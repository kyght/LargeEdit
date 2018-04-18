unit unitUtils;

interface

uses sysutils, forms, windows, stdctrls, hh_funcs, controls, graphics, cUnicodeReader,
    cUnicodeMaps, cUnicodeChar, shellapi, SynEditTypes, classes;

type
  PHICON = ^HICON;
  TOnSetText = procedure(Text: String) of object;
  TOnGetText = function: String of Object;

  TOnGetMacro = function: TObject of Object;
  TOnMacroAction = procedure(Filename: String) of Object;

  TOnOpenFile = function( filename: string ): boolean of object;
  TOnSaveFile = function( filename: string ): boolean of object;

  TEmailMode = (emText,emHex,emAttach);

//images
procedure ConvertTo32BitImageList(const ImageList: TImageList);

//text functions
function WideStringToString(const ws: WideString; codePage: Word): AnsiString;
function StringToWideString(const s: AnsiString; codePage: Word): WideString;
function GetUnicodeText(Filename: String): String;

function GetBufferedList(var BufferedList: TStringList; Filename: String; RefreshAge: integer): boolean;
procedure SaveBufferedList(var BufferedList: TStringList; Filename: String);

//GUI functions
procedure EnableControl( Control: TEdit );
procedure DisableControl( Control: TEdit );

procedure SetProperty( Control: TObject; Name: String; Value: variant );

//File functions
function GetIOError: boolean;
function BrowseDialog(const Title: string; const Flag: integer): string;
function AppPath: String;
function GetSizeOfFile(Filename: String) : longword;
procedure ExecuteFile(Filename, Params: String);
function ShowProperties(const FileName: string): boolean;
function GetTempDir: String;
function GetTemporaryFileName( Path, Prefix: string ): string;
procedure RunDosInMemo(DosApp:String;AMemo:TMemo) ;
function ReadLine(var txt: file; var stline: String): boolean; //EOF
function GetSystemDir: TFileName;
function GetWindowsDir: TFileName;

//Util functions
function GetHeightPortion(Height, Fraction, Default: Integer): integer;
procedure MaximizeWindow( Handle: HWND );
function GetFirstFilterExt(Filter: String): String;
function ValueInArray(InArray: array of integer; Value: variant): boolean;
function FindFormwCapClass( Owner: TForm; Caption: String; Cls: TClass ): TObject;

//HTML
function TColorToHex(Color : TColor) : string;
function HexToTColor(sColor : string) : TColor;

//System functions
procedure FreeObject( Obj: TObject );

//Advances functions
function sendMail( const TargetName, TargetAddr,
                         SenderName, SenderAddr,
                         MsgSubject, MsgContent,
                         Attachment : String;
                         PreviewMsg : Boolean = TRUE ) : Integer;

procedure GetAssociatedIcon(FileName: TFilename; PLargeIcon, PSmallIcon: PHICON);

//Help functions
procedure ShowHelp( Topic: String); overload;
procedure ShowHelp( Filename: String; Topic: String); overload;

//SynEdit Functions
function BufCordToPoint( bc: TBufferCoord ): TPoint;

var
  ApplicationHelpFile: String;
  ScriptingHelpFile: String;

implementation

uses variants, mapimail, mapi, dialogs, shlobj, registry, commctrl;

{:Converts Unicode string to Ansi string using specified code page.
  @param   ws       Unicode string.
  @param   codePage Code page to be used in conversion. 
  @returns Converted ansi string. 
} 

function WideStringToString(const ws: WideString; codePage: Word): AnsiString; 
var 
  l: integer; 
begin 
  if ws = '' then
    Result := ''
  else  
  begin 
    l := WideCharToMultiByte(codePage, 
      WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR, 
      @ws[1], - 1, nil, 0, nil, nil); 
    SetLength(Result, l - 1); 
    if l > 1 then 
      WideCharToMultiByte(codePage, 
        WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR, 
        @ws[1], - 1, @Result[1], l - 1, nil, nil); 
  end; 
end; { WideStringToString } 


