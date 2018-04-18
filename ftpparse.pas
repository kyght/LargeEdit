unit ftpparse;
{ ftpparse.c, ftpparse.h: library for parsing FTP LIST responses
20001223
D. J. Bernstein, djb@cr.yp.to
http://cr.yp.to/ftpparse.html

Commercial use is fine, if you let me know what programs you're using this in.

Currently covered formats:
EPLF.
UNIX ls, with or without gid.
Microsoft FTP Service.
Windows NT FTP Server.
VMS.
WFTPD.
NetPresenz (Mac).
NetWare.
MSDOS.

Definitely not covered:
Long VMS filenames, with information split across two lines.
NCSA Telnet FTP server. Has LIST = NLST (and bad NLST for directories).
}

interface

//#include <time.h>
//#include "ftpparse.h"

type
	ftpinfo = record
	  name: string;
	  namelen: integer;
	  flagtrycwd: integer;
	  flagtryretr: integer;
	  sizetype: integer;
	  size: longint;
	  mtimetype: integer;
	  mtime: integer;
	  idtype: integer;
	  id: string;
	  idlen: integer;
	end;

  tm = record
    tm_sec: integer;//        seconds after the minute (from 0)
    tm_min: integer;//        minutes after the hour (from 0)
    tm_hour: integer;//       hour of the day (from 0)
    tm_mday: integer;//       day of the month (from 1)
    tm_mon: integer; //       month of the year (from 0)
    tm_year: integer;//       years since 1900 (from 0)
    tm_wday: integer;//       days since Sunday (from 0)
    tm_yday: integer;//       day of the year (from 0)
    tm_isdst: integer;//      Daylight Saving Time flag
  end;


const FTPPARSE_SIZE_UNKNOWN: integer = 0;
const FTPPARSE_SIZE_BINARY: integer =  1; {/* size is the number of octets in TYPE I */}
const FTPPARSE_SIZE_ASCII: integer =  2; {/* size is the number of octets in TYPE A */}

const FTPPARSE_MTIME_UNKNOWN: integer =  0;
const FTPPARSE_MTIME_LOCAL: integer =  1; {/* time is correct */}
const FTPPARSE_MTIME_REMOTEMINUTE: integer =  2; {/* time zone and secs are unknown */}
const FTPPARSE_MTIME_REMOTEDAY: integer =  3; {/* time zone and time of day are unknown */}
{
When a time zone is unknown, it is assumed to be GMT. You may want
to use localtime() for LOCAL times, along with an indication that the
time is correct in the local time zone, and gmtime() for REMOTE* times.
}

const FTPPARSE_ID_UNKNOWN: integer = 0;
const FTPPARSE_ID_FULL: integer =  1; {/* unique identifier for files on this FTP server */}

function ftpparser2(fp: ftpinfo; buf: string; len: integer): integer;

function ftpparser(fp: ftpinfo; buf: string; len: integer): integer;

implementation

uses sysutils, regexpr;

var
  flagneedbase: integer = 1;
  base: longint; //double; {/* time() value on this OS at the beginning of 1970 TAI */}
  nowtime: longint; {/* current time */}
  flagneedcurrentyear: integer = 1;
  currentyear: longint; {/* approximation to current year */}


function totai(year, month, mday: longint): longint;
begin
  if (month >= 2) then
		month := month - 2
  else begin month := month + 10; dec(year); end;

  result := (mday - 1) * 10 + 5 + 306 * month;
  result := round(result / 10);

	if (result = 365) then begin
		dec(year, 3); result := 1460;
	end
  else
		result := result + 365 * (year mod 4);
  year := round(year / 4);
  result := result + 1461 * (year mod 25);
  year := round(year / 25);

  if (result = 36524) then begin
		dec(year, 3); result := 146096;
	end
  else begin
		result := result + 36524 * (year mod 4);
 	end;
  year := round(year / 4);
  result := result + 146097 * (year - 5);
  result := result + 11017;
  result := result * 86400;
end;

function gmtime(base: double): tm;
var
  dt: TDateTime;
  yr, m, dy: Word;
begin
  dt := Now;
  DecodeDate(dt, yr, m, dy);
  result.tm_year := yr;

end;


procedure initbase();
var
  t: tm;
