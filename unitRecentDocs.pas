unit unitRecentDocs;

interface

uses shlobj, classes;

  //Windows Function Wappers
  function LoadRecentDocs( List: TStringList ): boolean;
  procedure AddRecentDocs( Doc: String );

implementation

uses windows, activex, forms, sysutils;

procedure AddRecentDocs( Doc: String );
begin
  if length(Doc) <= 0 then exit;
  SHAddToRecentDocs(SHARD_PATH, PChar(Doc));
end;

function LoadRecentDocs( List: TStringList ): boolean;
var
  docpath: array of Char;
  fd: WIN32_FIND_DATA;
  hnd, i: integer;
  fnme, ext: String;
  prs, rb: Boolean;
  pitemlst: PITEMIDLIST;
  mac: IMalloc;
  rs: HRESULT;
begin
  setlength(docpath, MAX_PATH);
  rs := SHGetSpecialFolderLocation(Application.Handle, CSIDL_RECENT, pitemlst);
  if failed(rs) then exit;
  rb := SHGetPathFromIDList(pitemlst, Pchar(docpath));
  if not rb then exit;
  rs := SHGetMalloc(mac);
  if FAILED(rs) then begin
    setlength(docpath, 0);
    exit;
  end;
  if mac.DidAlloc(pitemlst) = 1 then
    mac.Free(pitemlst);
  mac := nil;
{  if not SHGetSpecialFolderPath(Application.Handle,PChar(docpath),CSIDL_RECENT,true) then begin
    setlength(docpath, 0);
    exit;
    end;}
  fnme := '';
  for i := 0 to MAX_PATH do begin
    if docpath[i] = #0 then break;
    fnme := fnme + docpath[i];
  end;
  fnme := fnme + '\*.*';
  hnd := FindFirstFile(PChar(fnme), fd);
  if hnd = INVALID_HANDLE_VALUE then exit;
  prs := true;
  while prs do begin
    fnme := fd.cFileName;
    fnme := StringReplace(fnme, '.lnk','',[rfReplaceAll, rfIgnoreCase]);
    ext := ExtractFileExt(fnme);
    if  (length(ext) <= 1) or
        (fd.dwFileAttributes <> 32) then begin
      prs := FindNextFile(hnd, fd);
      continue;
      end;
    list.Add(fnme);
    prs := FindNextFile(hnd, fd);
  end;
  setlength(docpath, 0);
end;

end.
