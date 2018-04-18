unit dlgFindReplace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, Buttons, dlgProcessing;

type
  TdFindReplace = class(TdStandard)
    Label1: TLabel;
    Label2: TLabel;
    mFind: TMemo;
    mReplace: TMemo;
    GroupBox1: TGroupBox;
    rbcurdoc: TRadioButton;
    rbfolder: TRadioButton;
    edtfolder: TEdit;
    sbtnDir: TSpeedButton;
    cbsubdir: TCheckBox;
    Label3: TLabel;
    edtTypes: TEdit;
    btnFind: TButton;
    btnReplace: TButton;
    cbBackup: TCheckBox;
    procedure btnFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnReplaceClick(Sender: TObject);
    procedure sbtnDirClick(Sender: TObject);
  private
    { Private declarations }
    flist: TStringList;
    fmtxt: TStringList;
    dlgprs: TdlgProcess;
    StopSearch: boolean;
    FMax, FCur: integer;
    FCurFile: String;
    function GetFileFound(index: integer): String;
    function GetFound: boolean;
    function GetFoundCount: Integer;
    function GetLineFound(index: integer): String;
    function IsValidData: Boolean;
    function GetDefPath: String;
    function GetDefTypes: String;
    procedure SetDefPath(const Value: String);
    procedure SetDefTypes(const Value: String);
    function GetMatchText(index: integer): String;
    function GetFindText: string;
    function GetReplaceText: string;
    procedure SetFindText(const Value: string);
    procedure SetReplaceText(const Value: string);
  public
    { Public declarations }
    function FindTextInFile(FindText, ReplaceText, Filename: String; DoReplace, Backup: boolean; var LineNums, MatchText: TStringList): Boolean;
    function FindInFiles(FindText, ReplaceText, Path, FileOnly, FileTypes: String; CheckSubDirs, DoReplace, Backup: boolean; var FileList, Matches: TStringList): boolean;

    property Files[index: integer]: String read GetFileFound;
    property LineFound[index: integer]: String read GetLineFound;
    property MatchText[index: integer]: String read GetMatchText;
    property Found: boolean read GetFound;
    property FoundCount: Integer read GetFoundCount;

    property FindText: string read GetFindText write SetFindText;
    property ReplaceText: string read GetReplaceText write SetReplaceText;
    property DefaultPath: String read GetDefPath write SetDefPath;
    property DefaultTypes: String read GetDefTypes write SetDefTypes;
    property CurrentFile: String read FCurFile write FCurFile;
  end;

var
  dFindReplace: TdFindReplace;

implementation

uses unitUtils, shlobj;

{$R *.dfm}

procedure TdFindReplace.btnFindClick(Sender: TObject);
var
  txt, msg, rtxt, fnme: String;
begin
  inherited;
  if rbcurdoc.Checked then
    fnme := FCurFile
  else
    fnme := '';
      txt := mfind.Lines.Text;
      rtxt := mreplace.Lines.Text;
      if not IsValidData then exit;
      StopSearch := false;
      dlgprs.ProcessCaption := 'Searching files';
      dlgprs.Show;
      FCur := 0;
      FMax := 1;
      try
        FindInFiles(txt, rtxt, edtfolder.Text, fnme, edtTypes.Text, cbsubdir.checked, false, false, flist, fmtxt);
      finally
        dlgprs.Hide;
      end;
//  end; //if
  modalResult := MrOk;
end;

function TdFindReplace.FindInFiles(FindText, ReplaceText, Path, FileOnly, FileTypes: String; CheckSubDirs, DoReplace, Backup: boolean;
  var FileList, Matches: TStringList): boolean;
var
  fd: WIN32_FIND_DATA;
  hnd, i: integer;
  fname, findname, findext: String;
  prs: boolean;
  mtxt, idxList: TStringList;