begin
  if  (flagneedbase <> 1) then exit;

  base := 0;
  t := gmtime(base);
  base := (totai(t.tm_year + 1900,t.tm_mon,t.tm_mday) + t.tm_hour * 3600 + t.tm_min * 60 + t.tm_sec);
  //base = -(totai(t->tm_year + 1900,t->tm_mon,t->tm_mday) + t->tm_hour * 3600 + t->tm_min * 60 + t->tm_sec);
  { assumes the right time_t, counting seconds. }
  { base may be slightly off if time_t counts non-leap seconds. }
  flagneedbase := 0;
end;

procedure initnow();
var
	day, year: double;
begin

  initbase();
  {
  nowtime := time((time_t *) 0) - base;

  if (flagneedcurrentyear) begin
    day = now / 86400;
    if ((now % 86400) < 0) --day;
    day -= 11017;
    year = 5 + day / 146097;
    day = day % 146097;
    if (day < 0) begin day += 146097; --year; end;
    year *= 4;
    if (day == 146096) begin year += 3; day = 36524; end;
    else begin year += day / 36524; day %= 36524; end;
    year *= 25;
    year += day / 1461;
    day %= 1461;
    year *= 4;
    if (day == 1460) begin year += 3; day = 365; end;
    else begin year += day / 365; day %= 365; end;
    day *= 10;
    if ((day + 5) / 306 >= 10) ++year;
    currentyear = year;
    flagneedcurrentyear = 0;
	end;
  }
end;

{/* UNIX ls does not show the year for dates in the last six months. */
/* So we have to guess the year. */
/* Apparently NetWare uses ``twelve months'' instead of ``six months''; ugh. */
/* Some versions of ls also fail to show the year for future dates. */}
function guesstai(month, mday: integer): integer;
var
	year, t: integer;
begin

  initnow();

  for year := currentyear - 1 to currentyear + 100 do begin
    t := totai(year,month,mday);
    if (now - t < 350 * 86400) then begin
      result := t;
      exit;
      end;
	end;
end;

function check(buf , monthname: string): boolean;
begin
  result := true;
//  if ((buf[1] <> monthname[1]) and (buf[1] <> monthname[1] - 32)) result := false;
//  if ((buf[2] <> monthname[2]) and (buf[2] <> monthname[2] - 32)) result := false;
//  if ((buf[3] <> monthname[3]) and (buf[3] <> monthname[3] - 32)) result := false;
end;

const months: array[0..11] of string = ('jan','feb','mar','apr','may','jun','jul','aug','sep','oct','nov','dec');

function getmonth(buf: string; bufadd: integer; len: integer): integer;
var
	i: integer;
begin
  result := -1;
  if (len = 3) then begin
    for i := 0 to 12 do
      if (check(buf,months[i])) then begin result := i; exit; end;
  end
end;

function getlong(buf: string; bufadd: integer; len: integer): longint;
var
	u: longint;
begin
  u := 0;
  while (len > 0) do begin
    //u := u * 10 + (buf++ - '0');
    len := len - 1;
  end;
  result := u;
end;

function ftpparser2(fp: ftpinfo; buf: string; len: integer): integer;
var
  r: TRegExpr;
begin
  r := TRegExpr.Create;

  case (buf[1]) of
    '+': begin
    {/* see http://pobox.com/~djb/proto/eplf.txt */
    /* "+i8388621.29609,m824255902,/,\tdev" */
    /* "+i8388621.44468,m839956783,r,s10376,\tRFCEPLF" */}


    end;

    'b', 'c', 'd', 'l', 'p', 's', '-': begin
    {/* UNIX-style listing, without inum and without blocks */
    /* "-rw-r--r--   1 root     other        531 Jan 29 03:26 README" */
    /* "dr-xr-xr-x   2 root     other        512 Apr  8  1994 etc" */
    /* "dr-xr-xr-x   2 root     512 Apr  8  1994 etc" */
    /* "lrwxrwxrwx   1 root     other          7 Jan 25 00:17 bin -> usr/bin" */
    /* Also produced by Microsoft's FTP servers for Windows: */
    /* "----------   1 owner    group         1803128 Jul 10 10:18 ls-lR.Z" */
    /* "d---------   1 owner    group               0 May  9 19:45 Softlib" */
    /* Also WFTPD for MSDOS: */
    /* "-rwxrwxrwx   1 noone    nogroup      322 Aug 19  1996 message.ftp" */
    /* Also NetWare: */
    /* "d [R----F--] supervisor            512       Jan 16 18:53    login" */
    /* "- [R----F--] rhesus             214059       Oct 20 15:27    cx.exe" */
    /* Also NetPresenz for the Mac: */
    /* "-------r--         326  1391972  1392298 Nov 22  1995 MegaPhone.sit" */
    /* "drwxrwxr-x               folder        2 May 10  1996 network" */}
    r.Expression := '';
    if (r.Exec(buf)) then begin
      //r.
    end;

    end;

  end;
