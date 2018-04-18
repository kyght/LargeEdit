unit autoLargeEdit;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, LargeEdit_TLB, StdVcl, fLargePad, autoLargeFile, dlgProcessing;

type
  TLargeEditor = class(TAutoObject, ILargeEditor)
  private
    FLPad: TfLEdit;
    FWorkingDir: string;
    FdlgProcess: TdlgProcess;
    function GetWorkingDir: string;
    procedure SetWorkingDir(const Value: string);
  protected
    procedure ShowHelp(const Helpfile, Search: WideString); safecall;
    function Get_CaretX: Integer; safecall;
    function Get_CaretY: Integer; safecall;
    procedure Set_CaretX(Value: Integer); safecall;
    procedure Set_CaretY(Value: Integer); safecall;
    procedure ToggleProjectWin; safecall;
    procedure ResultLog(const text: WideString); safecall;
    function Get_Files(index: Integer): LargeFile; safecall;
    function Get_FileCount: Integer; safecall;
    function Get_CurrentFile: LargeFile; safecall;
    procedure Update; safecall;
    procedure Save; safecall;
    procedure Print; safecall;
    procedure Run; safecall;
    procedure Open(const Filename: WideString); safecall;
    procedure New; safecall;
    procedure SetCurrentFile(const Filename: WideString); safecall;
    function Get_Version: WideString; safecall;
    function Get_Build: Integer; safecall;
    procedure SetHighlighter(const Name: WideString); safecall;
    procedure FTPOpen; safecall;
    procedure SpellCheck; safecall;
    procedure FTPSave; safecall;
    procedure FTPSaveAs; safecall;
    procedure OpenKeys(const Filename: WideString); safecall;
    procedure PlayKeys; safecall;
    procedure RecKeys; safecall;
    procedure SaveKeys(const Filename: WideString); safecall;
    procedure StopKeys; safecall;
    procedure PrintPreview; safecall;
    function Get_SelectedText: WideString; safecall;
    procedure Set_SelectedText(const Value: WideString); safecall;
    procedure Find(const Text: WideString); safecall;
    procedure Replace(const FindText, ReplaceText: WideString; All: WordBool);
      safecall;
    procedure BlockBegin(x, y: Integer); safecall;
    procedure BlockEnd(x, y: Integer); safecall;
    procedure ShowMessage(const msg: WideString); safecall;
    function InputBox(const title, prompt, defvalue: WideString): WideString;
      safecall;
    procedure RefreshDisplay; safecall;
    function Get_WorkingDirectory: WideString; safecall;
    function ProcessStatus(const status: WideString; progress,
      max: Integer): WordBool; safecall;
    procedure ProcessEnd; safecall;
    procedure ProcessStart(const title: WideString); safecall;
    function MessageDialog(const msgtext: WideString;
      dlgtype: SYSINT): WordBool; safecall;
    procedure ViewAsGrid(const Delimiter: WideString; FirstCols: WordBool);
      safecall;
    function Get_Session(const PropertyName: WideString): OleVariant; safecall;
    procedure Set_Session(const PropertyName: WideString; Value: OleVariant);
      safecall;
    procedure CloseCurrent(savecheck: WordBool); safecall;
    { Protected declarations }
  public
    property WorkingDir: string read GetWorkingDir write SetWorkingDir;
    property LargePad: TfLEdit read FLPad write FLPad;
  end;

implementation

uses ComServ, dlgResultTool, rsFileVersion, forms, dialogs, types, SynEditTypes,
    sysutils, unitutils, controls;

procedure TLargeEditor.ShowHelp(const Helpfile, Search: WideString);
begin
  FLPad.ViewHelp(helpfile, search)
end;

function TLargeEditor.Get_CaretX: Integer;
begin
  result := FLPad.memo1.CaretX;
end;

function TLargeEditor.Get_CaretY: Integer;
begin
  result := FLPad.memo1.CaretY;
end;

procedure TLargeEditor.Set_CaretX(Value: Integer);
begin
  FLPad.memo1.CaretX := Value;
end;

procedure TLargeEditor.Set_CaretY(Value: Integer);
begin
  FLPad.memo1.CaretY := Value;
