unit frmHexEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, MPHexEditor, MPHexEditorEx, ActnMan, ImgList, Menus,
  StdActns, ActnList, ComCtrls, ToolWin, ActnCtrls, flargepad, frmCatalog,
  unitutils, CustomizeDlg, ExtCtrls;

type
  TfHexEdit = class(TForm)
    memohex: TMPHexEditorEx;
    sbar: TStatusBar;
    HexActions: TActionList;
    aopen: TAction;
    aclosefile: TAction;
    ASave: TAction;
    aFind: TAction;
    aReplace: TAction;
    aSaveClose: TAction;
    aexit: TAction;
    aEditCopy: TEditCopy;
    aEditCut: TEditCut;
    aEditPaste: TEditPaste;
    aEditSelectAll: TEditSelectAll;
    aEditDelete: TEditDelete;
    aEditUndo: TEditUndo;
    aFileNew: TAction;
    aShowRuler: TAction;
    aOptions: TAction;
    aSaveAs: TAction;
    aEditRedo: TAction;
    aPrintPreview: TAction;
    aPrint: TAction;
    aPrinterSetup: TAction;
    aEmailTxt: TAction;
    aEmailAttach: TAction;
    aAbout: TAction;
    aUserTBar: TAction;
    aCustomUserBar: TAction;
    anethome: TAction;
    ahelp: TAction;
    ahelpTopics: TAction;
    aenterserial: TAction;
    abuyLE: TAction;
    anetsupport: TAction;
    aupdates: TAction;
    aonlinehelp: TAction;
    atutorials: TAction;
    aAsciiCode: TAction;
    arunfile: TAction;
    aOpenHex: TAction;
    aCalendar: TAction;
    aReposit: TAction;
    aFindNext: TAction;
    aFtpSaveAs: TAction;
    aftpOpen: TAction;
    aFTPSave: TAction;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    OpenBinary1: TMenuItem;
    mitemReopen: TMenuItem;
    N7: TMenuItem;
    ASave1: TMenuItem;
    SaveAs1: TMenuItem;
    SaveClose1: TMenuItem;
    Close1: TMenuItem;
    N10: TMenuItem;
    FTPOpen1: TMenuItem;
    FTPSave1: TMenuItem;
    FTPSaveAs1: TMenuItem;
    N9: TMenuItem;
    SendTo1: TMenuItem;
    Email1: TMenuItem;
    EmailasText1: TMenuItem;
    EmailasAttachment1: TMenuItem;
    HTML1: TMenuItem;
    RTF1: TMenuItem;
    N8: TMenuItem;
    PrinterSetup1: TMenuItem;
    PrintPreview1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Redo1: TMenuItem;
    N3: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N4: TMenuItem;
    Insert1: TMenuItem;
    AsciiCode1: TMenuItem;
    SelectAll1: TMenuItem;
    Search1: TMenuItem;
    Find1: TMenuItem;
    FindNext1: TMenuItem;
    Replace1: TMenuItem;
    Tools1: TMenuItem;
    Repository1: TMenuItem;
    N19: TMenuItem;
    ASCIICodes1: TMenuItem;
    ViewASCIICodes1: TMenuItem;
    ViewSymbolNames1: TMenuItem;
    N17: TMenuItem;
    GetASCIIvalue1: TMenuItem;
    GetCharactor1: TMenuItem;
    Calendar1: TMenuItem;
    N5: TMenuItem;
    RunFile1: TMenuItem;
    N18: TMenuItem;
    ShowToolbar1: TMenuItem;
    ShowRuler1: TMenuItem;
    UserToolbar1: TMenuItem;
    CustomizeUserToolbar1: TMenuItem;
    N6: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    ContextHelp1: TMenuItem;
    HelpTopics1: TMenuItem;
    OnlineHelp1: TMenuItem;
    utorials1: TMenuItem;
    N13: TMenuItem;
    NetLeggerHomePage1: TMenuItem;
    NetLeggerSupportPage1: TMenuItem;
    EnterSerialNumber1: TMenuItem;
    BuyLargeEdit1: TMenuItem;
    CheckforUpdates1: TMenuItem;
    N12: TMenuItem;
    About1: TMenuItem;
    ImageList1: TImageList;
    fd: TFindDialog;
    rd: TReplaceDialog;
    od: TOpenDialog;
    sd: TSaveDialog;
    HexActionManager: TActionManager;
    aTextMode: TAction;
    PrintSetupdlg: TPrinterSetupDialog;
    printdlg: TPrintDialog;
    CoolBar1: TCoolBar;
    ATBMain: TActionToolBar;
    aUserTools: TActionToolBar;
    N20: TMenuItem;
    SwitchtoTextMode1: TMenuItem;
    aTranKASCII: TAction;
    aTransKDos: TAction;
    aTransKAsIs: TAction;
    aTransKBCD: TAction;
    aTransKMac: TAction;
    SelectTranslation1: TMenuItem;
    Windows1: TMenuItem;
    Macintosh1: TMenuItem;
    ASCII1: TMenuItem;
    BCD1: TMenuItem;
    Dos1: TMenuItem;
    aEmailHex: TAction;
    AsHex1: TMenuItem;
    CustomDlg: TCustomizeDlg;
    sdwinmac: TSaveDialog;
    odwinmac: TOpenDialog;
    aRecMac: TAction;
    aPlayMac: TAction;
    aSaveMac: TAction;
    aStopMac: TAction;
    aOpenMac: TAction;
    WindowsMacro1: TMenuItem;
    Record1: TMenuItem;
    Play1: TMenuItem;
    Stop1: TMenuItem;
    Open2: TMenuItem;
    Save1: TMenuItem;
    pSubWindow: TPanel;
    pcTools: TPageControl;
    splitsubwin: TSplitter;
    aclosewindow: TAction;
    procedure memohexChange(Sender: TObject);
    procedure aFileNewExecute(Sender: TObject);
    procedure aSaveAsExecute(Sender: TObject);
    procedure aopenExecute(Sender: TObject);
    procedure aclosefileExecute(Sender: TObject);
    procedure ASaveExecute(Sender: TObject);
    procedure aSaveCloseExecute(Sender: TObject);
    procedure aPrintPreviewExecute(Sender: TObject);
    procedure aTextModeExecute(Sender: TObject);
    procedure aOpenHexExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aShowRulerExecute(Sender: TObject);
    procedure aexitExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure fdFind(Sender: TObject);
    procedure aTranKASCIIExecute(Sender: TObject);
    procedure aTransKDosExecute(Sender: TObject);
    procedure aTransKAsIsExecute(Sender: TObject);
    procedure aTransKBCDExecute(Sender: TObject);
    procedure aTransKMacExecute(Sender: TObject);
    procedure aRepositExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aPrinterSetupExecute(Sender: TObject);
    procedure aftpOpenExecute(Sender: TObject);
    procedure aFTPSaveExecute(Sender: TObject);
    procedure aFtpSaveAsExecute(Sender: TObject);
    procedure aFindNextExecute(Sender: TObject);
    procedure rdReplace(Sender: TObject);
    procedure aReplaceExecute(Sender: TObject);
    procedure aEditUndoExecute(Sender: TObject);
    procedure aEditRedoExecute(Sender: TObject);
    procedure aEditCutExecute(Sender: TObject);
    procedure aEditCopyExecute(Sender: TObject);
    procedure aEditPasteExecute(Sender: TObject);
    procedure aEditSelectAllExecute(Sender: TObject);
    procedure aEditDeleteExecute(Sender: TObject);
    procedure aAsciiCodeExecute(Sender: TObject);
    procedure aEmailTxtExecute(Sender: TObject);
    procedure aEmailAttachExecute(Sender: TObject);
    procedure aEmailHexExecute(Sender: TObject);
    procedure arunfileExecute(Sender: TObject);
    procedure aCustomUserBarExecute(Sender: TObject);
    procedure aOptionsExecute(Sender: TObject);
    procedure aUserTBarExecute(Sender: TObject);
    procedure aCalendarExecute(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
    procedure anethomeExecute(Sender: TObject);
    procedure ahelpExecute(Sender: TObject);
    procedure ahelpTopicsExecute(Sender: TObject);
    procedure aenterserialExecute(Sender: TObject);
    procedure abuyLEExecute(Sender: TObject);
    procedure anetsupportExecute(Sender: TObject);
    procedure aupdatesExecute(Sender: TObject);
    procedure aonlinehelpExecute(Sender: TObject);
    procedure atutorialsExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aRecMacExecute(Sender: TObject);
    procedure aStopMacExecute(Sender: TObject);
    procedure aSaveMacExecute(Sender: TObject);
    procedure aOpenMacExecute(Sender: TObject);
    procedure aPlayMacExecute(Sender: TObject);
    procedure aclosewindowExecute(Sender: TObject);
  private
    FIsInit: boolean;
    FOnCloseViewer: TNotifyEvent;
    FOnSaveHex: TNotifyEvent;
    function GetCurFile: string;
    procedure SetCurFile(const Value: string);
  private
    { Private declarations }
    FSCata: TfSQLCata;
    FChanges: Boolean;
    ACurFile: String;
    FNewFile: boolean;

    //Remote File Info
    IsRemoteFileOpen: boolean;
    FHost: String;
    FPort: integer;
    FUser: String;
    FPass: String;
    FRemoteDir: String;
    FRemoteFile: String;

    //Macrostuff
    IsMacSaved: Boolean;
    FMacFile: String;
    IsRecord: boolean;
    procedure PlayMacro(Filename: String);
    procedure StopRec;
    procedure PlayFinished; stdcall;

    procedure PrintHex(FromPage, ToPage, Copies: Integer; OnlySel: boolean = false);

    procedure SwitchEditorToText(filename: string);

    procedure updateposition;

    //callback
    procedure SetText(Text: String);
    function GetSelText: String;

    property Changes: boolean read FChanges write FChanges default false;
    property FCurFile: string read GetCurFile write SetCurFile;

    //Initize Stuff
    property IsInitialized: boolean read FIsInit write FIsInit default false;
    procedure InitApp( Sender: TObject );

    //Advanced Functions
    procedure Email(EMode: TEmailMode);

    function FindText( Text: String ): Boolean;
  public
    { Public declarations }
    procedure DebugLog(Text: String);

    function OpenHexFile(filename: String; DoSaveCheck: boolean = false): boolean;
    procedure LoadData(data: string);
    procedure OpenCurHex;
    procedure CloseCurHex;
    procedure OpenNewHex;

    function SaveCheck(Closing: Boolean): boolean;
    procedure SaveFile;
    procedure SaveFileAs(Filename: String);    

    procedure ShowOpenHex;
    procedure PrintDialog;

    property OnCloseViewer: TNotifyEvent read FOnCloseViewer write FOnCloseViewer;
    property OnSaveHex: TNotifyEvent read FOnSaveHex write FOnSaveHex;
    property Filename: string read ACurFile write ACurFile; 
  end;

var
  fHexEdit: TfHexEdit;

implementation

{$R *.dfm}

uses  frmPrintPreviewHex,
      printers,
      dlgNagScreen,
      unitAppConst,
      Clipbrd,
      dlgFTPSaveOpen,
      foptions,
      dlgMonthCal,
      dlgAboutLE,
      shellapi,
      unithelpconstants,
      winmacro;

const
  scUntitled = 'Untitled';

{ TForm1 }

function TfHexEdit.OpenHexFile(filename: String;
  DoSaveCheck: boolean): boolean;
var
  i: integer;
begin
  result := false;
  DebugLog('OpenHexFile Filename='+filename);
  if Not Fileexists(filename) then begin
    MessageDlg('File could not be found', mtError, [mbOk], 0);
    exit;
  end;
  if dosavecheck then begin
    if not SaveCheck(false) then exit;
  end;
  FCurFile := filename;
  FNewFile := false;
  OpenCurHex;
  updateposition;
  //*********
  DebugLog('OpenFile Finish');
  result := true;
end;

procedure TfHexEdit.OpenNewHex;
begin
  memohex.CreateEmptyFile(scUntitled);
  FCurFile := '';
  FNewFile := true;
end;

procedure TfHexEdit.ShowOpenHex;
var
  isSmall: Boolean;
  i: integer;
begin
  DebugLog('ShowOpenHex Edit');
  if not SaveCheck(false) then exit;
  if od.Execute then begin
    OpenHexFile(od.FileName, false);
  end;
  DebugLog('ShowOpenHex Finish');
end;

procedure TfHexEdit.OpenCurHex;
begin
  memohex.LoadFromFile(FCurFile);
end;

procedure TfHexEdit.DebugLog(Text: String);
begin
  fLEdit.DebugLog(text);
end;

procedure TfHexEdit.SwitchEditorToText(filename: String);
begin
  fLEdit.Width := Width;
  fLEdit.Height := Height;
  fLEdit.Top := top;
  fLEdit.Left := left;
  fledit.WindowState := WindowState;
  fLEdit.Show;
  if length(filename) > 0 then
    fLEdit.OpenFile(filename);
  hide
end;

procedure TfHexEdit.memohexChange(Sender: TObject);
begin
   Changes := memohex.Modified;
end;

function TfHexEdit.SaveCheck(Closing: Boolean): boolean;
var
  res: word;
begin
  DebugLog('SaveCheck Closing='+BoolToStr(Closing, true));
  result := true;
  if Changes then begin
    res := MessageDlg('Do you wish to save your changes?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if res = mrYes then
      SaveFile
    else if res = mrCancel then
      result := false
    else begin
      if Closing then begin
        CloseCurHex;
      end;
    end;
  end
  else begin
    if Closing then begin
      CloseCurHex;
    end;
  end;
  DebugLog('SaveCheck Finish');
end;

procedure TfHexEdit.updateposition;
begin

end;

procedure TfHexEdit.SaveFile;
begin
  if FNewFile then
    aSaveAsExecute(nil)
  else
    memohex.Save;
end;

procedure TfHexEdit.CloseCurHex;
var
  s: String;
begin
  DebugLog('CloseCurFile');
  OpenNewHex;
  DebugLog('CloseCurFile Finish');
end;

procedure TfHexEdit.aFileNewExecute(Sender: TObject);
begin
  OpenNewHex;
end;

procedure TfHexEdit.aSaveAsExecute(Sender: TObject);
begin
  if not sd.Execute then exit;
  savefileas(sd.FileName);
end;

procedure TfHexEdit.SaveFileAs(Filename: String);
begin
  memohex.SaveToFile(filename);
end;

procedure TfHexEdit.aopenExecute(Sender: TObject);
begin
  ShowOpenHex
end;

procedure TfHexEdit.aclosefileExecute(Sender: TObject);
begin
  CloseCurHex;
end;

procedure TfHexEdit.ASaveExecute(Sender: TObject);
begin
//  Savefile;
  if assigned(FOnSaveHex) then
    OnSaveHex(self);
end;

procedure TfHexEdit.aSaveCloseExecute(Sender: TObject);
begin
  SaveFile;
  CloseCurHex;
end;

procedure TfHexEdit.aPrintPreviewExecute(Sender: TObject);
begin
  if memohex.SelCount > 0 then
    memohex.PrintOptions.Flags := memohex.PrintOptions.Flags + [pfSelectionOnly];
  fPrintPreHex.ShowPreview(memohex);
  memohex.PrintOptions.Flags := memohex.PrintOptions.Flags - [pfSelectionOnly];
end;

procedure TfHexEdit.aTextModeExecute(Sender: TObject);
var
  cfile: String;
begin
  cfile := FCurFile;
  SaveCheck(false);
  OpenNewHex;
  SwitchEditorToText(cfile);
end;

procedure TfHexEdit.aOpenHexExecute(Sender: TObject);
begin
  //SwitchAsShowOpen
  SaveCheck(false);
  if fLEdit.ShowOpen then begin
    OpenNewHex;
    SwitchEditorToText('');
    end;
end;

procedure TfHexEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fledit.Close;
end;

procedure TfHexEdit.aShowRulerExecute(Sender: TObject);
begin
  memohex.ShowRuler := not ashowruler.Checked;
  ashowruler.Checked := memohex.ShowRuler;
end;

procedure TfHexEdit.aexitExecute(Sender: TObject);
begin
  close;
end;

procedure TfHexEdit.aPrintExecute(Sender: TObject);
begin
  PrintDialog;
end;

procedure TfHexEdit.PrintHex(FromPage, ToPage, Copies: Integer; OnlySel: boolean = false);
var
  i, j: integer;
begin
  //print hex
  if OnlySel then
    memohex.PrintOptions.Flags := memohex.PrintOptions.Flags + [pfSelectionOnly];
  printer.BeginDoc;
  printer.Title := FCurFile;
  for i := FromPage to ToPage do begin
    for j := 1 to copies do begin
      memohex.Print(i);
      if i < topage then  printer.NewPage;
      end;
    end;
  printer.EndDoc;
  memohex.PrintOptions.Flags := memohex.PrintOptions.Flags - [pfSelectionOnly];
end;

procedure TfHexEdit.PrintDialog;
var
  Copies, FromPg, ToPg: integer;
begin
  printdlg.FromPage := 1;
  printdlg.MinPage := 1;
  printdlg.ToPage := memohex.PrintNumPages;
  printdlg.MaxPage := memohex.PrintNumPages;
  if printdlg.Execute then begin
    Copies := printdlg.Copies;
    if printdlg.PrintRange = prPageNums then begin
      PrintHex(printdlg.FromPage, printdlg.ToPage, Copies)
      end
    else if printdlg.PrintRange = prSelection then begin
      PrintHex(1, memohex.PrintNumPages, Copies, true)
      end
    else begin
      PrintHex(1, memohex.PrintNumPages, Copies)
    end;
  end;
end;

function TfHexEdit.GetCurFile: string;
begin
  result := ACurFile;
end;

procedure TfHexEdit.SetCurFile(const Value: string);
var
  regtxt: string;
begin
  if not fLEdit.Registered then
    regtxt := ' | Unregistered (Day ' + IntToStr(dlgNag.DaysUsed) + ' of 30)'
  else
    regtxt := '';
  ACurFile := Value;
  if Length(ACurFile) <= 0 then
    self.Caption := scTitle + ' - Untitled' + regtxt
  else
    self.Caption := scTitle + ' - ' + ExtractFileName(ACurFile) + regtxt;
  application.Title := self.Caption;
end;


procedure TfHexEdit.FormCreate(Sender: TObject);
begin
  IsRecord := false;
  FMacFile := '';
  IsMacSaved := false;
  OpenNewHex;
end;

procedure TfHexEdit.aFindExecute(Sender: TObject);
begin
  //Find
  if length(memohex.SelectionAsHex) > 0 then
    fd.FindText := memohex.SelectionAsHex
  else if length(clipboard.AsText) >= 0 then
    fd.FindText := clipboard.AsText;
  fd.Execute;
end;

procedure TfHexEdit.fdFind(Sender: TObject);
var
  ftxt: String;
begin
  ftxt := fd.FindText;
  if not FindText(ftxt) then
    Showmessage(ftxt + ' not found');
end;

procedure TfHexEdit.aTranKASCIIExecute(Sender: TObject);
begin
  memohex.Translation := tkASCII;
  aTranKASCII.Checked := not aTranKASCII.Checked;
end;

procedure TfHexEdit.aTransKDosExecute(Sender: TObject);
begin
  memohex.Translation := tkDos8;
  aTransKDos.Checked := not aTransKDos.Checked;
end;

procedure TfHexEdit.aTransKAsIsExecute(Sender: TObject);
begin
  memohex.Translation := tkAsIs;
  aTransKAsIs.Checked := not aTransKAsIs.Checked;
end;

procedure TfHexEdit.aTransKBCDExecute(Sender: TObject);
begin
  memohex.Translation := tkBCD;
  aTransKBCD.Checked := not aTransKBCD.Checked;
end;

procedure TfHexEdit.aTransKMacExecute(Sender: TObject);
begin
  memohex.Translation := tkMac;
  aTransKMac.Checked := not aTransKMac.Checked;
end;

procedure TfHexEdit.aRepositExecute(Sender: TObject);
var
  stop,sleft: integer;
begin
  sTop := top + height - fSQLCata.Height;
  sleft := left + width - fSQLCata.Width;
  FSCata.Top := stop - 20;
  FSCata.Left := sleft - 5;
  FSCata.OnSetText := SetText;
  FSCata.OnGetText := GetSelText;
  FSCata.Show;
end;

function TfHexEdit.GetSelText: String;
begin
  result := memohex.SelectionAsHex;
end;

procedure TfHexEdit.SetText(Text: String);
begin
  memohex.SelectionAsHex := Text;
end;

procedure TfHexEdit.InitApp(Sender: TObject);
begin
  IsInitialized := true;
  if not assigned(FSCata) then
    FSCata := TfSQLCata.Create(self);

  //HexActionManager.LoadFromFile(AppPath+'usrhxact.atb');    
  if fopts.GetSetting(Name, aUserTools.Name, aUserTools.Visible) then
    aUserTBar.Execute;
  if not fopts.GetSetting(Name, memohex.Name+'_RULER', memohex.ShowRuler) then
    aShowRuler.Execute;
end;

procedure TfHexEdit.FormShow(Sender: TObject);
begin
  if not IsInitialized then InitApp(Sender);
end;

procedure TfHexEdit.aPrinterSetupExecute(Sender: TObject);
begin
  //Setup Printer
  if PrintSetupdlg.Execute then begin
  end;
end;

procedure TfHexEdit.aftpOpenExecute(Sender: TObject);
var
  fdlg: TdFTPso;
begin
  fdlg := TdFTPso.Create(self);
  try
    if fdlg.Execute(fdtOpen) then begin
      if messagedlg('Do you wish to open the file?', mtConfirmation, [mbYes, mbNO], 0) = mrYes then begin
        OpenHexFile(fdlg.Filename, true);
        //Set After Open local because open local set Remote to false;
        IsRemoteFileOpen := true;
        FHost := fdlg.Host;
        FPort := fdlg.Port;
        FUser := fdlg.User;
        FPass := fdlg.Pass;
        FRemoteDir := fdlg.RemoteDir;
        FRemoteFile := fdlg.RemoteFile;
        end;
      end;
  finally
    fdlg.Free;
  end;
end;

procedure TfHexEdit.aFTPSaveExecute(Sender: TObject);
var
  fdlg: TdFTPso;
  msg: String;
begin
  if not IsRemoteFileOpen then begin
    messageDlg('This file wasn''t opened remotely, please use save as first.', mtinformation, [mbok], 0);
    exit;
    end;
  //Save File
  fdlg := TdFTPso.Create(self);
  try
    msg := Format('Are you sure you wish to save the current file to the following location? '#$D#$A'  Host: %s'#$D#$A'  Dir: %s'#$D#$A'  File: %s', [FHost, FRemoteDir, FRemoteFile]);
    if messagedlg(msg, mtConfirmation, [mbYes, mbNO], 0) = mrYes then begin
      IsRemoteFileOpen := false;
      SaveFile;
      IsRemoteFileOpen := true;
      fdlg.Filename := FCurFile;
      fdlg.Host := FHost;
      fdlg.Port := FPort;
      fdlg.User := FUser;
      fdlg.Pass := FPass;
      fdlg.RemoteDir := FRemoteDir;
      fdlg.RemoteFile := FRemoteFile;
      fdlg.SendFile;
      end;
  finally
    fdlg.Free;
  end;
end;

procedure TfHexEdit.aFtpSaveAsExecute(Sender: TObject);
var
  fdlg: TdFTPso;
begin
  fdlg := TdFTPso.Create(self);
  try
    fdlg.Filename := FCurFile;
    if fdlg.Execute(fdtSave) then begin
      IsRemoteFileOpen := true;
      FHost := fdlg.Host;
      FPort := fdlg.Port;
      FUser := fdlg.User;
      FPass := fdlg.Pass;
      FRemoteDir := fdlg.RemoteDir;
      FRemoteFile := fdlg.RemoteFile;
      end;
  finally
    fdlg.Free;
  end;
end;

procedure TfHexEdit.aFindNextExecute(Sender: TObject);
begin
  fdFind(sender);
end;

procedure TfHexEdit.rdReplace(Sender: TObject);
var
  ftxt, rtxt: String;
  en, st, i: integer;
  fnd: boolean;
begin
  ftxt := rd.FindText;
  rtxt := rd.ReplaceText;
  if not (frReplaceAll in rd.Options) then begin
      if FindText( ftxt ) then
        memohex.ReplaceSelection(Pchar(rtxt), length(rtxt), 'Replace ' + ftxt);
  end
  else begin
    i := 1;
    if memohex.SelCount > 0 then
      memohex.ReplaceSelection(Pchar(rtxt), length(rtxt), 'Replace All ' + ftxt + ' ' + IntToStr(i));
    fnd := FindText( ftxt );
    while fnd do begin
      memohex.ReplaceSelection(Pchar(rtxt), length(rtxt), 'Replace All ' + ftxt + ' ' + IntToStr(i));
      fnd := FindText( ftxt );
      i := i + 1;
    end;
    Showmessage('Replaced ' + IntToStr(i) + ' occurances.');
  end;
end;

function TfHexEdit.FindText(Text: String): Boolean;
var
  ftxt: String;
  en, st, i: integer;
begin
  ftxt := Text;
  st := memohex.GetCursorPos + memohex.SelCount;
  en := length(memohex.AsHex);
  i := memohex.Find(PChar(ftxt), length(ftxt), st, en, true, true);
  if i >= 0 then begin
    memohex.SelStart := i;
    memohex.SelEnd := i + length(ftxt) -1;
    result := true;
  end
  else
    result := false;
end;

procedure TfHexEdit.aReplaceExecute(Sender: TObject);
begin
  rd.Execute;
end;

procedure TfHexEdit.aEditUndoExecute(Sender: TObject);
begin
  memohex.Undo;
end;

procedure TfHexEdit.aEditRedoExecute(Sender: TObject);
begin
  memohex.Redo;
end;

procedure TfHexEdit.aEditCutExecute(Sender: TObject);
begin
  memohex.CBCut;
end;

procedure TfHexEdit.aEditCopyExecute(Sender: TObject);
begin
  memohex.CBCopy;
end;

procedure TfHexEdit.aEditPasteExecute(Sender: TObject);
begin
  memohex.CBPaste;
end;

procedure TfHexEdit.aEditSelectAllExecute(Sender: TObject);
begin
  memohex.SelectAll;
end;

procedure TfHexEdit.aEditDeleteExecute(Sender: TObject);
begin
  memohex.DeleteSelection('Delete Selection');
end;

procedure TfHexEdit.aAsciiCodeExecute(Sender: TObject);
var
  txt : string;
begin
  if inputquery('Insert ASCII Charactor Code', 'Enter Charactor', txt ) then begin
    if length(txt) <= 0 then begin messagedlg('Please enter a valid charactor.', mtError, [mbok], 0); exit; end;
    memohex.SelectionAsText := txt;
    end;
end;

procedure TfHexEdit.aEmailTxtExecute(Sender: TObject);
begin
  try
    Email(emText);
  except
    Showmessage('Unable to email text:' + Exception(exceptobject).Message);
  end;
end;

procedure TfHexEdit.Email(EMode: TEmailMode);
var
  sub,bdy, att: String;
begin
  bdy := ''; att := '';
  if length(FCurFile) <= 0 then
    sub := 'Untitled'
  else
    sub := ExtractFilename(FCurFile);

  if emode = emText then
    bdy := memohex.AsText
  else if emode = emHex then
    bdy := memohex.AsHex
  else begin
    SaveCheck(false);
    att := FCurFile;
    end;

  sendMail( '', '',
             '', '',
             sub, bdy,
             att, true );

{  bdy := StringReplace(bdy, '%', '%25', [rfReplaceAll, rfIgnoreCase]);
  bdy := StringReplace(bdy, ' ', '%20', [rfReplaceAll, rfIgnoreCase]);
  bdy := StringReplace(bdy, '?', '%3F', [rfReplaceAll, rfIgnoreCase]);
  bdy := StringReplace(bdy, '=', '%3D', [rfReplaceAll, rfIgnoreCase]);
  bdy := StringReplace(bdy, '&', '%26', [rfReplaceAll, rfIgnoreCase]);
  bdy := StringReplace(bdy, #$D#$A, '%0d%0a', [rfReplaceAll, rfIgnoreCase]);
  ExecuteFile('mailto:?subject='+sub+'&body='+bdy);}
end;


procedure TfHexEdit.aEmailAttachExecute(Sender: TObject);
begin
  //Mailas Attach
  try
    Email(emAttach);
  except
    Showmessage('Unable to email attachment:' + Exception(exceptobject).Message);
  end;
end;

procedure TfHexEdit.aEmailHexExecute(Sender: TObject);
begin
  //Mailas Attach
  try
    Email(emHex);
  except
    Showmessage('Unable to email as Hex:' + Exception(exceptobject).Message);
  end;
end;

procedure TfHexEdit.arunfileExecute(Sender: TObject);
var
  tmdir, tfle: String;
begin
//  tmdir := GetTempDir;
//  tfle := GetTemporaryFileName(tmdir, 'LGTF');
//  tfle := GetTmpPathFileName(ExtractFilePath(FCurFile), FCurFile);
  //I didn't use temporary paths and filenames because I wanted the
  //behavior to be more like Homesite, and I wanted to override the
  //temp file after
  tfle := ExtractFilePath(FCurFile) + '~' + ExtractFilename(FCurFile);
  memohex.SaveToFile(tfle);
  ExecuteFile(tfle, '');  //
end;

procedure TfHexEdit.aCustomUserBarExecute(Sender: TObject);
begin
  CustomDlg.Show;
end;

procedure TfHexEdit.aOptionsExecute(Sender: TObject);
begin
  if fopts.ShowModal = mrOK then begin;
    //Set Changed options
    end;
end;

procedure TfHexEdit.aUserTBarExecute(Sender: TObject);
begin
  aUserTBar.Checked := not aUserTBar.Checked;
  aUserTools.Visible := aUserTBar.Checked;  
end;

procedure TfHexEdit.aCalendarExecute(Sender: TObject);
begin
  // show calendar dialog
  if not assigned(dMonCal) then
    dMonCal := TdMonCal.Create(self);
  if dMoncal.ShowModal = mrOk then
    memohex.SelectionAsText := FormatDateTime('DDDD, MMM DD, YYYY', dmoncal.SelectedDate );
end;

procedure TfHexEdit.aAboutExecute(Sender: TObject);
begin
  dlgAbout.ShowModal;
end;

procedure TfHexEdit.anethomeExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.netlegger.net', '', nil, SW_SHOWNORMAL);
end;

procedure TfHexEdit.ahelpExecute(Sender: TObject);
begin
  ShowHelp(hcHelpTopics);
end;

procedure TfHexEdit.ahelpTopicsExecute(Sender: TObject);
begin
    ShowHelp(hcHelpTopics);
end;

procedure TfHexEdit.aenterserialExecute(Sender: TObject);
begin
  fLEdit.EnterSerial;
end;

procedure TfHexEdit.abuyLEExecute(Sender: TObject);
begin
  FlEdit.BuyApp;
end;

procedure TfHexEdit.anetsupportExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.netlegger.net/support.html', '', nil, SW_SHOWNORMAL);
end;

procedure TfHexEdit.aupdatesExecute(Sender: TObject);
begin
  fLedit.CheckForUpdates;
end;

procedure TfHexEdit.aonlinehelpExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.netlegger.net/help/le/frames.html', '', nil, SW_SHOWNORMAL);
end;

procedure TfHexEdit.atutorialsExecute(Sender: TObject);
begin
  ShowHelp(hctutorials);
end;

procedure TfHexEdit.FormDestroy(Sender: TObject);
begin
  //Save User layout
  HexActionManager.SaveToFile(AppPath+'usrhxact.atb');
  fopts.SaveSetting(Name, aUserTools.Name, aUserTools.Visible);
  fopts.SaveSetting(Name, memohex.Name+'_RULER', memohex.ShowRuler);

  if assigned(FSCata) then
    FSCata.Free;
end;

procedure TfHexEdit.aRecMacExecute(Sender: TObject);
var
  res: word;
begin
  if not IsMacSaved and (Length(FMacFile) > 0) then begin
    res := MessageDlg('Do you want to save your current macro?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if res = mrYes then
      aSaveMacExecute(nil)
    else if res = mrCancel then
      exit;
  end;
  if length(FMacFile) <= 0 then begin
    FMacFile := AppPath + '~tmpMac.emc';
    end;
  aStopMac.Enabled := true;
  aRecMac.Enabled := false;
  aPlayMac.Enabled := false;
  if StartRecording = 0 then begin
          aStopMac.Enabled := false;
          aRecMac.Enabled := true;
          MessageDlg('Error Starting Macro.', mtError, [mbOK], 0);
  end
  else
    IsMacSaved := false;
end;

procedure TfHexEdit.StopRec;
begin
  if length(FMacFile) <= 0 then
    FMacFile := AppPath + '~tmpMac.emc';
  aRecMac.Enabled := true;
  aStopMac.Enabled := false;
  aPlayMac.Enabled := true;
  if StopRecording(PChar(FMacFile)) > 0 then begin
          aPlayMac.Enabled := true;
  end
  else begin
          aRecMac.Enabled := true;
          MessageDlg('Error Saving Macro File.', mtError, [mbOK], 0);
  end;
  IsRecord := false;
end;

procedure TfHexEdit.aPlayMacExecute(Sender: TObject);
begin
  if length(FMacFile) <= 0 then begin
    if not odwinmac.Execute then exit;
    FMacFile := odwinmac.filename;
    IsMacSaved := true;
  end;
  PlayMacro(FMacFile);
end;

procedure TfHexEdit.PlayMacro(Filename: String);
begin
//play mac
  Playback(PChar(Filename), PlayFinished);
end;

procedure TfHexEdit.aSaveMacExecute(Sender: TObject);
begin
  //SaveMac
  if not sdwinmac.Execute then exit;
  CopyFile(PChar(FMacFile), PChar(sdwinmac.FileName), true);
  FMacFile := sdwinmac.FileName;
  IsMacSaved := true;
end;

procedure TfHexEdit.aStopMacExecute(Sender: TObject);
begin
  StopRec;
end;

procedure TfHexEdit.PlayFinished;
begin
  aplaymac.Enabled := true;
end;

procedure TfHexEdit.aOpenMacExecute(Sender: TObject);
begin
  //Open
  if not odwinmac.Execute then begin
    FMacFile := odwinmac.filename;
    IsMacSaved := true;
  end;
end;


procedure TfHexEdit.aclosewindowExecute(Sender: TObject);
begin
  //Close Window
  //Close this window
  CloseCurHex;
  if assigned( FOnCloseViewer ) then
    FOnCloseViewer( sender );  
end;

procedure TfHexEdit.LoadData(data: string);
begin
  memohex.AsText := data;
end;

end.