{:Converts Ansi string to Unicode string using specified code page. 
  @param   s        Ansi string.
  @param   codePage Code page to be used in conversion. 
  @returns Converted wide string. 
}
function StringToWideString(const s: AnsiString; codePage: Word): WideString;
var
  l: integer;
begin
  if s = '' then
    Result := ''
  else
  begin
    l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, PChar(@s[1]), - 1, nil, 0);
    SetLength(Result, l - 1);
    if l > 1 then
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PChar(@s[1]),
        - 1, PWideChar(@Result[1]), l - 1);
  end;
end; { StringToWideString }

function BufCordToPoint( bc: TBufferCoord ): TPoint;
begin
  result.X := bc.Char;
  result.Y := bc.Line;
end;

procedure ConvertTo32BitImageList(const ImageList: TImageList);
const
  Mask: array[Boolean] of Longint = (0, ILC_MASK);
var
  TemporyImageList: TImageList;
begin
  if Assigned(ImageList) then
  begin
    TemporyImageList := TImageList.Create(nil);
    try
      TemporyImageList.Assign(ImageList);
      with ImageList do
      begin
        ImageList.Handle := ImageList_Create(Width, Height, ILC_COLOR32 or Mask[Masked], 0, AllocBy);
        if not ImageList.HandleAllocated then
        begin
          raise EInvalidOperation.Create('Invalid Image List');
        end;
      end;
      ImageList.AddImages(TemporyImageList);
    finally
      TemporyImageList.Free;
    end;
  end;
end;

function ReadLine(var txt: file; var stline: String): boolean; //EOF
var
  NumRead: Integer;
  Buf: array[1..1] of Char;
  ch: AnsiChar;
  sout: string;
  eol: boolean;