end;

procedure TLargeEditor.ToggleProjectWin;
begin
  FLPad.aprojectwinExecute(nil);
end;

procedure TLargeEditor.ResultLog(const text: WideString);
begin
  dResultTool.ResultMemo.Lines.Add(text);
end;

function TLargeEditor.Get_Files(index: Integer): LargeFile;
var
  alefile: TLargeFile;
begin
  alefile := TLargeFile.Create;
  alefile.LargeFile := FLPad.fLEfiles.Items[index];
  alefile.LargeEditor := FLPad;
  result := alefile;
end;

function TLargeEditor.Get_FileCount: Integer;
begin
  result := FLPad.fLEfiles.Count;
end;

function TLargeEditor.Get_CurrentFile: LargeFile;
var
  alefile: TLargeFile;
begin
  alefile := TLargeFile.Create;
  alefile.LargeFile := FLPad.CurLEfile;
  alefile.LargeEditor := FLPad;
  result := alefile;
end;

procedure TLargeEditor.Update;
begin
  FLPad.SetCurrentMemo;
  Application.ProcessMessages;
end;

procedure TLargeEditor.Save;
begin
  FLPad.SaveMulti();
end;

procedure TLargeEditor.Print;
begin
  FLPad.JustPrint;
end;

procedure TLargeEditor.Run;
begin
  FLPad.arunfileExecute(nil);
end;

procedure TLargeEditor.Open(const Filename: WideString);
begin
  FLPad.OpenFileMulti(filename);
end;

procedure TLargeEditor.New;
begin
  FLPad.OpenNewMulti;
end;

procedure TLargeEditor.SetCurrentFile(const Filename: WideString);
begin
  FLPad.SetCurrentTab(Filename);
  FLPad.SetCurrentMemo;
  FLPad.SetCurrentHL;
  FLPad.SetCursorPos;
end;

function TLargeEditor.Get_Version: WideString;
var
  fv: TrsFileVersion;
begin
  //GetLEVersion Number
  fv := TrsFileVersion.Create;
  try
    if fv.GetFileVersion(Application.ExeName) then begin
      //File Verison info
      result := fv.Version;
    end;
  finally
    fv.Free;
  end;
end;

function TLargeEditor.Get_Build: Integer;
var
  fv: TrsFileVersion;
begin
  //GetLEVersion Number
  fv := TrsFileVersion.Create;
  try
    if fv.GetFileVersion(Application.ExeName) then begin
      //File Verison info
      result := fv.Build;
    end;
  finally
    fv.Free;
  end;
end;

procedure TLargeEditor.SetHighlighter(const Name: WideString);
begin
  FLPad.SetCurrentHL(Name);
end;

procedure TLargeEditor.FTPOpen;
begin
  FLPad.aftpOpenExecute(nil);
end;

procedure TLargeEditor.SpellCheck;
begin
  FLPad.aSpellCheckExecute(nil);
end;

procedure TLargeEditor.FTPSave;
begin
  FLPad.aFTPSaveExecute(nil);
end;

procedure TLargeEditor.FTPSaveAs;
begin
  FLPad.aFtpSaveAsExecute(nil);
end;

procedure TLargeEditor.OpenKeys(const Filename: WideString);
begin
  FLPad.OpenKeyMacro( filename );
end;

procedure TLargeEditor.PlayKeys;
begin
  FLPad.aKMPlayExecute(nil);
end;

procedure TLargeEditor.RecKeys;
begin
  FLPad.aKMRecExecute(nil);
end;

procedure TLargeEditor.SaveKeys(const Filename: WideString);
begin
  FLPad.symac.SaveToFile(FileName);
end;

procedure TLargeEditor.StopKeys;
begin
  FLPad.AKMStopExecute(nil);
end;

procedure TLargeEditor.PrintPreview;
begin
  FLPad.aPrintPreviewExecute(nil);
end;

function TLargeEditor.Get_SelectedText: WideString;
begin
  result := FLPad.memo1.SelText;
end;

procedure TLargeEditor.Set_SelectedText(const Value: WideString);
begin
  FLPad.memo1.SelText := value;
  Update;
end;