end;

function ftpparser(fp: ftpinfo; buf: string; len: integer): integer;
var
  i: integer;
  j: integer;
  state: integer;
  size: longint;
  year: longint;
  month: longint;
  mday: longint;
  hour: longint;
  minute: longint;
begin

  fp.name := '';
  fp.namelen := 0;
  fp.flagtrycwd := 0;
  fp.flagtryretr := 0;
  fp.sizetype := FTPPARSE_SIZE_UNKNOWN;
  fp.size := 0;
  fp.mtimetype := FTPPARSE_MTIME_UNKNOWN;
  fp.mtime := 0;
  fp.idtype := FTPPARSE_ID_UNKNOWN;
  fp.id := '';
  fp.idlen := 0;

  if (len < 2) then begin {/* an empty name in EPLF, with no info, could be 2 chars */}
    result := 0;
		exit;
		end;

  case (buf[1]) of 
    {/* see http://pobox.com/~djb/proto/eplf.txt */
    /* "+i8388621.29609,m824255902,/,\tdev" */
    /* "+i8388621.44468,m839956783,r,s10376,\tRFCEPLF" */}
    '+': begin
      i := 1;
      for j := 1 to len do begin
        if (buf[j] = '9') then begin
          fp.name := IntToStr( StrToInt(buf) + j + 1 );
          fp.namelen := len - j - 1;
          result := 1;
          exit;
				end;
        if (buf[j] = ',') then begin
          case (buf[i]) of
            '/': fp.flagtrycwd := 1;
            'r': fp.flagtryretr := 1;
            's': begin
              fp.sizetype := FTPPARSE_SIZE_BINARY;
              fp.size := getlong(buf, i + 1, j - i - 1);
              end;
            'm': begin
              fp.mtimetype := FTPPARSE_MTIME_LOCAL;
              initbase();
              fp.mtime := base + getlong(buf, i + 1, j - i - 1);
              end;
            'i': begin
              fp.idtype := FTPPARSE_ID_FULL;
              fp.id := IntToStr(StrToInt(buf) + i + 1);
              fp.idlen := j - i - 1;
              end;
					end;
          i := j + 1;
				end;
			end;
      result := 0;
      exit;
    end; //+
    
    {/* UNIX-style listing, without inum and without blocks */
    /* "-rw-r--r--   1 root     other        531 Jan 29 03:26 README" */
    /* "dr-xr-xr-x   2 root     other        512 Apr  8  1994 etc" */
    /* "dr-xr-xr-x   2 root     512 Apr  8  1994 etc" */
    /* "lrwxrwxrwx   1 root     other          7 Jan 25 00:17 bin -> usr/bin" */
    /* Also produced by Microsoft's FTP servers for Windows: */
    /* "----------   1 owner    group         1803128 Jul 10 10:18 ls-lR.Z" */
    /* "d---------   1 owner    group               0 May  9 19:45 Softlib" */
    /* Also WFTPD for MSDOS: */
    /* "-rwxrwxrwx   1 noone    nogroup      322 Aug 19  1996 message.ftp" */
    /* Also NetWare: */
    /* "d [R----F--] supervisor            512       Jan 16 18:53    login" */
    /* "- [R----F--] rhesus             214059       Oct 20 15:27    cx.exe" */
    /* Also NetPresenz for the Mac: */
    /* "-------r--         326  1391972  1392298 Nov 22  1995 MegaPhone.sit" */
    /* "drwxrwxr-x               folder        2 May 10  1996 network" */}

    'b', 'c', 'd', 'l', 'p', 's', '-': begin

      if (buf[1] = 'd') then fp.flagtrycwd := 1;
      if (buf[1] = '-') then fp.flagtryretr := 1;
      if (buf[1] = 'l') then begin fp.flagtryretr := 1; fp.flagtrycwd := fp.flagtryretr; end;

      state := 1;
      i := 0;
      for j := 1 to len do begin
        //if ((buf[j] = ' ') and (buf[j - 1] <> ' ')) then begin
        if ((buf[j - 1] <> ' ')) then begin
          case(state) of
            1: {/* skipping perm */}
              state := 2;
            2: begin {/* skipping nlink */}
              state := 3;
              if ((j - i = 6) and (buf[i] = 'f')) then {/* for NetPresenz */}
                state := 4;
            end;
            3: {/* skipping uid */}
              state := 4;
            4: begin {/* getting tentative size */}
              size := getlong(buf, i, j - i);
              state := 5;
            end;
            5: begin {/* searching for month, otherwise getting tentative size */}
              month := getmonth(buf, i, j - i);
              if (month >= 0) then
                state := 6
              else
                size := getlong(buf, i, j - i);
            end;
            6: begin {/* have size and month */}
              mday := getlong(buf, i, j - i);
              state := 7;
            end;
            7: begin {/* have size, month, mday */}
              if ((j - i = 4) and (buf[i + 1] = ':')) then begin
                hour := getlong(buf,i,1);
                minute := getlong(buf, i + 2,2);
                fp.mtimetype := FTPPARSE_MTIME_REMOTEMINUTE;
                initbase();
                fp.mtime := base + guesstai(month,mday) + hour * 3600 + minute * 60;
              end else if ((j - i = 5) and (buf[i + 2] = ':')) then begin
                hour := getlong(buf,i,2);
                minute := getlong(buf, i + 3,2);
                fp.mtimetype := FTPPARSE_MTIME_REMOTEMINUTE;
                initbase();
                fp.mtime := base + guesstai(month,mday) + hour * 3600 + minute * 60;
							end
              else if (j - i >= 4) then begin
                year := getlong(buf, i,j - i);
                fp.mtimetype := FTPPARSE_MTIME_REMOTEDAY;
                initbase();
                fp.mtime := base + totai(year,month,mday);
							end
              else begin
                result := 0;
                exit;
                end;
              fp.name := buf[ j + 1 ];
              fp.namelen := len - j - 1;
              state := 8;
            end;
            //8: {/* twiddling thumbs */}
          end;
          i := j + 1;
          while ((i < len) and (buf[i] = ' ')) do inc(i);
        end;
      end;

      if (state <> 8) then begin
        result := 0;
        exit;
        end;

      fp.size := size;
      fp.sizetype := FTPPARSE_SIZE_BINARY;

      if (buf = 'l') then begin
        for i := 0 to fp.namelen - 3 do
          if (fp.name[i] = ' ') then
            if (fp.name[i + 1] = '-') then
              if (fp.name[i + 2] = '>') then
                if (fp.name[i + 3] = ' ') then begin
                  fp.namelen := i;
                  break;
								end;
      end;

      {/* eliminate extra NetWare spaces */}
      if ((buf[1] = ' ') or (buf[1] = '[')) then begin
        if (fp.namelen > 3) then
          if (fp.name[1] = ' ') then
            if (fp.name[2] = ' ') then
              if (fp.name[3] = ' ') then begin
                fp.name := fp.name + '3';
                fp.namelen := fp.namelen - 3;
							end
      end;

      result := 1;
      exit;
    end; // other constant
