unit ftpparseheader;

{
ftpparse(&fp,buf,len) tries to parse one line of LIST output.

The line is an array of len characters stored in buf.
It should not include the terminating CR LF; so buf[len] is typically CR.

If ftpparse() can't find a filename, it returns 0.

If ftpparse() can find a filename, it fills in fp and returns 1.
fp is a struct ftpparse, defined below.
The name is an array of fp.namelen characters stored in fp.name;
fp.name points somewhere within buf.
}

interface

type
  Pftpparse = ^_ftpparse;
	_ftpparse = packed record
	  name: PChar;
	  namelen: integer;
	  flagtrycwd: integer;
	  flagtryretr: integer;
	  sizetype: integer;
	  size: longint;
	  mtimetype: integer;
	  mtime: longint;
	  idtype: integer;
	  id: PChar;
	  idlen: integer;
	end;

{struct ftpparse
  char *name; /* not necessarily 0-terminated */
  int namelen;
  int flagtrycwd; /* 0 if cwd is definitely pointless, 1 otherwise */
  int flagtryretr; /* 0 if retr is definitely pointless, 1 otherwise */
  int sizetype;
  long size; /* number of octets */
  int mtimetype;
  time_t mtime; /* modification time */
  int idtype;
  char *id; /* not necessarily 0-terminated */
  int idlen;
 ;}

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

//external ftpparse(fp: ftpparseinfo; buf: char; len: integer): integer;

{$L ftpparse.obj}

var
  _gmtime: longint;
  _time: longint;

implementation

end.