begin
  result := false;
  eol := false;
  sout := '';
  while not eol do begin
    BlockRead(txt, Buf, 1, NumRead);
    if NumRead <= 0 then begin result := true; exit; end;
    if IsASCIIChar(WideChar(buf[1])) and (buf[1] <> #0) then begin
      ch := buf[1];
      if buf = #13 then begin
        while buf <> #10 do
          BlockRead(txt, Buf, 1, NumRead);
        eol := true;
        continue;
      end;
      sout := sout + ch;
    end;
  end;
  stline := sout; 
end;

procedure SaveBufferedList(var BufferedList: TStringList; Filename: String);
begin
  DeleteFile(PChar(Filename));
  BufferedList.SaveToFile(Filename);
end;

function GetBufferedList(var BufferedList: TStringList; Filename: String; RefreshAge: integer): boolean;
var
  fleag: TDateTime;
  dif2, fage: integer;
begin
  if not FileExists(Filename) then begin
    result := false;
    exit;
    end;
  BufferedList.Clear;
  fage := FileAge(Filename);
  fleag := FileDateToDateTime(fage);
  dif2 := round(now - fleag);
  if dif2 > RefreshAge then begin
    result := false;
  end
  else begin
    BufferedList.LoadFromFile(Filename);
    result := true;
  end;
end;

function GetHeightPortion(Height, Fraction, Default: Integer): integer;
var
  fr: Double;
begin
  result := Default;
  try
    fr := height / Fraction;
    result := round(fr);
  except
    result := Default;
  end;
end;

procedure FreeObject( Obj: TObject );
begin
  if assigned(obj) then obj.free;
end;

function AppPath: String;
begin
  result := extractfilepath(application.ExeName);
end;

function GetSizeOfFile(Filename: String) : longword;
var
  fd: WIN32_FIND_DATA;
  hnd: integer;
begin
  hnd := FindFirstFile(Pchar(filename), fd);
  if hnd = INVALID_HANDLE_VALUE then
    result := 0
  else begin
    if fd.nFileSizeHigh <> 0 then
      result := (fd.nFileSizeHigh * MAXDWORD) + fd.nFileSizeLow
    else
      result := fd.nFileSizeLow;
  end
end;

procedure ExecuteFile(Filename, Params: String);
begin
  Shellexecute(application.Handle, 'open', Pchar(filename), Pchar(Params), Pchar(ExtractFilePath(Filename)), SW_SHOW);
end;

function ShowProperties(const FileName: string): boolean;
var
   Info: TShellExecuteInfo;
   Handle : THandle;
begin
   { Fill in the SHELLEXECUTEINFO structure }
   with Info do
   begin
     cbSize := SizeOf(Info) ;
     fMask := SEE_MASK_NOCLOSEPROCESS or
              SEE_MASK_INVOKEIDLIST or
              SEE_MASK_FLAG_NO_UI;
     wnd := application.Handle;
     lpVerb := 'properties';
     lpFile := pChar(FileName) ;
     lpParameters := nil;
     lpDirectory := nil;
     nShow := 0;
     hInstApp := 0;
     lpIDList := nil;
   end;
   Result := ShellExecuteEx(@Info);
end;

procedure RunDosInMemo(DosApp:String;AMemo:TMemo) ;
  const
     ReadBuffer = 2400;
  var
   Security : TSecurityAttributes;
   ReadPipe,WritePipe : THandle;
   start : TStartUpInfo;
   ProcessInfo : TProcessInformation;
   Buffer : Pchar;
   str: String;
   BytesRead : DWord;
   Apprunning : DWord;
  begin
   With Security do begin
    nlength := SizeOf(TSecurityAttributes) ;
    binherithandle := true;
    lpsecuritydescriptor := nil;
   end;
   if Createpipe (ReadPipe, WritePipe,
                  @Security, 0) then begin
    Buffer := AllocMem(ReadBuffer + 1) ;
    FillChar(Start,Sizeof(Start),#0) ;
    start.cb := SizeOf(start) ;
    start.hStdOutput := WritePipe;
    start.hStdInput := ReadPipe;
    start.dwFlags := STARTF_USESTDHANDLES +
                         STARTF_USESHOWWINDOW;
    start.wShowWindow := SW_HIDE;

    if CreateProcess(nil,
           PChar(DosApp),
           @Security,
           @Security,
           true,
           NORMAL_PRIORITY_CLASS,
           nil,
           nil,
           start,
           ProcessInfo)
    then
    begin
     repeat
      Apprunning := WaitForSingleObject
                   (ProcessInfo.hProcess,100) ;
      Application.ProcessMessages;
     until (Apprunning <> WAIT_TIMEOUT) ;
      Repeat
        BytesRead := 0;
        ReadFile(ReadPipe,Buffer[0],
        ReadBuffer,BytesRead,nil) ;
        Buffer[BytesRead]:= #0;
        OemToAnsi(Buffer,Buffer) ;
        str := String(Buffer);
        AMemo.Lines.Text := str;
      until (BytesRead < ReadBuffer) ;
   end;
   FreeMem(Buffer) ;
   CloseHandle(ProcessInfo.hProcess) ;
   CloseHandle(ProcessInfo.hThread) ;
   CloseHandle(ReadPipe) ;
   CloseHandle(WritePipe) ;
   end;
  end;

function sendMail( const TargetName, TargetAddr,
                         SenderName, SenderAddr,
                         MsgSubject, MsgContent,
                         Attachment : String;
                         PreviewMsg : Boolean = TRUE ) : Integer;
var
  msg       : TMapiMessage;    // Pointer to the message itself
  mrdSender,                   // Who's sending it?
  mrdTarget : TMapiRecipDesc;  // Who's going to get it?
  mfdAttach : TMapiFileDesc;   // The attached file.
  liFlags   : Longint;         // Flags for MAPI.
  strError  : String;          // Holds MAPI error results;
begin
 result := 0;
 liFlags := 0;
 fillChar( msg, sizeOf( msg ), 0 );
 with msg do
 begin

   if TargetAddr = '' then
//      raise tMailFileException.createFmt( ERROR,
//         [ 'Target email address not specified' ] )
   else begin
      if TargetName = '' then
         mrdTarget.lpszName := pChar( TargetAddr )
      else
         mrdTarget.lpszName := pChar( TargetName );
      mrdTarget.ulRecipClass := MAPI_TO;
      mrdTarget.lpszAddress := pChar( TargetAddr );
      mrdTarget.ulReserved := 0;
      mrdTarget.ulEIDSize := 0;
      mrdTarget.lpEntryID := NIL;
      nRecipCount := 1;
      lpRecips := @mrdTarget;

   end;

   if SenderAddr = '' then
//      raise tMailFileException.createFmt( ERROR,
//         [ 'Sender email address not specified' ] )
   else begin
      if SenderName = '' then
         mrdSender.lpszName := pChar( SenderAddr )
      else
         mrdSender.lpszName := pChar( SenderName );
      mrdSender.ulRecipClass := MAPI_ORIG;
      mrdSender.lpszAddress := pChar( 'SMTP:' + SenderAddr );
      mrdSender.ulReserved := 0;
      mrdSender.ulEIDSize := 0;
      mrdSender.lpEntryID := NIL;
      lpOriginator := @mrdSender;
   end;

   if MsgSubject = '' then
      lpszSubject := ''
   else
      lpszSubject := pChar( MsgSubject );

   if ( MsgContent = '' ) AND ( Attachment = '' ) then
      raise tMailFileException.createFmt( ERROR,
         [ 'Tried to send an empty message (no content or attachment)' ] )
   else begin
      if MsgContent = '' then
         lpszNoteText := 'Please see the attached file.'
      else
         lpszNoteText := pChar( MsgContent );

      if Attachment = '' then begin
         nFileCount := 0;
         lpFiles := NIL;
      end else begin
         fillChar( mfdAttach, sizeOf( mfdAttach ), 0 );
         mfdAttach.nPosition := cardinal( $FFFFFFFF );
         mfdAttach.lpszPathName := pChar( Attachment );
         mfdAttach.lpszFileName := PChar( Attachment );
         nFileCount := 1;
         lpFiles := @mfdAttach;
      end;
   end; // with

   if previewMsg then liFlags := MAPI_DIALOG;

   result := mapiSendMail( 0, application.Handle, msg, liFlags, 0 );

   if result <> 0 then
//      raise tMailFileException.createFmt( ERROR,
//         [ 'MAPI triggered an error ('
//           + getMAPIError( result ) + ')' ] );
  end;

end;

function GetFirstFilterExt(Filter: String): String;
var
  px: integer;
  tmp: string;
begin
  px := Pos('|', Filter);
  if px = 0 then
    tmp := filter
  else
    tmp := Copy(Filter,px+1, length(filter));
  px := Pos('*.', tmp);
  if px = 0 then
    tmp := tmp
  else
    tmp := Copy(tmp,px+2,length(tmp));
  px := Pos(';', tmp);
  if px = 0 then
    result := tmp
  else
    result := Copy(tmp,1,px-1);
end;

procedure MaximizeWindow( Handle: HWND );
var
  pt: TWindowPlacement;
  po: PWindowPlacement;
begin
  pt.length := sizeof(WindowPlacement);
  pt.showCmd := SW_SHOWMAXIMIZED;
  po := @pt;
  SetWindowPlacement(Handle, po);
end;

function GetIOError: boolean;
var
  msg: array of Char;
  smsg: String;
  msize, i: Integer;
begin
  result := false;
  if IOResult <> 0 then begin
    result := false;
    msize := 255;
    SetLength(msg, msize);
    FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,
                  nil,
                  GetLastError,
                  0,
                  PChar(msg),
                  msize,
                  nil);
    for i := 0 to msize do begin
      if msg[i] = #0 then break;
      smsg := smsg + msg[i];
    end;
    result := true;
    MessageDlg(smsg, mtError, [mbOK], 0);
  end;

end;


function BrowseDialog(const Title: string; const Flag: integer): string;
var
  lpItemID : PItemIDList;
  BrowseInfo : TBrowseInfo;
  DisplayName : array[0..MAX_PATH] of char;
  TempPath : array[0..MAX_PATH] of char;
begin
  Result:='';
  FillChar(BrowseInfo, sizeof(TBrowseInfo), #0);
  with BrowseInfo do begin
    hwndOwner := Application.Handle;
    pszDisplayName := @DisplayName;
    lpszTitle := PChar(Title);
    ulFlags := Flag;
  end;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then begin
    SHGetPathFromIDList(lpItemID, TempPath);
    Result := TempPath;
    GlobalFreePtr(lpItemID);
  end;
end;


procedure EnableControl( Control: TEdit );
begin
  Control.Enabled := true;
  control.Color := clWindow;
end;

procedure DisableControl( Control: TEdit );
begin
  Control.Enabled := false;
  Control.Color := clBtnFace;
end;


procedure SetProperty( Control: TObject; Name: String; Value: variant );
var
  pt: Pointer;
  pv: Pvariant;
begin
  pt := Control.FieldAddress(Name);
  if assigned(pt) then begin
    pv := pt;
    pv^ := value;
  end;
end;

procedure ShowHelp( Topic: String);
begin
  HHDisplayTopic(ApplicationHelpFile,Topic,'', htHHAPI);
end;

procedure ShowHelp( Filename: String; Topic: String);
begin
  HHDisplayTopic(Filename,Topic,'', htHHAPI);
end;

function ValueInArray(InArray: array of integer; Value: variant): boolean;
var
  i: integer;
begin
  result := false;
  for i := low(InArray) to High(InArray) do begin
    if InArray[i] = Value then begin result := true; break; end;
  end;
end;

function FindFormwCapClass( Owner: TForm; Caption: String; Cls: TClass ): TObject;
var
  i: integer;
begin
  result := nil;
  for i := 0 to owner.ComponentCount -1 do begin
    if owner.Components[i] is cls then begin
      if TForm(owner.Components[i]).Caption = Caption then begin
        result := owner.Components[i];
        break;
        end;
      end;
  end;
end;

function GetTempDir: String;
var
  msize, i: integer;
  msg: array of Char;
  smsg: String;
begin
  msize := MAX_PATH;
  SetLength(msg, msize);
  GetTempPath(msize, PChar(msg));
    for i := 0 to msize do begin
      if msg[i] = #0 then break;
      smsg := smsg + msg[i];
    end;
  result := smsg;
end;

function GetTemporaryFileName( Path, Prefix: string ): string;
var
  msize, i: integer;
  msg: array of Char;
  smsg: String;
begin
  msize := MAX_PATH;
  SetLength(msg, msize);
  i := GetTempFileName(PChar(Path), Pchar(Prefix), 0, PChar(msg));
  if i = 0 then raise Exception.Create('Error generating temporary filename');
    for i := 0 to msize do begin
      if msg[i] = #0 then break;
      smsg := smsg + msg[i];
    end;
  result := smsg;
end;


function TColorToHex(Color : TColor) : string;
begin
   Result :=
     IntToHex(GetRValue(Color), 2) +
     IntToHex(GetGValue(Color), 2) +
     IntToHex(GetBValue(Color), 2) ;
end;

function HexToTColor(sColor : string) : TColor;
begin
   Result :=
     RGB(
       StrToInt('$'+Copy(sColor, 1, 2)),
       StrToInt('$'+Copy(sColor, 3, 2)),
       StrToInt('$'+Copy(sColor, 5, 2))
     ) ;
end;

function GetUnicodeText(Filename: String): String;
var
  ur: TUnicodeFileReader;
  str: string;
begin
  ur := TUnicodeFileReader.Create(filename);
  ur.ReadToAnsiStr(str);
end;

function GetSystemDir: TFileName;
var
  SysDir: array [0..MAX_PATH-1] of char;
begin
  SetString(Result, SysDir, GetSystemDirectory(SysDir, MAX_PATH));
  if Result = '' then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

function GetWindowsDir: TFileName;
var
  WinDir: array [0..MAX_PATH-1] of char;
begin
  SetString(Result, WinDir, GetWindowsDirectory(WinDir, MAX_PATH));
  if Result = '' then
    raise Exception.Create(SysErrorMessage(GetLastError));
end;

procedure GetAssociatedIcon(FileName: TFilename;
    PLargeIcon, PSmallIcon: PHICON);
// Gets the icons of a given file
var
  IconIndex: UINT;  // Position of the icon in the file
  FileExt, FileType: string;
  Reg: TRegistry;
  p: integer;
  p1, p2: pchar;
label
  noassoc;
begin
  IconIndex := 0;
  // Get the extension of the file
  FileExt := UpperCase(ExtractFileExt(FileName));
  if ((FileExt <> '.EXE') and (FileExt <> '.ICO')) or
      not FileExists(FileName) then begin
    // If the file is an EXE or ICO and it exists, then
    // we will extract the icon from this file. Otherwise
    // here we will try to find the associated icon in the
    // Windows Registry...
    Reg := nil;
    try
      Reg := TRegistry.Create(KEY_QUERY_VALUE);
      Reg.RootKey := HKEY_CLASSES_ROOT;
      if FileExt = '.EXE' then FileExt := '.COM';
      if Reg.OpenKeyReadOnly(FileExt) then
        try
          FileType := Reg.ReadString('');
        finally
          Reg.CloseKey;
        end;
      if (FileType <> '') and Reg.OpenKeyReadOnly(
          FileType + '\DefaultIcon') then
        try
          FileName := Reg.ReadString('');
        finally
          Reg.CloseKey;
        end;
    finally
      Reg.Free;
    end;

    // If we couldn't find the association, we will
    // try to get the default icons
    if FileName = '' then goto noassoc;

    // Get the filename and icon index from the
    // association (of form '"filaname",index')
    p1 := PChar(FileName);
    p2 := StrRScan(p1, ',');
    if p2 <> nil then begin
      p := p2 - p1 + 1; // Position of the comma
      IconIndex := StrToInt(Copy(FileName, p + 1,
        Length(FileName) - p));
      SetLength(FileName, p - 1);
    end;
  end;
  // Attempt to get the icon
  if ExtractIconEx(pchar(FileName), IconIndex,
      PLargeIcon^, PSmallIcon^, 1) <> 1 then
  begin
noassoc:
    // The operation failed or the file had no associated
    // icon. Try to get the default icons from SHELL32.DLL

    try // to get the location of SHELL32.DLL
      FileName := IncludeTrailingBackslash(GetSystemDir)
        + 'SHELL32.DLL';
    except
      FileName := 'C:\WINDOWS\SYSTEM\SHELL32.DLL';
    end;
    // Determine the default icon for the file extension
    if      (FileExt = '.DOC') then IconIndex := 1
    else if (FileExt = '.EXE')
         or (FileExt = '.COM') then IconIndex := 2
    else if (FileExt = '.HLP') then IconIndex := 23
    else if (FileExt = '.INI')
         or (FileExt = '.INF') then IconIndex := 63
    else if (FileExt = '.TXT') then IconIndex := 64
    else if (FileExt = '.BAT') then IconIndex := 65
    else if (FileExt = '.DLL')
         or (FileExt = '.SYS')
         or (FileExt = '.VBX')
         or (FileExt = '.OCX')
         or (FileExt = '.VXD') then IconIndex := 66
    else if (FileExt = '.FON') then IconIndex := 67
    else if (FileExt = '.TTF') then IconIndex := 68
    else if (FileExt = '.FOT') then IconIndex := 69
    else IconIndex := 0;
    // Attempt to get the icon.
    if ExtractIconEx(pchar(FileName), IconIndex,
        PLargeIcon^, PSmallIcon^, 1) <> 1 then
    begin
      // Failed to get the icon. Just "return" zeroes.
      if PLargeIcon <> nil then PLargeIcon^ := 0;
      if PSmallIcon <> nil then PSmallIcon^ := 0;
    end;
  end;
end;


end.