procedure TLargeEditor.Find(const Text: WideString);
begin
  FLPad.fd.FindText := Text;
  FLPad.fdFind(nil);
end;

procedure TLargeEditor.Replace(const FindText, ReplaceText: WideString;
  All: WordBool);
begin
  FLPad.rd.ReplaceText := ReplaceText;
  FLPad.rd.FindText := FindText;
  if all then
    FLPad.rd.Options := FLPad.rd.Options + [frReplaceAll]
  else
    FLPad.rd.Options := FLPad.rd.Options - [frReplaceAll];
  FLPad.rdReplace(nil);
end;

procedure TLargeEditor.BlockBegin(x, y: Integer);
var
  pt: TPoint;
begin
  pt.X := x;
  pt.Y := y;
  FLPad.memo1.BlockBegin := TBufferCoord(pt);
end;

procedure TLargeEditor.BlockEnd(x, y: Integer);
var
  pt: TPoint;
begin
  pt.X := x;
  pt.Y := y;
  FLPad.memo1.BlockEnd := TBufferCoord(pt);
end;

procedure TLargeEditor.ShowMessage(const msg: WideString);
begin
  flpad.ShowMsg(msg);
end;

function TLargeEditor.InputBox(const title, prompt,
  defvalue: WideString): WideString;
begin
  result := flpad.InpBox(title, prompt, defvalue);
end;

procedure TLargeEditor.RefreshDisplay;
begin
  Application.ProcessMessages;
end;

function TLargeEditor.Get_WorkingDirectory: WideString;
begin
  result := WorkingDir;
end;

function TLargeEditor.GetWorkingDir: string;
begin
  if length(FWorkingDir) > 0 then
    result := FWorkingDir
  else if (not(FLPad.CurLEfile.IsNewFile)) then
    result := ExtractFilePath(FLPad.CurLEfile.Filename)
  else
    result := AppPath + 'scripts';
end;

procedure TLargeEditor.SetWorkingDir(const Value: string);
begin
  FWorkingDir := value;
end;

function TLargeEditor.ProcessStatus(const status: WideString; progress,
  max: Integer): WordBool;
begin
  if not(assigned(FdlgProcess)) then FdlgProcess := TdlgProcess.Create(nil);
  result := FdlgProcess.UpdateStatus(status, progress, max)
end;

procedure TLargeEditor.ProcessEnd;
begin
  if assigned(FdlgProcess) then
    FdlgProcess.Hide;
end;

procedure TLargeEditor.ProcessStart(const title: WideString);
begin
  if not(assigned(FdlgProcess)) then FdlgProcess := TdlgProcess.Create(nil);
  FdlgProcess.ProcessCaption := title;
  FdlgProcess.Show;
end;

function TLargeEditor.MessageDialog(const msgtext: WideString;
  dlgtype: SYSINT): WordBool;
begin
  if (dlgtype >= 0) and (dlgtype <= 4) then
    result := (MessageDlg(msgtext, TMsgDlgType(dlgtype), mbOKCancel, 0 ) = mrOk)
  else
    result := (MessageDlg(msgtext, mtInformation, mbOKCancel, 0 ) = mrOk);
end;

procedure TLargeEditor.ViewAsGrid(const Delimiter: WideString;
  FirstCols: WordBool);
var
  dchar: char;
  str: String;
begin
  str := Delimiter;
  if length(str) > 0 then
    dchar := str[1]
  else
    dchar := ',';
  flpad.ViewAsGrid(dchar, FirstCols);
end;

function TLargeEditor.Get_Session(
  const PropertyName: WideString): OleVariant;
begin
  result := FLPad.GetSessionValue(PropertyName);
end;

procedure TLargeEditor.Set_Session(const PropertyName: WideString;
  Value: OleVariant);
begin
  FLPad.SetSessionValue(PropertyName, Value);
end;

procedure TLargeEditor.CloseCurrent(savecheck: WordBool);
begin
  FLPad.CloseCurrentMulti(savecheck);
end;

initialization
  TAutoObjectFactory.Create(ComServer, TLargeEditor, Class_LargeEditor,
    ciMultiInstance, tmApartment);
end.