//   end;
  end;

  {/* MultiNet (some spaces removed from examples) */
  /* "00README.TXT;1      2 30-DEC-1996 17:44 [SYSTEM] (RWED,RWED,RE,RE)" */
  /* "CORE.DIR;1          1  8-SEP-1996 16:09 [SYSTEM] (RWE,RWE,RE,RE)" */
  /* and non-MutliNet VMS: */
  /* "CII-MANUAL.TEX;1  213/216  29-JAN-1996 03:33:12  [ANONYMOU,ANONYMOUS]   (RWED,RWED,,)" */}

  for i := 0 to len do begin
    if (buf[i] = ';') then break;
  end;

  if (i < len) then begin
    fp.name := buf;
    fp.namelen := i;
    if (i > 4) then
      if (buf[i - 4] = '.') then
        if (buf[i - 3] = 'D') then
          if (buf[i - 2] = 'I') then
            if (buf[i - 1] = 'R') then begin
              fp.namelen := fp.namelen - 4;
              fp.flagtrycwd := 1;
						end;
    
    if (fp.flagtrycwd <> 1) then
      fp.flagtryretr := 1;

    while (buf[i] <> ' ') do begin Inc(i); if (i = len) then begin result := 0; exit; end; end;
    while (buf[i] = ' ') do begin Inc(i); if (i = len) then begin result := 0; exit; end; end;
    while (buf[i] <> ' ') do begin Inc(i); if (i = len) then begin result := 0; exit; end; end;
    while (buf[i] = ' ') do begin Inc(i); if (i = len) then begin result := 0; exit; end; end;       
    j := i;
    while (buf[j] <> '-') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    mday := getlong(buf, i,j - i);
    while (buf[j] = '-') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    i := j;
    while (buf[j] <> '-') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    month := getmonth(buf, i,j - i);
    if (month < 0) then result := 0;
    while (buf[j] = '-') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    i := j;
    while (buf[j] <> ' ') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    year := getlong(buf, i,j - i);
    while (buf[j] = ' ')  do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    i := j;
    while (buf[j] <> ':') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    hour := getlong(buf, i,j - i);
    while (buf[j] = ':')  do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    i := j;
    while ((buf[j] <> ':') and (buf[j] <> ' '))  do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    minute := getlong(buf, i,j - i);

    fp.mtimetype := FTPPARSE_MTIME_REMOTEMINUTE;
    initbase();
    fp.mtime := base + totai(year,month,mday) + hour * 3600 + minute * 60;

    result := 1;
    exit;
  end;

  {/* MSDOS format */
  /* 04-27-00  09:09PM       <DIR>          licensed */
  /* 07-18-00  10:16AM       <DIR>          pub */
  /* 04-14-00  03:47PM                  589 readme.htm */}
  if ((buf >= '0') and (buf <= '9')) then begin
    i := 0;
    j := 0;
    while (buf[j] <> '-') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    month := getlong(buf, i,j - i) - 1;
    while (buf[j] = '-') do begin Inc(j); if (j = len) then result := 0; exit; end; end;
    i := j;
    while (buf[j] <> '-') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    mday := getlong(buf, i,j - i);
    while (buf[j] = '-') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    i := j;
    while (buf[j] <> ' ') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    year := getlong(buf, i,j - i);
    if (year < 50) then year := year + 2000;
    if (year < 1000) then year := year + 1900;
    while (buf[j] = ' ') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    i := j;
    while (buf[j] <> ':') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    hour := getlong(buf, i,j - i);
    while (buf[j] = ':') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    i := j;
    while ((buf[j] <> 'A') and (buf[j] <> 'P')) do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    minute := getlong(buf, i,j - i);
    if (hour = 12) then hour := 0;
    if (buf[j] = 'A') then begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    if (buf[j] = 'P') then begin hour := hour + 12; Inc(j); if (j = len) then begin result := 0; exit; end; end;
    if (buf[j] = 'M') then begin Inc(j); if (j = len) then begin result := 0; exit; end; end;

    while (buf[j] = ' ') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
    if (buf[j] = '<') then begin
      fp.flagtrycwd := 1;
      while (buf[j] <> ' ') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
		end
    else begin
      i := j;
      while (buf[j] <> ' ') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;
      fp.size := getlong(buf, i,j - i);
      fp.sizetype := FTPPARSE_SIZE_BINARY;
      fp.flagtryretr := 1;
		end;
    while (buf[j] = ' ') do begin Inc(j); if (j = len) then begin result := 0; exit; end; end;

    fp.name := buf; //buf + j;
    fp.namelen := len - j;

    fp.mtimetype := FTPPARSE_MTIME_REMOTEMINUTE;
    initbase();
    fp.mtime := base + totai(year,month,mday) + hour * 3600 + minute * 60;

    result := 1;
    exit;

  end;

  {/* Some useless lines, safely ignored: */
  /* "Total of 11 Files, 10966 Blocks." (VMS) */
  /* "total 14786" (UNIX) */
  /* "DISK$ANONFTP:[ANONYMOUS]" (VMS) */
  /* "Directory DISK$PCSA:[ANONYM]" (VMS) */}

  //result := 0;
//end;


end.