begin
  if length(fileonly) > 0 then
    fname := fileOnly
  else
    fname := Path + '\*.*';
  hnd := FindFirstFile(Pchar(fname), fd);
  if hnd = INVALID_HANDLE_VALUE then
    result := false
  else begin
    prs := true;
    if not dlgprs.UpdateStatus('Searching' +#13#10+ Path, FCur, FMax, true) then StopSearch := true;
    if StopSearch then exit;
    while prs do begin
      findname := fd.cFileName;
      findext := ExtractFileExt(findname);
      if ((fd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) <> 0)
        and ((findname <> '.') and (findname <> '..')) and CheckSubDirs then
        FindInFiles(FindText, ReplaceText, Path + '\' + findname, '', filetypes, CheckSubDirs, DoReplace, Backup, Filelist, Matches)
      else if ((fd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0) then begin
        if (Pos(findext, filetypes) <> 0) or (length(filetypes) <= 0) or (filetypes = '*.*') then begin
          idxList := TStringList.Create;
          mtxt := TStringList.Create;
          try
            if not dlgprs.UpdateStatus('Scanning' +#13#10+ Path +#13#10+ findname, FCur, FMax, true) then StopSearch := true;
            if StopSearch then exit;
            FindTextInFile(FindText, ReplaceText, Path + '\' + findname, DoReplace, backup, idxlist, mtxt);
            for i := 0 to idxlist.count -1 do begin
              FileList.Add(Path + '\' + findname+'='+idxlist[i]);
              Matches.Add(mtxt[i]);
              end;
          finally
            idxlist.Free;
            mtxt.free;
          end; //try
        end; //if
      end; //else
      prs := FindNextFile(hnd, fd);
    end; //while
  end;// if
end;

function TdFindReplace.FindTextInFile(FindText, ReplaceText, Filename: String; DoReplace, Backup: boolean; var LineNums, MatchText: TStringList): Boolean;
var
  txt: TextFile;
  comtxt: TStringList;
  buf: TStringList;
  i, msize, cnt, idx, lnenum, flushline, replaces, outline: Integer;
  msg: array of Char;
  smsg, lne, tx: String;
  bufset, open, ropen, backedup: boolean;
  replacefile: TextFile;
  rfilename, bkfile: String;
  //********** Get Text Dosn't work for multi - line search ********
  // Compare fix procedure not needed
{  function GetText(Slist: TStringList): String;
  var
    i: integer;
  begin
    for i := 0 to Slist.Count -1 do
      result := SList[i];
      if i < Slist.Count -1 then
        result := result + #$D#$A;
  end;}
  //**********************************************
begin
  //Find In files
  result := true;
  comtxt := TStringList.Create;
  buf := TStringList.Create;
  open := false;
  ropen := false;
  replaces := 0;
  try
    //Create Temp Replace File
    if DoReplace then begin
      rfilename := ExtractFilePath(filename) + '~rt'+ ExtractFileName(filename);
      AssignFile(replacefile, rfilename);
      {$I-}
      Rewrite(replacefile);
      {$I+}
      if GetIOError then begin result := false; exit end;
      ropen := true;
    end;

    comtxt.Text := findtext;
    AssignFile(txt, filename);
    {$I-}
    Reset(txt);
    {$I+}
    if GetIOError then begin result := false; exit end;
    open := true;

    try
      //Search inside file for match
      cnt := comtxt.Count;
      if cnt <= 0 then cnt := 1;
      lnenum := 0;
      flushline := 0;
      bufset := false;
      buf.Clear;
      while not eof(txt) do begin
        if not bufset then begin
          for i := 0 to cnt - 1 do begin
            if eof(txt) then break;
            ReadLn(txt, lne);
            buf.Add(lne);
          end;
          bufset := true;
        end
        else begin
          ReadLn(txt, lne);
          lnenum := lnenum + 1;

          //Flush Deleted Line to Replace Buffer
          if DoReplace and (lnenum > flushline) then begin
            writeln(replacefile, buf[0]);
            flushline := flushline + 1;
            end;

          buf.Delete(0);
          buf.Add(lne);
        end;
        //Which Compare is better for multi-line checks
        //idx := buf.IndexOf(FindText); or if txt = buf.Text
        if pos(FindText, buf.Text) <> 0 then begin
          if buf.Count > 1 then tx := buf[0] else tx := StringReplace(buf.Text, #$D#$A, '', [rfReplaceAll, rfIgnoreCase]);
          outline := lnenum+1; //-buf.Count+1;
          if outline <= 0 then outline := 1;
          LineNums.Add(IntToStr(outline));
          MatchText.Add(tx);

          //Replace Text
          if DoReplace and ropen then begin
            //re Buffer to temp file
            replaces := replaces + 1;
            writeln(replacefile, replacetext);
            flushline := flushline + buf.count;
            end; //doReplace

          end; //Pos
      end
    finally
      if open then CloseFile(txt);

      //Flush End of buffer to file
      if DoReplace and (replaces > 0) then begin
        for i := 0 to buf.Count - 1 do begin
          //Flush Deleted Line to Replace Buffer
          if DoReplace and ((lnenum+(i+1)) > flushline) then begin
            writeln(replacefile, buf[i]);
            flushline := flushline + 1;
            end;
        end;
      end;

      if ropen then CloseFile(replacefile);

      //Delete Temp file if no replace
      if DoReplace and (replaces <= 0) then
        DeleteFile(rfilename)
      else if DoReplace then begin

        //Backup File
        backedup := true;
        if backup then begin
          bkfile := Filename + '.bak';
          if not CopyFile(PChar(Filename), PChar(bkfile), false) then begin
            messagedlg('Unable to create backup file ' + ExtractFilename(bkfile)+ ', replacement will be saved as ' + rfilename, mtError, [mbok], 0);
            backedup := false;
            end;
          end;

        if backedup then begin
          if not DeleteFile(filename) then begin
            messagedlg('File to be replaced could not be deleted, file will be renamed to ' + 'DELETE_'+ExtractFileName(filename), mtError, [mbok],0);
            if not RenameFile(filename, ExtractFilePath(filename)+'DELETE_'+ExtractFileName(filename) ) then begin
              messagedlg('Unable to rename file to ' + 'DELETE_'+ExtractFileName(filename) + ', replacement will be saved as ' + rfilename, mtError, [mbok],0);
              end
              else begin
                CopyFile(PChar(rfilename), PChar(filename), false);
                DeleteFile(rfilename);
              end;
            end
          else begin
            CopyFile(PChar(rfilename), PChar(filename), false);
            DeleteFile(rfilename);
          end;
        end; // backedup
      end;  //DoReplace
    end;
  finally
    comtxt.Free;
    buf.Free;
  end;
end;

procedure TdFindReplace.FormCreate(Sender: TObject);
begin
  inherited;
  flist := TStringList.Create;
  fmtxt := TStringList.Create;
  dlgprs := TdlgProcess.Create(self);
  mfind.Clear;
  mreplace.Clear;
  edtfolder.Text := '';
  edttypes.Text := '';
end;

procedure TdFindReplace.FormDestroy(Sender: TObject);
begin
  inherited;
  flist.Free;
  dlgprs.Free;
  fmtxt.Free;
end;

procedure TdFindReplace.btnReplaceClick(Sender: TObject);
var
  txt, msg, rtxt, fnme: String;
begin
  { TODO 5 -oFind Replace -cDev : Add Replace code to Extended File Replace Dialog }
  inherited;
//  if rbFolder.Checked then begin
//      txt := Copy(mfind.Lines.Text,1, length(mfind.Lines.Text)-2);
  if rbcurdoc.Checked then
    fnme := FCurFile
  else
    fnme := '';
      txt := mfind.Lines.Text;
      rtxt := mreplace.Lines.Text;
      if not IsValidData then exit;
      StopSearch := false;
      dlgprs.ProcessCaption := 'Searching files';
      dlgprs.Show;
      FCur := 0;
      FMax := 1;
      try
        FindInFiles(txt, rtxt, edtfolder.Text, fnme, edtTypes.Text, cbsubdir.checked, true, cbBackup.checked, flist, fmtxt);
      finally
        dlgprs.Hide;
      end;
//  end; //if
  modalResult := MrOk;
end;

function TdFindReplace.GetFileFound(index: integer): String;
begin
  if index <= flist.Count -1 then
    result := flist.Names[index];
end;

function TdFindReplace.GetFound: boolean;
begin
  result := flist.Count > 0;
end;

function TdFindReplace.GetFoundCount: Integer;
begin
  result := flist.Count;
end;

function TdFindReplace.GetLineFound(index: integer): String;
var
  tmp: String;
begin
  if index <= flist.Count -1 then begin
    tmp := flist[index];
    result := Copy(tmp, pos('=',tmp) +1, length(tmp));
  end;
end;

function TdFindReplace.IsValidData: Boolean;
var
  txt, pth, ck: String;
begin
  //Do Validation Checks.
  result := false;
  txt := '';

  //remove last slash
  pth := edtfolder.Text;
  ck := pth[length(pth)];
  if ck = '\' then
    pth := Copy(pth,1,length(pth)-1);
  edtfolder.Text := pth;

  //Is Valid Directory
  if not Directoryexists(edtfolder.Text) then
    txt := 'Directory doesn''t exist';


  if length(txt) > 0 then begin
    messagedlg(txt, mtError, [mbOk], 0);
    exit;
    end;
  result := true;
end;

function TdFindReplace.GetDefPath: String;
begin
  result := edtfolder.Text;
end;

function TdFindReplace.GetDefTypes: String;
begin
  result := edttypes.Text;
end;

procedure TdFindReplace.SetDefPath(const Value: String);
begin
  edtfolder.Text := Value;
end;

procedure TdFindReplace.SetDefTypes(const Value: String);
begin
  edttypes.Text := value;
end;

function TdFindReplace.GetMatchText(index: integer): String;
var
  tmp: String;
begin
  if index <= fmtxt.Count -1 then
    result := fmtxt[index];
end;

procedure TdFindReplace.sbtnDirClick(Sender: TObject);
begin
  inherited;
  edtfolder.Text := BrowseDialog('Select Directroy', BIF_RETURNONLYFSDIRS);
end;

function TdFindReplace.GetFindText: string;
begin
  result := mFind.Lines.Text;
end;

function TdFindReplace.GetReplaceText: string;
begin
  result := mReplace.Lines.Text;
end;

procedure TdFindReplace.SetFindText(const Value: string);
begin
  mFind.Lines.Text := value;
end;

procedure TdFindReplace.SetReplaceText(const Value: string);
begin
  mReplace.Lines.Text := value;
end;

end.
