unit fLargePad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ActnList, ImgList, Menus, ToolWin, SynEdit,
  unitObjs, synedittypes, StdActns, AppEvnts, SynEditPlugins,
  SynMacroRecorder, SynEditHighlighter, SynEditPrint, SynExportRTF,
  SynEditExport, SynExportHTML, SynCompletionProposal, ActnMan, ActnCtrls,
  ActnMenus, BandActn, SynSpellCheck, dlgSpellCheck, CustomizeDlg, dlgStandardTool,
  XPActnCtrls, ExtActns, OleServer, ESELLERATECONTROL350Lib_TLB, syneditKeyCmds,
  Grids, MPHexEditor, MPHexEditorEx, dlgLargeTxt, OleCtrls,
  MSScriptControl_TLB, unitLargeFiles, IdBaseComponent, IdCoder,
  IdCoder3To4, SynEditRegexSearch, SynEditMiscClasses, SynEditSearch, unitNSToolbars,
  SynURIOpener, SynHighlighterURI;

{ DONE 1 -cBasic : Add Change Font to the Memo1 Synedit }
type
//  TMessages = array of TMessage;
  TFileProcessType = (fptNothing, fptPrint, fptAssociation, fptEdit, fptDebug);
  TPluginEvents = (peOpen, peSave, peClose, peChange, peTabChange);

  TSessionObj = class
  public
    Value: OleVariant;
  end;

  TfLEdit = class(TForm)
    od: TOpenDialog;
    sd: TSaveDialog;
    MainActions: TActionList;
    aopen: TAction;
    aopenedit: TAction;
    anext: TAction;
    fd: TFindDialog;
    rd: TReplaceDialog;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    Search1: TMenuItem;
    Action1: TMenuItem;
    Tools1: TMenuItem;
    Help1: TMenuItem;
    Open1: TMenuItem;
    OpeninEditMode1: TMenuItem;
    aclosefile: TAction;
    aexit: TAction;
    Next1: TMenuItem;
    Close1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    adelfield: TAction;
    aSaveCur: TAction;
    aLongLn: TAction;
    Search2: TMenuItem;
    aFind: TAction;
    Find1: TMenuItem;
    aReplace: TAction;
    N2: TMenuItem;
    Replace1: TMenuItem;
    SaveCurrent1: TMenuItem;
    aSaveClose: TAction;
    SaveClose1: TMenuItem;
    ASave: TAction;
    ASave1: TMenuItem;
    aSelectMode: TAction;
    BlockSelect1: TMenuItem;
    aEditCopy: TEditCopy;
    aEditCut: TEditCut;
    aEditPaste: TEditPaste;
    aEditSelectAll: TEditSelectAll;
    aEditUndo: TEditUndo;
    Undo1: TMenuItem;
    N3: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N4: TMenuItem;
    SelectAll1: TMenuItem;
    aEditDelete: TEditDelete;
    Delete1: TMenuItem;
    aFileNew: TAction;
    New1: TMenuItem;
    aRecMac: TAction;
    aPlayMac: TAction;
    sdMac: TSaveDialog;
    odMac: TOpenDialog;
    sbar: TStatusBar;
    aSaveMac: TAction;
    aStopMac: TAction;
    pRuler: TPanel;
    aShowRuler: TAction;
    ShowRuler1: TMenuItem;
    aKMPlay: TAction;
    AKMStop: TAction;
    aKMRec: TAction;
    symac: TSynMacroRecorder;
    aKMSave: TAction;
    aKMOpen: TAction;
    Marco1: TMenuItem;
    PlaybackKeystrokes1: TMenuItem;
    RecordKeystrokes1: TMenuItem;
    StopRecording1: TMenuItem;
    OpenKeystrokes1: TMenuItem;
    SaveKeystrokes1: TMenuItem;
    aOptions: TAction;
    Options1: TMenuItem;
    N7: TMenuItem;
    aSaveAs: TAction;
    SaveAs1: TMenuItem;
    aEditRedo: TAction;
    Redo1: TMenuItem;
    aShowMacro: TAction;
    MacroToolbar1: TMenuItem;
    aKMPlayPerLine: TAction;
    aGotoLine: TAction;
    GotoLine1: TMenuItem;
    synprint: TSynEditPrint;
    aPrintPreview: TAction;
    aPrint: TAction;
    N8: TMenuItem;
    PrintPreview1: TMenuItem;
    Print1: TMenuItem;
    aPrinterSetup: TAction;
    PrintSetupdlg: TPrinterSetupDialog;
    PrinterSetup1: TMenuItem;
    HeaderFont: TFontDialog;
    printdlg: TPrintDialog;
    aEmailTxt: TAction;
    SendTo1: TMenuItem;
    Email1: TMenuItem;
    aEmailAttach: TAction;
    EmailasText1: TMenuItem;
    EmailasAttachment1: TMenuItem;
    N9: TMenuItem;
    SynExportHTML: TSynExporterHTML;
    SynExportRTF: TSynExporterRTF;
    aExpHTML: TAction;
    sdexp: TSaveDialog;
    aExpRTF: TAction;
    HTML1: TMenuItem;
    RTF1: TMenuItem;
    aAbout: TAction;
    About1: TMenuItem;
    SynAutoComplete: TSynAutoComplete;
    mitemReopen: TMenuItem;
    aSpellCheck: TAction;
    SpellCheck1: TMenuItem;
    aextendfr: TAction;
    ExtendedFileReplace1: TMenuItem;
    pSubWindow: TPanel;
    splitsubwin: TSplitter;
    aShowTools: TAction;
    ShowTools1: TMenuItem;
    aIndent: TAction;
    N11: TMenuItem;
    Indent1: TMenuItem;
    aUnIndent: TAction;
    UnIndent1: TMenuItem;
    ActionManager: TActionManager;
    aUserTBar: TAction;
    UserToolbar1: TMenuItem;
    aSelHighLight: TAction;
    SelectHighLighter1: TMenuItem;
    CustomDlg: TCustomizeDlg;
    aCustomUserBar: TAction;
    CustomizeUserToolbar1: TMenuItem;
    aViewAsGrid: TAction;
    pcTools: TPageControl;
    CoolBar1: TCoolBar;
    ActionToolBar1: TActionToolBar;
    ATBEditor: TActionToolBar;
    ATBEdit: TActionToolBar;
    ATBMacro: TActionToolBar;
    ATBMain: TActionToolBar;
    anethome: TAction;
    ahelp: TAction;
    ahelpTopics: TAction;
    aenterserial: TAction;
    abuyLE: TAction;
    anetsupport: TAction;
    aupdates: TAction;
    aonlinehelp: TAction;
    atutorials: TAction;
    HelpTopics1: TMenuItem;
    ContextHelp1: TMenuItem;
    N12: TMenuItem;
    OnlineHelp1: TMenuItem;
    utorials1: TMenuItem;
    N13: TMenuItem;
    NetLeggerHomePage1: TMenuItem;
    NetLeggerSupportPage1: TMenuItem;
    EnterSerialNumber1: TMenuItem;
    BuyLargeEdit1: TMenuItem;
    CheckforUpdates1: TMenuItem;
    N14: TMenuItem;
    DeleteField2: TMenuItem;
    auppercase: TAction;
    N15: TMenuItem;
    alowercase: TAction;
    N16: TMenuItem;
    ConvertCase1: TMenuItem;
    Uppercase1: TMenuItem;
    Lowercase1: TMenuItem;
    aAsciiCode: TAction;
    Insert1: TMenuItem;
    AsciiCode1: TMenuItem;
    aASCIIvalue: TAction;
    ASCIICodes1: TMenuItem;
    GetASCIIvalue1: TMenuItem;
    aNumCount: TAction;
    NumCount1: TMenuItem;
    Playperline1: TMenuItem;
    aViewASCIICodes: TAction;
    ViewASCIICodes1: TMenuItem;
    aGetCharforCode: TAction;
    GetCharactor1: TMenuItem;
    aSymName: TAction;
    N17: TMenuItem;
    ViewSymbolNames1: TMenuItem;
    aviewHTMLcodes: TAction;
    HTMLCodes1: TMenuItem;
    ViewHTMLcodes1: TMenuItem;
    arunfile: TAction;
    ShowToolbar1: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    aOpenHex: TAction;
    OpenBinary1: TMenuItem;
    aHtmlColors: TAction;
    HTMLColors1: TMenuItem;
    aCalendar: TAction;
    Calendar1: TMenuItem;
    aReposit: TAction;
    Repository1: TMenuItem;
    aFindNext: TAction;
    FindNext1: TMenuItem;
    aFtpSaveAs: TAction;
    FTPSaveAs1: TMenuItem;
    aftpOpen: TAction;
    FTPOpen1: TMenuItem;
    N10: TMenuItem;
    aFTPSave: TAction;
    FTPSave1: TMenuItem;
    pruler2: TPanel;
    aHexMode: TAction;
    N20: TMenuItem;
    SwitchtoHexMode1: TMenuItem;
    N21: TMenuItem;
    WindowMacros1: TMenuItem;
    Record1: TMenuItem;
    Play1: TMenuItem;
    Stop1: TMenuItem;
    Save1: TMenuItem;
    aOpenMac: TAction;
    odwinmac: TOpenDialog;
    sdwinmac: TSaveDialog;
    Open2: TMenuItem;
    aNextLong: TAction;
    NextLongLine1: TMenuItem;
    aLineRange: TAction;
    LineRange1: TMenuItem;
    anewwindow: TAction;
    NewWindow1: TMenuItem;
    maddhelp: TMenuItem;
    aXpath: TAction;
    N22: TMenuItem;
    XPathSearch1: TMenuItem;
    N23: TMenuItem;
    RunFile2: TMenuItem;
    PopupMenu1: TPopupMenu;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    N5: TMenuItem;
    Cut2: TMenuItem;
    Indent2: TMenuItem;
    UnIndent2: TMenuItem;
    PopupMenu2: TPopupMenu;
    CustomizeToolbar1: TMenuItem;
    N24: TMenuItem;
    Case1: TMenuItem;
    Lower1: TMenuItem;
    Upper1: TMenuItem;
    ASCIICode2: TMenuItem;
    SelectHighLighter2: TMenuItem;
    N25: TMenuItem;
    aDelDup: TAction;
    sdout: TSaveDialog;
    DeleteDuplicates1: TMenuItem;
    aMacRepos: TAction;
    MacroRepository1: TMenuItem;
    srcc: TScriptControl;
    ScriptMacros1: TMenuItem;
    aSMCreate: TAction;
    aSMPlay: TAction;
    aSMEdit: TAction;
    aSMPlayMany: TAction;
    Create1: TMenuItem;
    Edit2: TMenuItem;
    Edit3: TMenuItem;
    PlayMultiples1: TMenuItem;
    aprojectwin: TAction;
    aprojectwin1: TMenuItem;
    pcontent: TPanel;
    pproject: TPanel;
    pmain: TPanel;
    ptabs: TPanel;
    tabsfile: TTabControl;
    peditor: TPanel;
    spltproj: TSplitter;
    poptabs: TPopupMenu;
    Close2: TMenuItem;
    aprior: TAction;
    Prior1: TMenuItem;
    anexttab: TAction;
    apretab: TAction;
    aWebPreview: TAction;
    View1: TMenuItem;
    WebPreview1: TMenuItem;
    ViewasGrid1: TMenuItem;
    wscript: TScriptControl;
    odlgscript: TOpenDialog;
    pviewer: TPanel;
    splitviewer: TSplitter;
    mrecentprojs: TMenuItem;
    aopenproject: TAction;
    odlgproj: TOpenDialog;
    Project1: TMenuItem;
    OpenProject2: TMenuItem;
    aaddproject: TAction;
    aaddfolder: TAction;
    aaddfile: TAction;
    ascanfiles: TAction;
    AddProject1: TMenuItem;
    AddFolder1: TMenuItem;
    AddFile1: TMenuItem;
    AddFolderFiles1: TMenuItem;
    N26: TMenuItem;
    adeleteprojitem: TAction;
    anewprojgroup: TAction;
    NewProjectGroup1: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    DeleteItem1: TMenuItem;
    abaseencode: TAction;
    N29: TMenuItem;
    Base64Encode1: TMenuItem;
    ashowhex: TAction;
    HexView1: TMenuItem;
    N30: TMenuItem;
    axslttrans: TAction;
    odlgxslt: TOpenDialog;
    axsltrefresh: TAction;
    XSLTTransform1: TMenuItem;
    XSLTRefresh1: TMenuItem;
    atransxnode: TAction;
    XSLTTransformXNODE1: TMenuItem;
    alighton: TAction;
    N31: TMenuItem;
    HighlighterOn1: TMenuItem;
    asavetemplate: TAction;
    aopentemplate: TAction;
    NewTemplate1: TMenuItem;
    SaveAsTemplate1: TMenuItem;
    XSLT1: TMenuItem;
    N32: TMenuItem;
    asaveall: TAction;
    SaveAll1: TMenuItem;
    acloseall: TAction;
    CloseAll1: TMenuItem;
    aexplorewin: TAction;
    ExplorerWindow1: TMenuItem;
    N33: TMenuItem;
    imglisttabs: TImageList;
    aSMPlayLast: TAction;
    aSMPlayLast1: TMenuItem;
    Save2: TMenuItem;
    SaveAsTemplate2: TMenuItem;
    Export1: TMenuItem;
    HTML2: TMenuItem;
    RTF2: TMenuItem;
    RunFile1: TMenuItem;
    awordwrap: TAction;
    N6: TMenuItem;
    WordWrap1: TMenuItem;
    SynCodeProposal: TSynCompletionProposal;
    memo1: TSynEdit;
    SynSearch: TSynEditSearch;
    SynRegexSearch: TSynEditRegexSearch;
    afindprevious: TAction;
    N34: TMenuItem;
    N35: TMenuItem;
    aSortAsc: TAction;
    aSortDesc: TAction;
    aSortAscRmDup: TAction;
    aSortDescRmDup: TAction;
    Ascending1: TMenuItem;
    Descending1: TMenuItem;
    SortAscending1: TMenuItem;
    SortDescending1: TMenuItem;
    alCustomActs: TActionList;
    imgCustomList: TImageList;
    aSetBookmark: TAction;
    N36: TMenuItem;
    oggleBookmark1: TMenuItem;
    Bookmark01: TMenuItem;
    aGotoBookmark: TAction;
    GotoBookmark1: TMenuItem;
    Bookmark02: TMenuItem;
    aSetBookmark1: TAction;
    aSetBookmark2: TAction;
    aSetBookmark3: TAction;
    aSetBookmark4: TAction;
    aSetBookmark5: TAction;
    aSetBookmark6: TAction;
    aSetBookmark7: TAction;
    aSetBookmark8: TAction;
    aSetBookmark9: TAction;
    aGotoBookmark1: TAction;
    aGotoBookmark2: TAction;
    aGotoBookmark3: TAction;
    aGotoBookmark4: TAction;
    aGotoBookmark5: TAction;
    aGotoBookmark6: TAction;
    aGotoBookmark7: TAction;
    aGotoBookmark8: TAction;
    aGotoBookmark9: TAction;
    Bookmark11: TMenuItem;
    Bookmark21: TMenuItem;
    Bookmark31: TMenuItem;
    Bookmark41: TMenuItem;
    Bookmark51: TMenuItem;
    Bookmark61: TMenuItem;
    Bookmark71: TMenuItem;
    Bookmark81: TMenuItem;
    Bookmark91: TMenuItem;
    Bookmark12: TMenuItem;
    Bookmark22: TMenuItem;
    Bookmark32: TMenuItem;
    Bookmark42: TMenuItem;
    Bookmark52: TMenuItem;
    Bookmark62: TMenuItem;
    Bookmark72: TMenuItem;
    Bookmark82: TMenuItem;
    Bookmark92: TMenuItem;
    aSMPlayFunc: TAction;
    PlayLast1: TMenuItem;
    N37: TMenuItem;
    imglistBookmarks: TImageList;
    alRecent: TActionList;
    addcurrent: TAction;
    AddCurrentFile1: TMenuItem;
    N38: TMenuItem;
    addfilegroup: TAction;
    AddOpenFiles1: TMenuItem;
    afileproperties: TAction;
    Properties1: TMenuItem;
    Properties2: TMenuItem;
    N39: TMenuItem;
    amanualactivate: TAction;
    ManualActivate1: TMenuItem;
    ascripthelp: TAction;
    LEScriptingHelp1: TMenuItem;
    N40: TMenuItem;
    amatchbracket: TAction;
    MatchBracket1: TMenuItem;
    synLinks: TSynURIOpener;
    URISyntax: TSynURISyn;
    aclicklinks: TAction;
    ClickLinks1: TMenuItem;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aopenExecute(Sender: TObject);
    procedure anextExecute(Sender: TObject);
    procedure aclosefileExecute(Sender: TObject);
    procedure aSaveCurExecute(Sender: TObject);
    procedure adelfieldExecute(Sender: TObject);
    procedure aLongLnExecute(Sender: TObject);
    procedure aopeneditExecute(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure fdFind(Sender: TObject);
    procedure rdFind(Sender: TObject);
    procedure rdReplace(Sender: TObject);
    procedure aReplaceExecute(Sender: TObject);
    procedure aSaveCloseExecute(Sender: TObject);
    procedure memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ASaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure memo1Change(Sender: TObject);
    procedure aSelectModeExecute(Sender: TObject);
    procedure aFileNewExecute(Sender: TObject);
    procedure aRecMacExecute(Sender: TObject);
    procedure aPlayMacExecute(Sender: TObject);
    procedure aSaveMacExecute(Sender: TObject);
    procedure aStopMacExecute(Sender: TObject);
    procedure aShowRulerExecute(Sender: TObject);
    procedure aKMRecExecute(Sender: TObject);
    procedure AKMStopExecute(Sender: TObject);
    procedure aKMPlayExecute(Sender: TObject);
    procedure aKMSaveExecute(Sender: TObject);
    procedure aKMOpenExecute(Sender: TObject);
    procedure aEditUndoExecute(Sender: TObject);
    procedure aOptionsExecute(Sender: TObject);
    procedure aSaveAsExecute(Sender: TObject);
    procedure aEditRedoExecute(Sender: TObject);
    procedure aEditDeleteExecute(Sender: TObject);
    procedure aEditSelectAllExecute(Sender: TObject);
    procedure aEditCopyExecute(Sender: TObject);
    procedure aEditCutExecute(Sender: TObject);
    procedure aEditPasteExecute(Sender: TObject);
    procedure aShowMacroExecute(Sender: TObject);
    procedure aKMPlayPerLineExecute(Sender: TObject);
    procedure aGotoLineExecute(Sender: TObject);
    procedure aexitExecute(Sender: TObject);
    procedure memo1Click(Sender: TObject);
    procedure memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aPrintPreviewExecute(Sender: TObject);
    procedure aPrinterSetupExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aEmailTxtExecute(Sender: TObject);
    procedure aEmailAttachExecute(Sender: TObject);
    procedure aExpHTMLExecute(Sender: TObject);
    procedure aExpRTFExecute(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure aIndentExecute(Sender: TObject);
    procedure memo1DropFiles(Sender: TObject; X, Y: Integer;
      AFiles: TStrings);
    procedure aSpellCheckExecute(Sender: TObject);
    procedure aextendfrExecute(Sender: TObject);
    procedure splitsubwinCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure aShowToolsExecute(Sender: TObject);
    procedure aUnIndentExecute(Sender: TObject);
    procedure aUserTBarExecute(Sender: TObject);
    procedure aSelHighLightExecute(Sender: TObject);
    procedure aCustomUserBarExecute(Sender: TObject);
    procedure aViewAsGridExecute(Sender: TObject);
    procedure anethomeExecute(Sender: TObject);
    procedure ahelpExecute(Sender: TObject);
    procedure ahelpTopicsExecute(Sender: TObject);
    procedure aenterserialExecute(Sender: TObject);
    procedure abuyLEExecute(Sender: TObject);
    procedure anetsupportExecute(Sender: TObject);
    procedure aupdatesExecute(Sender: TObject);
    procedure aonlinehelpExecute(Sender: TObject);
    procedure atutorialsExecute(Sender: TObject);
    procedure auppercaseExecute(Sender: TObject);
    procedure alowercaseExecute(Sender: TObject);
    procedure aAsciiCodeExecute(Sender: TObject);
    procedure aASCIIvalueExecute(Sender: TObject);
    procedure aNumCountExecute(Sender: TObject);
    procedure aViewASCIICodesExecute(Sender: TObject);
    procedure aGetCharforCodeExecute(Sender: TObject);
    procedure aSymNameExecute(Sender: TObject);
    procedure aviewHTMLcodesExecute(Sender: TObject);
    procedure arunfileExecute(Sender: TObject);
    procedure aOpenHexExecute(Sender: TObject);
    procedure aHtmlColorsExecute(Sender: TObject);
    procedure aCalendarExecute(Sender: TObject);
    procedure aRepositExecute(Sender: TObject);
    procedure aFindNextExecute(Sender: TObject);
    procedure aFtpSaveAsExecute(Sender: TObject);
    procedure aftpOpenExecute(Sender: TObject);
    procedure aFTPSaveExecute(Sender: TObject);
    procedure aHexModeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aOpenMacExecute(Sender: TObject);
    procedure aNextLongExecute(Sender: TObject);
    procedure aLineRangeExecute(Sender: TObject);
    procedure anewwindowExecute(Sender: TObject);
    procedure aXpathExecute(Sender: TObject);
    procedure aDelDupExecute(Sender: TObject);
    procedure aMacReposExecute(Sender: TObject);
    procedure aprojectwinExecute(Sender: TObject);
    procedure tabsfileChange(Sender: TObject);
    procedure tabsfileChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure apriorExecute(Sender: TObject);
    procedure anexttabExecute(Sender: TObject);
    procedure apretabExecute(Sender: TObject);
    procedure aWebPreviewExecute(Sender: TObject);
    procedure aSMPlayExecute(Sender: TObject);
    procedure wscriptError(Sender: TObject);
    procedure aSMCreateExecute(Sender: TObject);
    procedure aSMEditExecute(Sender: TObject);
    procedure aopenprojectExecute(Sender: TObject);
    procedure aaddprojectExecute(Sender: TObject);
    procedure aaddfolderExecute(Sender: TObject);
    procedure aaddfileExecute(Sender: TObject);
    procedure ascanfilesExecute(Sender: TObject);
    procedure anewprojgroupExecute(Sender: TObject);
    procedure adeleteprojitemExecute(Sender: TObject);
    procedure abaseencodeExecute(Sender: TObject);
    procedure ashowhexExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure axslttransExecute(Sender: TObject);
    procedure axsltrefreshExecute(Sender: TObject);
    procedure atransxnodeExecute(Sender: TObject);
    procedure alightonExecute(Sender: TObject);
    procedure asavetemplateExecute(Sender: TObject);
    procedure aopentemplateExecute(Sender: TObject);
    procedure aSMPlayManyExecute(Sender: TObject);
    procedure asaveallExecute(Sender: TObject);
    procedure acloseallExecute(Sender: TObject);
    procedure tabsfileDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure aexplorewinExecute(Sender: TObject);
    procedure memo1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure aSMPlayLastExecute(Sender: TObject);
    procedure awordwrapExecute(Sender: TObject);
    procedure SynCodeProposalAfterCodeCompletion(Sender: TObject;
      const Value: String; Shift: TShiftState; Index: Integer;
      EndToken: Char);
    procedure SynCodeProposalCodeCompletion(Sender: TObject; var Value: String;
      Shift: TShiftState; Index: Integer; EndToken: Char);
    procedure SynCodeProposalPaintItem(Sender: TObject; Index: Integer;
      TargetCanvas: TCanvas; ItemRect: TRect; var CustomDraw: Boolean);
    procedure memo1ReplaceText(Sender: TObject; const ASearch,
      AReplace: String; Line, Column: Integer;
      var Action: TSynReplaceAction);
    procedure afindpreviousExecute(Sender: TObject);
    procedure aSortAscExecute(Sender: TObject);
    procedure aSortDescExecute(Sender: TObject);
    procedure aSortDescRmDupExecute(Sender: TObject);
    procedure aSortAscRmDupExecute(Sender: TObject);
    procedure SynCodeProposalExecute(Kind: SynCompletionType;
      Sender: TObject; var CurrentInput: String; var x, y: Integer;
      var CanExecute: Boolean);
    procedure aSetBookmarkExecute(Sender: TObject);
    procedure aGotoBookmarkExecute(Sender: TObject);
    procedure aSMPlayFuncExecute(Sender: TObject);
    procedure memo1ClearBookmark(Sender: TObject; var Mark: TSynEditMark);
    procedure memo1PlaceBookmark(Sender: TObject; var Mark: TSynEditMark);
    procedure addcurrentExecute(Sender: TObject);
    procedure addfilegroupExecute(Sender: TObject);
    procedure afilepropertiesExecute(Sender: TObject);
    procedure poptabsPopup(Sender: TObject);
    procedure amanualactivateExecute(Sender: TObject);
    procedure ascripthelpExecute(Sender: TObject);
    procedure amatchbracketExecute(Sender: TObject);
    procedure aclicklinksExecute(Sender: TObject);
  private
    fplugins: TStringList;
    fplugininfo: TStringList;
    esell: IeSeller;
    Fhighlight: TSynCustomHighlighter;
    dlgSpellChk: TdSpellCheck;
    FRegistered: boolean;
    FIsInit: boolean;
    FDebugLogOn: boolean;
    function GetCurFile: string;
    procedure SetCurFile(const Value: string);
    function GetChanges: boolean;
    procedure SetChanges(const Value: boolean);
    function GetSerial: String;
    procedure SetSerial(const Value: String);

    function AppOnHelp(Command: Word; Data: Longint; var CallHelp: Boolean): Boolean;
    function GetCurrentHL: TSynCustomHighlighter;
  public
    //DEBUG HELP
    FDEBUGLOG: TStringList;

    //NEW File MultiTab
    fLEfiles: TLEFiles;
    ACurLEfile: TLEFile;

    //Dialog functions
    function ShowOpenMulti(edit: boolean = false; intdir: string = ''): boolean;

    //File Functions
    function OpenFileMulti( filename: string; edit: boolean = false; checkprojfile: boolean = false ): boolean;
    procedure OpenNewMulti();
    procedure CloseCurrentMulti(savecheck: boolean = true);
    function SaveMulti(Reopen: Boolean = true; SaveAs: Boolean = false; RemoteCheck: boolean = true): boolean;
    function SaveCheckMulti(closing: boolean = false; askuser: boolean = true  ): boolean;
    function SaveCheckCurrent: boolean;
    function SaveCheckFile( lefile: TLEFile; closing: boolean = false; askuser: boolean = true ): boolean;
    procedure FTPSaveCurrent();

    //Project file functions
    function OpenProjectGroup( filename: string ): boolean;
    function IsFileProjectGroup( filename: string ): boolean;

    function NextMulti(Lines: String; WriteLines: boolean = true; ResetMemo: boolean = true): boolean;
    function GetCurFileMulti: TLEFile;
    procedure SetCurFileMulti(Value: TLEFile);
    procedure SetCurTitle;

    function Last(): Boolean;

    //Display Functions
    procedure RefreshTabs();
    procedure SetFileIcon(lefile: TLEFile);
    function SetCurrentTab(filename: string): boolean;
    procedure SetCurrentMemo();
    procedure SaveCurrentMemo();
    procedure UpdateCurrentFile();
    procedure DisplayCurrent();
    procedure UpdateIcons();
    procedure SetCursorPos();
    procedure SaveCursorPos();
    procedure CheckAutoOptions();

    //Highligher
    procedure SetCurrentHL(ahlname: string = '');
    procedure SetCurrentHLByName( hlname: string );
    procedure ShowHLToolbars(ahlname: string = '');
    procedure ShowCurrentToolbars();

    //Project Functions
    function OpenProjectFile(filename: string): boolean;
    function OpenProject(filename: string): boolean;

    //Web functions
    procedure CloseSplitView(Sender: TObject);

    //Hex Function
    procedure OnSaveCurHexFile(Sender: TObject);

    property CurLEfile: TLEFile read GetCurFileMulti write SetCurFileMulti;
    property highlight: TSynCustomHighlighter read GetCurrentHL;
  private
    { Private declarations }
    CurKey: Word;
    FCurToken: String;
    CompleteON: boolean;
    FNewFile: Boolean;
    ACurFile: String;
    FCurOpen: Boolean;
    FTempFile: String;
    FTempOpen: Boolean;
    IsSaved: Boolean;
    IsSmall: Boolean;
    FChanges: Boolean;
    FSaveFile: String;
    FMacFile: String;
    IsMacSaved: Boolean;
    FRecMaco: TStringList;
    IsRecord: boolean;
    IsPlaying: boolean;
    shownag: boolean;
    LastLLSearch: integer;

    //Remote File Info
    IsRemoteFileOpen: boolean;
    FHost: String;
    FPort: integer;
    FUser: String;
    FPass: String;
    FRemoteDir: String;
    FRemoteFile: String;

    FCurProjectFile: string;

    txt: TextFile;
    unifile: file;
    outf: TextFile;

    bifile: File of Word;


    totalline: integer;
    editmode: Boolean;
    lastend: Integer;
    editgutter: TEditSynGutter;
    EndOfFile : boolean;
    TotalReplaced: Integer;
    StartFont: TFont;

    FLastRecentDoc: String;
    RecentDocs: TStringList;
    FLastRecentProject: String;
    RecentProjects: TStringList;
    xpathdlg: TfrmLargeTEXT;

    //Session Variables
    FSessionObjects: TStringList;

    //Ext Find&Replace vars
    FSDefaultPath: string;
    FSDefaultTypes: string;
    FSFindText: string;
    FSReplaceText: string;

    //search vars
    fSearchFromCaret: boolean;
    fLastAction: TSynReplaceAction;
    fDoReplaceAll: boolean;

    //Script mac vars
    flastscript: string;
    flastfunc: string;
    flastplayfun: boolean;

    //Toolbars
    FNSTBars: TNSToolbars;
    FTBarsVisible: TStringList;

    //File related functions
    function GetLinesBufValue: String;
    function GetTmpFileName(Filename: String): String;
    function GetTmpPathFileName(Path, Filename: String): String;
    function GetNewTempFileName: String;

    //Display function
    procedure Busy;
    procedure NotBusy;
  public
    function GetSessionValue(PropertyName: String): OleVariant;
    procedure SetSessionValue(PropertyName: String; Value: OleVariant);

    procedure ProcessFile(MinLength: Integer; OutFile: String);

    function GetLines(Lines: Integer; var outtext: String): integer;
    function GetSelLines(Startl, Endl: Integer; var outtext: String): Integer;

    procedure DeleteField(Del: String; Field, NumofFields: Integer; OutFile: String);
    procedure RemoveDuplicates(OutFile: String);

    function Next(Lines: String; WriteLines: boolean = true; ResetMemo: boolean = true): boolean;
    function GetNextLines: String;
    procedure OutLines;

    procedure CloseCurFile(WriteLines: boolean = true);
    function OpenCurFile(Edit: Boolean = false): boolean;
    function OpenCurFileAsBin(Edit: Boolean = false): boolean;
    procedure CleanUpTempFile;
    function ReadFileLine(var stline: String): boolean; //EOF

    Function SaveFile(Reopen: Boolean = true; SaveAs: boolean = false): boolean;
    function SaveCheck(Closing: Boolean): boolean;

    procedure SetHighlighter;

    //Macro Functions
    procedure StartRec;
    procedure StopRec;
    procedure PlayMacro(Filename: String);
    procedure PlayFinished; stdcall;
    procedure SaveMac(Filename: String);

    // Key Macros
    procedure PlayKeyMacro( filename: String );
    procedure PlayManyKeyMacro( filename: String );
    procedure OpenKeyMacro( filename: String );
    function GetCurrentMacro: TObject;

    //Tool Bar functions
    procedure CreateRuler;

    //Status Bar Functions
    procedure UpdatePosition;
    procedure UpdateStatus( Txt: String );

    procedure PrintSetup;
    function GetDocTitle: string;

    //Advances Features
    procedure Email(AsText: Boolean);
    function ExportFile( ExpType: TSynCustomExporter ): boolean;
    function GetFilePar: String;
    function GetFileProcessType: TFileProcessType;
    procedure JustPrint;
    procedure UpdateRecentDocs;
    procedure AddRecentDocsToMenu;
    procedure UpdateRecentProjects;
    procedure AddRecentProjectsToMenu;
    procedure AddHelpDocsToMenu;
    procedure OnClickRecentDoc( Sender: TObject );
    procedure OnClickRecentProject( Sender: TObject );
    procedure OnClickHelpDoc( Sender: TObject );
    procedure RunEditorCommand( Command: word );
    procedure SelectHighlighter;
    function ViewCodes( Name, Del, Filename: String ): boolean;
    procedure ViewAsGrid( Del: Char; FirstCols: boolean );

    //Plugins
    function LoadViewer(filename: string): boolean;
    function LoadPlugins: boolean;

    //Searching Functions
    procedure ShowSearchReplaceDialog(AReplace: boolean);
    procedure DoSearchReplaceText(AReplace: boolean; ABackwards: boolean; doprompt: boolean = true; doreplaceall: boolean = false);


    //help system
    procedure ViewHelp( filename: string; search: string);

    // project window
    procedure showprojectwindow;
    procedure hideprojectwindow;

    //Explorer Window
    procedure showexplorewindow;
    procedure hideexplorewindow;

    //Plugin Functions
    procedure OnPLViewer(Sender: TObject);
    procedure OnPLToolView(Sender: TObject);
    procedure OnPLClick(Sender: TObject);
    procedure OnPLNotify(event: TPluginEvents);

    // extended tool window
    procedure OnHideTool(Sender: TObject);
    procedure OnCloseTool(Sender: TObject;  var CanClose: Boolean);
    procedure ShowToolWindow;
    procedure AddToolWindow( ToolWin: TdStandardTool );

    //file list callbacks
    procedure OnFileListOpen(Filename, Line: String);
    procedure GotoLine( line: string );

    //grid callbacks
    function GetText: String;
    procedure SetCaret(X, Y: integer);
    procedure ChangeText(XStart, XEnd, Y: integer; Text: String);
    function GetDelimitText(XStart, Y: integer; Delimiter: Char): String;

    //callback
    procedure SetText(Text: String);
    function GetSelText: String;

    //Add to Edit Menu;
    procedure AddEditsToMenu;
    procedure OnExecuteEdit(Sender: TObject);

    //Advanced XML Features
    procedure ShowXPathSearch;
    function ShowXPathSearchModal: boolean;
    procedure OnXPathSearch( sender: TObject );
    function RunXPathSearch(Document, Search: String): String;
    function RunXSLTTransform(xmlfile, xsltfile: string; xselect: string = ''): string;
    procedure ShowXSLTResult(transtext: string);

    procedure ShowWebWindow(url: string);

    //Scripting stuff
    function ScrCallFunction(const FunctionName: string; const Params: array of Variant): OleVariant;
    procedure PlayScriptMacro(scriptfile: string; func: string = 'Run'; showres: boolean = true);
    procedure PlayCode( code: string; func: string = 'Run'; showres: boolean = true);
    procedure ShowMsg( text: String );
    function InpBox( title, prompt, defval: String): string;

    //Extra functions
    procedure SortText( removedup: boolean = false; desc: boolean = false);

    //Toolbar Function
    procedure LoadToolBars;
    procedure RefreshToolbars;
    procedure ClearToolBars;
    procedure DisplayToolBars;
    procedure RevisibleToolbars;
    function GetToolbar(name: string; norecall: boolean = false): boolean;
    procedure AddVisibleToolbar(name: string);
    procedure RemoveVisibleToolbar(name: string);
    procedure HideToolbar(name: string);
    procedure HideAllCustomTbars;
    procedure OnExecCustomAction(Sender: TObject);
    procedure OnShowCustTBar(Sender: TObject);

    //Initize Stuff
    property IsInitialized: boolean read FIsInit write FIsInit default false;
    procedure InitApp( Sender: TObject );

    property FCurFile: string read GetCurFile write SetCurFile;
    property Changes: boolean read GetChanges write SetChanges;

  public
    { Public declarations }
    //Esell Properties
    property SerialNumber: String read GetSerial write SetSerial;
    property Registered: boolean read FRegistered write FRegistered default false;

    function OpenFile(filename: String; Edit: Boolean = false; DoSaveCheck: boolean = false): boolean;
    procedure OpenNew;

    procedure DebugLog(Text: String);

    procedure PrintDialog;

    function ShowOpen(Edit: Boolean = false): boolean;

    //ESell Functions
    function ValidSerial: boolean;
    procedure BuyApp;
    procedure EnterSerial;
    procedure CheckForUpdates;

    //Exposed Automation Functions
    function aSearch(const Text: String): Integer;

  end;

var
  fLEdit: TfLEdit;

implementation

uses  vcl_util,
      dialogDefField,
      unitUtils,
      dlgProcessing,
      winmacro,
      foptions,
      Clipbrd,
      frmPrintPreview,
      dlgAboutLE,
      unitRecentAppDocs,
      dlgEditCodeCompletion,
      dlgFindReplace,
      dlgFileList,
      dlgSelectList,
      dlgViewGrid,
      dlgTextGrid,
      ShellApi,
      unitHelpConstants,
      unitAppConst,
      registry,
      dlgNagScreen,
      dlgCodeViewer,
      dlgColorHex,
      dlgMonthCal,
      frmCatalog,
      dlgFTPSaveOpen,
      frmHexEditor,
      dlgResultTool,
      frmMacroCatalog,
      frmWebBrowser,
      frmProjectWin,
      autoLargeEdit,
      SynUniHighlighter,
      dlgTemplate,
      frmexplorer,
      ShellCtrls,
      hh,
      math,
      cUnicodeCodecs,
      comobj,
      variants,
      frmImages,
      dlgSearchText,
      dlgReplaceText,
      dlgConfirmReplace,
      dlgOLEPlugin,
      SynEditTextBuffer,
      commctrl,
      activex,
      MSXML2_TLB,
      autoLargeFile,
      LargeEdit_TLB;


const deffile = 'tmp.txt';
      debugfile = 'dbug.txt';

//      TrialSerialNumber = 'L4RGDMO000-01T2-9FB2-D401-Y41T-04B7';

      edtCmds: array[0..9] of integer = (
                ecWordLeft, ecWordRight, ecLineStart, ecLineEnd,
                ecSelWordLeft, ecSelWordRight, ecSelLineStart, ecSelLineEnd,
                ecDeleteWord, ecDeleteLine);

//Search Remember vars
var
  gbSearchBackwards: boolean;
  gbSearchCaseSensitive: boolean;
  gbSearchFromCaret: boolean;
  gbSearchSelectionOnly: boolean;
  gbSearchTextAtCaret: boolean;
  gbSearchWholeWords: boolean;
  gbSearchRegex: boolean;

  gsSearchText: string;
  gsSearchTextHistory: string;
  gsReplaceText: string;
  gsReplaceTextHistory: string;


{$R *.DFM}

procedure TfLEdit.ProcessFile(MinLength: Integer; OutFile: String);
var
  s, t: String;
begin
  AssignFile(outf, outFile);
  Rewrite(outf);
  FTempOpen := true;
  while not eof(txt) do begin
    Readln(txt, s);
    while (length(s) <= MinLength) do begin
      t := s;
      Readln(txt, s);
      t := t + s;
      s := t;
    end;
    writeln(outf, s);
  end;
  CloseFile(outf);
  FTempOpen := false;
  ShowMessage('Done');
end;

procedure TfLEdit.Button2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if sd.Execute then begin
    ProcessFile(StrToInt(GetLinesBufValue), sd.FileName);
  end;
  Screen.Cursor := crDefault;
end;

{function TfLEdit.GetLines(Lines: Integer; var outtext: String): integer;
var
  s: string;
  i: Integer;
  str: TStringList;
begin
  DebugLog('GetLines - Lines='+IntToStr(lines));
  result := 0;
  if not FCurOpen then begin
    MessageDlg('You must open a file first?', mtInformation, [mbOK], 0);
    exit;
  end;
  str := TStringList.Create;
  try
    for i := 0 to lines - 1 do begin
      if eof(txt) then begin
        if EndofFile then
          beep;
}          { TODO 1 -cBasic : Check if there is a beep on other OS's }
//          UpdateStatus('End Of File'); // MessageDlg('You have reached the end of the file.', mtInformation, [mbOk], 0);
{        EndOfFile := true;
        break;
      end;
      Readln(txt, s);
      result := result + 1;
      totalline := totalline + 1;
      str.Add(s);
    end;
    if length(str.Text) > 0 then
      outtext := str.text;
  finally
    str.Free;
  end;
  DebugLog('GetLines - End (TotalLines='+IntToStr(totalline));
end;
}

{ NEW Read method
  if OpenDialog1.Execute then
  begin
    AssignFile(FromF, OpenDialog1.FileName);
    Reset(FromF, 1);
    BlockRead(FromF, Buf, SizeOf(Buf), NumRead);
    str := '';
    for i := 1 to NumRead do begin
        if IsASCIIChar(WideChar(buf[i])) and (buf[i] <> #0) then begin
          char := buf[i];
          str := str + char;
        end;
    end;
    memo1.Text := str;
    CloseFile(FromF);
}

{ TODO 5 : Fix this read line procedure to open unicode files }

function TfLEdit.GetLines(Lines: Integer; var outtext: String): integer;
var
  s: string;
  i: Integer;
  str: TStringList;
begin
  DebugLog('GetLines - Lines='+IntToStr(lines));
  result := 0;
  if not FCurOpen then begin
    MessageDlg('You must open a file first?', mtInformation, [mbOK], 0);
    exit;
  end;
  str := TStringList.Create;
  try
    for i := 0 to lines - 1 do begin
      if eof(txt) then begin
        if EndofFile then
          beep;
          { TODO 1 -cBasic : Check if there is a beep on other OS's }
//          UpdateStatus('End Of File'); // MessageDlg('You have reached the end of the file.', mtInformation, [mbOk], 0);
        EndOfFile := true;
        break;
      end;
      //Readln(txt, s);
      Readln(txt, s);
      //if memo1.MaxLeftChar < length(s) then memo1.MaxLeftChar := length(s);
      result := result + 1;
      totalline := totalline + 1;
      str.Add(s);
    end;
    if length(str.Text) > 0 then
      outtext := str.text;
  finally
    str.Free;
  end;
  DebugLog('GetLines - End (TotalLines='+IntToStr(totalline));
end;


procedure TfLEdit.Button5Click(Sender: TObject);
begin
  if sd.Execute then begin
    memo1.Lines.SaveToFile(sd.FileName);
  end;
end;

procedure TfLEdit.OutLines;
var
  txt: String;
begin
  DebugLog('Output Lines='+IntToStr(memo1.Lines.Count));
  if length( memo1.Lines.Text ) > 0 then begin
    txt := memo1.Lines.Text;
    txt := Copy(txt , 1, length(txt)-2);
    Writeln(outf, txt);
  end;
end;

function TfLEdit.GetSelLines(Startl, Endl: Integer; var outtext: String): integer;
var
  s: String;
  i: Integer;
  str: TStringList;
begin
  DebugLog('GetSelLines - StartLn='+IntToStr(Startl)+' EndLn='+IntToStr(Endl));
  result := 0;
  if not FCurOpen then begin
    MessageDlg('You must open a file first?', mtInformation, [mbOK], 0);
    exit;
  end;
  str := TStringList.Create;
  try
    for i := 0 to Endl - 1 do begin
      if eof(txt) then begin
        if EndofFile then
          MessageDlg('You have reached the end of the file.', mtInformation, [mbOk], 0);
        EndOfFile := true;
        break;
      end;
      Readln(txt, s);
      totalline := totalline + 1;
      if i >= Startl-1 then begin
        str.Add(s);
        result := result + 1;
        end
      else if editmode then
        Writeln(outf, s);
    end;
    if length(str.Text) > 0 then
      outtext := str.text;
  finally
    str.Free;
  end;
  DebugLog('GetSelLines - End (TotalLines='+IntToStr(totalline));
end;

procedure TfLEdit.FormCreate(Sender: TObject);
begin
  ApplicationHelpFile := ChangeFileExt(Application.ExeName, '.chm');
  ScriptingHelpFile := ChangeFileExt(Application.ExeName, ' Scripting.chm');  
  application.OnHelp := AppOnHelp;
  eSell := CoeSeller.Create;
  RecentDocs := TStringList.Create;
  RecentProjects := TStringList.Create;
  fplugins := TStringList.Create;
  fplugininfo := TStringList.Create;
  FTBarsVisible := TStringList.Create;
  FTBarsVisible.Sorted := true;  
  FTBarsVisible.Duplicates := dupIgnore;
  fLEfiles := TLEFiles.Create;
  fLEfiles.CRtoCRLF := fopts.CRtoCRLF;
  fLEfiles.LFtoCRLF := fopts.LFtoCRLF;
  fLEfiles.BackBuffers := fopts.BackBuffers;
  fLEfiles.TempFolder := AppPath + 'temp\';
  if not(assigned(fproject)) then fProject := TfProject.Create(self);
  fproject.OnOpenProject := OpenProject; //Add to recent project list
  fproject.OnSaveProject := OpenProject;
  if not(DirectoryExists(fLEfiles.TempFolder)) then
    ForceDirectories( fLEfiles.TempFolder );
  tabsfile.Tabs.Clear;
  ptabs.Height := 1;
  StartFont := memo1.Font;
  Caption := scTitle;
  lastend := 0;
  LastLLSearch := 1;
  editmode := false;
  FNewFile := false;
  IsRecord := false;
  IsPlaying := false;
  FMacFile := '';
  IsMacSaved := false;
  totalline := 0;
  IsSaved := false;
  FCurOpen := false;
  FTempOpen := false;
  if fopts.StartMax then begin
    WindowState := wsMaximized;
    end
  else begin
    self.Width := fopts.GetSetting(Name, 'width', self.Width);
    self.Height := fopts.GetSetting(Name, 'height', self.Height);
    self.Top := fopts.GetSetting(Name, 'top', self.Top);
    self.Left := fopts.GetSetting(Name, 'left', self.Left);
  end;
  memo1.RightEdge := fopts.GetSetting('Settings', 'edtrightedge', memo1.RightEdge);
end;

procedure TfLEdit.DeleteField(Del: String; Field, NumofFields: Integer;  OutFile: String);
var
  s, t: String;
  d: char;
  fields: TStringList;
  cnt, total : integer;
  dlg : TdlgProcess;
  output: textfile;
  function GetDelLine: String;
  var i: integer;
  begin
    result := '';
    for i := 0 to fields.Count - 1 do
      result := result + Fields[i] + del;
  end;
begin
  if not FCurOpen then begin
    MessageDlg('The file must open a file first?', mtInformation, [mbOK], 0);
    exit;
  end;
  //Close and reopen file for processing
  CloseCurFile(false);
  OpenCurFile(true);
{  CloseFile(txt);
  FCurOpen := false;
  AssignFile(txt, FCurFile);
  Reset(txt);
  FCurOpen := true;}

  dlg := TdlgProcess.Create(self);
  try
    dlg.ProcessCaption := 'Processing Field Delete';
    dlg.Show;
    dlg.UpdateStatus('Calculating number of records to process.',0, 100);
    //Get Count
    total := 0;
    while not eof(txt) do begin
      Readln(txt, s);
      total := total + 1;
    end;

    //Close and reopen file for processing
    CloseCurFile(false);
    OpenCurFile(true);

{    CloseFile(txt);
    FCurOpen := false;
    AssignFile(txt, FCurFile);
    Reset(txt);
    FCurOpen := true;}

    AssignFile(output, outFile);
    Rewrite(output);
    d := del[1];
    cnt := 0;

    while not eof(txt) do begin
      Readln(txt, s);
      cnt := cnt + 1;
      if not dlg.UpdateStatus('Processing record ' + IntToStr(cnt) + ' of ' + IntToStr(total) + '.',cnt, total) then exit;
      if assigned(fields) then
        fields.Free;
      fields := SplitStr(s,d);
      if not(Assigned(fields)) then begin MessageDlg('Error Deleting Field from record, Line:' + IntToStr(cnt), mtError, [mbok], 0); exit; end;
      while (fields.Count < NumofFields) do begin
        t := s;
        Readln(txt, s);
        if not dlg.UpdateStatus('Processing record ' + IntToStr(cnt) + ' of ' + IntToStr(total) + '.',cnt, total) then exit;
        cnt := cnt +1;
        t := t + s;
        s := t;
        fields.Free;
        fields := SplitStr(s,d);
        if not(Assigned(fields)) then begin MessageDlg('Error Deleting Field from record, Line:' + IntToStr(cnt), mtError, [mbok], 0); exit; end;
      end;
      fields.Delete(field);
//      fields[field] := '';
      s := GetDelLine;
      writeln(output, s);
    end;
  finally
    dlg.Free;
    if assigned(fields) then
      fields.Free;
    CloseFile(output);

    ShowMessage( IntToStr(cnt) + ' Records processed successfully');
    // Reopen Current File or New File

{    CloseFile(txt);
    FCurOpen := false;}
    CloseCurFile;

    if MessageDlg('Would you like to open the output file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      OpenFileMulti(outfile, true);
    end;
    //else
      //OpenFileMulti(outfile, true);

    anextExecute(nil);
  end;
end;

procedure TfLEdit.RemoveDuplicates(OutFile: String);
var
  s, t, delidx: String;
  i, j, fp, lnbuf, idx, brow: integer;
  tmp: double;
  buffer, delitems: TStringList;
  cnt, total, chkloops: integer;
  dlg : TdlgProcess;
  output: textfile;
  addbuf, skip: boolean;
begin
  if not FCurOpen then begin
    MessageDlg('The file must open a file first?', mtInformation, [mbOK], 0);
    exit;
  end;
  //Close and reopen file for processing
  CloseCurFile(false);
  OpenCurFile(true);

  dlg := TdlgProcess.Create(self);
  try
    dlg.ProcessCaption := 'Processing Remove Duplicates';
    dlg.Show;
    dlg.UpdateStatus('Calculating number of records to process.',0, 100);
    //Get Count
    total := 0;
    while not eof(txt) do begin
      Readln(txt, s);
      total := total + 1;
    end;

    CloseCurFile(false);

    lnbuf := fopts.LineFetch;
    tmp := total / lnbuf;
    chkloops := ceil(tmp);

    buffer := TStringList.Create;
    delitems := TStringList.Create;
    delitems.Clear;

    AssignFile(output, outFile);
    Rewrite(output);

    for i := 1 to chkloops do begin
      cnt := 0;
      fp := lnbuf * i;
      if not dlg.UpdateStatus('Retreiving buffer to scan ' + IntToStr(fp-lnbuf) + ' to ' + IntToStr(fp), 0, 1) then exit;
      OpenCurFile(true);
      buffer.Clear;
      addbuf := false;
      for j := 1 to fp do begin
        if not dlg.UpdateStatus('Retreiving buffer to scan ' + IntToStr(fp-lnbuf) + ' to ' + IntToStr(fp), j, fp) then exit;
        Readln(txt, s);
        if (fp - lnbuf) = cnt then
          addbuf := true;
        if addbuf then
          buffer.AddObject(s, TObject(cnt));
        if eof(txt) then break;
        cnt := cnt + 1;
      end;
      if not dlg.UpdateStatus('Checking for duplicates in buffer ' + IntToStr(i) + ' of ' + IntToStr(chkloops) + '.',i, chkloops) then exit;

      CloseCurFile(false);
      OpenCurFile(true);

      cnt := 0;
      delidx := '';
      while not eof(txt) do begin
        readln(txt, s);
        skip := false;
        idx := delitems.IndexOf(IntToStr(cnt));
        if idx >= 0 then
          skip := true;

        //check buffer
        if not skip then begin
          {idx := buffer.IndexOf(s);
          brow := Integer(buffer.Objects[idx]);
          if (idx >= 0) and (brow <> cnt) then
            delitems.Add( IntToStr(brow) );
           }
          for j := 0 to buffer.Count -1 do begin
            idx := integer(buffer.Objects[j]);
            if (lowercase(s) = lowercase(buffer[j])) and
              (cnt <> idx)
            then
              delitems.Add( IntToStr(idx) );
          end;
        end;

        cnt := cnt + 1;
        if not dlg.UpdateStatus('Scaning file for duplicates ' + IntToStr(cnt) + ' of ' + IntToStr(total) + '.',cnt, total) then exit;
      end;

      CloseCurFile(false);
    end;

    OpenCurFile(true);
    cnt := 0;
    while not eof(txt) do begin
      readln(txt, s);
      //delete items
      idx := delitems.IndexOf(IntToStr(cnt));
      if idx <= -1 then begin
        Writeln(output, s);
      end;
      cnt := cnt + 1;
    end;

    CloseCurFile;

  finally
    dlg.Free;
    CloseFile(output);
  end;

    if MessageDlg('Would you like to open the output file?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      OpenFileMulti(outFile, true);
    end;
    //else
      //OpenCurFile(true);

    anextExecute(nil);
end;

procedure TfLEdit.aopenExecute(Sender: TObject);
begin
  //ShowOpen;
  ShowOpenMulti;
end;

procedure TfLEdit.anextExecute(Sender: TObject);
begin
  try
    busy;
    Next(GetLinesBufValue);
  finally
    notbusy;
  end;
end;

procedure TfLEdit.aclosefileExecute(Sender: TObject);
begin
  CloseCurrentMulti;
  if tabsfile.Tabs.Count <= 0 then
    OpenNewMulti;
  exit;
  
  if editmode then begin
    if not SaveCheck(true) then exit;
  end;
  OpenNew;
{  if editmode then begin
    if messageDlg('Would you like to save the remainder of the file?', mtConfirmation, [mbNo, mbYes], 0) = mrNo then
      editmode := false;
  end;
  CloseCurFile;}
end;

procedure TfLEdit.aSaveCurExecute(Sender: TObject);
begin
  if memo1.Lines.count <= 0 then begin MessageDlg('There are no lines in the editor to be saved', mtError, [mbOK], 0); exit; end;
  if sd.Execute then begin
    memo1.Lines.SaveToFile(sd.FileName);
  end;
end;

procedure TfLEdit.adelfieldExecute(Sender: TObject);
var
  dlg: TdlgDelField;
begin
  Screen.Cursor := crHourGlass;
  dlg := TdlgDelField.Create(self);
  try
    if (memo1.Lines.Count > 0) and (length(memo1.Lines.Strings[0]) > 0) or not FCurOpen then begin
      dlg.FirstLine := memo1.Lines.Strings[0];
      if dlg.ShowModal = mrOk then begin
        DeleteField(dlg.Delimiter, dlg.DeleteField - 1, dlg.NumOfFields, dlg.OutFilename);
      end;
    end
    else
      MessageDlg('You must open a file in read mode first', mtError, [mbok], 0);
  finally
    dlg.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfLEdit.aLongLnExecute(Sender: TObject);
var
  i, totallen, StartPos, ToEnd, FoundAt: integer;
  s: String;
begin
  Screen.Cursor := crHourGlass;
  LastLLSearch := StrToIntDef(Inputbox('Search for a line longer then', 'Line Length', '0'), 0);
  totallen := 0;
  for i := memo1.CaretY - 1 to memo1.Lines.Count - 1 do begin
    s := memo1.Lines[i];
    if length(s) > LastLLSearch then begin
        Memo1.SetFocus;
        memo1.CaretY := i + 1;
        memo1.BlockBegin := memo1.CaretXY;
        memo1.CaretX := LastLLSearch;
        memo1.BlockEnd := memo1.CaretXY;
        break;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfLEdit.aopeneditExecute(Sender: TObject);
begin
  ShowOpenMulti(true);
  //ShowOpen(true);
end;

procedure TfLEdit.aFindExecute(Sender: TObject);
begin
  try
    busy;
    if length(memo1.SelText) > 0 then gsSearchText := memo1.SelText;
    ShowSearchReplaceDialog(FALSE);
  finally
    notbusy;
  end;
  exit;
  //OLD CODE
  {if length(memo1.SelText) > 0 then
    fd.FindText := memo1.SelText
  else if length(clipboard.AsText) >= 0 then
    fd.FindText := clipboard.AsText;
  fd.Execute;}
end;

function TfLEdit.Next(Lines: String; WriteLines: boolean = true; ResetMemo: boolean = true): boolean;
var
  sl, el, i, lineshowen: Integer;
  tmp, buf: string;
begin
  result := NextMulti(lines, writelines, resetmemo);
  exit;

///*********
  if FNewFile then exit;
  Screen.Cursor := crHourGlass;
  try
    if editmode and WriteLines and not(EndOfFile) then
      OutLines;
    tmp := Lines;
    i := pos('-', tmp);
    if i = 0 then begin
      lineshowen := StrToInt(tmp);
      lineshowen := GetLines(lineshowen, buf);
      end
    else begin
      sl := StrToInt(Copy(tmp,0,i-1));
      el := StrToInt(Copy(tmp,i+1,length(tmp)));
      if memo1.Lines.Count >= el then begin
        if (sl+1) = el then
          memo1.CaretY := el
        else
          memo1.CaretY := sl;
        exit;
      end
      else begin
        if not endOfFile then begin
          if sl < totalline then begin
            if editmode then
              if MessageDlg('Your currently in edit mode and the line your searching for is back, if you continue the remainder of the file will be saved and reopened in read mode and your line will be located. Do you wish to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
                //memo1.Lines.text := buf;
                exit;
              end;
            CloseCurFile;
            memo1.Lines.Clear;
            if not OpenCurFile then exit;
          end;
          lineshowen := el - sl;
          lastend := totalline;
          sl := sl - lastend;
          el := el - lastend;
          lastend := lastend + el;
          lineshowen := GetSelLines(sl,el, buf);
        end //end of file
        else begin
          messageDlg('Line could not be found.', mtError, [mbOK], 0);
          exit;
          end
      end; // else
    end; // i =0
    if lineshowen > 0 then begin
      if resetmemo then begin
        memo1.Lines.Clear;
        memo1.Lines.Text := buf;
        memo1.Gutter.StartValue := totalline - lineshowen;
        end;
      end;
    if ashowtools.Checked then begin
      dTextGrid.Refresh;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfLEdit.fdFind(Sender: TObject);
var
  syopt: TSynSearchOptions;
begin
  try
   busy;
    //ssoMatchCase, ssoWholeWord, ssoBackwards, ssoEntireScope,
    //ssoSelectedOnly, ssoReplace, ssoReplaceAll, ssoPrompt
    syopt := [ssoSelectedOnly];
    if not (frDown in fd.Options) then begin
      syopt := syopt + [ssoBackwards];
      memo1.BlockEnd := memo1.BlockBegin;
      memo1.CaretXY := memo1.BlockBegin;
    end
    else
      memo1.BlockBegin := memo1.BlockEnd;

    if frMatchCase in fd.Options then
      syopt := syopt + [ssoMatchCase];
    if frWholeWord in fd.Options then
      syopt := syopt + [ssoWholeWord];
    if memo1.SearchReplace(fd.FindText,'',syopt) <= 0 then begin
      if CurLEfile.IsFileOpen then begin
        //Next(GetLinesBufValue);
        CurLEFile.Next(GetLinesBufValue, true, true);
        if Pos(fd.FindText, CurLeFile.BufferText) > 0 then SetCurrentMemo;
        if CurLEfile.EndOfFile then begin
          SetCurrentMemo;
          fd.CloseDialog;
          MessageDlg('Not Found',mtInformation, [mbok],0);
          exit;
        end;
        fdFind(sender);
      end;
      {if FCurOpen then begin
        Next(GetLinesBufValue);
        if EndOfFile then exit;
        fdFind(sender);
      end;}
      //MessageDlg('Not Found',mtInformation, [mbok],0);
      end;
    memo1.CaretXY := memo1.BlockEnd;
   finally
    notbusy;
   end;
end;

procedure TfLEdit.rdFind(Sender: TObject);
var
  syopt: TSynSearchOptions;
begin
  try
    busy;
    //ssoMatchCase, ssoWholeWord, ssoBackwards, ssoEntireScope,
    //ssoSelectedOnly, ssoReplace, ssoReplaceAll, ssoPrompt
    syopt := [ssoSelectedOnly];
    if not (frDown in rd.Options) then begin
      syopt := syopt + [ssoBackwards];
      memo1.BlockEnd := memo1.BlockBegin;
      memo1.CaretXY := memo1.BlockBegin;
    end
    else
      memo1.BlockBegin := memo1.BlockEnd;

    if frMatchCase in rd.Options then
      syopt := syopt + [ssoMatchCase];
    if frWholeWord in rd.Options then
      syopt := syopt + [ssoWholeWord];
    if memo1.SearchReplace(rd.FindText,'',syopt) <= 0 then begin
      CurLEFile.Next(GetLinesBufValue, true, true);
      if Pos(rd.FindText, CurLeFile.BufferText) > 0 then SetCurrentMemo;
      //Next(GetLinesBufValue);
      if CurLEfile.EndOfFile then begin
        SetCurrentMemo;
        rd.CloseDialog;
        MessageDlg('Not Found',mtInformation, [mbok],0);
        exit;
        end;
      rdFind(sender);
      //MessageDlg('Not Found',mtInformation, [mbok],0);
      end;
    memo1.CaretXY := memo1.BlockEnd;
   finally
    notbusy;
   end;
end;

procedure TfLEdit.rdReplace(Sender: TObject);
var
  spt: TPoint;
  syopt: TSynSearchOptions;
begin
  try
    busy;
    if not (frReplaceAll in rd.Options) then begin
      if length(memo1.SelText) > 0 then begin
        spt := BufCordToPoint(memo1.BlockEnd);
        memo1.SelText := rd.ReplaceText;
        memo1.BlockBegin := memo1.BlockEnd;
        memo1.CaretXY := TBufferCoord(spt);
        rdFind(Sender);
      end
      else
        rdFind(Sender);
    end
    else begin
      syopt := [ssoReplaceAll, ssoEntireScope, ssoPrompt];
      if frMatchCase in rd.Options then
        syopt := syopt + [ssoMatchCase];
      if frWholeWord in fd.Options then
        syopt := syopt + [ssoWholeWord];
      TotalReplaced := TotalReplaced + memo1.SearchReplace(rd.findText, rd.ReplaceText, syopt);
      if CurLEfile.IsFileOpen then begin
        CurLEFile.Next(GetLinesBufValue, true, true);
        if Pos(rd.FindText, CurLeFile.BufferText) > 0 then SetCurrentMemo;
        //NextMulti(GetLinesBufValue);
        if CurLEfile.EndOfFile then begin
          SetCurrentMemo;
          messagedlg('Replaced ' + IntToStr(TotalReplaced) + ' occurrences', mtinformation, [mbok], 0);
          exit;
        end;
      end;
      rdReplace(sender);
    end;
   finally
    notbusy;
   end;    
end;

procedure TfLEdit.aReplaceExecute(Sender: TObject);
begin
  if not CurLEfile.Editmode then begin
    if messagedlg('Your not in edit mode to you do you wish to continue?',mtConfirmation, [mbYes, mbNo], 0) <> mrYes then exit;
  end;
  if length(memo1.SelText) > 0 then
    rd.FindText := memo1.SelText
  else if length(clipboard.AsText) >= 0 then
    rd.FindText := clipboard.AsText;
  TotalReplaced := 0;

  ShowSearchReplaceDialog(TRUE);

  exit;
  //OLD Code
  rd.Execute;
end;

procedure TfLEdit.CloseCurFile(WriteLines: boolean);
var
  s: String;
begin
  DebugLog('CloseCurFile WriteLines='+BoolToStr(Writelines, true));
  if editmode and FTempOpen then begin
    Screen.Cursor := crHourGlass;
    if writelines then begin
      OutLines;
      if FCurOpen then begin
        while not eof(txt) do begin
          Readln(txt,s);
          writeln(outf,s);
        end;
      end;
    end;
    CloseFile(outf);
    FTempOpen := false;
    Screen.Cursor := crDefault;
  end;
  if FCurOpen then
    CloseFile(txt);
  FCurOpen := false;
  //Commented out because Save of small files causes unwanted movement
  //memo1.Lines.Clear;
  DebugLog('CloseCurFile Finish');
end;

function TfLEdit.OpenCurFile(Edit: Boolean): boolean;
var
  msg: array of Char;
  smsg: String;
  msize, i: integer;
begin
  IsRemoteFileOpen := false;
  DebugLog('OpenCurFile Edit='+BoolToStr(Edit, true));
  if FCurOpen then CloseFile(txt);
  if FileExists(FCurFile) then begin
    AssignFile(txt, FCurFile);
    {$I-}
    FileMode := fmOpenRead + fmShareCompat;
    Reset(txt);
    FileMode := fmOpenReadWrite;
    {$I+}
    if IOResult <> 0 then begin
      result := false;
      FCurFile := '';
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
      MessageDlg(smsg, mtError, [mbOK], 0);
      SetLength(msg, 0);
      OpenNew;
      exit;
    end;
    FileMode := fmOpenReadWrite;
    EndOfFile := eof(txt);
    FCurOpen := true;
  end;
  totalline := 0;
  if Edit then begin
    FTempFile := GetTmpFileName(FCurFile);
    if FTempOpen then CloseFile(outf);
    AssignFile(outf, FTempFile);
    Rewrite(outf);
    FTempOpen := true;
  end;
  editmode := Edit;
  if (editmode) and (not(FNewFile)) then begin FSaveFile := FCurFile; IsSaved := true; end;
  changes := false;
  DebugLog('OpenCurFile Finish');

  //Add to recentDoc list
  UpdateRecentDocs;
  result := true;
end;

procedure TfLEdit.aSaveCloseExecute(Sender: TObject);
begin
  if CurLEfile.editmode then begin
      SaveMulti(false);
      CloseCurrentMulti(false);
      if tabsfile.Tabs.Count <= 0 then
        OpenNewMulti;
  end
  else begin
    if MessageDlg('The file was not opened in edit mode and will not be saved. Do you still want to close?', mtConfirmation, [mbYes, mbNO], 0) = mrYes then  begin
      CloseCurrentMulti(false);
      if tabsfile.Tabs.Count <= 0 then
        OpenNewMulti;
    end;
  end;
end;

procedure TfLEdit.memo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  CurLEfile.ReCalcMaxChar(memo1.LineText);
  //memo1.MaxLeftChar := CurLefile.MaxLeftChar;
  memo1.MaxScrollWidth := CurLefile.MaxLeftChar;
  CurKey := Key;
{  if IsRecord then begin
    if Key = VK_ESCAPE then begin
      StopRec;
      exit;
    end;
    if ssShift in Shift then
      AddRecLine('KEY=SHIFTDOWN');
    if ssCtrl in Shift then
      AddRecLine('KEY=CTRLDOWN');
    AddRecLine('KEY=' + IntToStr(Key) );
  end;
}
  UpdatePosition;
  //if CurLEfile.MaxLeftChar < (length(s)+10)then fMaxLeftChar := (length(s)+10);

  if (Key = VK_DOWN) or (key = VK_NEXT) then begin
    if memo1.CaretY >= memo1.Lines.Count then begin
        if Next(GetLinesBufValue) then begin
          Key := 0;
          memo1.CaretX := 0;
          memo1.CaretY := 0;
          end;
        end;
    end
  else if (Key = VK_UP) or (key = VK_PRIOR) then begin
    if memo1.CaretY <= 1 then begin
      if Last() then begin
        Key := 0;
        memo1.CaretX := 0;
        memo1.CaretY := memo1.Lines.Count;
      end;
    end;
  end;
end;

function TfLEdit.GetTmpFileName(Filename: String): String;
begin
  result := GetTmpPathFileName(AppPath, filename);
end;

procedure TfLEdit.ASaveExecute(Sender: TObject);
begin
  SaveMulti;
  exit;
  SaveFile;
end;

function TfLEdit.SaveFile(Reopen: Boolean; SaveAs: Boolean): boolean;
var
  newf: String;
  x, y: integer;
  attra: word;
  copied: boolean;
begin
  result := false;
  if IsRemoteFileOpen then begin
    if messageDlg('This file was opened remotely, would you like to save it remotely?', mtconfirmation, [mbyes, mbno], 0) = mryes then begin
      aFTPSaveExecute(nil);
      exit;
      end;
    end;

  DebugLog('Savefile Reopen='+BoolToStr(Reopen, true));
  //Copy Edit file to location and delete temp
  if length(FCurFile) <= 0 then begin MessageDlg('You must open a file in edit mode first?', mtError, [mbOK], 0); exit; end;
  if not editmode then begin
    MessageDlg('The file must be opened in edit mode first?', mtInformation, [mbOK], 0);
    exit;
  end;

  if (length(FSaveFile) > 0) and not(SaveAs) then
    newf := FSaveFile
  else begin
    sd.FileName := ExtractFileName(FSaveFile);
    sd.InitialDir := ExtractFilePath(FSaveFile);
    if not sd.Execute then exit;
    newf := sd.filename;
    end;

  //Check to see if file is read only before you close the file
  //is can't save then user can save as
  if FileExists(newf) and FileIsReadOnly(newf) then begin
    if MessageDlg('The file your trying to save is marked read only, would you like to remove read only marker and save?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
      exit;
    attra := FileGetAttr(newf);
    FileSetAttr(newf, attra - faReadOnly);
    if FileIsReadOnly(newf) then begin
      MessageDlg('Unable to remove read only marking', mtError, [mbOK], 0);
      exit;
      end;
  end;

  CloseCurFile;
  CopyFile(PChar(FTempFile), PChar(newf), false);
  DeleteFile(FTempFile);
  IsSaved := true;
  Changes := false;
  FSaveFile := newf;
  FNewFile := false;
  if Reopen then begin
    FCurFile := newf;
    if not OpenCurFile(true) then exit;
    if memo1.Highlighter = nil then
      SetHighlighter;
    next(GetNextLines ,false, not IsSmall);
    end
  else
    memo1.Lines.Clear;

  result := true;
  DebugLog('Savefile Finish');
end;

function TfLEdit.ShowOpen(Edit: Boolean): Boolean;
var
  isSmall: Boolean;
  i: integer;
begin
  result := false;
  DebugLog('ShowOpen Edit='+BoolToStr(Edit, true));
  if editmode then begin
    if not SaveCheck(false) then exit;
  end;
  if Length(FCurfile) > 0 then
    od.InitialDir := extractfilepath(FCurFile);
  if od.Execute then begin
    OpenFileMulti(od.FileName, edit);
    result := true;
  end;
  DebugLog('ShowOpen Finish');
//  else
//    OpenNew;
end;

procedure TfLEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: integer;
begin
  UpdateCurrentFile;
  CanClose := SaveCheckMulti(true);
  if CanClose then fopts.StartMax := (WindowState = wsMaximized);
  exit;
  CanClose := SaveCheck(True);
end;

procedure TfLEdit.memo1Change(Sender: TObject);
var
  lststate: boolean;
begin
  lststate := CurLEFile.IsChanged;
  CurLEFile.IsChanged := true;
  UpdateCurrentFile;
  Changes := true;
  UpdatePosition;
  UpdateStatus('');
  if (not lststate) then tabsfile.Refresh;

  //Plug Notify
  OnPLNotify( peChange );

  //Kill Complete if empty
  if CompleteOn then begin
    if SynCodeProposal.Form.ItemList.Count <= 0 then
      SynCodeProposal.CancelCompletion;
  end;
  //Code Complete by watch
  if (Curkey = VK_SPACE) or (Curkey = VK_RETURN) or (Curkey = VK_BACK) then exit;
  if SynCodeProposal.Tag > 0 then begin
    FCurToken := memo1.GetWordAtRowCol(memo1.CaretXY);
    FCurToken := GetWorkAtCursor(memo1);
    if length(FCurToken) >= SynCodeProposal.Tag then begin
      if not CompleteON then
        SynCodeProposal.ActivateCompletion;
    end;
  end;
end;

function TfLEdit.SaveCheck(Closing: Boolean): boolean;
var
  res: word;
begin
  DebugLog('SaveCheck Closing='+BoolToStr(Closing, true));
  result := true;
  if editmode and Changes then begin
    res := MessageDlg('Do you wish to save your changes?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if res = mrYes then
      SaveFile(not closing)
    else if res = mrCancel then
      result := false
    else begin
      if Closing then begin
        CloseCurFile(false);
        memo1.Lines.Clear;
        CleanUpTempFile;
      end;
    end;
  end
  else begin
    if Closing then begin
      CloseCurFile(false);
      memo1.Lines.Clear;
      CleanUpTempFile;
    end;
  end;
  DebugLog('SaveCheck Finish');
end;

procedure TfLEdit.aSelectModeExecute(Sender: TObject);
begin
  if memo1.SelectionMode = smColumn then
    memo1.SelectionMode := smNormal
  else
    memo1.SelectionMode := smColumn;
  aSelectMode.Checked := memo1.SelectionMode = smColumn;
end;

procedure TfLEdit.aFileNewExecute(Sender: TObject);
begin
  OpenNewMulti;
  exit;

  if editmode then begin
    if not SaveCheck(true) then exit;
  end;
  OpenNew;
end;

function TfLEdit.GetNewTempFileName: String;
var
  fn: string;
  exists: boolean;
  i: integer;
begin
  exists := true;
  i := 0;
  while exists do begin
    fn := AppPath + 'new' + IntToStr(i) + '.ltf';
    exists := FileExists(fn);
    i := i + 1;
  end;
  result := fn;
end;

function TfLEdit.GetCurFile: string;
begin
  result := CurLeFile.Filename;
  //result := ACurFile;
end;

procedure TfLEdit.SetCurFile(const Value: string);
var
  regtxt: string;
begin
  showmessage('SetCurFile');
  exit;

  if not Registered then
    regtxt := ' | Unregistered (Day ' + IntToStr(dlgNag.DaysUsed) + ' of ' + IntToStr(dlgNag.DayTrial) + ')'
  else
    regtxt := '';
  ACurFile := Value;
  if (Pos(AppPath, Value) > 0) and (LowerCase(ExtractFileExt(Value)) = '.ltf') then
    //self.Caption := 'Untitled' + regtxt
    self.Caption := scTitle + ' - Untitled' + regtxt
  else
    self.Caption := ExtractFileName(ACurFile) + regtxt;
    //self.Caption := scTitle + ' - ' + ExtractFileName(ACurFile) + regtxt;
  application.Title := self.Caption;
end;

procedure TfLEdit.OpenNew;
begin
  DebugLog('OpenNew Start');
  FCurFile := GetNewTempFileName;
  FNewFile := true;
  FSaveFile := '';
  IsSaved := false;
  IsSmall := true;
  memo1.Lines.Clear;
  { TODO 4 -oMain -cDev :
Add Dialog to ask highlight and complete on new files or have
option under file to select highlight and complete }
  memo1.Highlighter := nil;
  memo1.Gutter.StartValue := 0;
  SynAutoComplete.AutoCompleteList.Clear;
  SynCodeProposal.Tag := 0;
  SynCodeProposal.InsertList.Clear;
  SynCodeProposal.ItemList.Clear;
  //**********************
  if not OpenCurFile(true) then exit;;
  FCurOpen := false;
  changes := false;
  updateposition;
  DebugLog('OpenNew Finish');
end;

procedure TfLEdit.aRecMacExecute(Sender: TObject);
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

procedure TfLEdit.StopRec;
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

procedure TfLEdit.aPlayMacExecute(Sender: TObject);
begin
  if length(FMacFile) <= 0 then begin
    if not odwinmac.Execute then exit;
    FMacFile := odwinmac.filename;
    IsMacSaved := true;
  end;
  PlayMacro(FMacFile);
end;

procedure TfLEdit.PlayMacro(Filename: String);
begin
//play mac
  Playback(PChar(Filename), PlayFinished);
end;

procedure TfLEdit.StartRec;
begin

end;

procedure TfLEdit.SaveMac(Filename: String);
begin

end;

procedure TfLEdit.aSaveMacExecute(Sender: TObject);
begin
  //SaveMac
  if not sdwinmac.Execute then exit;
  CopyFile(PChar(FMacFile), PChar(sdwinmac.FileName), true);
  FMacFile := sdwinmac.FileName;
  IsMacSaved := true;
end;

procedure TfLEdit.aStopMacExecute(Sender: TObject);
begin
  StopRec;
end;

procedure TfLEdit.aShowRulerExecute(Sender: TObject);
begin
  pRuler.Visible := not pRuler.Visible;
  pRuler2.Visible := not pRuler2.Visible;
  aShowRuler.Checked := pRuler.Visible;
  if aShowRuler.Checked then begin
    memo1.Font := pruler.Font;
    CreateRuler;
    end
  else
    memo1.Font := StartFont;
end;

procedure TfLEdit.CreateRuler;
var
  txt, txt2: String;
  i, j, wid, pid, dig, mid: integer;
  cw: double;
begin
  wid := memo1.Gutter.Width;
  wid := memo1.Gutter.LeftOffset + memo1.Gutter.RightOffset + wid + wid + memo1.Gutter.DigitCount + 1;
  cw := wid / memo1.Font.Size;
  i := Round( cw );
  txt := StringOfChar(' ', i);

  wid := pRuler.Width;
  cw := wid / 8;
  pid := Round(cw);

  dig := 1;
  txt2 := txt;
  txt := txt;
  for i := 1 to pid do begin
    if (i mod 2) = 0 then begin
      txt := txt + IntToStr(dig * 5) + '';
      dig := dig + 1;
    end
    else begin
      if dig = 1 then
        mid := 5 - length(IntToStr(dig * 5))
      else
        mid := 5 - length(IntToStr((dig-1) * 5));
      txt := txt + StringOfChar('.', mid);
    end;
  end;
  j := 1;
  for i := 1 to (pid+pid) do begin
    if (j mod 2) = 0 then
      txt2 := txt2 + IntToStr((j mod (j+5)));

    j := j + 1;
    if j >= 10 then begin
      j := 1;
      txt2 := txt2 + '|';
      end
    else if (j mod 2) = 0 then
      txt2 := txt2 + '.';

  end;

  pRuler.Caption := txt;
  pruler2.Caption := txt2;
end;

procedure TfLEdit.aKMRecExecute(Sender: TObject);
begin
  aKMrec.Enabled := false;
  aKMStop.Enabled := true;
  aKMPlay.Enabled := false;
  aKMPlayPerLine.Enabled := false;
  symac.RecordMacro(memo1);
end;

procedure TfLEdit.AKMStopExecute(Sender: TObject);
begin
  aKMrec.Enabled := true;
  aKMStop.Enabled := false;
  aKMPlay.Enabled := true;
  aKMPlayPerLine.Enabled := true;
  symac.Stop;
end;

procedure TfLEdit.aKMPlayExecute(Sender: TObject);
begin
  aKMPlay.Enabled := false;
  aKMPlayPerLine.Enabled := false;
  symac.PlaybackMacro(memo1);
  aKMPlay.Enabled := true;
  aKMPlayPerLine.Enabled := true;
  UpdateCurrentFile;
end;

procedure TfLEdit.aKMSaveExecute(Sender: TObject);
var
  fs: TFileStream;
begin
  if sdmac.Execute then begin
    symac.SaveToFile(sdmac.FileName);
{    if fileexists(sdmac.FileName) then
      if messagedlg('File already exists, do you wish to override?',mtWarning,[mbYes,mbNo],0) = mrYes then
        DeleteFile(sdmac.FileName)
      else
        exit;
    fs := TFileStream.Create(sdmac.FileName, fmCreate);
    try
      symac.SaveMacro(fs);
    finally
      fs.Free;
    end;}
  end;
end;

procedure TfLEdit.aKMOpenExecute(Sender: TObject);
var
  fs: TFileStream;
begin
  if odmac.Execute then begin
    symac.LoadFromFile(odmac.FileName);
{    fs := TFileStream.Create(odmac.FileName, fmOpenReadWrite);
    try
      symac.LoadMacro(fs);
    finally
      fs.Free;
    end;}
  end;
  aKMPlay.Enabled := true;
  aKMPlayPerLine.Enabled := true;
end;

procedure TfLEdit.aEditUndoExecute(Sender: TObject);
begin
  memo1.Undo;
  UpdateIcons;
end;

procedure TfLEdit.aOptionsExecute(Sender: TObject);
begin
  if fopts.ShowModal = mrOK then begin;
    fopts.SetEditorOptions(memo1);
    if fopts.ToolbarChanged then begin
      RefreshToolbars;
    end;
    if fopts.HighlighterChanged then begin
      SetCurrentHL(CurLEfile.Highlight);
    end;
    //Set Hightlighter

    {highlight := fopts.GetSyntaxHighlighter(FCurFile);
    if assigned(highlight) then begin
      memo1.Highlighter := highlight;
      //Get Auto Completion
      if length(fopts.GetAutoComplete(highlight)) > 0 then
        SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(highlight));
      //Get Completion Proposal
      fopts.SetCompletePropos(SynCodeProposal, highlight);
    end;}

    AddHelpDocsToMenu;
  end;
end;

procedure TfLEdit.aSaveAsExecute(Sender: TObject);
begin
  SaveMulti(true, true);
  exit;
  SaveFile(true, true);
end;

procedure TfLEdit.aEditRedoExecute(Sender: TObject);
begin
  Memo1.Redo;
  UpdateIcons;  
end;

procedure TfLEdit.aEditDeleteExecute(Sender: TObject);
begin
  Memo1.SelText := '';
end;

procedure TfLEdit.aEditSelectAllExecute(Sender: TObject);
begin
  RunEditorCommand(ecSelectAll);
//  memo1.SelectAll;
end;

procedure TfLEdit.aEditCopyExecute(Sender: TObject);
begin
  if Assigned(ActiveControl) then
    Postmessage(ActiveControl.Handle, WM_COPY, 0,0);
end;

procedure TfLEdit.aEditCutExecute(Sender: TObject);
begin
  if Assigned(ActiveControl) then
    Postmessage(ActiveControl.Handle, WM_CUT, 0,0);
end;

procedure TfLEdit.aEditPasteExecute(Sender: TObject);
begin
  if Assigned(ActiveControl) then
    Postmessage(ActiveControl.Handle, WM_PASTE, 0,0);
end;

procedure TfLEdit.aShowMacroExecute(Sender: TObject);
begin
  ATBMacro.Visible := not ATBMacro.Visible;
  aShowMacro.Checked := ATBMacro.Visible;
end;

procedure TfLEdit.aKMPlayPerLineExecute(Sender: TObject);
var
  i, mx: integer;
  dp: TdlgProcess;
begin
  aKMPlay.Enabled := false;
  aKMPlayPerLine.Enabled := false;
  application.ProcessMessages;
  mx := memo1.Lines.Count;
  mx := StrToInt(InputBox('Play macro multiple times','Enter the number time you want to play the macro',  IntToStr(mx)));
  memo1.BeginUpdate;
  //if not fopts.ShowEditLongPlay then
  if mx > 100 then memo1.Visible := false;
  dp := TdlgProcess.Create(self);
  try
    dp.ProcessCaption := 'Playing macro for each line';
    dp.Show;
    for i := 1 to mx do begin
      symac.PlaybackMacro(memo1);
      if not dp.UpdateStatus('Currently processing line ' + IntToStr(i), i, mx) then break;
    end;
    if not memo1.Visible then memo1.Visible := true;    
  finally
    dp.Free;
    if not memo1.Visible then begin
      memo1.Visible := true;
      //sleep(1000);
      //memo1.SetFocus;
      end;
    memo1.EndUpdate;
    UpdateCurrentFile;
  end;
  aKMPlay.Enabled := true;
  aKMPlayPerLine.Enabled := true;
end;

procedure TfLEdit.aGotoLineExecute(Sender: TObject);
var
  ln: String;
//  i: integer;
begin
  ln := inputbox('Goto line number','Enter line number', '');
  GotoLine(ln);
{  if length(ln) <= 0 then exit;
  i := StrToIntDef(ln, -1);
  if i = -1 then
    Showmessage('Please enter a valid line number')
  else begin
    if (CurLeFile.IsSmall) then begin
      CurLefile.CaretY := i;
      memo1.CaretY := i;
    end
    else begin
      next(IntToStr(i)+'-'+ IntToStr(i + StrToInt(GetLinesBufValue)));
      SetCurrentMemo;
    end;
  end;
}
end;

procedure TfLEdit.aexitExecute(Sender: TObject);
begin
  Close;
end;

function TfLEdit.GetChanges: boolean;
begin
  result := FChanges;
end;

procedure TfLEdit.SetChanges(const Value: boolean);
begin
  FChanges := Value;
  if FChanges then
    sbar.Panels[1].Text := 'Modified'
  else
    sbar.Panels[1].Text := '';
end;

procedure TfLEdit.UpdatePosition;
var
  y,x: integer;
begin
  x := memo1.CaretX;
  y := memo1.CaretY;
  sbar.Panels[0].Text := format('%d : %d', [y,x]);
//  sbar.Panels[2].Text := 'Line len: ' + inttostr(length(memo1.LineText)) + ' MaxChar: ' + inttostr(CurLEfile.MaxLeftChar);
end;

procedure TfLEdit.memo1Click(Sender: TObject);
begin
  UpdatePosition;
  SaveCursorPos;
end;

procedure TfLEdit.memo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  UpdatePosition;
end;

function TfLEdit.GetNextLines: String;
var
  i: integer;
  isSmall: boolean;
begin
    //Check for Small File
    isSmall := fopts.IsSmallFile(FCurFile);
    if isSmall then
      result := IntToStr(high(i))
    else
      result := GetLinesBufValue;
end;

procedure TfLEdit.aPrintPreviewExecute(Sender: TObject);
begin
  PrintSetup;
  fPrintPre.SynEditPrintPreview.SynEditPrint := synPrint;
  fPrintPre.ShowModal;
end;

procedure TfLEdit.aPrinterSetupExecute(Sender: TObject);
begin
  //Setup Printer
  if PrintSetupdlg.Execute then begin
  end;
end;

procedure TfLEdit.aPrintExecute(Sender: TObject);
begin
  PrintSetup;
  PrintDialog;
end;

procedure TfLEdit.PrintSetup;
begin
  synprint.SynEdit := memo1;
  if assigned(highlight) then begin
    synprint.Highlighter := highlight;
    synprint.Colors := true;
    end;
  synprint.Title := GetDocTitle;
  synprint.Header.Add(synprint.Title, HeaderFont.Font, taLeftJustify, 1);
  synprint.Footer.Add('Page $PAGENUM$', HeaderFont.Font, taRightJustify, 1);
end;

procedure TfLEdit.PrintDialog;
begin
  printdlg.FromPage := 1;
  printdlg.MinPage := 1;
  printdlg.ToPage := synprint.PageCount;
  printdlg.MaxPage := synprint.PageCount;
  if printdlg.Execute then begin
    synprint.Copies := printdlg.Copies;
    if printdlg.PrintRange = prPageNums then
      synprint.PrintRange(printdlg.FromPage, printdlg.ToPage)
    else begin
      if printdlg.PrintRange = prSelection then
        synprint.SelectedOnly := true;
      synprint.Print;
    end;
    synprint.Copies := 1;
    synprint.SelectedOnly := false;
  end;
end;

procedure TfLEdit.CleanUpTempFile;
var
  tmfile: String;
begin
  if not FTempOpen then
    if fileexists(FTempFile) then
      DeleteFile(FTempFile);
  DebugLog('Delete Temp File '+FTempFile);

  //Clean up temp execute file
  tmfile := ExtractFilePath(FCurFile) + '~' + ExtractFilename(FCurFile);
  if fileexists(tmfile) then
    Deletefile(tmfile);
end;


procedure TfLEdit.Email(AsText: Boolean);
var
  sub,bdy, att: String;
begin
  bdy := ''; att := '';
  if not IsSaved then
    sub := 'Untitled'
  else
    sub := ExtractFilename(FCurFile);

  if AsText then
    bdy := memo1.Text
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

procedure TfLEdit.aEmailTxtExecute(Sender: TObject);
begin
  try
    Email(true);
  except
    Showmessage('Unable to email text:' + Exception(exceptobject).Message);
  end;
end;

procedure TfLEdit.aEmailAttachExecute(Sender: TObject);
begin
  //Mailas Attach
  try
    Email(false);
  except
    Showmessage('Unable to email attachment:' + Exception(exceptobject).Message);
  end;
end;

procedure TfLEdit.aExpHTMLExecute(Sender: TObject);
begin
  //Export HTML
  ExportFile(SynExportHTML);
end;

function TfLEdit.ExportFile(ExpType: TSynCustomExporter): boolean;
begin
  sdexp.Filter := ExpType.DefaultFilter + '|' + sdexp.Filter;
  sdexp.Title := 'Export ' + exptype.FormatName;
  sdexp.DefaultExt := GetFirstFilterExt(exptype.DefaultFilter);
  if Length(FCurfile) > 0 then begin
    sdexp.InitialDir := extractfilepath(FCurFile);
    sdexp.FileName := ChangeFileExt(Extractfilename(FCurFile), '.'+sdexp.DefaultExt);
  end;
  if sdexp.Execute then begin
    with ExpType do begin
      Title := GetDocTitle;
      if assigned(highlight) then
        Highlighter := highlight;
      ExportAsText := TRUE;
      ExportAll(memo1.Lines);
      SaveToFile(sdexp.FileName);
      end;
    result := true;
  end
  else
    result := false;
end;

procedure TfLEdit.aExpRTFExecute(Sender: TObject);
begin
  //Export RTF
  ExportFile(SynExportRTF);
end;

function TfLEdit.GetDocTitle: string;
begin
  if not IsSaved then
    result := 'Untitled'
  else
    result := FCurFile;
end;

procedure TfLEdit.aAboutExecute(Sender: TObject);
begin
  //About Dialog
  dlgAbout.ShowModal;
end;

procedure TfLEdit.DebugLog(Text: String);
var
  msg: String;
begin
{$IFDEF DEBUG}
//Check for debuglog in setting
  if not FDebugLogOn then begin
    if not fopts.GetSetting(Name, 'DEBUGLOG', false) then exit;
  end;

  if not(assigned(FDEBUGLOG)) then
    FDEBUGLOG := TStringList.Create;
  msg := Format('%s > %s ',
  [
    FormatDateTime('yyyy-mm-dd hh:nn:ss', now), Text
  ]);
    {
    #9'CurOpen = %s'#13#10 +
    #9'CurFile = %s'#13#10 +
    #9'TempOpen = %s'#13#10 +
    #9'TempFile = %s'#13#10 +
    #9'Changes = %s'#13#10 +
    #9'IsSaved = %s'#13#10 +
    #9'SaveFile = %s'#13#10 +
    #9'EndOfFile = %s'#13#10 +
    #9'EditMode = %s'#13#10,
    BoolToStr(self.FCurOpen, true),
    self.FCurFile,
    BoolToStr(self.FTempOpen, true),
    self.FTempFile,
    BoolToStr(self.FChanges, true),
    BoolToStr(self.IsSaved, true),
    self.FSaveFile,
    BoolToStr(EndOfFile, true),
    BoolToStr(editmode, true)}
  FDEBUGLOG.Add(msg);
{$ENDIF}
end;

procedure TfLEdit.FormDestroy(Sender: TObject);
var
  dfile: String;
  tmp: TStringList;
begin
  FreeObject(RecentDocs);
  FreeObject(RecentProjects);
  FreeObject(fplugins);
  FreeObject(fplugininfo);
  //Clean up temp file if closed from hex edit
  //CleanUpTempFile;
  //Save and cleanup debuglog
  if assigned(FDEBUGLOG) then begin
    dfile := format('%s%s', [FormatDateTime('yyyymmdd', now), debugfile]);
    if FDebuglog.Count > 0 then begin
      if FileExists(dfile) then begin
          tmp := TStringList.Create;
          try
            tmp.LoadFromFile(dfile);
            tmp.Add('************* ' + FormatDateTime('hh:nn:ss', now) + ' **************');
            FDebuglog.Text := tmp.Text + FDebuglog.Text;
          finally
            tmp.Free;
          end;
        end;
        FDebuglog.SaveToFile(AppPath+dfile);
      end;
    FDEBUGLOG.Free;
  end;
  dlgSpellChk.Free;
  //Save User layout

  actionmanager.SaveToFile(AppPath+'usrtxact.atb');

  fopts.SaveSetting(Name, ATBEdit.Name, ATBEdit.Visible);
  fopts.SaveSetting(Name, ATBMacro.Name, ATBMacro.Visible);
  fopts.SaveSetting(Name, pRuler.Name, pRuler.Visible);

  if (self.WindowState <> wsMaximized) then begin
    fopts.SaveSetting(Name, 'width', self.Width);
    fopts.SaveSetting(Name, 'height', self.Height);
    fopts.SaveSetting(Name, 'top', self.Top);
    fopts.SaveSetting(Name, 'left', self.Left);
  end;
end;

procedure TfLEdit.aIndentExecute(Sender: TObject);
begin
  RunEditorCommand(ecBlockIndent);
end;

procedure TfLEdit.memo1DropFiles(Sender: TObject; X, Y: Integer;
  AFiles: TStrings);
var
  i: integer;
begin
  //Open Dropped File
  try
    Busy;

    if Afiles.Count = 1 then
      OpenFileMulti(Afiles[0],false) //OpenFile(Afiles[0],false,true)
    else if Afiles.Count > 1 then begin
      OpenFileMulti(Afiles[0],false); //OpenFile(Afiles[0],false,true);
      if MessageDlg('Do you wish to open all files?',mtConfirmation,[mbYes, mbNo], 0) = mrYes then begin
        for i := 1 to afiles.Count - 1 do begin
          OpenFileMulti(Afiles[i],false); //ExecuteFile(Application.ExeName,'"'+Afiles[i]+'"');
        end;
      end;
    end;
  finally
    NotBusy;
  end
end;

function TfLEdit.OpenFile(filename: String; Edit: Boolean = false; DoSaveCheck: boolean = false): boolean;
var
  i: integer;
begin
  result := false;
  DebugLog('OpenFile Filename='+filename);
  if Not Fileexists(filename) then begin
    MessageDlg('File could not be found', mtError, [mbOk], 0);
    exit;
  end;
  if editmode and dosavecheck then begin
    if not SaveCheck(false) then exit;
  end;
  CloseCurFile(false);
  memo1.Lines.Clear;
  CleanUpTempFile;
  FCurFile := filename;
  FNewFile := false;
  memo1.Gutter.StartValue := 0;
  SetHighlighter;
  //Check for Small File
  isSmall := fopts.IsSmallFile(FCurFile);
  if isSmall then begin
    if not OpenCurFile(fopts.EditSmallFile) then exit;
    end
  else begin
    if not OpenCurFile(edit) then exit;
  end;
  next( GetNextLines, false);
  updateposition;
  //*********
  DebugLog('OpenFile Finish');
  result := true;
end;

function TfLEdit.GetFilePar: String;
var
  cl, ot: String;
  i: integer;
  qstart: Boolean;
begin
  cl := GetCommandLine;
  ot := '';
  result := ot;
  if pos(' ', cl) = 0 then exit;
  qstart := false;
  for i := length(cl) downto 0 do begin
    if (cl[i] = '"') and (qstart) then
      qstart := false
    else if (cl[i] = '"') and (not qstart) then
      qstart := true;
    if (Ord(cl[i]) = VK_SPACE) and (not qstart) then break;
    ot := cl[i] + ot;
  end;
  ot := StringReplace(ot, '"', '', [rfReplaceAll]);
  result := ot;
end;

function TfLEdit.GetFileProcessType: TFileProcessType;
var
  cl: String;
begin
  result := fptNothing;
  cl := GetCommandLine;
  if Pos(' /p ', cl) <> 0 then result := fptPrint;
  if Pos(' /a ', cl) <> 0 then result := fptAssociation;
  if Pos(' /e ', cl) <> 0 then result := fptEdit;
  if Pos(' /d', cl) <> 0 then result := fptDebug;  
end;

procedure TfLEdit.JustPrint;
begin
  PrintSetup;
  synprint.Print;
end;

procedure TfLEdit.UpdateStatus(Txt: String);
begin
  sbar.Panels[2].Text := txt;
  //Update tab caption
  { TODO : Update tab caption with modified flag }
{  if FLEFiles.Items[tabsfile.TabIndex].IsChanged then
    tabsfile.Tabs[tabsfile.TabIndex] := ExtractFilename(FLEFiles.Items[tabsfile.TabIndex].Filename) + '*'
  else
    tabsfile.Tabs[tabsfile.TabIndex] := ExtractFilename(FLEFiles.Items[tabsfile.TabIndex].Filename);
}
end;

procedure TfLEdit.UpdateRecentDocs;
begin
  if (length(FCurFile) <= 0) or FNewFile then exit;
  if FLastRecentDoc <> FCurFile then
    AddRecentDocs(RecentDocs, FCurFile);
  FLastRecentDoc := FCurFile;
  AddRecentDocsToMenu;
end;

procedure TfLEdit.AddRecentDocsToMenu;
var
  i: integer;
  mi: TMenuItem;
  acl: TActionClientItem;
  arec: TAction;
begin
  LoadRecentDocs( RecentDocs );
  mitemReopen.Clear;
  for i := 0 to RecentDocs.Count - 1 do begin
    //arec := TAction.Create(alRecent);
    //arec.ActionList := alRecent;
    //arec.Caption := IntToStr(i) + ' - ' + RecentDocs[i];
    //arec.OnExecute := self.OnClickRecentDoc;

    mi := TMenuItem.Create(self);
    //mi.Action := arec;
    mi.OnClick := self.OnClickRecentDoc;
    mi.Caption := IntToStr(i) + ' - ' + RecentDocs[i];
    mitemReopen.Add(mi);

    //acl := ActionManager.ActionBars.ActionBars[0].Items[1].Items.Add();
    //acl.Action := arec;

  end;
end;

procedure TfLEdit.AddHelpDocsToMenu;
var
  i: integer;
  mi: TMenuItem;
  nme, vle : string;
begin
  //Change to Help menu
  maddhelp.Clear;
  for i := 0 to fopts.GetHelpCount - 1 do begin
    mi := TMenuItem.Create(self);
    mi.OnClick := self.OnClickHelpDoc;
    fopts.GetHelp(i, nme, vle);
    mi.Caption := nme;
    maddhelp.Add(mi);
  end;
end;

procedure TfLEdit.OnClickRecentDoc(Sender: TObject);
var
  fnme: String;
  i: integer;
begin
  if Sender is TMenuItem then begin
    with Sender as TMenuItem do begin
      fnme := Caption;
      i := Pos('-', fnme);
      if i <> 0 then
        fnme := Trim(Copy(fnme, i+1, length(fnme)));
      OpenFileMulti(fnme); //self.OpenFile(fnme);
    end; // with
  end; //If
end;

procedure TfLEdit.aSpellCheckExecute(Sender: TObject);
begin
  if not(assigned(dlgSpellChk)) then begin
    dlgSpellChk := TdSpellCheck.Create(self);
    dlgSpellChk.Editor := memo1;
  end;
  dlgSpellChk.CheckSpelling;
end;

procedure TfLEdit.aextendfrExecute(Sender: TObject);
var
  fr: TdFindReplace;
  i: integer;
  nme, path, lne, txt: String;
begin
  //Find Replace Dialog
  fr := TdFindReplace.Create(self);
  try
    if length(FCurFile) > 0 then begin
      fr.DefaultPath := ExtractFilePath(FCurFile);
      fr.CurrentFile := FCurFile;
      if assigned(CurLEfile.HighlightObject) then begin
        if (CurLEfile.HighlightObject is TSynUniSyn) then
          fr.DefaultTypes := fopts.GetCustomFileTypesFromFilter( TSynUniSyn(CurLEfile.HighlightObject).Info.General.Extensions )
        else
          fr.DefaultTypes := fopts.GetFileTypesFromFilter(CurLEfile.HighlightObject.DefaultFilter);
      end
    end
    else begin
      fr.DefaultPath := FSDefaultPath;
      fr.DefaultTypes := FSDefaultTypes;
    end;
    fr.FindText := FSFindText;
    fr.ReplaceText := FSReplaceText;
    if fr.ShowModal = mrOK then begin
      FSDefaultPath := fr.DefaultPath;
      FSDefaultTypes := fr.DefaultTypes;
      FSFindText := fr.FindText;
      FSReplaceText := fr.ReplaceText;
      dFileList.Clear;
      for i := 0 to fr.FoundCount - 1 do begin
        nme := ExtractFileName(fr.Files[i]);
        path := ExtractFilePath(fr.Files[i]);
        lne := fr.LineFound[i];
        txt := fr.MatchText[i];
        dfilelist.AddFile(nme, path, lne, txt);
      end;
      AddToolWindow(dfilelist);
      dfilelist.OnOpenFile := OnFileListOpen;
      ShowToolWindow;
    end;
  finally
    fr.Free;
  end;
end;

procedure TfLEdit.SetHighlighter;
begin
  //Set Hightlighter
  memo1.Highlighter := nil;
  //highlight := fopts.GetSyntaxHighlighter(FCurFile);
  if assigned(highlight) then begin
    memo1.Highlighter := highlight;
    //Get Auto Completion
    if length(fopts.GetAutoComplete(highlight)) > 0 then
      SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(highlight));
    //Get Completion Proposal
    fopts.SetCompletePropos(SynCodeProposal, highlight);
  end;
end;

procedure TfLEdit.splitsubwinCanResize(Sender: TObject;
  var NewSize: Integer; var Accept: Boolean);
begin
  Accept := ashowtools.checked;
end;

procedure TfLEdit.OnHideTool(Sender: TObject);
begin
  psubwindow.Tag := psubwindow.Height;
  psubwindow.Height := 2;
  pctools.Enabled := false;
  psubwindow.Enabled := false;
  splitsubwin.Height := 1;
  splitsubwin.Cursor := crArrow;
  ashowtools.Checked := false;
end;

procedure TfLEdit.ShowToolWindow;
begin
  if ashowtools.Checked then exit;
  pctools.Enabled := true;
  psubwindow.Enabled := true;
  memo1.Align := alNone;
  psubwindow.Align := alNone;
  splitsubwin.Align := alNone;
  sbar.Align:= alNone;
  if psubwindow.Tag > 75 then
    psubwindow.Height := psubwindow.Tag
  else
    psubwindow.Height := GetHeightPortion(memo1.Height, 3, 200);
  splitsubwin.Height := 5;
  splitsubwin.Cursor := crVSplit;
  sbar.Align:= alBottom;
  psubwindow.Align := alBottom;
  splitsubwin.Align := alBottom;
  memo1.Align := alClient;
  ashowtools.Checked := true;
end;

procedure TfLEdit.aShowToolsExecute(Sender: TObject);
begin
  if psubwindow.Height = 2 then
    ShowToolWindow
  else
    OnHideTool(sender);
end;

procedure TfLEdit.OnFileListOpen(Filename, Line: String);
var
  stl: string;
  ln: Integer;
begin
  OpenFileMulti(Filename, false);
  gotoline(line);
  memo1.SetFocus;
  //memo1.CaretY := StrToIntDef(line,1);
{  ln := StrToIntDef(line, 1);
  stl := line + '-' + IntToStr(ln+CurLEfile.LineBuffer) ;
  NextMulti(stl);
  memo1.SetFocus;}
end;

procedure TfLEdit.RunEditorCommand(Command: Word);
var
  data: pointer;
begin
  if command <> ecNone then
    memo1.CommandProcessor(command, #0, data);
end;

procedure TfLEdit.aUnIndentExecute(Sender: TObject);
begin
  RunEditorCommand(ecBlockUnindent);
end;

procedure TfLEdit.aUserTBarExecute(Sender: TObject);
begin
  aUserTBar.Checked := not aUserTBar.Checked;
  ATBEdit.Visible := aUserTBar.Checked;
end;

procedure TfLEdit.SelectHighlighter;
var
  hl: TStringlist;
  dlist: TdSelectList;
  found: boolean;
begin
  hl := TStringlist.Create;
  dlist := TdSelectList.Create(self);
  try
    fopts.GetHighlighterList(hl);
    dlist.Title := 'Select Highlighter';
    dlist.LoadList(hl);
    if dlist.ShowModal = mrOk then begin
      //Set Hightlighter
      fopts.SetSyntaxHighlighterByName(CurLEFile, dlist.SelectedText, found);
      //highlight := fopts.GetSyntaxHighlighterByName(dlist.SelectedText);
      if found then begin
        memo1.Highlighter := CurLEFile.HighlightObject;
        alighton.Checked := (memo1.Highlighter <> nil);
        //Get Auto Completion
        if length(fopts.GetAutoComplete(CurLEFile.HighlightObject)) > 0 then
          SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(CurLEFile.HighlightObject));
        //Get Completion Proposal
        fopts.SetCompletePropos(SynCodeProposal, CurLEFile.HighlightObject);
        //SetToolBar
        alighton.Checked := (memo1.Highlighter <> nil);
        Curlefile.HLSet := true;
        Curlefile.HighligherOn := alighton.Checked;
        if alighton.Checked then
          sbar.Panels.Items[2].Text := highlight.LanguageName
        else
          sbar.Panels.Items[2].Text := '';
        CurLEFile.HighlightName := highlight.LanguageName;

        //Ask to add new file ext to highlight list
        if not CurLEfile.IsNewFile then begin
          //CurLEfile.Highlight := CurLEfile.Filename;
        //only ask if files is not a new blank file
          if messagedlg('Do you want to always use this highlighter for this file type?', mtConfirmation, [mbyes, mbno], 0) = mryes then begin
            fopts.AddExtToHighlighter(highlight, extractfileext(CurLEfile.Filename));
            //While this hightlighter will have the ext added, There are far
            //to many highlighters using the same ext's. There needs to be a hard linked
            //list from the file ext to the exact highlighter
            fopts.SaveSetting('HighlighterFiles', extractfileext(CurLEfile.Filename), dlist.SelectedText);
            fopts.SaveOptions;
          end;
        end;
      end;
    end;

  finally
    hl.Free;
    dlist.Free;
  end;
end;

procedure TfLEdit.aSelHighLightExecute(Sender: TObject);
begin
  SelectHighlighter;
end;

procedure TfLEdit.aCustomUserBarExecute(Sender: TObject);
begin
  CustomDlg.Show;
end;

procedure TfLEdit.aViewAsGridExecute(Sender: TObject);
var
  dlg: TdViewGrid;
begin
  //Ask user about delimiter and show grid;
  dlg := TdViewGrid.Create(self);
  try
    if dlg.ShowModal = mrOK then begin
      dTextGrid.HeaderLine := memo1.Lines[0];
      dTextGrid.LoadGrid(memo1.Lines.Text, dlg.Delimiter, dlg.FirstLineColumns);
      dTextGrid.OnGetText := GetText;
      dTextGrid.OnSetCaret := SetCaret;
      dTextGrid.OnChangeText := ChangeText;
      dtextGrid.OnGetDelimitText := GetDelimitText;
      dtextgrid.LEEditor := self;
      AddToolWindow(dtextgrid);
      showtoolwindow;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfLEdit.AddToolWindow(ToolWin: TdStandardTool);
var
  i: integer;
  NewTabSheet: TTabSheet;
  found: boolean;
begin
  found := false;
  for i := 0 to pcTools.PageCount - 1 do
    if pcTools.Pages[i].Caption = Toolwin.Caption then begin
      pcTools.ActivePage := pcTools.Pages[i];
      found := true;
      end;
  if not found then begin
    NewTabSheet := TTabSheet.Create(pctools);
    NewTabSheet.PageControl := pctools;
    NewTabSheet.Caption := toolwin.Caption;
    ToolWin.Parent := NewTabSheet;
    ToolWin.Align := alClient;
    ToolWin.OnCloseQuery := OnCloseTool;
    pcTools.ActivePage := NewTabSheet;
    found := true;
  end;
  if found then ToolWin.Show;
end;

procedure TfLEdit.OnCloseTool(Sender: TObject; var CanClose: Boolean);
begin
  OnHideTool(sender);
  if not application.Terminated then
    CanClose := false;
end;

function TfLEdit.GetText: String;
begin
  result := memo1.Lines.Text;
end;

procedure TfLEdit.SetCaret(X, Y: integer);
begin
  memo1.CaretX := X;
  memo1.CaretY := Y;
  memo1.SetFocus;
end;

procedure TfLEdit.ChangeText(XStart, XEnd, Y: integer; Text: String);
begin
  memo1.CaretX := XStart;
  memo1.CaretY := Y;
  memo1.BlockBegin := BufferCoord(XStart, Y);
  memo1.BlockEnd := BufferCoord(XEnd, Y);
  memo1.SelText := Text;
end;

function TfLEdit.GetDelimitText(XStart, Y: integer; Delimiter: Char): String;
var
  i, Xend, mi: integer;
  lne, field: String;
begin
  memo1.BlockBegin := BufferCoord(XStart, Y);
  lne := memo1.Lines[y-1];
  field := Copy(lne, XStart, length(lne));
  i := Pos(Delimiter, field);
  if i = 0 then
    Xend := High(mi)
  else
    Xend := XStart+(i-1);
  memo1.BlockEnd := BufferCoord(XEnd, Y);
  result := memo1.SelText;
end;

function TfLEdit.GetLinesBufValue: String;
begin
  result := IntToStr(fopts.LineFetch);
end;

//Standard Functions
procedure TfLEdit.anethomeExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.netlegger.net', '', nil, SW_SHOWNORMAL);
end;

procedure TfLEdit.ahelpExecute(Sender: TObject);
var
  hlp, curwrd, pars: String;
begin
  //Use hightlighter help is available
  if assigned(highlight) then begin
      hlp := fopts.GetSetting(highlight.CommonName,'HELPFILE', '');
    curwrd := memo1.SelText;
    if length(curwrd) <= 0 then
      curwrd := memo1.GetWordAtRowCol(memo1.CaretXY);
    if length(hlp) > 0 then begin
      if UpperCase(ExtractFileExt(hlp)) = '.CHM' then begin
        HTMLHelp(GetDesktopWindow, PChar(hlp), HH_DISPLAY_INDEX, DWord(curwrd));
        exit;
      end
      else if UpperCase(ExtractFileExt(hlp)) = '.HLP' then begin
        application.HelpSystem.ShowHelp(curwrd, hlp);
        exit;
      end
      else begin
        //Open Other types
        pars := fopts.GetSetting(highlight.CommonName,'HELPFILEPAR', '');
        pars := StringReplace(pars, '%currentword%', curwrd, [rfIgnoreCase, rfReplaceAll]);
        ExecuteFile(hlp, pars);
      end
    end;
  end;
  ShowHelp(hcHelpTopics);
end;

procedure TfLEdit.ahelpTopicsExecute(Sender: TObject);
begin
    ShowHelp(hcHelpTopics);
end;

procedure TfLEdit.aenterserialExecute(Sender: TObject);
var
  serial: WideString;
  res: Integer;
  dlg: TdlgProcess;
  function GetESellMessage(code: integer): String;
  begin
    case code of
      -2: result := 'Some components are missing from this installation, reinstall and try again.';
      -1: result := 'Unable to connect to the internet, or activation site.';
      -25000: result := 'This activation set is no longer supported.';
      -25001: result := 'Serial number is unknown to this activation.';
      -25003: result := 'The seral number your trying to use has been blacklisted.';
      -25004: result := 'Unable to activate because product was returned.';
      -25005: result := 'Activation failed because the activation limit for this serial number has been reached.';
      -25009: result := 'This serial number is already associated with another order.';
      else
        result := 'Unable error response.';
    end;
  end;
begin
  serial := Inputbox('Enter Serial', 'Serial #', '');
  if length(serial) <= 0 then exit;
  res := esell.ValidateSerialNumber(serial, '', '', '54620');
  if res < 0 then
    ShowMessage('You have entered an invalid serial number, Please try again.')
  else begin
      //Activate Takes time, show wait dialog
      dlg := TdlgProcess.Create(self);
      try
        dlg.ProcessCaption := 'Activating product';
        dlg.UpdateStatus('Connecting to internet for product activation',0,1, true);
        dlg.show;
        res := esell.ActivateSerialNumber('PUB303075819',  'ACT841614530', serial, 1 ); //LE1: ACT018707295
      finally
        dlg.Free;
      end;
      if res = 0 then begin
        SerialNumber := serial;
        ShowMessage('SuccessFully Activated');
      end
      else begin
        if res >= -2 then begin
          if messagedlg('Error ('+IntToStr(res)+'): Occured while attempting to activate LargeEdit internally, Would you like to activate LargeEdit manually using your web browser?', mtConfirmation, [mbyes,mbno], 0) = mrno then exit;
          end
        else if res <= -25000 then begin
          if messagedlg('Error ('+IntToStr(res)+'): ' + GetESellMessage(res) + ', Would you like to activate LargeEdit manually using your web browser?', mtConfirmation, [mbyes,mbno], 0) = mrno then exit;
          end;
        res := esell.ManualActivateSerialNumber('PUB303075819', 'ACT841614530', serial, '', 'If your unable to activate LargeEdit, please contact NetLegger Support for assistance' ); //LE1: 'ACT018707295'
        if res = 0 then begin
          SerialNumber := serial;
          ShowMessage('SuccessFully Activated');
        end
        else
          messagedlg('Error ('+IntToStr(res)+'): Unable to activate LargeEdit, if you need assistance contact NetLegger Support.', mtInformation, [mbok], 0);
      end
    end;
end;

procedure TfLEdit.abuyLEExecute(Sender: TObject);
var
  rescode, i: integer;
begin
  {$ifdef TUCOWS}
  //New Esellerage Engine 3.5
{      rescode := esell.Purchase(
        'PUB303075819',
        'ES4115211849', //LE1: 'ES3163410866',
        '',//'PC3163410866-5257',
        'http://www.netlegger.net/support.asp',
        '',
        '',
        0,
        '',
        ???'PTL077700015',
        'ACT841614530', // LE1: 'ACT018707295',
        ''
      );}
  {$ELSE}
      rescode := esell.Purchase(
        'PUB303075819',
        'ES4115211849', //LE1: 'ES3163410866',
        '', //'PC3163410866-5257',
        'http://www.netlegger.net/support.asp',
        '',
        '',
        0,
        '',
        '',
        '',
        'ACT841614530', // LE1: 'ACT018707295',
        ''
      );
  {$ENDIF}

  if rescode <> 0 then
    messagedlg('Error('+IntToStr(Rescode)+') occured while trying to purchase LargeEdit, Please try again.',mtError, [mbok], 0)
  else begin
    if esell.GetSerialNumberCount > 0 then
      Showmessage('Thank you for purchasing LargeEdit.');
    for i := 1 to esell.GetSerialNumberCount  do begin
       SerialNumber := esell.GetSerialNumber(i);
    end;
  end;
end;

function TfLEdit.ValidSerial: boolean;
var
  res: integer;
begin
  res := esell.ValidateSerialNumber(SerialNumber, '', '', '54620');
  if res < 0 then
    result := false
  else
    result := true;
end;


procedure TfLEdit.anetsupportExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.netlegger.net/support.asp', '', nil, SW_SHOWNORMAL);
end;

procedure TfLEdit.aupdatesExecute(Sender: TObject);
begin
{ TODO 4 : Add Esellerate Check for updates procedure }
  esell.CheckForUpdate(
        'PUB303075819',
        'ES4115211849', //LE1: 'ES3163410866',
        '',//'PC3163410866-5257',
        'http://www.netlegger.net/support.asp',
        '',
        '',
        0,
        '',
        '',
        '',
        'ACT841614530', // LE1: 'ACT018707295'
        '');
//  ShellExecute(0, 'open', 'http://www.netlegger.net/updates.asp', '', nil, SW_SHOWNORMAL);
end;

procedure TfLEdit.aonlinehelpExecute(Sender: TObject);
begin
  ShellExecute(0, 'open', 'http://www.netlegger.net/help/le/frames.html', '', nil, SW_SHOWNORMAL);
end;

procedure TfLEdit.atutorialsExecute(Sender: TObject);
begin
  ShowHelp(hctutorials);
end;

function TfLEdit.GetSerial: String;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey(kAPP, true);
    if reg.ValueExists(rvserial) then
      result := reg.ReadString(rvserial)
    else
      result := '';
//I didn't do this after because is uses an expiration date calulated from
//generation date, So if you encode a serial number, all copies will
//expire at a set date (ie: Dec 31, 2003)
//    else
//      result := TrialSerialNumber;
  finally
    reg.Free;
  end;
end;

procedure TfLEdit.SetSerial(const Value: String);
var
  reg: TRegistry;
begin
      reg := TRegistry.Create;
      try
        reg.RootKey := HKEY_CURRENT_USER;
        reg.OpenKey(kAPP, true);
        reg.WriteString(rvserial, value );
      finally
        reg.Free;
      end;
end;

procedure TfLEdit.BuyApp;
begin
  abuyLEExecute(nil);
end;

procedure TfLEdit.EnterSerial;
begin
  aenterserialExecute(nil);
end;

procedure TfLEdit.AddEditsToMenu;
var
  i, x : integer;
  des, dis: String;
  item: TMenuItem;
begin
  for i := 0 to fopts.KeyStrokes.Count -1 do begin
    if not (ValueInArray(edtCmds, fopts.KeyStrokes[i].Command) ) then continue; 
    dis := fopts.KeyStrokes[i].DisplayName;
    des := ShortCutToText(fopts.KeyStrokes[i].ShortCut);
    dis := Copy(dis,3,length(dis));
    x := pos('-', dis);
    dis := Copy(dis,1,x-1);
    item := TMenuItem.Create(mainMenu1);
    item.Caption := dis + ' (' +des+ ')';
    item.Tag := fopts.KeyStrokes[i].Command;
    item.OnClick := OnExecuteEdit;
    edit1.Add(item);
  end;
end;

procedure TfLEdit.OnExecuteEdit(Sender: TObject);
begin
  if sender is TComponent then begin
    with sender as TComponent do begin
      if tag < 0 then exit;
      RunEditorCommand(tag);
    end;
  end;
end;

procedure TfLEdit.auppercaseExecute(Sender: TObject);
begin
  //Uppercase Selection for if not selection uppercase all
  if length(memo1.SelText) > 0 then
    memo1.SelText := uppercase(memo1.SelText)
  else
    memo1.Text := uppercase(memo1.Text);
end;

procedure TfLEdit.alowercaseExecute(Sender: TObject);
begin
  //Lowercase Selection for if not selection lowercase all
  if length(memo1.SelText) > 0 then
    memo1.SelText := lowercase(memo1.SelText)
  else
    memo1.Text := lowercase(memo1.Text);
end;

procedure TfLEdit.aAsciiCodeExecute(Sender: TObject);
var
  txt : string;
begin
  if inputquery('Insert ASCII Code as Charactor', 'Enter ASCII Code', txt ) then begin
    if StrToIntDef(txt, -1000) = -1000 then begin messagedlg('Please enter a valid integer value.', mtError, [mbok], 0); exit; end;
    memo1.SelText := chr(StrToIntDef(txt, 0));
    end;
end;

procedure TfLEdit.aASCIIvalueExecute(Sender: TObject);
var
  txt : string;
begin
  if length(memo1.SelText) = 1 then begin
      inputbox('ASCII code value', 'ASCII code for ' + memo1.SelText + ' is', IntToStr(ord(memo1.SelText[1])) );
    end
  else begin
    if Inputquery('Get ASCII code for charactor', 'Enter Charactor', txt) then
      inputbox('ASCII code value', 'ASCII code for ' + txt + ' is', IntToStr(ord(txt[1])) );
    end;
end;

procedure TfLEdit.aNumCountExecute(Sender: TObject);
var
  txt: String;
  i: integer;
  s,e: integer;
begin
  txt := '0-10';
  s := 0;
  e := 10;
  if inputquery('Insert Numeric Count','Enter Number Range', txt) then begin
    if length(txt) <= 0 then exit;
    i := pos('-', txt);
    if i = 0 then
      messagedlg('Range not found, starting at 0', mtinformation, [mbok], 0)
    else begin
      s := StrToIntDef(Copy(txt,1,i-1), 0);
      e := StrToIntDef(Copy(txt,i+1,length(txt)), 10);
      if s > e then
        for i := s downto e do begin
          memo1.SelText := IntToStr(i);// + #$D#$A
          memo1.CaretX := memo1.CaretX - length(IntToStr(i));
          memo1.CaretY := memo1.CaretY + 1;
          end
      else
        for i := s to e do begin
          memo1.SelText := IntToStr(i); // + #$D#$A;
          memo1.CaretX := memo1.CaretX - length(IntToStr(i));
          memo1.CaretY := memo1.CaretY + 1;
          end;
    end;
  end;
end;

procedure TfLEdit.aViewASCIICodesExecute(Sender: TObject);
var
  flenme: String;
begin
  //View ASCII Code Chart
  flenme := AppPath + scASCIIChart;
  ViewCodes( 'ASCII Codes', ' ' , flenme );
end;

function TfLEdit.ViewCodes(Name, Del, Filename: String): boolean;
var
  codes: TStringList;
  dcodes: TdCodeViewer;
begin
  //View Code table
  codes := TStringList.Create;
  try
    codes.LoadFromFile(filename);
    dcodes := TdCodeViewer(FindFormwCapClass(self, Name, TdCodeViewer));
    if not assigned(dcodes) then begin
      dcodes := TdCodeViewer.Create(self);
      dcodes.OnSetText := SetText;
      dcodes.Caption := Name;
      end;
    dcodes.Caption := Name;
    dcodes.LoadGrid(codes.Text, Del[1], true);
    AddToolWindow(dcodes);
    showtoolwindow;
  finally
    codes.Free;
  end;
end;

procedure TfLEdit.SetText(Text: String);
begin
  memo1.SelText := Text;
  memo1.SetFocus;
  memo1.EnsureCursorPosVisible;
end;

procedure TfLEdit.aGetCharforCodeExecute(Sender: TObject);
var
  txt : string;
begin
  if (length(memo1.SelText) >= 1) and (StrToIntDef(memo1.SelText, -1000) <> -1000) then begin
    inputbox('ASCII Charactor value', 'ASCII charactor for ' + memo1.SelText + ' is', chr(StrToIntDef(memo1.SelText, 0)) );
    end
  else begin
    if Inputquery('Get ASCII charactor for code', 'Enter Code', txt) then
      inputbox('ASCII Charactor value', 'ASCII charactor for ' + txt + ' is', chr(StrToIntDef(txt, 0)) );
    end;
end;

procedure TfLEdit.aSymNameExecute(Sender: TObject);
var
  flenme: String;
begin
  //View Symbol Names Chart
  flenme := AppPath + scSymbolChart;
  ViewCodes( 'Symbol Names', ',', flenme );
end;

procedure TfLEdit.aviewHTMLcodesExecute(Sender: TObject);
var
  flenme: String;
begin
  //View HTML Code Chart
  flenme := AppPath + scHTMLChart;
  ViewCodes( 'HTML Codes', '', flenme );
end;

procedure TfLEdit.arunfileExecute(Sender: TObject);
var
  tmdir, tfle, exef, exep, ecmd: String;
  getrs: boolean;
begin
  getrs := false;
  //tfle := ExtractFilePath(FCurFile) + '~' + ExtractFilename(FCurFile);
  if not savecheck(false) then exit;
  //memo1.Lines.SaveToFile(tfle);
  tfle := FCurfile;
  ecmd := tfle;
  exep := '';

  //Use hightlighter help is available
  if assigned(highlight) then begin
    ecmd := fopts.GetSetting(highlight.CommonName,'EXEFILE', '');
    exep := fopts.GetSetting(highlight.CommonName,'EXEFILEPAR', '');
    getrs := fopts.getSetting(highlight.CommonName, 'EXEFILEDOS', false);
    exep := StringReplace(exep, '%1', tfle, [rfIgnoreCase, rfReplaceAll]);
  end;
  if length(ecmd) <= 0 then
    ecmd := tfle;

  if getrs then begin
    //show result window
    RunDosInMemo(ecmd + ' ' + exep ,dResultTool.ResultMemo);
    AddToolWindow(dResultTool);
    ShowToolWindow;
    end
  else begin
    ExecuteFile(ecmd, exep);
  end

//  tmdir := GetTempDir;
//  tfle := GetTemporaryFileName(tmdir, 'LGTF');
//  tfle := GetTmpPathFileName(ExtractFilePath(FCurFile), FCurFile);
  //I didn't use temporary paths and filenames because I wanted the
  //behavior to be more like Homesite, and I wanted to override the
  //temp file after
end;

function TfLEdit.GetTmpPathFileName(Path, Filename: String): String;
var
  fn, newfn: string;
  i: integer;
begin
  fn := ExtractFileName(Filename);
  newfn := Path + '~' + fn;
  i := 0;
  while FileExists(newfn) do begin
    newfn := Path + '~' + IntToStr(i) + fn;
    i := i + 1;
    end;
  result := newfn;
end;

function TfLEdit.OpenCurFileAsBin(Edit: Boolean): boolean;
var
  msg: array of Char;
  aWord: Word;
  smsg: String;
  msize, i: integer;
  xtxt: String;
begin
  DebugLog('OpenCurFileAsBin Edit='+BoolToStr(Edit, true));
  if FCurOpen then CloseFile(txt);
  if FileExists(FCurFile) then begin
    AssignFile(bifile, FCurFile);
    {$I-}
    FileMode := fmOpenRead;
    Reset(bifile);
    FileMode := fmOpenReadWrite;
    {$I+}
    if IOResult <> 0 then begin
      result := false;
      FCurFile := '';
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
      MessageDlg(smsg, mtError, [mbOK], 0);
      SetLength(msg, 0);
      OpenNew;
      exit;
    end;
    FileMode := fmOpenReadWrite;
    EndOfFile := eof(bifile);
    FCurOpen := true;
  end;
  totalline := 0;
  if Edit then begin
    FTempFile := GetTmpFileName(FCurFile);
    if FTempOpen then CloseFile(outf);
    AssignFile(outf, FTempFile);
    Rewrite(outf);
    FTempOpen := true;
  end;
  editmode := Edit;
  if (editmode) and (not(FNewFile)) then begin FSaveFile := FCurFile; IsSaved := true; end;
  changes := false;
  DebugLog('OpenCurFileAsBin Finish');

  xtxt := '';
  while not Eof(bifile) do
  begin
    Read(bifile, aWord);
    xtxt := xtxt + IntToStr(aWord)
  end;
  memo1.Lines.text := xtxt;

  //Add to recentDoc list
  UpdateRecentDocs;
  result := true;
end;

procedure TfLEdit.aOpenHexExecute(Sender: TObject);
begin
  //Switch to Hex Editor
  //aHexModeExecute(sender);
  //fHexEdit.ShowOpenHex;
  ashowhexExecute(nil);
  pviewer.Width := Round(peditor.Width /3) * 2;
  fHexEdit.ShowOpenHex;
end;

//**********************OLD OPEN BINARY PROCEDURE ***************
{var
  isSmall: Boolean;
  i: integer;
  filename: String;
begin
  if editmode then begin
    if not SaveCheck(false) then exit;
  end;
  if od.Execute then begin
    filename := od.filename;
    DebugLog('OpenFile Filename='+filename);
    if Not Fileexists(filename) then begin
      MessageDlg('File could not be found', mtError, [mbOk], 0);
      exit;
    end;
    if not SaveCheck(false) then exit;
    CloseCurFile(false);
    memo1.Lines.Clear;
    CleanUpTempFile;
    FCurFile := filename;
    FNewFile := false;
    memo1.Gutter.StartValue := 0;
    SetHighlighter;
    //Check for Small File
    isSmall := fopts.IsSmallFile(FCurFile);
  //  if isSmall then begin
  //    if not OpenCurFileAsBin(fopts.EditSmallFile) then exit;
  ///    end
  //  else begin
      if not OpenCurFileAsBin(true) then exit;
  //  end;
//    next( GetNextLines, false);
    updateposition;
    //*********
    DebugLog('OpenFile Finish');
  end;
end;}
//*************************************************************

procedure TfLEdit.aHtmlColorsExecute(Sender: TObject);
begin
  // show hex color dialog
  if not assigned(dHexColor) then
    dHexColor := TdHexColor.Create(self);
  if dHexColor.ShowModal = mrok then
    memo1.SelText := dHexColor.HexColor;
end;

procedure TfLEdit.aCalendarExecute(Sender: TObject);
begin
  // show calendar dialog
  if not assigned(dMonCal) then
    dMonCal := TdMonCal.Create(self);
  if dMoncal.ShowModal = mrOk then
    memo1.SelText := FormatDateTime('DDDD, MMM DD, YYYY', dmoncal.SelectedDate );
end;

procedure TfLEdit.aRepositExecute(Sender: TObject);
var
  stop,sleft: integer;
begin
  sTop := top + height - fSQLCata.Height;
  sleft := left + width - fSQLCata.Width;
  fSQLCata.Top := stop - 20;
  fSQLCata.Left := sleft - 5;
  fSQLCata.OnSetText := SetText;
  fSQLCata.OnGetText := GetSelText;
  fSQLCata.TagReplace := fopts.TagReplaceCodeRep;
  fSQLCata.BaseDIR := fopts.RepositoryDir;
  fSQLCata.Show;
end;

function TfLEdit.GetSelText: String;
begin
  result := memo1.SelText;
end;

procedure TfLEdit.aFindNextExecute(Sender: TObject);
begin
  try
    busy;
    DoSearchReplaceText(FALSE, gbSearchBackwards);
  finally
    notbusy;
  end;
  //OLD CODE
  //fdFind(sender);
end;

procedure TfLEdit.aFtpSaveAsExecute(Sender: TObject);
var
  fdlg: TdFTPso;
begin
  fdlg := TdFTPso.Create(self);
  try
    fdlg.Filename := FCurFile;
    if fdlg.Execute(fdtSave) then begin
      CurLEfile.IsRemoteFileOpen := true;
      CurLEfile.RemoteFile.Host := fdlg.Host;
      CurLEfile.RemoteFile.Port := fdlg.Port;
      CurLEfile.RemoteFile.User := fdlg.User;
      CurLEfile.RemoteFile.Pass := fdlg.Pass;
      CurLEfile.RemoteFile.RemoteDir := fdlg.RemoteDir;
      CurLEfile.RemoteFile.RemoteFile := fdlg.RemoteFile;
    end;
  finally
    fdlg.Free;
  end;
end;

procedure TfLEdit.aftpOpenExecute(Sender: TObject);
var
  fdlg: TdFTPso;
begin
  fdlg := TdFTPso.Create(self);
  try
    if fdlg.Execute(fdtOpen) then begin
      if messagedlg('Do you wish to open the file?', mtConfirmation, [mbYes, mbNO], 0) = mrYes then begin
        OpenFileMulti(fdlg.Filename, true);
        //Set After Open local because open local set Remote to false;
        CurLEfile.IsRemoteFileOpen := true;
        CurLEfile.RemoteFile.Host := fdlg.Host;
        CurLEfile.RemoteFile.Port := fdlg.Port;
        CurLEfile.RemoteFile.User := fdlg.User;
        CurLEfile.RemoteFile.Pass := fdlg.Pass;
        CurLEfile.RemoteFile.RemoteDir := fdlg.RemoteDir;
        CurLEfile.RemoteFile.RemoteFile := fdlg.RemoteFile;
        end;
      end;
  finally
    fdlg.Free;
  end;
end;

procedure TfLEdit.aFTPSaveExecute(Sender: TObject);
var
  fdlg: TdFTPso;
  msg: String;
begin
  FTPSaveCurrent;
  exit;
  if not IsRemoteFileOpen then begin
    messageDlg('This file wasn''t opened remotely, please use save as first.', mtinformation, [mbok], 0);
    exit;
    end;
  //Save File
  fdlg := TdFTPso.Create(self);
  try
    msg := Format('Are you sure you wish to save the current file to the following location? '#$D#$A'  Host: %s'#$D#$A'  Dir: %s'#$D#$A'  File: %s', [FHost, FRemoteDir, FRemoteFile]);
    if messagedlg(msg, mtConfirmation, [mbYes, mbNO], 0) = mrYes then begin
      SaveMulti(true, false, false);
      CurLEfile.IsRemoteFileOpen := true;
      fdlg.Filename := CurLEfile.Filename;
      fdlg.Host := CurLEfile.RemoteFile.Host;
      fdlg.Port := CurLEfile.RemoteFile.Port;
      fdlg.User := CurLEfile.RemoteFile.User;
      fdlg.Pass := CurLEfile.RemoteFile.Pass;
      fdlg.RemoteDir := CurLEfile.RemoteFile.RemoteDir;
      fdlg.RemoteFile := CurLEfile.RemoteFile.RemoteFile;
      fdlg.SendFile;
      end;
  finally
    fdlg.Free;
  end;
end;


procedure TfLEdit.aHexModeExecute(Sender: TObject);
var
  cfile: string;
  nfle: boolean;
begin
  //ShowHexHideText
  nfle := CurLEfile.IsNewFile;
  cfile := CurLEFile.Filename;
  SaveCheckMulti(true);
//  OpenNewMulti;
  fhexedit.Width := Width;
  fhexedit.Height := Height;
  fhexedit.Top := top;
  fhexedit.Left := left;
  fhexedit.WindowState := WindowState;
  fHexEdit.Show;
  if not nfle then
    fHexEdit.OpenHexFile(cfile, false);
  hide;
end;

procedure TfLEdit.InitApp( Sender: TObject );
var
  pt: TFileProcessType;
  ex: String;
  seres: integer;
  stdate: TDateTime;
begin
  IsInitialized := true;
  //Check Serial Number
  shownag := false;

//  stdate := EncodeDate(2000,1,1);
  seres := esell.ValidateSerialNumber(SerialNumber, '', '', '54620');
  if seres < 0 then shownag := true;

  //See comment in GetSerial function
{  if ((stdate+seres) <= now) and (SerialNumber = TrialSerialNumber) then begin
    // Trial has ran out;
    MessageDlg('Your trail version has expired.', mtInformation, [mbOk], 0);
    dlgNag.ShowModal;
    application.Terminate;
    shownag := true;
  end;}

  if not shownag then begin
    seres := esell.ValidateActivation('PUB303075819', 'ACT841614530', SerialNumber ); // LE1: ACT018707295
    if seres <> 0 then
      shownag := true
    else
      registered := true;
  end;

  if shownag then begin
    if not dlgnag.IsTrialValid then
      if dlgNag.ShowModal <> mrOK then begin application.Terminate; exit; end;
  end;

  if not(registered) and not(dlgnag.IsTrialValid) then begin application.Terminate; exit; end;
  //***************


  AddRecentDocsToMenu;
  AddRecentProjectsToMenu;
  AddEditsToMenu;
  AddHelpDocsToMenu;

  hideprojectwindow;

  if fileexists(AppPath+'usrtxact.atb') then
    actionmanager.LoadFromFile(AppPath+'usrtxact.atb');
  ATBEdit.Visible := fopts.GetSetting(Name, ATBEdit.Name, ATBEdit.Visible);
  aUserTBar.Checked := ATBEdit.Visible;
  ATBMacro.Visible := fopts.GetSetting(Name, ATBMacro.Name, ATBMacro.Visible);
  aShowMacro.Checked := ATBMacro.Visible;

  fopts.SetEditorOptions(memo1);

  //Toolbar Initilize
  LoadToolBars; //Load a seperate instance of NSToolbars for app
  DisplayToolBars;


  //Handle File Parameter Passing
  if length(GetFilePar) > 0 then begin
    pt := GetFileProcessType;
    Debuglog(GetCommandLine);
    if pt = fptDebug then begin
      FDebugLogOn := true;
      aFileNewExecute(sender);
    end
    else if (pt = fptNothing) then begin
      if not(OpenFileMulti(GetFilePar, false, true)) then  //if not OpenFile(GetFilePar) then
        aFileNewExecute(sender);
      end
    else if pt = fptEdit then begin
      if not OpenFileMulti(GetFilePar, true, true) then //if not OpenFile(GetFilePar, true) then
        aFileNewExecute(sender);
      end
    else if pt = fptPrint then begin
      //Print
      OpenFileMulti(GetFilePar); //self.OpenFile(GetFilePar);
      JustPrint;
      Close;
      end
    else if pt = fptAssociation then begin
        ex := ExtractFileExt(GetFilePar);
        DebugLog('Creating File Association ' + ex);
        if length(ex) > 0 then
          fopts.CreateFileAssociations(ex);
        if not OpenFileMulti(GetFilePar, false, true) then //if not OpenFile(GetFilePar) then
          aFileNewExecute(sender);
      end;
    end
  else
    aFileNewExecute(sender);
  //**********************************

//  if fopts.GetSetting(Name, ATBEdit.Name, ATBEdit.Visible) then
//    aUserTBar.Execute;

//  if fopts.GetSetting(Name, ATBMacro.Name, ATBMacro.Visible) then
//    aShowMacro.Execute;

//  if fopts.GetSetting(Name, pRuler.Name, pRuler.Visible) then
//    aShowRuler.Execute;

  od.Filter := od.Filter + fopts.GetExtraFileFilters;
  sd.Filter := sd.Filter + fopts.GetExtraFileFilters;
  updateposition;
end;

procedure TfLEdit.FormShow(Sender: TObject);
begin
  if not IsInitialized then InitApp(Sender);
  LoadPlugins;
end;

procedure TfLEdit.CheckForUpdates;
begin
  aupdatesExecute(nil);
end;

procedure TfLEdit.PlayFinished;
begin
  aplaymac.Enabled := true;
end;

procedure TfLEdit.aOpenMacExecute(Sender: TObject);
begin
  //Open
  if odwinmac.Execute then begin
    FMacFile := odwinmac.filename;
    IsMacSaved := true;
  end;
end;

procedure TfLEdit.aNextLongExecute(Sender: TObject);
var
  i, totallen, StartPos, ToEnd, FoundAt: integer;
  s: String;
begin
  Screen.Cursor := crHourGlass;
//  LastLLSearch := StrToIntDef(Inputbox('Search for a line longer then', 'Line Length', '0'), 0);
  totallen := 0;
  if length(memo1.SelText) > 0 then
    memo1.CaretY := memo1.CaretY + 1; 
  for i := memo1.CaretY - 1 to memo1.Lines.Count - 1 do begin
    s := memo1.Lines[i];
    if length(s) > LastLLSearch then begin
        Memo1.SetFocus;
        memo1.CaretY := i + 1;
        memo1.CaretX := 1;
        memo1.BlockBegin := memo1.CaretXY;
        memo1.CaretX := LastLLSearch;
        memo1.BlockEnd := memo1.CaretXY;
        break;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TfLEdit.aLineRangeExecute(Sender: TObject);
var
  ln: String;
  i: integer;
begin
  ln := inputbox('Line Range','Enter line range', '1500-2000');
  if length(ln) <= 0 then exit;
  i := Pos('-', ln);
  if i = 0 then
    Showmessage('Please enter a valid line range')
  else begin
    next(ln);
    memo1.SetFocus;
    end;
end;

procedure TfLEdit.anewwindowExecute(Sender: TObject);
begin
  executefile(application.ExeName, '');
end;

function TfLEdit.AppOnHelp(Command: Word; Data: Integer;
  var CallHelp: Boolean): Boolean;
begin
//  if (Command > 0) and (Command <= 27) then
//    ShowHelp( hlpfiles[ Command ] );
end;

procedure TfLEdit.OnClickHelpDoc(Sender: TObject);
var
  fnme, path: String;
  i: integer;
begin
  if Sender is TMenuItem then begin
    with Sender as TMenuItem do begin
      fnme := Caption;
      i := maddhelp.IndexOf(Sender as TMenuItem);
      path := fopts.GetHelpDir(i);
      ExecuteFile(path, '');
    end; // with
  end; //If
end;

function TfLEdit.ReadFileLine(var stline: String): boolean;
begin

end;

procedure TfLEdit.aXpathExecute(Sender: TObject);
begin
  ShowXPathSearch;
end;

procedure TfLEdit.ShowXPathSearch;
begin
  if not(assigned(xpathdlg)) then
    xpathdlg := TfrmLargeTEXT.Create(self);
  xpathdlg.Title := 'Enter XPath Expression';
  xpathdlg.Text := '';
  xpathdlg.OnClickOK := self.OnXPathSearch;
  xpathdlg.Show
end;

function TfLEdit.RunXPathSearch(Document, Search: String): String;
var
  xdoc: Variant;
  xnode: variant;
begin
  result := '';
  try
    xdoc := CreateOleObject('MSXML2.DOMDocument');
  except
    Showmessage('Error: Microsoft XML Parser is not installed');
    exit;
  end;
  try
    if not xdoc.load(document) then begin
      Showmessage('Could not parse document. Reason: ' + xdoc.parseError.reason);
    end
  except
    Showmessage('Error: Unable to load document, may not a valid XML document');
    exit;
  end;
  try
    xnode := xdoc.selectsinglenode(search);
    if vartype(xnode) = varEmpty then begin
      Showmessage('The XPath expression did not return a node');
      end
    else begin
        result := xnode.xml;
      end;
  except
    Showmessage('Error: Unable to select node');
    exit;
  end;
end;

procedure TfLEdit.OnXPathSearch(sender: TObject);
var
  str: string;
begin
  if sender is TfrmLargeTEXT then begin
    with sender as TfrmLargeTEXT do begin
      if not savecheck(false) then exit;
      str := Text;
      str := RunXPathSearch(CurLEfile.Filename, str);
      if length(str) > 0 then
        dResultTool.ResultMemo.Lines.Add(str);
        AddToolWindow(dResultTool);
        ShowToolWindow;
        //Text := Text + Chr(13) + Chr(10) + str;
    end;
  end;
end;

procedure TfLEdit.aDelDupExecute(Sender: TObject);
var
  tmplist, sellist: TStringList;
  i: integer;
begin
  //Duplicate Delete
//  if sdout.Execute then
//    RemoveDuplicates(sdout.FileName);
  tmplist := TStringList.Create;
  sellist := TStringList.Create;
  try
    if length(memo1.SelText) > 0 then
      sellist.Text := memo1.SelText
    else
      sellist.Text := memo1.Text;
    tmplist.Sorted := true;
    tmplist.Duplicates := dupIgnore;
    for i := 0 to sellist.Count - 1 do
      tmplist.Add(sellist[i]);

    if length(memo1.SelText) <= 0 then memo1.Lines.Clear;
    { TODO 1 -oDev -cExtras : Kill the last hard return, line freed in the text var }
    //tmplist.Text
    memo1.SelText := tmplist.Text;
  finally
    tmplist.free;
    sellist.Free;
  end;
end;

procedure TfLEdit.aMacReposExecute(Sender: TObject);
var
  stop,sleft: integer;
begin
  //Macro Catalog
  sTop := top + height - fMacCat.Height;
  sleft := left + width - fMacCat.Width;
  fMacCat.Top := stop - 20;
  fMacCat.Left := sleft - 5;
  fMacCat.OnGetMacro := GetCurrentMacro;
  fMacCat.OnPlayMacro := PlayKeyMacro;
  fMacCat.OnPlayManyMacro := PlayManyKeyMacro;
  fMacCat.OnOpenMacro := OpenKeyMacro;
  fMacCat.Show;
end;

function TfLEdit.GetCurrentMacro: TObject;
begin
  if aPlayMac.Enabled then
    result := TObject(symac)
  else
    result := nil;
end;

procedure TfLEdit.OpenKeyMacro(filename: String);
begin
  if FileExists(filename) then begin
    symac.LoadFromFile(filename);
  end;
  aKMPlay.Enabled := true;
  aKMPlayPerLine.Enabled := true;
end;

procedure TfLEdit.PlayKeyMacro(filename: String);
begin
  OpenKeyMacro(filename);
  aKMPlayExecute(nil);
end;

procedure TfLEdit.PlayManyKeyMacro(filename: String);
begin
  OpenKeyMacro(filename);
  aKMPlayPerLineExecute(nil);
end;

function TfLEdit.aSearch(const Text: String): Integer;
var
  syopt: TSynSearchOptions;
begin
  //ssoMatchCase, ssoWholeWord, ssoBackwards, ssoEntireScope,
  //ssoSelectedOnly, ssoReplace, ssoReplaceAll, ssoPrompt
  result := 0;
  fd.FindText := Text;
  syopt := [ssoSelectedOnly];
  if not (frDown in fd.Options) then begin
    syopt := syopt + [ssoBackwards];
    memo1.BlockEnd := memo1.BlockBegin;
    memo1.CaretXY := memo1.BlockBegin;
  end
  else
    memo1.BlockBegin := memo1.BlockEnd;

  if frMatchCase in fd.Options then
    syopt := syopt + [ssoMatchCase];
  if frWholeWord in fd.Options then
    syopt := syopt + [ssoWholeWord];
  if memo1.SearchReplace(fd.FindText,'',syopt) <= 0 then begin
    if FCurOpen then begin
      Next(GetLinesBufValue);
      if EndOfFile then exit;
      fdFind(nil);
    end;
  end
  else result := 1;
  memo1.CaretXY := memo1.BlockEnd;
end;

procedure TfLEdit.aprojectwinExecute(Sender: TObject);
begin
  aexplorewin.Checked := false;
  if (pproject.Enabled) and (pproject.Tag = 1 ) then begin
    hideprojectwindow;
    exit;
  end;
  showprojectwindow;
end;

procedure TfLEdit.hideprojectwindow;
begin
  pproject.Width := 1;
  pproject.Enabled := false;
  spltproj.Enabled := false;
  aprojectwin.Checked := false;
end;

function TfLEdit.OpenFileMulti(filename: string; edit: boolean; checkprojfile: boolean ): boolean;
begin
  try
    Busy;
    DebugLog('Set Current Tab is file is already open');
    if assigned(CurLEfile) then begin
      SaveCursorPos;
      SaveCurrentMemo;
    end;
    if SetCurrentTab(filename) then begin
      //Same action as a tab change is already open
      SetCurrentMemo;
      SetCurrentHL;
      SetCursorPos;
      UpdateIcons;
      //Plug Notify
      OnPLNotify(peTabChange);
      exit;
    end;

    //if this file is a largeedit project group, then open in project group editor
    if IsFileProjectGroup(filename) then begin
      if OpenProjectGroup(filename) then exit; //Group open, close application
    end;


    if assigned(CurLEFile) then begin
      if not CurLEFile.IsChanged and CurLEFile.IsNewFile then begin
        DebugLog('Close unchange new file to open file');
        CloseCurrentMulti;
      end;
    end;

    CurLEFile := fLEfiles.AddFile( filename );

    //Check for Small File
    isSmall := fopts.IsSmallFile(filename);
    CurLeFile.IsSmall := isSmall;
    if isSmall then begin
      DebugLog('OpenFileAsSmall editmode = ' + BoolToStr(fopts.EditSmallFile));
      if not CurLEFile.OpenCurFile(fopts.EditSmallFile) then exit;
      end
    else begin
      DebugLog('OpenFileAsLargge editmode = ' + BoolToStr(edit));
      if not CurLEFile.OpenCurFile(edit) then exit;
    end;

    CurLEFile.LineBuffer := StrToInt(GetNextLines());
    { TODO 4 -oMain -cBasic : Add Lines Param, using sizelimit from IsSmallFile or check other procedure }
    CurLEFile.Next(GetNextLines, false);

    Debuglog('Set Current Highlighter');
    SetCurrentHL;
    CurLEfile.HLChecked := true;
    //Add to recentDoc list
    UpdateRecentDocs;
    SetCurTitle;

    RefreshTabs;
    DebugLog('Set Current Tab');
    SetCurrentTab(filename);
    CheckAutoOptions;
    DisplayCurrent;

    //Plugin notify
    OnPLNotify(peOpen);
  finally
    NotBusy;
  end;
  result := true;
end;

procedure TfLEdit.OpenNewMulti;
begin
  { TODO 4 -oMain -cDev :
Add Dialog to ask highlight and complete on new files or have
option under file to select highlight and complete }
  try
    Busy;
    memo1.Highlighter := nil;
    memo1.Gutter.StartValue := 0;
    SynAutoComplete.AutoCompleteList.Clear;
    SynCodeProposal.Tag := 0;
    SynCodeProposal.InsertList.Clear;
    SynCodeProposal.ItemList.Clear;

    CurLEFile := fLEFiles.AddNew;
    CurLEFile.TempFolder := AppPath;// + 'temp\'; //This was set earlier on LEFiles object
    CurLEFile.LineBuffer := StrToInt(GetNextLines());
    CurLeFile.WordWrap := true;
    RefreshTabs;

    SetCurrentHL;

    updateposition;
    tabsfile.TabIndex := fLEFiles.Count-1;
    DisplayCurrent;

    //Plug Notify
    OnPLNotify( peOpen );
  finally
    NotBusy;
  end
end;

function TfLEdit.SaveMulti(Reopen: Boolean; SaveAs: Boolean; RemoteCheck: boolean): boolean;
var
  newf: String;
  x, y: integer;
  attra: word;
  copied: boolean;
begin
  result := false;
  if (RemoteCheck) and (CurLEFile.IsRemoteFileOpen) then begin
    if messageDlg('This file was opened remotely, would you like to save it remotely?', mtconfirmation, [mbyes, mbno], 0) = mryes then begin
      FTPSaveCurrent;
      exit;
      end;
    end;

  DebugLog('Savefile Reopen='+BoolToStr(Reopen, true));
  //Copy Edit file to location and delete temp
  //if length(CurLEFile.Filename) <= 0 then begin MessageDlg('You must open a file in edit mode first?', mtError, [mbOK], 0); exit; end;
  if not CurLEFile.Editmode then begin
    MessageDlg('The file must be opened in edit mode first?', mtInformation, [mbOK], 0);
    exit;
  end;

  if (length(CurLEFile.SaveFilename) > 0) and not(SaveAs) and not(CurLEFile.IsNewFile) then
    newf := CurLEFile.SaveFilename
  else begin
    sd.FileName := ExtractFileName(CurLEFile.SaveFilename);
    sd.InitialDir := ExtractFilePath(CurLEFile.SaveFilename);
    if not sd.Execute then exit;
    newf := sd.filename;
    end;

  //Check to see if file is read only before you close the file
  //is can't save then user can save as
  if FileExists(newf) and FileIsReadOnly(newf) then begin
    if MessageDlg('The file your trying to save is marked read only, would you like to remove read only marker and save?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
      exit;
    attra := FileGetAttr(newf);
    FileSetAttr(newf, attra - faReadOnly);
    if FileIsReadOnly(newf) then begin
      MessageDlg('Unable to remove read only marking', mtError, [mbOK], 0);
      exit;
      end;
  end;

  SaveCursorPos;
  UpdateCurrentFile;
  try
    Busy;
    CurLEFile.SaveFile(newf, reopen);
    Changes := CurLEfile.IsChanged;
  finally
    NotBusy;
  end;

  RefreshTabs;
  SetCurrentTab(newf);
  if not CurLEFile.IsSmall then SetCurrentMemo;
  SetCurrentHL;
  SetCurTitle;
  SetCursorPos;

  //Plug Notify
  OnPLNotify( peSave );

  result := true;
  DebugLog('Savefile Finish');
end;

procedure TfLEdit.FTPSaveCurrent;
var
  fdlg: TdFTPso;
  msg: String;
begin
  if not CurLEFile.IsRemoteFileOpen then begin
    messageDlg('This file wasn''t opened remotely, please use save as first.', mtinformation, [mbok], 0);
    exit;
    end;
  //Save File
  fdlg := TdFTPso.Create(self);
  try
    msg := Format('Are you sure you wish to save the current file to the following location? '#$D#$A'  Host: %s'#$D#$A'  Dir: %s'#$D#$A'  File: %s', [CurLEFile.RemoteFile.Host, CurLEFile.RemoteFile.RemoteDir, CurLEFile.RemoteFile.RemoteFile]);
    if messagedlg(msg, mtConfirmation, [mbYes, mbNO], 0) = mrYes then begin
      if (SaveMulti(true, false, false)) then begin
        CurLEfile.IsRemoteFileOpen := true;
        fdlg.Filename := CurLEFile.Filename;
        fdlg.Host := CurLEFile.RemoteFile.Host;
        fdlg.Port := CurLEFile.RemoteFile.Port;
        fdlg.User := CurLEFile.RemoteFile.User;
        fdlg.Pass := CurLEFile.RemoteFile.Pass;
        fdlg.RemoteDir := CurLEFile.RemoteFile.RemoteDir;
        fdlg.RemoteFile := CurLEFile.RemoteFile.RemoteFile;
        fdlg.SendFile;
        end
      end;
  finally
    fdlg.Free;
  end;
end;

procedure TfLEdit.RefreshTabs;
var
  i: integer;
  nme: String;
begin
  //Scroll thought LE files and update tabs
  if fLEfiles.Count > 0 then ptabs.Height := 27;
  tabsfile.Tabs.Clear;
  for i := 0 to fLEfiles.Count -1 do begin
    nme := fLEFiles.Items[i].Filename;
    if (length(nme) <= 0) then
      nme := 'Untitled' + IntToStr(i)
    else
      nme := ExtractFilename(nme);
    SetFileIcon(fLEFiles.Items[i]);
    fLEFiles.Items[i].DisplayName := nme;
    tabsfile.Tabs.AddObject(nme + '   ',fLEFiles.Items[i]);
  end;
end;

procedure TfLEdit.DisplayCurrent;
begin
  //memo1.MaxLeftChar := CurLEfile.MaxLeftChar;
  memo1.MaxScrollWidth := CurLEfile.MaxLeftChar;
  memo1.Lines.Text := CurLEFile.Buffer.Text;
  //Set Word Wrap
  memo1.WordWrap := CurLeFile.WordWrap;
  awordwrap.Checked := CurLeFile.WordWrap;
  HideAllCustomTbars; //Hide all Custom toolbars
  ShowCurrentToolbars; //Show all remembered toolbars
  RevisibleToolbars;
  UpdateIcons;
end;

function TfLEdit.ShowOpenMulti(edit: boolean; intdir: string): boolean;
var
  isSmall: Boolean;
  i: integer;
begin
  result := false;
  DebugLog('ShowOpen Edit='+BoolToStr(Edit, true));
//  if editmode then begin
//    if not SaveCheck(false) then exit;
//  end;
//  if Length(CurLEFile.Filename) > 0 then
//    od.InitialDir := extractfilepath(CurLEFile.Filename);
  if not(CurLEFile.IsNewFile) then od.InitialDir := ExtractFilePath(CurLEFile.Filename);
  if (length(intdir) > 0) then od.InitialDir := AppPath + intdir;
  if od.Execute then begin
    for i := od.Files.Count -1 downto 0 do
      OpenFileMulti(od.Files[i], edit);
    result := true;
  end;
  DebugLog('ShowOpen Finish');
end;

function TfLEdit.SetCurrentTab(filename: string): boolean;
var
  i: integer;
begin
  //Scroll thought LE files and set current
  result := false;
  for i := 0 to fLEfiles.Count -1 do begin
    if (fLEFiles.Items[i].Filename = filename) then begin
      tabsfile.TabIndex := i;
      result := true;
      break;
      end;
  end;
end;

procedure TfLEdit.SetCurrentMemo;
begin
  if tabsfile.TabIndex >= 0 then
    CurLEFile := FLEFiles.Items[tabsfile.TabIndex];
  UpdatePosition;

  memo1.Lines.Clear;
  memo1.Lines.Text := CurLEFile.Buffer.Text;
  memo1.Gutter.StartValue := CurLEFile.StartLine;
  memo1.UndoList.Assign(CurLEFile.UndoList);
  memo1.RedoList.Assign(CurLEfile.RedoList);
  //memo1.MaxLeftChar := CurLEfile.MaxLeftChar;
  memo1.MaxScrollWidth := CurLEfile.MaxLeftChar;
  memo1.WordWrap := CurLEFile.WordWrap;
  CurLEfile.SetBookmarks(memo1);
  HideAllCustomTbars; //Hide all Custom toolbars
  ShowCurrentToolbars; //Show all remembered toolbars
  RevisibleToolbars;
  memo1.Refresh;

  Changes := CurLEfile.IsChanged;
  UpdateIcons;
  SetCursorPos;
end;

procedure TfLEdit.tabsfileChange(Sender: TObject);
begin
  try
    Busy;
    DebugLog('Set Current Memo');
    SetCurrentMemo;
    DebugLog('Set Current Highlighter');
    SetCurrentHL;
    SetCursorPos;
    UpdateIcons;
    OnPLNotify( peTabChange );
  finally
    NotBusy;
  end
end;

procedure TfLEdit.SetCurrentHL(ahlname: string = '');
var
  hlname, inhlname, extname: string;
  found: boolean;
begin
  //Set Hightlighter
  memo1.Highlighter := nil;
  if assigned(CurLEFile.HighlightObject) then begin
    //*********** If Highlighter has been set then use it ***********
    memo1.Highlighter := CurLEFile.HighlightObject;
    if length(fopts.GetAutoComplete(CurLEFile.HighlightObject)) > 0 then
      SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(CurLEFile.HighlightObject));
    fopts.SetCompletePropos(SynCodeProposal, CurLEFile.HighlightObject);
  end
  else begin
    //*********** Try to file the correct highlighter ***********
    if ((CurLEFile.HLSet) and (length(CurLEfile.HighlightName) > 0)) then begin
      //Explicitly Set Highlighter
      //highlight := fopts.GetSyntaxHighlighterByName(CurLEfile.HighlightName);
      fopts.SetSyntaxHighlighterByName(CurLEFile, CurLEfile.HighlightName, found);
      if found then begin
        memo1.Highlighter := CurLEFile.HighlightObject;
        if length(fopts.GetAutoComplete(CurLEFile.HighlightObject)) > 0 then
          SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(CurLEFile.HighlightObject));
        fopts.SetCompletePropos(SynCodeProposal, CurLEFile.HighlightObject);
      end;
    end
    else if ((CurLEFile.IsNewFile) and (length(CurLEfile.HighlightName) > 0)) then begin
      //New file with set highlighter
      //highlight := fopts.GetSyntaxHighlighterByName(CurLEfile.HighlightName);
      fopts.SetSyntaxHighlighterByName(CurLEFile, CurLEfile.HighlightName, found);
      if found then begin
        memo1.Highlighter := CurLEFile.HighlightObject;
        if length(fopts.GetAutoComplete(CurLEFile.HighlightObject)) > 0 then
          SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(CurLEFile.HighlightObject));
        fopts.SetCompletePropos(SynCodeProposal, CurLEFile.HighlightObject);
      end;
    end
    else if length(CurLEFile.Highlight) > 0 then begin
      //Highlighter by filename scan
      hlname := fopts.GetSetting('HighlighterFiles', extractfileext(CurLEFile.Highlight), '');
      if length(hlname) > 0 then
        //highlight := fopts.GetSyntaxHighlighterByName(hlname)
        fopts.SetSyntaxHighlighterByName(CurLEFile, hlname, found)
      else
        //highlight := fopts.GetSyntaxHighlighter(CurLEFile.Highlight);
        fopts.SetSyntaxHighlighter(CurLEFile, CurLEFile.Highlight, found);
      if found then begin
        memo1.Highlighter := CurLEFile.HighlightObject;
        CurLEfile.HighlightName := hlname;
        if length(fopts.GetAutoComplete(CurLEFile.HighlightObject)) > 0 then
          SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(CurLEFile.HighlightObject));
        //Get Completion Proposal
        fopts.SetCompletePropos(SynCodeProposal, CurLEFile.HighlightObject);
      end
    end
    else if ((CurLEFile.IsNewFile) and (length(ahlname) <= 0) ) then begin
      //New file with no explicitly passed highlighter
      memo1.Highlighter := nil;
      memo1.Gutter.StartValue := 0;
      SynAutoComplete.AutoCompleteList.Clear;
      SynCodeProposal.Tag := 0;
      SynCodeProposal.InsertList.Clear;
      SynCodeProposal.ItemList.Clear;
    end
    else begin
      //check for a hard linked highlighter
      if (length(ahlname) > 0) then
        inhlname := ahlname
      else
        inhlname := CurLEFile.Filename;
      hlname := fopts.GetSetting('HighlighterFiles', extractfileext(inhlname), '');
      if (length(hlname) > 0) and not(CurLEfile.HLChecked) then begin
        //highlight := fopts.GetSyntaxHighlighterByName(hlname);
        fopts.SetSyntaxHighlighterByName(CurLEFile, hlname, found);
        if not(found) and not(CurLEfile.HLChecked) then fopts.SetSyntaxHighlighter(CurLEFile, inhlname, found); //highlight := fopts.GetSyntaxHighlighter(inhlname);
      end
      else begin
        if not(CurLEfile.HLChecked) then begin //Improve Speed on tab switching
          //highlight := fopts.GetSyntaxHighlighter(inhlname);
          fopts.SetSyntaxHighlighter(CurLEFile, inhlname, found);
        end
      //else
        //highlight := nil;
      end;
      if found then begin
        memo1.Highlighter := CurLEfile.HighlightObject;
        CurLEFile.Highlight := inhlname;
        CurLEfile.HighlightName := hlname;
        //Get Auto Completion
        if length(fopts.GetAutoComplete(CurLEFile.HighlightObject)) > 0 then
          SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(CurLEFile.HighlightObject));
        //Get Completion Proposal
        fopts.SetCompletePropos(SynCodeProposal, CurLEFile.HighlightObject);
      end;
    end;
  end; //*********** Find Highlighter ***********
  
  alighton.Checked := (memo1.Highlighter <> nil);
  CurLeFile.HighligherOn := alighton.Checked;

  aclicklinks.Checked := CurLEfile.LinksOn;  
  if CurLEfile.LinksOn then begin
    memo1.Highlighter := URISyntax;
    sbar.Panels.Items[2].Text := memo1.Highlighter.CommonName;
  end
  else if alighton.Checked then begin
    //highlight := CurLEFile.HighlightObject;
    sbar.Panels.Items[2].Text := CurLEfile.HighlightObject.CommonName;
    //ShowHLToolbars(hlname); //Show Toolbars assigned with highlighter
    ShowHLToolbars(CurLEfile.HighlightName); //Show Toolbars assigned with highlighter
    end
  else
    sbar.Panels.Items[2].Text := '';
end;

procedure TfLEdit.CloseCurrentMulti(savecheck: boolean = true);
var
  idx: integer;
begin
  //Save Check first;
  try
    Busy;

    UpdateCurrentFile;
    if savecheck then SaveCheckCurrent;
    idx := tabsfile.TabIndex;
    if (idx >= 0) then begin
      FLEFiles.Items[idx].CloseCurFile;
      FLEFiles.Items[idx].CleanUpTempFile;
      FLEFiles.Remove(idx);
      if (idx > 0) then idx := idx -1;
      if FLEFiles.Count > 0 then
        CurLEFile := FLEFiles.Items[idx];
      RefreshTabs;
      SetCurrentMemo;
      SetCurrentHL;
      UpdateIcons;
    end;

    //Plug Notify
    OnPLNotify( peClose );

  finally
    NotBusy;
  end;
end;

procedure TfLEdit.tabsfileChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  try
    Busy;
    SaveCurrentMemo;    
    UpdateCurrentFile;
    SaveCursorPos;
  finally
    NotBusy;
  end
end;

procedure TfLEdit.UpdateCurrentFile;
begin
  if (tabsfile.TabIndex >= 0) and (tabsfile.TabIndex < FLEFiles.Count) then
    FLEFiles.Items[tabsfile.TabIndex].Buffer.Text := memo1.Lines.Text;
end;

procedure TfLEdit.FormActivate(Sender: TObject);
begin
  memo1.SetFocus;
end;

function TfLEdit.SaveCheckMulti(closing: boolean; askuser: boolean): boolean;
var
  i: integer;
  sve: integer;
begin
  //Loop thought ever
  try
    Busy;

    sve := tabsfile.TabIndex;
    for i := 0 to fLEfiles.Count -1 do begin
      tabsfile.TabIndex := i;
      SetCurrentMemo;
      SetCurrentHL;
      result := SaveCheckFile(fLEfiles.Items[i], false, askuser);
      if result = false then exit;
    end;
    if closing then begin
      while flefiles.Count > 0 do begin
          FLEFiles.Items[0].CloseCurFile;
          fLEfiles.Items[0].CleanUpTempFile;
          FLEFiles.Remove(0);
      end;
    end
    else begin
      tabsfile.TabIndex := sve;
      SetCurrentMemo;
      SetCurrentHL;
    end;

  finally
    NotBusy;
  end;
end;

function TfLEdit.SaveCheckCurrent: boolean;
begin
  result := SaveCheckFile(CurLEFile);
end;

function TfLEdit.SaveCheckFile(lefile: TLEFile; closing: boolean; askuser: boolean): boolean;
var
  res: word;
  tmplefile: TLEFile;
  fname: string;
begin
  DebugLog('SaveCheck Closing='+BoolToStr(Closing, true));
  result := true;
  if lefile.Editmode and lefile.IsChanged then begin
    if askuser then
      res := MessageDlg('Do you wish to save your changes to "' + lefile.DisplayName + '" ?', mtConfirmation, [mbYes, mbNo, mbCancel], 0)
    else
      res := mrYes;
    if res = mrYes then begin
      tmplefile := CurLEFile;
      CurLEFile := lefile;
      if not (SaveMulti(not closing)) then result := false; //If you cancels save dialog, its still a cancel
      CurLEFile := tmplefile;
      end
    else if res = mrCancel then
      result := false
    else begin
      if Closing then begin
        tmplefile := CurLEFile;
        CurLEFile := lefile;
        CloseCurrentMulti( false );
        CurLEFile := tmplefile;
      end;
    end;
  end;
  DebugLog('SaveCheck Finish');
end;

function TfLEdit.OpenProjectFile(filename: string): boolean;
begin
  result := OpenFileMulti( filename );
end;

function TfLEdit.NextMulti(Lines: String; WriteLines, ResetMemo: boolean): boolean;
begin
  result := CurLEFile.Next(lines, Writelines, ResetMemo);
  if result then SetCurrentMemo;
end;

function TfLEdit.GetCurFileMulti: TLEFile;
begin
  result := ACurLEfile;
end;

procedure TfLEdit.SetCurFileMulti(Value: TLEFile);
begin
  ACurLEfile := value;
  SetCurTitle()
end;

procedure TfLEdit.SetCurTitle();
var
  regtxt: string;
  fname: string;
  rdonly: string;
begin
  rdonly := '';
  fname := CurLEFile.Filename;
  if not Registered then
    regtxt := ' | Unregistered (Day ' + IntToStr(dlgNag.DaysUsed) + ' of ' + IntToStr(dlgNag.DayTrial) + ')'
  else
    regtxt := '';
  if FileIsReadOnly(fname) then
    rdonly := ' (ReadOnly)';
  if not(CurLEfile.Editmode) then
    rdonly := ' (ReadOnly)';
  if (length(fname) <= 0) or ((Pos(AppPath, fname) > 0) and (LowerCase(ExtractFileExt(fname)) = '.ltf')) then
    //self.Caption := 'Untitled' + regtxt
    self.Caption := scTitle + ' - Untitled' + regtxt
  else
    self.Caption := ExtractFileName(fname) + rdonly + regtxt;
    //self.Caption := scTitle + ' - ' + ExtractFileName(ACurFile) + regtxt;
  application.Title := self.Caption;
end;

function TfLEdit.Last: Boolean;
begin
  try
    busy;
    result := CurLEfile.Last;
    if result then SetCurrentMemo;
  finally
    notbusy;
  end;
end;

procedure TfLEdit.apriorExecute(Sender: TObject);
begin
  if Last() then begin
    memo1.CaretX := 0;
    memo1.CaretY := 0;
  end;
end;

procedure TfLEdit.anexttabExecute(Sender: TObject);
begin
  //Switch to next tab
  try
    Busy;
    SaveCursorPos;
    SaveCurrentMemo;

    if tabsfile.TabIndex < tabsfile.Tabs.Count -1 then tabsfile.TabIndex := tabsfile.TabIndex + 1
    else tabsfile.TabIndex := 0;
    SetCurrentMemo;
    SetCurrentHL;
    SetCursorPos;
    UpdateIcons;

    //Plug Notify
    OnPLNotify(peTabChange);
  finally
    NotBusy;
  end
end;

procedure TfLEdit.apretabExecute(Sender: TObject);
begin
  try
    Busy;
    //Switch to next tab
    SaveCursorPos;
    SaveCurrentMemo;

    if tabsfile.TabIndex > 0 then tabsfile.TabIndex := tabsfile.TabIndex - 1
    else tabsfile.TabIndex := tabsfile.Tabs.Count -1;
    SetCurrentMemo;
    SetCurrentHL;
    SetCursorPos;
    UpdateIcons;

    //Plug Notify
    OnPLNotify(peTabChange);
  finally
    NotBusy;
  end
end;

procedure TfLEdit.SetCursorPos;
begin
  memo1.CaretY := CurLEFile.CaretY;
  memo1.CaretX := CurLEFile.CaretX;
  memo1.TopLine := CurLEFile.TopLine;
  memo1.BlockBegin := CurLEFile.BlockBegin;
  memo1.BlockEnd := CurLEFile.BlockEnd;  
  UpdatePosition;
end;

procedure TfLEdit.aWebPreviewExecute(Sender: TObject);
begin
  //Preview Current Tab in a HTML Preview window.
  //Web view should be docked to the right side of the window.
  ShowWebWindow( CurLEfile.Filename );
end;

procedure TfLEdit.aSMPlayExecute(Sender: TObject);
var
  scrlarge: TLargeEditor;
  scrcode: TStringList;
  params: PSafeArray;
  vle, max: integer;
  txt: string;
begin
  //Load and play back a macro script
  if length(odlgscript.InitialDir) <= 0 then odlgscript.InitialDir := AppPath + 'scripts';  
  if odlgscript.Execute then begin
    flastscript := odlgscript.FileName;
    odlgscript.InitialDir := ExtractFilePath(flastscript);
    flastplayfun := false;
    aSMPlayLast.Enabled := true;
    scrlarge := TLargeEditor.Create;
    scrcode := TStringList.Create;
    scrcode.LoadFromFile(odlgscript.FileName);
    scrlarge.WorkingDir := ExtractFilePath(odlgscript.FileName);

    wscript.Reset;
    if UpperCase( ExtractFileExt(odlgscript.FileName) ) = '.VBS' then
      wscript.Language := 'VBSCRIPT'
    else
      wscript.Language := 'JSCRIPT';

    wscript.Timeout := fopts.GetSetting(scIniSetting, 'edtscrtimeout', wscript.Timeout);
    scrlarge.LargePad := self;

    wscript.AddObject('LargeEdit', scrlarge, true);
    wscript.AddCode(scrcode.Text);

    dResultTool.ResultMemo.Lines.Clear;

    txt := 'Test';
    ScrCallFunction('Run', [txt]);

    if (dResultTool.ResultMemo.Lines.Count > 0) then begin
      AddToolWindow(dResultTool);
      ShowToolWindow;
    end;
  end;
end;

procedure TfLEdit.wscriptError(Sender: TObject);
begin
  Showmessage(wscript.Error.Source + ' - ' + wscript.Error.Description + ' | ' + wscript.Error.Text);
end;

function TfLEdit.ScrCallFunction(const FunctionName: string;
  const Params: array of Variant): OleVariant;
var
	l_args_arr: Variant;
	l_args: PSafeArray;
	l_high, i: integer;
begin
	// build array of values
	l_high := High(Params);
	l_args_arr := VarArrayCreate([0, l_high], varVariant);
	for i := 0 to l_high do
		l_args_arr[i] := Params[i];

	// convert to PSafeArray
	l_args := PSafeArray(TVarData(l_args_arr).VArray);

	// call the function
	Result := wscript.Run(FunctionName, l_args);
end;

procedure TfLEdit.CloseSplitView(Sender: TObject);
begin
  //fWebBrowser.Hide;
  pviewer.Width := 34;
  splitviewer.Visible := False;
  pviewer.Visible := false;
end;

procedure TfLEdit.aSMCreateExecute(Sender: TObject);
var
  slist: TStringList;
begin
  //Create Script
  OpenNewMulti;
  slist := TStringList.Create;
  slist.LoadFromFile( ExtractFilePath(application.ExeName) + 'scripting.js' );
  memo1.Text := slist.Text;
  SetCurrentHLByName('LargeEdit Script');
  CurLEfile.HLChecked := true;
  SetCursorPos;
  UpdateCurrentFile;
  slist.Free;
end;

procedure TfLEdit.aSMEditExecute(Sender: TObject);
begin
  //Edit Script
  if ShowOpenMulti(true, 'scripts') then begin
    SetCurrentHLByName('LargeEdit Script');
    CurLEfile.HLChecked := true;
  end;
end;

procedure TfLEdit.AddRecentProjectsToMenu;
var
  i: integer;
  mi: TMenuItem;
begin
  LoadRecentDocs( RecentProjects, 'recprojs.lst' );
  mrecentprojs.Clear;
  for i := 0 to RecentProjects.Count - 1 do begin
    mi := TMenuItem.Create(self);
    mi.OnClick := self.OnClickRecentProject;
    mi.Caption := IntToStr(i) + ' - ' + RecentProjects[i];
    mrecentprojs.Add(mi);
  end;
end;

procedure TfLEdit.UpdateRecentProjects;
begin
  if (length(FCurProjectFile) <= 0) then exit;
  if FLastRecentProject <> FCurProjectFile then
    AddRecentDocs(RecentProjects, FCurProjectFile, 'recprojs.lst');
  FLastRecentProject := FCurProjectFile;
  AddRecentProjectsToMenu;
end;

procedure TfLEdit.OnClickRecentProject(Sender: TObject);
var
  fnme: String;
  i: integer;
begin
  if Sender is TMenuItem then begin
    with Sender as TMenuItem do begin
      fnme := Caption;
      i := Pos('-', fnme);
      if i <> 0 then
        fnme := Trim(Copy(fnme, i+1, length(fnme)));
      showprojectwindow;
      fproject.OpenProject(fnme);
    end; // with
  end; //If
end;

procedure TfLEdit.showprojectwindow;
begin
  if (pproject.Enabled) and (pproject.Tag = 1) then exit;
  pproject.Tag := 1;
  fproject.OnOpenFile := OpenProjectFile;
  fproject.OnOpenProject := OpenProject;
  pproject.Width := fproject.ClientWidth + 2;
  pproject.Enabled := true;
  spltproj.Enabled := true;
  fproject.Parent := pproject;
  fProject.Align := alClient;
  fProject.BorderStyle := bsNone;
  aprojectwin.Checked := true;
  fProject.Show;
end;

function TfLEdit.OpenProject(filename: string): boolean;
begin
  FCurProjectFile := filename;
  UpdateRecentProjects;
end;

procedure TfLEdit.aopenprojectExecute(Sender: TObject);
begin
  //Open project
  if (odlgproj.Execute) then begin
    if (fproject.OpenProject(odlgproj.FileName)) then showprojectwindow;
    //showprojectwindow;
    //fproject.OpenProject(odlgproj.FileName);
  end;
end;

procedure TfLEdit.aaddprojectExecute(Sender: TObject);
begin
  showprojectwindow;
  fProject.AddProject;
end;

procedure TfLEdit.aaddfolderExecute(Sender: TObject);
begin
  showprojectwindow;
  fProject.ShowAddFolder;
end;

procedure TfLEdit.aaddfileExecute(Sender: TObject);
begin
  showprojectwindow;
  fProject.ShowAddFile;
end;

procedure TfLEdit.ascanfilesExecute(Sender: TObject);
begin
  showprojectwindow;
  fProject.ShowAddScanFiles;
end;

procedure TfLEdit.anewprojgroupExecute(Sender: TObject);
begin
  showprojectwindow;
  fProject.NewProjectGroup;
end;

procedure TfLEdit.adeleteprojitemExecute(Sender: TObject);
begin
  showprojectwindow;
  fProject.DeleteItem;
end;

procedure TfLEdit.abaseencodeExecute(Sender: TObject);
begin
  //memo1.Text := Base64Encoder.CodeString(memo1.Text);
end;

procedure TfLEdit.ashowhexExecute(Sender: TObject);
begin
  //Preview Current Tab in a HTML Preview window.
  //Web view should be docked to the right side of the window.
  if not(assigned(fHexEdit)) then begin
    fHexEdit := TfHexEdit.Create(self);
    fHexEdit.Parent := pviewer;
    fHexEdit.BorderStyle := bsNone;
    fHexEdit.Align := alClient;
    fHexEdit.OnCloseViewer := CloseSplitView;
    fHexEdit.OnSaveHex := OnSaveCurHexFile;
    end;

  pviewer.Visible := true;
  splitviewer.Visible := true;
  pviewer.Width := Round(peditor.Width /2);

  if not(CurLEfile.IsNewFile) then begin
    fHexEdit.OpenHexFile(CurLEfile.Filename);
  end
  else begin
    fHexEdit.OpenNewHex;
    fHexEdit.LoadData( CurLeFile.BufferText );
    end;
  fHexEdit.Show;
end;

procedure TfLEdit.FormResize(Sender: TObject);
begin
//This is anonying when using
//  if pviewer.Visible then
//    pviewer.Width := Round(peditor.Width /2);
end;

procedure TfLEdit.OnSaveCurHexFile(Sender: TObject);
begin
  if fHexEdit.Filename = CurLEfile.Filename then begin
    aclosefileExecute(nil);
    fHexEdit.SaveFile;
    OpenFileMulti(fHexEdit.Filename);
  end
  else
    fHexEdit.SaveFile;
end;

procedure TfLEdit.axslttransExecute(Sender: TObject);
var
  text: string;
begin
  //Transform the current XML data, with an exiting XSLT and display the results in the web window
  if (odlgxslt.Execute) then begin
    text := RunXSLTTransform(CurLEfile.Filename, odlgxslt.FileName);
    ShowXSLTResult(text);
  end;
end;

function TfLEdit.RunXSLTTransform(xmlfile, xsltfile: string; xselect: string = ''): string;
var
  xdoc, xslt, stylesheet: Variant;
  xnode, xslProc: variant;
  error: boolean;
begin
  result := '';
  try
    xdoc := CreateOleObject('MSXML2.DOMDocument');
    xslt := CreateOleObject('Msxml2.XSLTemplate');
    stylesheet := CreateOleObject('Msxml2.FreeThreadedDOMDocument');
  except
    Showmessage('Error: Microsoft XML Parser is not installed');
    exit;
  end;

  if not xdoc.load(xmlfile) then begin
    Showmessage('Could not parse document. Reason: ' + xdoc.parseError.reason);
    exit;
  end;

  //Load XSLT Page
  stylesheet.async := false;
  stylesheet.resolveExternals := false;
  stylesheet.load(xsltfile);
  //Check for parse error
  if (stylesheet.parseError.errorCode <> 0) then begin
      Showmessage('Form "' + xsltfile + '" is could not be loaded: ' + stylesheet.parseError.reason);
      exit;
    end
  else begin
      xslt.stylesheet := stylesheet;
      xslProc := xslt.createProcessor;
      if (length(xselect) > 0) then begin
        xnode := xdoc.selectsinglenode(xselect);
        if vartype(xnode) = varEmpty then begin
          Showmessage('The XPath expression did not return a node');
          exit;
          end
      end
      else
        xnode := xdoc;

      xslProc.input := xnode;
			xslProc.transform;
      result := xslProc.output;
    end;
end;

procedure TfLEdit.axsltrefreshExecute(Sender: TObject);
var
  text: string;
begin
  if length(odlgxslt.FileName) <= 0 then
    axslttransExecute(Sender)
  else begin
    text := RunXSLTTransform(CurLEfile.Filename, odlgxslt.FileName);
    ShowXSLTResult(text);
    end;
end;

procedure TfLEdit.ShowXSLTResult(transtext: string);
var
  tmpfile: TStringList;
  tmpfname: string;
begin
  if length(transtext) <= 0 then exit;

  dResultTool.ResultMemo.Lines.Text := transtext;
  AddToolWindow(dResultTool);
  ShowToolWindow;

  //Show HTML Result in window
  tmpfile := TStringList.Create;
  tmpfname := GetNewTempFileName;
  tmpfile.Text := transtext;
  tmpfile.SaveToFile(tmpfname);
  ShowWebWindow(tmpfname);
end;

procedure TfLEdit.ShowWebWindow(url: string);
begin
  //Preview Current Tab in a HTML Preview window.
  //Web view should be docked to the right side of the window.
  if not(assigned(fWebBrowser)) then begin
    fWebBrowser := TfWebBrowser.Create(self);
    fWebBrowser.Parent := pviewer;
    fWebBrowser.BorderStyle := bsNone;
    fWebBrowser.Align := alClient;
    fWebBrowser.OnCloseViewer := CloseSplitView;
    end;

  pviewer.Visible := true;
  splitviewer.Visible := true;
  pviewer.Width := Round(peditor.Width /2);

  fWebBrowser.Navigate(url);
  fWebBrowser.Show;
end;

procedure TfLEdit.atransxnodeExecute(Sender: TObject);
var
  text: String;
begin
  //prompt for select XPath for Xnode
  if ShowXPathSearchModal then begin
    if length(odlgxslt.FileName) <= 0 then begin
      if odlgxslt.Execute then begin
        text := RunXSLTTransform(CurLEfile.Filename, odlgxslt.FileName, xpathdlg.Text);
        ShowXSLTResult(text);
      end;
    end
    else begin
      text := RunXSLTTransform(CurLEfile.Filename, odlgxslt.FileName, xpathdlg.Text);
      ShowXSLTResult(text);
      end;
  end;
end;

function TfLEdit.ShowXPathSearchModal: boolean;
begin
  if not(assigned(xpathdlg)) then
    xpathdlg := TfrmLargeTEXT.Create(self);
  xpathdlg.Title := 'Enter XPath Expression';
  xpathdlg.Text := '';
  xpathdlg.OnClickOK := self.OnXPathSearch;
  xpathdlg.ShowModal;
  result := true;
end;

procedure TfLEdit.alightonExecute(Sender: TObject);
begin
  //Switch highligher
  if alighton.Checked then
    memo1.Highlighter := nil
  else
    memo1.Highlighter := highlight;
  alighton.Checked := (memo1.Highlighter <> nil);
  CurLeFile.HighligherOn := alighton.Checked;
  if alighton.Checked then
    sbar.Panels.Items[2].Text := highlight.CommonName
  else
    sbar.Panels.Items[2].Text := '';
end;

procedure TfLEdit.asavetemplateExecute(Sender: TObject);
var
  dlg: Tdtempwin;
begin
  //Save the current file as a Template
  dlg := Tdtempwin.Create(self);
  dlg.dlgType := dtSave;
  dlg.Text := memo1.Text;
  if not(CurLEfile.IsNewFile) then
    dlg.Filename := CurLEfile.Filename;
  if dlg.ShowModal = mrok then begin

  end;
end;

procedure TfLEdit.aopentemplateExecute(Sender: TObject);
var
  dlg: Tdtempwin;
begin
  //Load template dlg
  dlg := Tdtempwin.Create(self);
  dlg.dlgType := dtOpen;
  if dlg.ShowModal = mrok then begin
    //Load New file with template text
    OpenNewMulti;
    memo1.Text := dlg.Text;
    SetCurrentHL(dlg.Filename);
    SetCursorPos;
    UpdateCurrentFile;
  end;
end;

procedure TfLEdit.aSMPlayManyExecute(Sender: TObject);
var
  scrlarge: TLargeEditor;
  scrcode: TStringList;
  params: PSafeArray;
  vle, max, i, mx: integer;
  txt: string;
begin
  //Load and play back a macro script
  if length(odlgscript.InitialDir) <= 0 then odlgscript.InitialDir := AppPath + 'scripts';
  if odlgscript.Execute then begin
    odlgscript.InitialDir := ExtractFilePath(odlgscript.FileName);
    mx := 1;
    mx := StrToInt(InputBox('Play script multiple times','Enter the number time you want to play the script',  IntToStr(mx)));

    scrlarge := TLargeEditor.Create;
    scrcode := TStringList.Create;
    scrcode.LoadFromFile(odlgscript.FileName);
    scrlarge.WorkingDir := ExtractFilePath(odlgscript.FileName);

    wscript.Reset;
    if UpperCase( ExtractFileExt(odlgscript.FileName) ) = '.VBS' then
      wscript.Language := 'VBSCRIPT'
    else
      wscript.Language := 'JSCRIPT';

    wscript.Timeout := fopts.GetSetting(scIniSetting, 'edtscrtimeout', wscript.Timeout);      
    scrlarge.LargePad := self;

    wscript.AddObject('LargeEdit', scrlarge, true);
    wscript.AddCode(scrcode.Text);

    dResultTool.ResultMemo.Lines.Clear;

    txt := 'Test';
    for i := 1 to mx do
      ScrCallFunction('Run', [txt]);

    if (dResultTool.ResultMemo.Lines.Count > 0) then begin
      AddToolWindow(dResultTool);
      ShowToolWindow;
    end;
  end;
end;


function TfLEdit.LoadViewer( filename: string ) : boolean;
var
  xdoc: IXMLDOMDocument; //Variant;
  xnode, xchld, xdata: IXMLDOMNode; //variant;
  i, imgidx: integer;
  smenu, sobj, stype, swidth, sheight: string;
  mitem, pitem: TMenuItem;
  btmenu, bvmenu: bool;
  pinfo: Tplugininfo;
  function GetProp(pname: string): string;
  begin
    xdata := xchld.selectSingleNode(pname);
    if assigned(xdata) then
      result := xdata.text
    else
      result := '';
  end;
begin

  try
  //Don't fail load of Editor because or plugin problem, if
  //plugin is not loading correctly, turn on debug logging to check problem.

      //Open Plugin file and load viewers
      try
        xdoc := CoDOMDocument.Create; //CreateOleObject('MSXML2.DOMDocument');
      except
        DebugLog('Error: Microsoft XML Parser is not installed');
        exit;
      end;
      try
        if not xdoc.load(filename) then begin
          DebugLog('Could not parse document. Reason: ' + xdoc.parseError.reason);
        end
      except
        DebugLog('Error: Unable to load document, may not a valid XML document');
        exit;
      end;
      try
        xnode := xdoc.selectsinglenode('plugins/visual');
        if assigned(xnode) then begin
            btmenu := false;
            bvmenu := false;
            //Loop thought children and load plugins
            for i := 0 to xnode.childNodes.length - 1 do begin
              xchld := xnode.childNodes.item[i];
              smenu := GetProp('menu');
              sobj := GetProp('object');
              stype := GetProp('type');
              if (length(sobj) > 0) and (length(smenu) > 0) then begin
                //Load menu Item, and viewer call.
                mitem := TMenuItem.Create(self);
                pinfo := Tplugininfo.Create;
                pinfo.rawtext := xchld.xml;
                pinfo.plugintype := stype;
                pinfo.menuname := smenu;
                pinfo.width := GetProp('width');
                pinfo.height := GetProp('height');
                pinfo.guidstr := sobj;
                pinfo.events := GetProp('events');
                pinfo.location := GetProp('location');
                pinfo.filename := GetProp('filename');
                pinfo.image := GetProp('image');
                pinfo.vieweralign := GetProp('align');
                imgidx := frmLEImages.AddImage(pinfo.image);
                mitem.ImageIndex := imgidx;
                mitem.Caption := smenu;
                mitem.Tag := fplugins.Add(sobj);
                fplugininfo.AddObject(sobj, pinfo);
                if (LowerCase(stype) = 'viewer') then begin
                  mitem.OnClick := OnPLViewer;
                  View1.Add(mitem);
                  if not(bvmenu) then begin
                    View1.InsertNewLineBefore(mitem);
                    bvmenu := true;
                  end;
                end
                else if (LowerCase(stype) = 'tool') then begin
                  mitem.OnClick := OnPLToolView;
                  Tools1.Add(mitem);
                  if not(btmenu) then begin
                    Tools1.InsertNewLineBefore(mitem);
                    btmenu := true;
                  end;
                end
                else begin
                  pitem := MainMenu1.Items.Find(stype);
                  if assigned(pitem) then begin
                    mitem.OnClick := OnPLClick;
                    pitem.Add(mitem);
                    if not(pitem.Tag = 1) then begin
                      pitem.InsertNewLineBefore(mitem);
                      pitem.Tag := 1;
                    end;
                  end;
                end;

              end;
            end;

        end;
      except
        //Do Nothing
        DebugLog('Unknown exception encountered during loading of plugins');
        exit;
      end;
  except
    //Do nothing
    DebugLog('Unknown exception encountered during loading of plugin file');
    exit;
  end
end;


procedure TfLEdit.OnPLViewer(Sender: TObject);
var
  sobj: String;
  cltview: ILEViewer;
  scrlarge: TLargeEditor;
  dlgplugin: Tdoleplugin;
  pinfo: Tplugininfo;
begin
  sobj := fplugins[ TMenuItem(Sender).Tag ];
  dlgplugin := fplugins.Objects[TMenuItem(Sender).Tag] as Tdoleplugin;
  pinfo := fplugininfo.Objects[TMenuItem(Sender).Tag] as Tplugininfo;
{  try
    cltview := CreateOleObject(sobj) as ILEViewer;
    scrlarge := TLargeEditor.Create;
    scrlarge.LargePad := self;
    cltview.Init(scrlarge);
  except
    Showmessage('Viewer could not be loaded');
    exit;
  end;}

  if not(assigned(dlgplugin)) then begin
    dlgplugin := Tdoleplugin.Create(self);
    dlgplugin.Parent := pviewer;
    dlgplugin.BorderStyle := bsNone;
    dlgplugin.Align := alClient;
    dlgplugin.FullView := true;
    dlgplugin.LargeEditX := TLargeEditor.Create;
    dlgplugin.LargeEditX.LargePad := self;
    dlgplugin.Load(pinfo);
    dlgplugin.Show;
    fplugins.Objects[TMenuItem(Sender).Tag] := dlgplugin;
    end;


  pviewer.Visible := true;
  splitviewer.Visible := true;
  pviewer.Width := Round(peditor.Width /2);
  if (pinfo.vieweralign = 'left') and (pviewer.Align = alRight) then begin
    pviewer.Align := alLeft;
    splitviewer.Align := alLeft;
  end
  else if (pviewer.Align = alLeft) then begin
    pviewer.Align := alRight;
    splitviewer.Align := alRight;
  end;


end;

procedure TfLEdit.OnPLToolView(Sender: TObject);
var
  sobj: String;
  cltview: ILEViewer;
  scrlarge: TLargeEditor;
  stop, sleft, swidth, sheight: integer;
  dlgplugin: Tdoleplugin;
  pinfo: Tplugininfo;
begin
  sobj := fplugins[ TMenuItem(Sender).Tag ];
  dlgplugin := fplugins.Objects[TMenuItem(Sender).Tag] as Tdoleplugin;
  pinfo := fplugininfo.Objects[TMenuItem(Sender).Tag] as Tplugininfo;

  if not(assigned(dlgplugin)) then begin
    dlgplugin := Tdoleplugin.Create(self);
    dlgplugin.BorderStyle := bsSizeToolWin;
    dlgplugin.FormStyle := fsStayOnTop;
    dlgplugin.FullView := true;
    dlgplugin.LargeEditX := TLargeEditor.Create;
    dlgplugin.LargeEditX.LargePad := self;
    dlgplugin.Load(pinfo);
    swidth := StrToIntDef(pinfo.width,dlgplugin.Width);
    sheight := StrToIntDef(pinfo.height,dlgplugin.Height);
    dlgplugin.Width := swidth;
    dlgplugin.Height := sheight;
    sTop := top + height - sheight;
    sleft := left + width - swidth;
    dlgplugin.Top := stop - 20;
    dlgplugin.Left := sleft - 5;    
    dlgplugin.Show;
    fplugins.Objects[TMenuItem(Sender).Tag] := dlgplugin;
    end
  else begin
    dlgplugin.Show;
  end

end;


procedure TfLEdit.Busy;
begin
{  Cursor := crHourGlass;
  memo1.Cursor := crHourGlass;
  tabsfile.Cursor := crHourGlass;}
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
end;

procedure TfLEdit.NotBusy;
begin
{  Cursor := crDefault;
  memo1.Cursor := crDefault;
  tabsfile.Cursor := crDefault;}
  Screen.Cursor := crDefault;
end;

procedure TfLEdit.ViewHelp(filename, search: string);
var
  hlp, curwrd, pars: String;
begin
  //Use hightlighter help is available
  hlp := filename;
  curwrd := search;
  if length(curwrd) <= 0 then
    curwrd := memo1.GetWordAtRowCol(memo1.CaretXY);
  if length(hlp) > 0 then begin
    if UpperCase(ExtractFileExt(hlp)) = '.CHM' then begin
      HTMLHelp(GetDesktopWindow, PChar(hlp), HH_DISPLAY_INDEX, DWord(curwrd));
      exit;
    end
    else if UpperCase(ExtractFileExt(hlp)) = '.HLP' then begin
      application.HelpSystem.ShowHelp(curwrd, hlp);
      exit;
    end
    else begin
      //Open Other types
      ExecuteFile(hlp, '');
    end
  end;
end;

procedure TfLEdit.OnPLClick(Sender: TObject);
var
  sobj: String;
  leact: ILEAction;
  scrlarge: TLargeEditor;
  pinfo: Tplugininfo;
begin
  sobj := fplugins[ TMenuItem(Sender).Tag ];
  pinfo := fplugininfo.Objects[TMenuItem(Sender).Tag] as Tplugininfo;

  try
    leact := CreateOleObject(pinfo.guidstr) as ILEAction;
    scrlarge := TLargeEditor.Create;
    scrlarge.LargePad := self;
    leact.Init(scrlarge);
    leact.OnClick( pinfo.menuname );
  except
    Showmessage('Plug could not be executed');
    exit;
  end;

end;

procedure TfLEdit.OnPLNotify(event: TPluginEvents);
var
  i: integer;
  pinfo: Tplugininfo;
  dlgplugin: Tdoleplugin;
  leEv: ILEEvents;
  sclargefile: TLargeFile;
begin
  sclargefile := TLargeFile.Create;
  sclargefile.LargeEditor := self;
  sclargefile.LargeFile := CurLEfile;

  for i := 0 to fplugins.Count -1 do begin
    pinfo := fplugininfo.Objects[i] as Tplugininfo;
    if (pinfo.events = 'true') and ((pinfo.plugintype = 'viewer') or (pinfo.plugintype = 'tool')) then begin
      dlgplugin := fplugins.Objects[i] as Tdoleplugin;
      try
        leEv := dlgplugin.DispatchObject as ILEEvents;
        if (event = peOpen) then leEv.OnOpen(sclargefile);
        if (event = peSave) then leEv.OnSave(sclargefile);
        if (event = peClose) then leEv.OnClose(sclargefile);
        if (event = peChange) then leEv.OnChange(sclargefile);
        if (event = peTabChange) then leEv.OnTabChange(sclargefile);
      except
        //Do nothing
      end;
    end;
  end;
end;

function TfLEdit.IsFileProjectGroup(filename: string): boolean;
begin
  //check the file to determine if it's a project file
  if (LowerCase(ExtractFileExt(filename)) = '.nsp') then result := true else result := false;
end;

function TfLEdit.OpenProjectGroup(filename: string): boolean;
begin
  //attempt to open file as project group, but if fail then open multi(caller controlled)
  try
    if (fproject.OpenProject(filename)) then showprojectwindow;
    result := true;
  except
    //do nothing
    result := false;
  end
end;

procedure TfLEdit.asaveallExecute(Sender: TObject);
var
  i: integer;
  tmplefile: TLEFile;
  sve: integer;
begin
  //Save all open files without closing
  SaveCursorPos;  
  UpdateCurrentFile;
  SaveCheckMulti(false, false);
  UpdatePosition;
  SetCursorPos;
end;

procedure TfLEdit.acloseallExecute(Sender: TObject);
begin
  //Close all open files
  if CurLEfile.IsChanged then UpdateCurrentFile;
  SaveCheckMulti(true);
  OpenNewMulti;
end;

procedure TfLEdit.SaveCursorPos;
begin
    CurLEfile.CaretX := memo1.CaretX;
    CurLEfile.CaretY := memo1.CaretY;
    CurLEfile.DisplayX := memo1.DisplayX;
    CurLEfile.DisplayY := memo1.DisplayY;
    CurLEFile.BlockBegin := memo1.BlockBegin;
    CurLEFile.BlockEnd := memo1.BlockEnd;    
    CurLEFile.TopLine := memo1.TopLine;
end;

procedure TfLEdit.tabsfileDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  FTabSize: TSmallPoint;
  TCItem: TTCItem;
begin

  //Draw tab differently for checked tabs
  TCItem.mask := TCIF_IMAGE;
  tabsfile.Canvas.FillRect(Rect);
  if ((TabIndex >= 0) and (TabIndex < FLEFiles.Count)) and (FLEFiles.Items[TabIndex].IsChanged) then begin
    control.Canvas.Font.Color := clRed;
    control.Canvas.TextRect(rect, rect.Left + 20, rect.Top + 3, tabsfile.Tabs[TabIndex]);
    //tabsfile.Canvas.FillRect(rect);
    end
  else begin
    control.Canvas.Font.Color := clBlack;
    control.Canvas.TextRect(rect, rect.Left + 20, rect.Top + 3, tabsfile.Tabs[TabIndex]);
  end;

  //TOO SLOW NOW
  //if CurLEfile.IconSet then begin
    //imglisttabs.Draw(control.Canvas, rect.left + 2, Rect.Top + 2, Curlefile.ImageIndex);
    //icon.Handle := curlefile.Icon.Handle;
  //  end
  //else

  frmLEImages.leimgsm.Draw( control.Canvas, rect.left + 2, Rect.Top + 2, 21 );
  FTabSize.x := 10; // tabsfile.TabWidth + frmLEImages.leimgsm.Width + 4;
  FTabSize.y := 0; //tabsfile.TabHeight;
  SendMessage(tabsfile.Handle, TCM_SETPADDING, 0, Integer(FTabSize));
  //SendMessage(tabsfile.Handle, TCM_SETITEMSIZE, 0, Integer(FTabSize));
//  SendMessage(tabsfile.Handle, WM_SIZE, SIZE_RESTORED, Word(tabsfile.Width) or Word(tabsfile.Height) shl 16);
//  tabsfile.Realign;
end;

procedure TfLEdit.hideexplorewindow;
begin
  pproject.Width := 1;
  pproject.Enabled := false;
  spltproj.Enabled := false;
end;

procedure TfLEdit.showexplorewindow;
begin
  if (pproject.Enabled) and (pproject.Tag = 2) then exit;
  fexplorer.OnOpenFile := OpenProjectFile;
  //fproject.OnOpenProject := OpenProject;
  pproject.Tag := 2;
  pproject.Width := fproject.ClientWidth;
  pproject.Enabled := true;
  spltproj.Enabled := true;
  fexplorer.Parent := pproject;
  fexplorer.Align := alClient;
  fexplorer.BorderStyle := bsNone;
  fexplorer.Show;
end;

procedure TfLEdit.aexplorewinExecute(Sender: TObject);
begin
  aprojectwin.Checked := false;
  if (pproject.Enabled) and (pproject.Tag = 2 ) then begin
    hideexplorewindow;
    aexplorewin.Checked := false;
    exit;
  end;
  showexplorewindow;
  aexplorewin.Checked := true;
end;

procedure TfLEdit.memo1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Source is TShellListView then
    Accept := true
  else
    Accept := false;
end;

procedure TfLEdit.memo1DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if Source is TShellListView then begin
    with source as TShellListView do begin
      if length( SelectedFolder.PathName) <= 0 then exit;
      OpenProjectFile( SelectedFolder.PathName );
    end;
  end;
end;

procedure TfLEdit.UpdateIcons;
begin
  if Curlefile.IsSmall then begin
    aprior.Enabled := false;
    anext.Enabled := false;
  end
  else begin
    aprior.Enabled := true;
    anext.Enabled := true;
  end;
  aeditRedo.Enabled := memo1.CanRedo;
  aeditUndo.Enabled := memo1.Canundo;
  alighton.Checked := CurLeFile.HighligherOn;
  awordwrap.Checked := CurLeFile.WordWrap;
end;

procedure TfLEdit.SetFileIcon(lefile: TLEFile);
var
  SmallIcon: HICON;
begin
  exit;
  if lefile.IconSet then exit;
  GetAssociatedIcon(lefile.Filename, nil, @SmallIcon);
  if SmallIcon <> 0 then begin
    lefile.Icon.Handle := SmallIcon;
    lefile.ImageIndex := imglisttabs.AddIcon(lefile.Icon);
    lefile.IconSet := true;
    //icon.Handle := smallicon;
    //lsticon.SaveToFile('c:\backup\' + ChangeFileExt(sr.name, '.ico'));
    end
  else
    lefile.IconSet := false;
end;

procedure TfLEdit.aSMPlayLastExecute(Sender: TObject);
begin
  //Play last Script Macro
  if flastplayfun then begin
    PlayCode(flastscript, flastfunc, true);
    end
  else begin
    PlayScriptMacro(flastscript);
  end;
end;

procedure TfLEdit.PlayScriptMacro(scriptfile: string; func: string; showres: boolean);
var
  scrlarge: TLargeEditor;
  scrcode: TStringList;
  params: PSafeArray;
  vle, max: integer;
  txt: string;
begin
  if fileexists(scriptfile) then begin
  //Load and play back a macro script
    scrlarge := TLargeEditor.Create;
    scrcode := TStringList.Create;
    scrcode.LoadFromFile(scriptfile);
    scrlarge.WorkingDir := ExtractFilePath(scriptfile);

    wscript.Reset;
    if UpperCase( ExtractFileExt(scriptfile) ) = '.VBS' then
      wscript.Language := 'VBSCRIPT'
    else
      wscript.Language := 'JSCRIPT';

    wscript.Timeout := fopts.GetSetting(scIniSetting, 'edtscrtimeout', wscript.Timeout);
    scrlarge.LargePad := self;

    wscript.AddObject('LargeEdit', scrlarge, true);
    wscript.AddCode(scrcode.Text);

    dResultTool.ResultMemo.Lines.Clear;

    txt := 'Test';
    ScrCallFunction(func, [txt]);

    if (showres) or (dResultTool.ResultMemo.Lines.Count > 0) then begin
      AddToolWindow(dResultTool);
      ShowToolWindow;
    end;
  end;
end;

procedure TfLEdit.awordwrapExecute(Sender: TObject);
begin
  //Word Wrap
  memo1.WordWrap := not memo1.WordWrap;
  awordwrap.Checked := memo1.WordWrap;
  CurLEFile.WordWrap := memo1.WordWrap;
  if CurLeFile.IsNewFile then CurLEFile.ReCalcMaxCharFull;
  memo1.MaxScrollWidth := CurLeFile.MaxLeftChar;
end;

procedure TfLEdit.SynCodeProposalAfterCodeCompletion(Sender: TObject;
  const Value: String; Shift: TShiftState; Index: Integer; EndToken: Char);
begin
  CompleteON := false;
end;

procedure TfLEdit.SynCodeProposalCodeCompletion(Sender: TObject;
  var Value: String; Shift: TShiftState; Index: Integer; EndToken: Char);
begin
  CompleteON := true;
end;


procedure TfLEdit.SynCodeProposalPaintItem(Sender: TObject; Index: Integer;
  TargetCanvas: TCanvas; ItemRect: TRect; var CustomDraw: Boolean);
begin
  CompleteON := true;
end;


procedure TfLEdit.CheckAutoOptions;
begin
  //Auto Check word wrap
  if (fopts.ShouldWordWrap(CurLEFile.Filename)) then
    memo1.WordWrap := true
  else
    memo1.WordWrap := false;
  awordwrap.Checked := memo1.WordWrap;
  CurLEFile.WordWrap := memo1.WordWrap;
end;

procedure TfLEdit.ShowMsg(text: String);
begin
  ShowMessage(text);
end;

function TfLEdit.InpBox(title, prompt, defval: String): string;
begin
  result := InputBox(title, prompt, defval);
end;

procedure TfLEdit.ShowSearchReplaceDialog(AReplace: boolean);
var
  dlg: TTextSearchDialog;
begin
  if AReplace then
    dlg := TTextReplaceDialog.Create(Self)
  else
    dlg := TTextSearchDialog.Create(Self);
  with dlg do try
    // assign search options
    SearchBackwards := gbSearchBackwards;
    SearchCaseSensitive := gbSearchCaseSensitive;
    SearchFromCursor := gbSearchFromCaret;
    SearchInSelectionOnly := gbSearchSelectionOnly;
    // start with last search text
    SearchText := gsSearchText;
    if gbSearchTextAtCaret then begin
      // if something is selected search for that text
      if memo1.SelAvail and (memo1.BlockBegin.Line = memo1.BlockEnd.Line)
      then
        SearchText := memo1.SelText
      else
        SearchText := memo1.GetWordAtRowCol(memo1.CaretXY);
    end;
    SearchTextHistory := gsSearchTextHistory;
    if AReplace then with dlg as TTextReplaceDialog do begin
      ReplaceText := gsReplaceText;
      ReplaceTextHistory := gsReplaceTextHistory;
    end;
    SearchWholeWords := gbSearchWholeWords;
    if ShowModal = mrOK then begin
      gbSearchBackwards := SearchBackwards;
      gbSearchCaseSensitive := SearchCaseSensitive;
      gbSearchFromCaret := SearchFromCursor;
      gbSearchSelectionOnly := SearchInSelectionOnly;
      gbSearchWholeWords := SearchWholeWords;
      gbSearchRegex := SearchRegularExpression;
      gsSearchText := SearchText;
      gsSearchTextHistory := SearchTextHistory;
      if AReplace then with dlg as TTextReplaceDialog do begin
        gsReplaceText := ReplaceText;
        gsReplaceTextHistory := ReplaceTextHistory;
      end;
      fSearchFromCaret := gbSearchFromCaret;
      if gsSearchText <> '' then begin
        DoSearchReplaceText(AReplace, gbSearchBackwards);
        fSearchFromCaret := TRUE;
      end;
    end;
  finally
    dlg.Free;
  end;
end;

procedure TfLEdit.DoSearchReplaceText(AReplace, ABackwards: boolean; doprompt: boolean; doreplaceall: boolean);
var
  Options: TSynSearchOptions;
begin
  fDoReplaceAll := doreplaceall;
  UpdateStatus('');
  if AReplace then
    Options := [ssoPrompt, ssoReplace, ssoReplaceAll]
  else
    Options := [];
  if not(doprompt) then
    Exclude(Options, ssoPrompt);
  if ABackwards then
    Include(Options, ssoBackwards);
  if gbSearchCaseSensitive then
    Include(Options, ssoMatchCase);
  if not fSearchFromCaret then
    Include(Options, ssoEntireScope);
  if gbSearchSelectionOnly then
    Include(Options, ssoSelectedOnly);
  if gbSearchWholeWords then
    Include(Options, ssoWholeWord);
  if gbSearchRegex then
    memo1.SearchEngine := SynRegexSearch
  else
    memo1.SearchEngine := SynSearch;
  if memo1.SearchReplace(gsSearchText, gsReplaceText, Options) = 0 then
  begin
    //Fetch Next block if large file, Is Find is not found
    if not(CurLEfile.IsSmall) and CurLEfile.IsFileOpen then begin
      //Next(GetLinesBufValue);
      if CurLEfile.EndOfFile then begin
        //SetCurrentMemo;
        MessageBeep(MB_ICONASTERISK);
        //UpdateStatus('Text not found');
        MessageDlg('Not Found',mtInformation, [mbok],0);
        exit;
      end;
      if ABackwards then begin
        if CurLeFile.Last then SetCurrentMemo;
        end
      else begin
        if CurLEFile.Next(GetLinesBufValue, true, true) then SetCurrentMemo;
      end;      
      DoSearchReplaceText(AReplace, ABackwards);
    end
    else begin
      //Normal file functions
      MessageBeep(MB_ICONASTERISK);
      //UpdateStatus('Text not found');
      MessageDlg('Search string "' + gsSearchText + '" not found',mtInformation, [mbok],0);

      if ssoBackwards in Options then
        memo1.BlockEnd := memo1.BlockBegin
      else
        memo1.BlockBegin := memo1.BlockEnd;
      memo1.CaretXY := memo1.BlockBegin;
    end;

  end;

  //If replace didn't find current view, then get next
  if (AReplace) and (fLastAction <> raCancel) then begin
    if not(CurLEfile.IsSmall) and CurLEfile.IsFileOpen then begin
      //Next(GetLinesBufValue);
      if CurLEfile.EndOfFile then begin
        //SetCurrentMemo;
        MessageBeep(MB_ICONASTERISK);
        //UpdateStatus('Text not found');
        MessageDlg('Search string "' + gsSearchText + '" not found',mtInformation, [mbok],0);
        exit;
      end;
      if ABackwards then begin
        if CurLeFile.Last then SetCurrentMemo;
        end
      else begin
        if CurLEFile.Next(GetLinesBufValue, true, true) then SetCurrentMemo;
      end;
      if (fDoReplaceAll) then begin
        if ConfirmReplaceDialog <> nil then begin
          ConfirmReplaceDialog.Free;
          if MessageDlg('Preforming replace all on a large file may take a long time, LargeEdit may appear unresponsive during this process. Do you want to continue?', mtWarning, [mbYes, mbNo], 0)= mrNo then exit;
        end;
        DoSearchReplaceText(AReplace, ABackwards, false, fDoReplaceAll);
        end
      else
        DoSearchReplaceText(AReplace, ABackwards);
    end;
  end;

  if ConfirmReplaceDialog <> nil then
    ConfirmReplaceDialog.Free;

  fLastAction := raSkip;
end;


procedure TfLEdit.memo1ReplaceText(Sender: TObject; const ASearch,
  AReplace: String; Line, Column: Integer; var Action: TSynReplaceAction);
var
  APos: TPoint;
  EditRect: TRect;
begin
  if ASearch = AReplace then
    Action := raSkip
  else begin
    APos := memo1.ClientToScreen(
      memo1.RowColumnToPixels(
      memo1.BufferToDisplayPos(
        BufferCoord(Column, Line) ) ) );
    EditRect := ClientRect;
    EditRect.TopLeft := ClientToScreen(EditRect.TopLeft);
    EditRect.BottomRight := ClientToScreen(EditRect.BottomRight);

    if ConfirmReplaceDialog = nil then
      ConfirmReplaceDialog := TConfirmReplaceDialog.Create(Application);
    ConfirmReplaceDialog.PrepareShow(EditRect, APos.X, APos.Y,
      APos.Y + memo1.LineHeight, ASearch);
    case ConfirmReplaceDialog.ShowModal of
      mrYes: Action := raReplace;
      mrYesToAll: begin
        Action := raReplaceAll;
        fDoReplaceAll := true;
        end;
      mrNo: Action := raSkip;
      else Action := raCancel;
    end;
    fLastAction := Action;
  end;
end;


procedure TfLEdit.afindpreviousExecute(Sender: TObject);
begin
    DoSearchReplaceText(FALSE, TRUE);
end;

procedure TfLEdit.SortText(removedup: boolean; desc: boolean);
var
  tmplist, sellist: TStringList;
  i: integer;
  txt, lst: string;
begin
  //Duplicate Delete
//  if sdout.Execute then
//    RemoveDuplicates(sdout.FileName);
  tmplist := TStringList.Create;
  sellist := TStringList.Create;
  try
    //Get text to work on
    if length(memo1.SelText) > 0 then begin
      sellist.Text := memo1.SelText;
      end
    else begin
      sellist.Text := memo1.Text;
      //memo1.SelectAll;
      end;
    //memo1.UndoList.AddChange(crDelete, memo1.BlockBegin, memo1.BlockEnd, memo1.SelText, memo1.SelectionMode);

    //Set parameters
    tmplist.Sorted := true;
    if removedup then
      tmplist.Duplicates := dupIgnore
    else
      tmplist.Duplicates := dupAccept;

    //Add data to list
    for i := 0 to sellist.Count - 1 do
      tmplist.Add(sellist[i]);

    //Descending sort
    if desc then begin
      sellist.Text := tmplist.Text;
      tmplist.Clear;
      tmplist.Sorted := false;
      for i := sellist.Count -1 downto 0 do
        tmplist.Add(sellist[i]);
    end;

    if length(memo1.SelText) <= 0 then memo1.Lines.Clear;
    lst := '';
    txt := tmplist.Text;
    if (length(txt) > 1) then
      lst := copy(txt, length(txt) - 1, 2);

    if (lst = (Chr(13) + Chr(10)) ) then
      memo1.SelText := copy(txt, 0, length(txt) -2)
    else
      memo1.SelText := txt;

    //memo1.UndoList.AddChange(crInsert, memo1.BlockBegin, memo1.BlockEnd, txt, memo1.SelectionMode);
  finally
    tmplist.free;
    sellist.Free;
    memo1.EndUndoBlock;
  end;
end;

procedure TfLEdit.aSortAscExecute(Sender: TObject);
begin
  SortText();
end;

procedure TfLEdit.aSortDescExecute(Sender: TObject);
begin
  SortText(false, true);
end;

procedure TfLEdit.aSortDescRmDupExecute(Sender: TObject);
begin
  SortText(true,true);
end;

procedure TfLEdit.aSortAscRmDupExecute(Sender: TObject);
begin
  SortText(true);
end;

procedure TfLEdit.LoadToolBars;
begin
  if not(assigned(FNSTBars)) then begin
    //Save Time loading toolbars, only load once per session
    FNSTBars := TNSToolbars.Create;
    FNSTBars.LoadToolbars(ExtractFilePath(application.ExeName) + '\toolbars\');
  end;
end;

function TfLEdit.GetToolbar(name: string; norecall: boolean): boolean;
var
  ftbar: TNSToolbar;
begin
  result := false;
  if not(assigned(FNSTBars)) then LoadToolBars;
  ftbar := FNSTBars.FindToolbar(name);
  if not(assigned(ftbar)) then exit; //Can't find toolbar
  //Create Actions and Action Bar
  if assigned(ftbar.ActionToolBar) then begin
    //if ftbar.ActionToolBar.Visible then exit; //No display on newly opened files
    ftbar.ActionToolBar.Show
  end
  else begin
    ftbar.CreateToolbar(ActionManager, alCustomActs, imgCustomList, CoolBar1,OnExecCustomAction);
    ftbar.ActionToolBar.Show;
    end;

  //Update LEFileObject with list of active toolbars
  if norecall = false then begin
    if CurLEFile.Toolbars.IndexOf(name) < 0 then
      CurLEfile.Toolbars.Add(name);
  end;
end;

procedure TfLEdit.OnExecCustomAction(Sender: TObject);
var
  act: TAction;
  abtn: TNSButton;
  scrfile: String;
begin
  SaveCursorPos;
  act := TAction(Sender);
  abtn := TNSButton(act.Tag);
  if abtn.Toolbar.ExtToolbar then begin
    scrfile := abtn.Toolbar.ToolPath + abtn.Toolbar.Source;
    PlayScriptMacro(scrfile, abtn.Action, false);
  end
  else begin
    PlayCode(abtn.GetWrappedCode, 'Run', false);    
  end;
end;

procedure TfLEdit.DisplayToolBars;
var
  i: integer;
  mitem: TMenuItem;
begin
  for i := 0 to FNSTBars.ToolbarCount -1 do begin
    //Add to Show Toolbar button
    mitem := TMenuItem.Create(self);
    mitem.Caption := FNSTBars.Toolbars[i].Name;
    mitem.Hint := FNSTBars.Toolbars[i].Name;
    mitem.OnClick := OnShowCustTBar;
    ShowToolbar1.Add(mitem);
  end;
end;

procedure TfLEdit.OnShowCustTBar(Sender: TObject);
var
  mitem: TMenuItem;
begin
  mitem := TMenuItem(Sender);
  if mitem.Checked then begin
    HideToolbar(mitem.Hint);
    RemoveVisibleToolbar(mitem.Hint);
    mitem.Checked := false;
    end
  else begin
    GetToolbar(mitem.Hint); //TESTING HTML TOOLBAR
    AddVisibleToolbar(mitem.Hint);
    mitem.Checked := true;
    end
end;

procedure TfLEdit.PlayCode(code, func: string; showres: boolean);
var
  scrlarge: TLargeEditor;
  scrcode: TStringList;
  params: PSafeArray;
  vle, max: integer;
  txt: string;
begin
//Load and play back a macro script
  scrlarge := TLargeEditor.Create;

  wscript.Reset;
  //if UpperCase( ExtractFileExt(odlgscript.FileName) ) = '.VBS' then
  //  wscript.Language := 'VBSCRIPT'
  //else
  wscript.Language := 'JSCRIPT';

  wscript.Timeout := fopts.GetSetting(scIniSetting, 'edtscrtimeout', wscript.Timeout);
  scrlarge.LargePad := self;

  wscript.AddObject('LargeEdit', scrlarge, true);
  wscript.AddCode(code);

  dResultTool.ResultMemo.Lines.Clear;

  txt := 'Test';
  ScrCallFunction(func, [txt]);

  if (showres) or (dResultTool.ResultMemo.Lines.Count > 0) then begin
    AddToolWindow(dResultTool);
    ShowToolWindow;
  end;

end;

procedure TfLEdit.SynCodeProposalExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: String; var x, y: Integer;
  var CanExecute: Boolean);
begin
  if SynCodeProposal.Form.ItemList.Count <= 0 then CanExecute := false;
end;

procedure TfLEdit.HideToolbar(name: string);
var
  ftbar: TNSToolbar;
  idx: integer;
begin
  ftbar := FNSTBars.FindToolbar(name);
  if not(assigned(ftbar)) then exit; //Can't find toolbar
  if assigned(ftbar.ActionToolBar) then ftbar.ActionToolBar.Hide;
  idx := CurLEfile.Toolbars.IndexOf(name);
  if idx >= 0 then
    CurLEFile.Toolbars.Delete(idx);
end;

procedure TfLEdit.GotoLine(line: string);
var
  i, tl: integer;
begin
  if length(line) <= 0 then exit;
  i := StrToIntDef(line, -1);
  if i = -1 then
    Showmessage('Please enter a valid line number')
  else begin
    if (CurLeFile.IsSmall) then begin
      tl := Round(memo1.LinesInWindow /2);
      tl := i - tl;
      CurLefile.CaretY := i;
      memo1.TopLine := tl;
      memo1.CaretY := i;
      CurLEFile.TopLine := memo1.TopLine;
    end
    else begin
      next(IntToStr(i)+'-'+ IntToStr(i + StrToInt(GetLinesBufValue)));
      SetCurrentMemo;
    end;
    UpdatePosition;
  end;
end;

procedure TfLEdit.aSetBookmarkExecute(Sender: TObject);
begin
  if TAction(Sender).Checked then
      memo1.ClearBookMark(TAction(Sender).Tag)
  else
    memo1.SetBookMark(TAction(Sender).Tag, memo1.CaretX, memo1.CaretY);
  TAction(Sender).Checked := not TAction(Sender).Checked;
end;

procedure TfLEdit.aGotoBookmarkExecute(Sender: TObject);
begin
  memo1.GotoBookMark(TAction(Sender).Tag);
end;

procedure TfLEdit.RefreshToolbars;
begin
  ClearToolBars;
  if assigned(FNSTBars) then FNSTBars.Free;
  //Save Time loading toolbars, only load once per session
  FNSTBars := TNSToolbars.Create;
  FNSTBars.LoadToolbars(ExtractFilePath(application.ExeName) + '\toolbars\');
  DisplayToolBars;
  RevisibleToolbars;  
end;

procedure TfLEdit.ClearToolBars;
var
  i: integer;
  mitem: TMenuItem;
begin
  if not(assigned(FTBarsVisible)) then begin
    FTBarsVisible := TStringList.Create;
    FTBarsVisible.Sorted := true;    
    FTBarsVisible.Duplicates := dupIgnore;
    end;
  FTBarsVisible.Clear;
  for i := 0 to FNSTBars.ToolbarCount -1 do begin
    mitem := ShowToolbar1.Find(FNSTBars.Toolbars[i].Name);
    if assigned(mitem) then begin
      if assigned(FNSTBars.Toolbars[i].ActionToolBar) and (FNSTBars.Toolbars[i].ActionToolBar.Visible) then FTBarsVisible.Add(FNSTBars.Toolbars[i].Name);
      ShowToolbar1.Delete(  ShowToolbar1.IndexOf(mitem) );
      end;
  end;

end;

procedure TfLEdit.RevisibleToolbars;
var
  i: integer;
  mitem: TMenuItem;  
begin
  if not(assigned(FTBarsVisible)) then exit;
  for i := 0 to FTBarsVisible.Count - 1 do begin
    mitem := ShowToolbar1.Find(FTBarsVisible[i]);
    if assigned(mitem) then begin
      GetToolbar(mitem.Hint, true); //TESTING HTML TOOLBAR
      AddVisibleToolbar(mitem.Hint);
      mitem.Checked := true;
      end;
  end;
end;

procedure TfLEdit.aSMPlayFuncExecute(Sender: TObject);
begin
  //Play a function
  //Load and play back a macro script
  if length(odlgscript.InitialDir) <= 0 then odlgscript.InitialDir := AppPath + 'scripts';
  if odlgscript.Execute then begin
    odlgscript.InitialDir := ExtractFilePath(odlgscript.FileName);
    if InputQuery('Call Function', 'Function Name:', flastfunc) then begin
      PlayCode( odlgscript.FileName, flastfunc, true);
      flastplayfun := true;
      end;
  end;
end;

procedure TfLEdit.SaveCurrentMemo;
begin
    CurLEFile.UndoList.Assign(memo1.UndoList);
    CurLEfile.RedoList.Assign(memo1.RedoList);
    CurLEfile.SaveBookmarks(memo1.Marks);
end;


procedure TfLEdit.memo1ClearBookmark(Sender: TObject;
  var Mark: TSynEditMark);
begin
  CurLEfile.ClearBookmark(mark);
  CurLEfile.SetBookmarks(memo1);
end;

procedure TfLEdit.memo1PlaceBookmark(Sender: TObject;
  var Mark: TSynEditMark);
begin
  CurLEfile.AddBookmark(mark);
end;

procedure TfLEdit.ShowHLToolbars(ahlname: string);
var
  tbarlist: TStringList;
  i: integer;
begin
  if length(ahlname) <= 0 then exit;
  tbarlist := TStringList.Create;
  try
    fopts.GetToolbarsForHighlighter(ahlname, tbarlist);
    for i := 0 to tbarlist.Count -1 do begin
      GetToolbar(tbarlist[i]);
    end;
  finally
    tbarlist.Free;
  end;
end;

procedure TfLEdit.HideAllCustomTbars;
var
  i: integer;
  mitem: TMenuItem;
begin
  if not(assigned(FNSTBars)) then exit;
  for i := 0 to FNSTBars.ToolbarCount -1 do begin
    mitem := ShowToolbar1.Find(FNSTBars.Toolbars[i].Name);
    if assigned(mitem) then begin
      mitem.Checked := false;
    end;
    if assigned(FNSTBars.Toolbars[i].ActionToolBar) then FNSTBars.Toolbars[i].ActionToolBar.Hide;
  end;
end;

procedure TfLEdit.ShowCurrentToolbars;
var
  i: integer;
begin
  if not(assigned(CurLEfile)) then exit;
  for i := 0 to CurLEfile.Toolbars.Count - 1 do begin
    GetToolbar(CurLEfile.Toolbars[i]);
  end;
end;

function TfLEdit.LoadPlugins: boolean;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  srdir: string;
  srchres: integer;
  tbar: TNSToolbar;
  fpath: string;
begin
    fpath := AppPath + 'plugins\';
    srdir := fpath + '*.*';
    FileAttrs := faHidden + faSysFile + faVolumeID + faDirectory + faArchive;

    FileAttrs := FileAttrs + faAnyFile;
    srchres := FindFirst(srdir, FileAttrs, sr);
    if srchres = 0 then begin
      repeat
        if (sr.Attr and faDirectory) = faDirectory then begin
          if not((sr.Name = '.') or (sr.Name = '..')) then begin
              //Extract File plugins.xml file from folder
              if fileexists(fpath + sr.Name + '\plugins.xml') then begin
                LoadViewer(fpath + sr.Name + '\plugins.xml')
              end;
            end;
          end
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
end;

procedure TfLEdit.SetCurrentHLByName(hlname: string);
var
  found: boolean;
begin
    if length(hlname) > 0 then
      fopts.SetSyntaxHighlighterByName(CurLEFile, hlname, found);
      //highlight := fopts.GetSyntaxHighlighterByName(hlname);
    if assigned(highlight) then begin
      memo1.Highlighter := highlight;
      if length(fopts.GetAutoComplete(highlight)) > 0 then
        SynAutoComplete.AutoCompleteList.LoadFromFile(fopts.GetAutoComplete(highlight));
      //Get Completion Proposal
      fopts.SetCompletePropos(SynCodeProposal, highlight);
    end;
    alighton.Checked := (memo1.Highlighter <> nil);
    CurLeFile.HighligherOn := alighton.Checked;

    aclicklinks.Checked := CurLEfile.LinksOn;
    if CurLEfile.LinksOn then begin
      memo1.Highlighter := URISyntax;
      sbar.Panels.Items[2].Text := memo1.Highlighter.CommonName;
    end
    else if alighton.Checked then begin
      sbar.Panels.Items[2].Text := highlight.CommonName;
      CurLeFile.HighlightName := hlname;
      ShowHLToolbars(hlname); //Show Toolbars assigned with highlighter
      end
    else
      sbar.Panels.Items[2].Text := '';
end;

procedure TfLEdit.AddVisibleToolbar(name: string);
begin
  FTBarsVisible.Add(name);
end;

procedure TfLEdit.RemoveVisibleToolbar(name: string);
var
  idx: integer;
begin
  idx := FTBarsVisible.IndexOf(name);
  if idx >= 0 then FTBarsVisible.Delete(idx);
end;

procedure TfLEdit.addcurrentExecute(Sender: TObject);
begin
  fProject.AddFileToActive(CurLEfile.Filename);
end;

procedure TfLEdit.addfilegroupExecute(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to fLEfiles.Count -1 do begin
    fProject.AddFileToActive(fLEfiles.Items[i].Filename);
  end;
end;

procedure TfLEdit.afilepropertiesExecute(Sender: TObject);
begin
  //File Properties
  if not(CurLEfile.IsNewFile) then
    ShowProperties(CurLEfile.Filename)
  else
    MessageDlg('You must save the file first', mtInformation, [mbok], 0);
end;

procedure TfLEdit.poptabsPopup(Sender: TObject);
begin
  if (CurLEfile.IsNewFile) then
    afileproperties.Enabled := false
  else
    afileproperties.Enabled := true;
end;

function TfLEdit.GetCurrentHL: TSynCustomHighlighter;
begin
  result := CurLEfile.HighlightObject;
end;

procedure TfLEdit.ViewAsGrid(Del: Char; FirstCols: boolean);
begin
    dTextGrid.HeaderLine := memo1.Lines[0];
    dTextGrid.LoadGrid(memo1.Lines.Text, del, FirstCols);
    dTextGrid.OnGetText := GetText;
    dTextGrid.OnSetCaret := SetCaret;
    dTextGrid.OnChangeText := ChangeText;
    dtextGrid.OnGetDelimitText := GetDelimitText;
    AddToolWindow(dtextgrid);
    showtoolwindow;
end;

procedure TfLEdit.amanualactivateExecute(Sender: TObject);
var
  res: Integer;
  serial: WideString;
begin
{  res := esell.ManualActivateSerialNumber('PUB303075819', 'ACT841614530', serial, '', 'If your unable to activate LargeEdit, please contact NetLegger Support for assistance' ); // LE1: 'ACT018707295'
  if res = 0 then begin
    SerialNumber := serial;
    ShowMessage('SuccessFully Activated');
  end
  else
    messagedlg('Error ('+IntToStr(res)+'): Unable to activate LargeEdit, if you need assistance contact NetLegger Support.', mtInformation, [mbok], 0);
  }
end;

function TfLEdit.GetSessionValue(PropertyName: String): OleVariant;
var
  idx: integer;
  sobj: TSessionObj;
begin
  if not(assigned(FSessionObjects)) then begin
      FSessionObjects := TStringList.Create;
    end;
  idx := FSessionObjects.IndexOf(PropertyName);
  if idx >= 0 then begin
    //Get Session Value
    sobj := TSessionObj(FSessionObjects.Objects[idx]);
    result := sobj.Value;
  end;
end;

procedure TfLEdit.SetSessionValue(PropertyName: String; Value: OleVariant);
var
  idx: integer;
  sobj: TSessionObj;
begin
  if not(assigned(FSessionObjects)) then begin
      FSessionObjects := TStringList.Create;
    end;
  idx := FSessionObjects.IndexOf(PropertyName);
  if idx >= 0 then begin
    //Override Session Value
    sobj := TSessionObj(FSessionObjects.Objects[idx]);
    sobj.Value := Value;
  end
  else begin
    //Add Session Value
    sobj := TSessionObj.Create;
    sobj.Value := Value;
    FSessionObjects.AddObject(PropertyName, sobj);
  end;
end;

procedure TfLEdit.ascripthelpExecute(Sender: TObject);
begin
  ShowHelp(ScriptingHelpFile, 'index.html');
end;

procedure TfLEdit.amatchbracketExecute(Sender: TObject);
begin
  memo1.FindMatchingBracket;
end;

procedure TfLEdit.aclicklinksExecute(Sender: TObject);
begin
  aclicklinks.Checked := not aclicklinks.Checked;
  synLinks.CtrlActivatesLinks := aclicklinks.Checked;
  if aclicklinks.Checked then begin
    memo1.Highlighter := URISyntax;
  end
  else begin
    memo1.Highlighter := highlight;
  end;
  if assigned(highlight) then
    sbar.Panels.Items[2].Text := highlight.CommonName
  else
    sbar.Panels.Items[2].Text := '';

  CurLEfile.LinksOn := aclicklinks.Checked;
end;

end.
