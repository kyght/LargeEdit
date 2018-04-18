unit foptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, SynEdit, Grids, ValEdit,
  SynEditHighlighter, SynHighlighterJScript, SynHighlighterCpp,
  SynHighlighterHtml, SynHighlighterVBScript, SynHighlighterPHP,
  SynHighlighterCss, SynHighlighterVB, SynHighlighterPas,
  SynHighlighterJava, SynHighlighterSQL, SynHighlighterFoxpro,
  SynHighlighterFortran, SynHighlighterPerl, SynHighlighterXML,
  SynHighlighterBat, SynHighlighterAsm, SynHighlighterIni,
  SynHighlighterAWK, SynCompletionProposal, unitCompProposalFile,
  unitFileAssoc, SynEditKeyCmds, inifiles, Buttons, SynUniHighlighter,
  ToolWin, unitNStoolbars, ActnMan, ActnCtrls, ActnList, CustomizeDlg,
  ImgList, SynEditMiscClasses, SynEditSearch, unitLargeFiles;

type
  Tfopts = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cbUseGutter: TCheckBox;
    GroupBox2: TGroupBox;
    cbGLineNums: TCheckBox;
    cbGLeadZero: TCheckBox;
    cbGZeroStart: TCheckBox;
    cbGUseFont: TCheckBox;
    Label1: TLabel;
    edtGDigCount: TEdit;
    Label2: TLabel;
    edtGLeftOff: TEdit;
    Label3: TLabel;
    edtGRightOff: TEdit;
    fdGutter: TFontDialog;
    Font: TButton;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    edtSmallFileLim: TEdit;
    Label5: TLabel;
    cbDefSmall: TCheckBox;
    cbEditSmall: TCheckBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    edtDefLines: TEdit;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    JScript: TSynJScriptSyn;
    vlistSyntax: TValueListEditor;
    VBScript: TSynVBScriptSyn;
    HTML: TSynHTMLSyn;
    CPlusPlus: TSynCppSyn;
    Java: TSynJavaSyn;
    Pascal: TSynPasSyn;
    VBBasic: TSynVBSyn;
    CStylesheets: TSynCssSyn;
    PHP: TSynPHPSyn;
    XML: TSynXMLSyn;
    Perl: TSynPerlSyn;
    Fortran: TSynFortranSyn;
    Foxpro: TSynFoxproSyn;
    SQL: TSynSQLSyn;
    btnCustomSyn: TButton;
    INI: TSynIniSyn;
    Assembly: TSynAsmSyn;
    Batch: TSynBatSyn;
    AWK: TSynAWKSyn;
    btnEditComplete: TButton;
    btnFileAssoc: TButton;
    fdEditor: TFontDialog;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    edtUndoMax: TEdit;
    Label8: TLabel;
    edtTabWidth: TEdit;
    cbMax: TCheckBox;
    btnEdFont: TButton;
    Label9: TLabel;
    TabSheet5: TTabSheet;
    GroupBox6: TGroupBox;
    lbKeys: TListBox;
    btnSaveKS: TButton;
    btnDefKS: TButton;
    cbKSAction: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    edtKS: TEdit;
    btnHelpFile: TButton;
    odhlp: TOpenDialog;
    btnEXE: TButton;
    odExe: TOpenDialog;
    tsHelp: TTabSheet;
    btnAddHelp: TButton;
    Button4: TButton;
    lveHelp: TValueListEditor;
    cbUnicode: TCheckBox;
    cbsmarttabs: TCheckBox;
    cbusetabs: TCheckBox;
    GroupBox7: TGroupBox;
    edtRepositdir: TEdit;
    bitbtnsetrepdir: TBitBtn;
    edtBackBufs: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edtrightedge: TEdit;
    CustomHighlighter: TSynUniSyn;
    btnAddHL: TButton;
    SEditorHL: TSynUniSyn;
    cbtabspaces: TCheckBox;
    cbtrimspaces: TCheckBox;
    GroupBox8: TGroupBox;
    edtAutoScanIgnore: TEdit;
    Label14: TLabel;
    GroupBox9: TGroupBox;
    Label15: TLabel;
    edtscrtimeout: TEdit;
    tsToolbars: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lbToolbars: TListBox;
    cbscrolleol: TCheckBox;
    GroupBox10: TGroupBox;
    Label16: TLabel;
    edtwordwrapext: TEdit;
    cbarcustom: TCoolBar;
    atbcustom: TActionToolBar;
    CustomActions: TActionManager;
    aCustomLayout: TCustomizeDlg;
    imglistcus: TImageList;
    Panel5: TPanel;
    pcustomtool: TPanel;
    synCustom: TSynEdit;
    SynSearchCustom: TSynEditSearch;
    SynJScriptCustom: TSynJScriptSyn;
    alcustom: TActionList;
    tbarc: TToolBar;
    lmglstTbar: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    alistTbar: TActionList;
    aAddBtn: TAction;
    aDelBtn: TAction;
    aMoveLeft: TAction;
    aMoveRight: TAction;
    aSaveToolbar: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    aEditBtn: TAction;
    ToolButton9: TToolButton;
    bbtnAdd: TBitBtn;
    bbtnRemove: TBitBtn;
    bbtnRename: TBitBtn;
    aAddToolbar: TAction;
    aRemoveToolbar: TAction;
    aRenameToolbar: TAction;
    bbtnhighlighter: TBitBtn;
    aHighlighterToolbar: TAction;
    cbCRtoCRLF: TCheckBox;
    cbTagReplaceCode: TCheckBox;
    Label17: TLabel;
    cbLFtoCRLF: TCheckBox;
    cbshowcaret: TCheckBox;
    procedure FontClick(Sender: TObject);
    procedure btnCustomSynClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditCompleteClick(Sender: TObject);
    procedure btnFileAssocClick(Sender: TObject);
    procedure btnEdFontClick(Sender: TObject);
    procedure btnSaveKSClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnDefKSClick(Sender: TObject);
    procedure lbKeysClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure vlistSyntaxDblClick(Sender: TObject);
    procedure btnHelpFileClick(Sender: TObject);
    procedure btnEXEClick(Sender: TObject);
    procedure btnAddHelpClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure bitbtnsetrepdirClick(Sender: TObject);
    procedure btnAddHLClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure lbToolbarsClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure aAddBtnExecute(Sender: TObject);
    procedure aSaveToolbarExecute(Sender: TObject);
    procedure aEditBtnExecute(Sender: TObject);
    procedure aDelBtnExecute(Sender: TObject);
    procedure aMoveRightExecute(Sender: TObject);
    procedure aMoveLeftExecute(Sender: TObject);
    procedure aAddToolbarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure aRemoveToolbarExecute(Sender: TObject);
    procedure aRenameToolbarExecute(Sender: TObject);
    procedure aHighlighterToolbarExecute(Sender: TObject);
  private
    { DONE 5 -cBasic : Add Save\Load Options from ini file }
    skey: TSynEditKeyStrokes;
    setting: TiniFile;
    displaydone: boolean;
    bufCusSynExt: TStringList;
    bufHLSaved: boolean;
    bufToolbars: TStringList;
    tbars: TNSToolbars;
    tCurbar: TNSToolbar;
    tCurBtn: TNSButton;
    fCurBtnName: String;
    fCachebars: TNSToolbars;
    FActMan: TActionManager;
    ftoolbarchanged: boolean;
    fhighlighterchanged: boolean;
    function GetEditSmallFile: Boolean;
    function GetLineFetch: integer;
    function GetMax: Boolean;
    function GetShowEditLongPlay: boolean;
    procedure ShowSyntaxOpts;
    procedure ShowCustomSyntaxOpts;
    procedure DisplayCurTbar;
    function GetFilterName( Filter : String ): String;
    function GetCompleteProposal( Highlighter: TSynCustomHighlighter): string;
    function InitCompleteProposal( ComP: TSynCompletionProposal; Highlighter: TSynCustomHighlighter): boolean;

    procedure InitKeyStrokes( OverrideDef: Boolean );
    function LoadKeyStrokes( filename: String ): boolean;
    function SaveKeyStrokes( filename: String ): boolean;
    procedure DisplayKeyStrokes;
    procedure SaveCurrentKeyStroke;
    function GetCurrentKSIndex: integer;
    procedure LoadCommands;
    function GetCommandName( Name: String ): String;
    function GetUnicodeRead: Boolean;
    function GetRepositoryDir: String;
    function GetBackBuffers: integer;

    function HLToolBarAdd: string;
    function HLToolBarRemove(item: string): boolean;

    procedure LoadCustomHList;
    procedure SetMax(const Value: Boolean);
    function GetCRtoCRLF: boolean;
    function GetTagReplaceCodeRep: boolean;
    function GetLFtoCRLF: boolean;
    { Private declarations }
  public
    { Public declarations }
    //Save Setting for other forms
    procedure LoadOptions;
    procedure SaveOptions;

    procedure SaveSetting(Section, Name: String; Value: String); overload;
    procedure SaveSetting(Section, Name: String; Value: integer); overload;
    procedure SaveSetting(Section, Name: String; Value: Boolean); overload;
    function GetSetting(Section, Name: String; Value: String): String; overload;
    function GetSetting(Section, Name: String; Value: integer): integer; overload;
    function GetSetting(Section, Name: String; Value: Boolean): boolean; overload;

    procedure SetEditorOptions( Editor: TSynEdit );
    function IsSmallFile(Filename: String): Boolean;

    procedure GetHighlighterList( var List: TStringList );
    procedure GetCustomHighlighterList( var List: TStringList );
    procedure GetHighlighterFilterList( var List: TStringList );
    procedure GetToolbarsForHighlighter( HLName: string; var List: TStringList );

    function GetSyntaxHighlighter(Filename: String): TSynCustomHighlighter;
    function GetCustomSyntaxHighlighter(Filename: String): TSynCustomHighlighter;

    procedure SetSyntaxHighlighter(LEFile: TLEFile; Filename: String; var found: boolean);
    procedure SetCustomSyntaxHighlighter(LEFile: TLEFile; Filename: String; var found: boolean);

    function GetSyntaxHighlighterByName(AName: String): TSynCustomHighlighter;
    function GetCustomSyntaxHighlighterByName(AName: String): TSynCustomHighlighter;

    procedure SetSyntaxHighlighterByName(LEFile: TLEFile; AName: String; var found: boolean);
    procedure SetCustomSyntaxHighlighterByName(LEFile: TLEFile; AName: String; var found: boolean);

    function GetAutoComplete(Highlighter: TSynCustomHighlighter): string;
    function SetCompletePropos(ComP: TSynCompletionProposal; Highlighter: TSynCustomHighlighter): boolean;
    function AddExtToHighlighter(Highlighter: TSynCustomHighlighter; Ext: String): boolean;
    function GetHighlighterHelp(Highlighter: TSynCustomHighlighter): String;
    function GetHighlighterDir(): String;

    function GetExtraFileFilters: String;
    function GetAllFileTypes: String;
    function GetFileTypesFromFilter( Filter : String ): String;
    function GetCustomFileTypesFromFilter( Filter : String ): String;
    function CreateFileAssociations(Ext: String; AssocText: boolean = false ): boolean;
    function CreateFileAssociationsEx(ext, prog, desc, icon: string): boolean;

    function GetHelpCount: integer;
    procedure GetHelp( index: integer; var nme, vle: String);
    function GetHelpDir( index: integer ): string;

    function ShouldWordWrap(filename: String): boolean;

    procedure OnCustomToolAction(Sender: TObject);
    procedure SetActionManager( actman: TActionManager );
    procedure LoadToolbars;
    function GetToolbar(name: string): boolean;
    procedure PressLastButton;
    procedure PressButton(name: string);
    property ToolbarChanged: boolean read ftoolbarchanged;
    property HighlighterChanged: boolean read fhighlighterchanged;

    property EditSmallFile: Boolean read GetEditSmallFile;
    property LineFetch: integer read GetLineFetch;
    property BackBuffers: integer read GetBackBuffers;
    property StartMax: Boolean read GetMax write SetMax;
    property UnicodeRead: Boolean read GetUnicodeRead;
    property CRtoCRLF: boolean read GetCRtoCRLF;
    property LFtoCRLF: boolean read GetLFtoCRLF;
    property TagReplaceCodeRep: boolean read GetTagReplaceCodeRep;
    property ShowEditLongPlay: boolean read GetShowEditLongPlay;
    property KeyStrokes: TSynEditKeyStrokes read skey;

    property RepositoryDir: String read GetRepositoryDir;
  end;

var
  fopts: Tfopts;

const
  scIniSetting = 'Settings';

implementation

uses variants,
      unitUtils,
      dlgHightlightEdit,
      dlgEditCodeCompletion,
      dlgToolButton,
      dlgToolbar,
      dlgManageList,
      dlgSelectList,
      vcl_util,
      FileCtrl,
      menus, frmImages;

const
  scKeyStrokeFile = 'lgkeys.lks';
  scDefHighlightDir = 'Highlighters';  

{$I ns.inc}

{$R *.DFM}

{ Tfopts }

procedure Tfopts.SetEditorOptions(Editor: TSynEdit);
begin
  Editor.Gutter.Visible := cbUseGutter.Checked;
  Editor.Gutter.ShowLineNumbers := cbGLineNums.Checked;
  Editor.Gutter.LeadingZeros := cbGLeadZero.Checked;
  Editor.Gutter.ZeroStart := cbGZeroStart.Checked;
  Editor.Gutter.UseFontStyle := cbGUseFont.Checked;
  Editor.Gutter.Font := fdGutter.Font;
  Editor.Gutter.DigitCount := StrToIntDef(edtGDigCount.Text,8);
  Editor.Gutter.LeftOffset := StrToIntDef(edtGLeftOff.Text,16);
  Editor.Gutter.RightOffset := StrToIntDef(edtGRightOff.Text,2);
  Editor.RightEdge := StrToIntDef(edtrightedge.Text,80);
  Editor.AlwaysShowCaret := cbshowcaret.Checked;

  if cbSmartTabs.Checked then
    Editor.Options := Editor.Options + [eoSmartTabs]
  else
    Editor.Options := Editor.Options - [eoSmartTabs];

  if cbusetabs.Checked then
    Editor.Options := Editor.Options + [eoTabIndent]
  else
    Editor.Options := Editor.Options - [eoTabIndent];

  if cbtabspaces.Checked then
    Editor.Options := Editor.Options + [eoTabsToSpaces]
  else
    Editor.Options := Editor.Options - [eoTabsToSpaces];

  if cbtabspaces.Checked then
    Editor.Options := Editor.Options + [eoTabsToSpaces]
  else
    Editor.Options := Editor.Options - [eoTabsToSpaces];

  if cbscrolleol.Checked then
    Editor.Options := Editor.Options + [eoScrollPastEol]
  else
    Editor.Options := Editor.Options - [eoScrollPastEol];
    

  Editor.MaxUndo := StrToIntDef(edtUndoMax.Text, 5000);
  Editor.TabWidth := StrToIntDef(edtTabWidth.text, 8);
  Editor.Font := fdEditor.Font;
  Editor.Keystrokes := skey;
end;

procedure Tfopts.FontClick(Sender: TObject);
begin
  fdGutter.Execute;
end;

{ OLD CODE I USED TO TRY AND FIND THE FILE SIZE, SEARCHED GOOGLE
  AND FOUND THAT FINDFIRSTFILE IS BETTER TO USE.
  f := CreateFile(PChar(Filename), GENERIC_READ,
    FILE_SHARE_READ + FILE_SHARE_WRITE, sa, OPEN_EXISTING, 0, 0);
  if f = INVALID_HANDLE_VALUE then begin
    FormatMessage(
        FORMAT_MESSAGE_ALLOCATE_BUFFER + FORMAT_MESSAGE_FROM_SYSTEM,
        nil,
        GetLastError,
        0,
        PChar(lpMsgBuf),
        0,
        nil
    );

    // Display the string.
    MessageBox( NULL, PChar(lpMsgBuf), 'GetLastError', MB_OK+MB_ICONINFORMATION );
    result := cbDefSmall.checked;
    exit;
    end;
  try
    dwSize := GetFileSize(f, hs);
    if (dwSize = INVALID_FILE_SIZE) and (GetLastError <> NO_ERROR) then
      result := cbDefSmall.checked
    else begin
      sizelim := StrToIntDef(edtSmallFileLim.Text, 2000000);
      sizelim := sizelim * 1000;
      if hs^ <> null then
        fsize := StrToInt(IntToStr(dwSize) + IntToStr(hs^))
      else
        fsize := dwSize;
      if fSize <= sizelim then
        result := true
      else
        result := false;
    end;
  finally
    CloseHandle(f);
  end;
}
function Tfopts.IsSmallFile(Filename: String): Boolean;
var
  dwSize: Word;
  hs: PWord;
  f: integer;
  sizelim, fsize: longword;
  sa: PSecurityAttributes;
  lpMsgBuf: String;
begin
  fsize := 0;
  if length(filename) > 0 then fsize := GetSizeOfFile(filename);
  sizelim := StrToIntDef(edtSmallFileLim.Text,2000000);
  if fsize <= 0 then
    result := cbDefSmall.checked
  else begin
    if fSize >= sizelim then
      result := false
    else
      result := true;
  end;
end;

function Tfopts.GetEditSmallFile: Boolean;
begin
  result := cbEditSmall.Checked;
end;

function Tfopts.GetLineFetch: integer;
begin
  result := StrToIntDef(edtDefLines.Text, 1000);
end;

function Tfopts.GetMax: Boolean;
begin
  result := cbMax.Checked;
end;

function Tfopts.GetShowEditLongPlay: boolean;
begin
  result := true; //cbMacEditShow.Checked;
end;

procedure Tfopts.ShowSyntaxOpts;
var
  i: integer;
  val, nme: String;
begin
  vlistSyntax.Strings.Clear;
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
        val := GetFileTypesFromFilter(DefaultFilter);
//          nme := GetFilterName(DefaultFilter);
        nme := GetLanguageName;
//          vlistSyntax.Strings.Add(nme+'='+val);
        vlistSyntax.Strings.AddObject(nme+'='+val, TObject(i));
      end;
    end;
  end;
  ShowCustomSyntaxOpts;
end;

function Tfopts.GetSyntaxHighlighter(Filename: String): TSynCustomHighlighter;
var
  types, ext: String;
  i: integer;
begin
  result := nil;
  ext := ExtractFileExt(Filename);
  //Add Skip exts
  if (pos(ext, edtAutoScanIgnore.Text) > 0) then exit;

  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
          if pos(lowercase(ext),lowercase(DefaultFilter)) > 0 then begin
            result := TSynCustomHighlighter(self.Components[i]);
            break;
            end;
      end;
    end;
  end;
  if not(assigned(result)) then
    result := GetCustomSyntaxHighlighter(Filename);
end;

function Tfopts.GetFileTypesFromFilter(Filter: String): String;
var
  px: integer;
begin
  px := Pos('|', Filter);
  if px = 0 then
    result := filter
  else
    result := Copy(Filter,px+1, length(filter));
end;

function Tfopts.GetFilterName(Filter: String): String;
var
  px: integer;
begin
  px := Pos('|', Filter);
  if px = 0 then
    result := filter
  else
    result := Copy(Filter,0 , px-1);
end;

procedure Tfopts.btnCustomSynClick(Sender: TObject);
var
  idx: integer;
  dlg: TdlgHighlightEditor;
  nme: String;
  //syndes: TSynUniDesigner;
begin
  //Dialog to customize
  if (vlistsyntax.Row -1) < 0 then begin
    showmessage('You must select a highlighter first');
    exit;
  end;

  idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
  nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
  if (idx >= 0) then begin
    //Native Syntax Highlighter
    if Components[idx] is TSynCustomHighlighter then begin

      dlg := TdlgHighlightEditor.Create(self);
      try
        dlg.MasterSyn := Components[idx] as TSynCustomHighlighter;
        dlg.MasterSyn.SaveToFile(AppPath+'syntax\Syntax'+dlg.MasterSyn.Name+'.syn');
        if dlg.ShowModal = mrOK then begin
          dlg.MasterSyn.SaveToFile(AppPath+'syntax\Syntax'+dlg.MasterSyn.Name+'.syn');
          fhighlighterchanged := true;
          end
        else begin
          if FileExists(AppPath+'syntax\Syntax'+dlg.MasterSyn.Name+'.syn') then
            dlg.MasterSyn.LoadFromFile(AppPath+'syntax\Syntax'+dlg.MasterSyn.Name+'.syn');
          end;
      finally
        dlg.Free;
        end;

    end
  end
  else begin
    //Custom Hightlighter, Load File
      //ExecuteFile(GetHighlighterDir + '\UniEdit.exe', '"' + GetHighlighterDir + '\' + nme + '.hgl"');
      ExecuteFile(GetHighlighterDir + '\UniDesigner.exe', '"' + GetHighlighterDir + '\' + nme + '.hgl"');
      fhighlighterchanged := true;
      {CustomHighlighter.LoadFromFile(GetHighlighterDir + '\' + nme + '.hgl');
      syndes := TSynUniDesigner.Create(CustomHighlighter);
      if syndes.Execute then
        CustomHighlighter.SaveToFile(GetHighlighterDir + '\' + nme + '.hgl');
      syndes.Free; }
    //showmessage('Unable to locate selected highlighter');
    end;
end;

function Tfopts.GetExtraFileFilters: String;
var
  i: integer;
begin
  result := '';
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      with Components[i] as TSynCustomHighlighter do begin
        result := result + '|' + DefaultFilter;
      end;
    end;
  end;
end;

procedure Tfopts.LoadOptions;
var
  i, j, cnt: integer;
  synfile: string;
  sec, val: string;
  txt, vle: string;
begin
  //Load ini File settings
  sec := scIniSetting;

  //Load Customized Syntax
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
        synfile := AppPath+'syntax\Syntax'+Name+'.syn';
        if fileexists(synFile) then
          LoadFromFile(synfile);

        //Added to get and save filter list
        if setting.ValueExists(sec, Name+'_DefaultFilter') then begin
          val := setting.ReadString(sec, Name+'_DefaultFilter',DefaultFilter);
          if length(val) > 0 then
            DefaultFilter := val;
          end;
      end;
    end;
  end;
  //***************

  for i := 0 to ComponentCount -1 do begin
    if Components[i].Tag = 1 then continue;
    if Components[i] is TEdit then begin
      with Components[i] as TEdit do begin
        Text := setting.ReadString(sec, Name, Text);
      end;
    end;
    if Components[i] is TCheckBox then begin
      with Components[i] as TCheckBox do begin
        Checked := setting.ReadBool(sec, Name, Checked);
      end;
    end;
    if Components[i] is TFontDialog then begin
      with Components[i] as TFontDialog do begin
        Font.Size := setting.ReadInteger(sec, Name+'_size', Font.Size);
        Font.Name := setting.ReadString(sec, Name+'_name', Font.Name);
        if setting.ReadBool(sec, Name+'_style_bold', (fsBold in Font.Style)) then
          Font.Style := Font.Style + [fsBold];
        if setting.ReadBool(sec, Name+'_style_italic', (fsItalic in Font.Style)) then
          Font.Style := Font.Style + [fsItalic];
        if setting.ReadBool(sec, Name+'_style_underline', (fsUnderline in Font.Style)) then
          Font.Style := Font.Style + [fsUnderline];
        if setting.ReadBool(sec, Name+'_style_strikeout', (fsStrikeOut in Font.Style)) then
          Font.Style := Font.Style + [fsStrikeOut];
        font.Color := setting.ReadInteger(sec, Name+'_color', font.Color);
      end;
    end;
   if Components[i] is TValueListEditor then begin
      with Components[i] as TValueListEditor do begin
        strings.Clear;
        cnt := setting.ReadInteger(sec+Name, 'Count', 0);
        for j := 0 to cnt - 1 do begin
          txt := setting.ReadString(sec+Name, 'Name'+IntToStr(j), '');
          vle := setting.ReadString(sec+Name, 'Value'+IntToStr(j), '');
          if length(txt) > 0 then
            strings.Add(txt + '=' + vle);
        end;
      end
   end
  end;
end;

procedure Tfopts.FormCreate(Sender: TObject);
begin
  setting := TiniFile.Create(AppPath+'config.ini');
  FActMan := CustomActions;
  skey := TSynEditKeyStrokes.Create(self);
  InitKeyStrokes( false );
  LoadKeyStrokes(Apppath+scKeyStrokeFile);
  LoadCommands;
  LoadOptions;
  PageControl1.ActivePage := TabSheet1;
  displaydone := false;
  bufHLSaved := false;
  bufCusSynExt := TStringList.Create;
  if not GetBufferedList(bufCusSynExt, AppPath+'highlighters.cache', 1) then begin
    LoadCustomHList;
  end
end;

function Tfopts.GetAutoComplete(
  Highlighter: TSynCustomHighlighter): string;
begin
  if fileexists(AppPath+'syntax\AutoCom'+Highlighter.Name+'.acp') then
    result := AppPath+'syntax\AutoCom'+Highlighter.Name+'.acp'
  else
    result := '';
end;

function Tfopts.GetCompleteProposal(
  Highlighter: TSynCustomHighlighter): string;
begin
//  if fileexists(AppPath+'ComPro'+Highlighter.Name+'.cmp') then
  if Highlighter is TSynUniSyn then begin
    with Highlighter as TSynUniSyn do
      result := AppPath+'syntax\ComPro'+ChangeFileExt( ExtractFileName(TSynUniSyn(Highlighter).FileName), '.cmp')
      //result := AppPath+'syntax\ComPro'+info.General.Name +'.cmp'
    end
  else
    result := AppPath+'syntax\ComPro'+Highlighter.Name+'.cmp';
//  else
//    result := '';
end;

procedure Tfopts.btnEditCompleteClick(Sender: TObject);
var
  dlgec: TdEditComplete;
  idx: integer;
  nme: string;
begin
  //Dialog to customize
  if (vlistsyntax.Row -1) < 0 then begin
    showmessage('You must select a highlighter first');
    exit;
  end;

  idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
  nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
  if (idx < 0) then begin
    CustomHighlighter.LoadFromFile(GetHighlighterDir + '\' + nme + '.hgl');
    //EditAutoCompleteFile
    dlgec := TdEditComplete.Create(self);
    try
      dlgec.Language := CustomHighlighter.Info.General.Name;
      dlgec.CompleteFile := GetCompleteProposal(CustomHighlighter as TSynCustomHighlighter);
      if dlgec.ShowModal = mrOK then begin
        dlgec.SaveToFile;
        fhighlighterchanged := true;
        end;
    finally
      dlgec.Free;
    end;

  end
  else if Components[idx] is TSynCustomHighlighter then begin

    //EditAutoCompleteFile
    dlgec := TdEditComplete.Create(self);
    try
      dlgec.Language := TSynCustomHighlighter(Components[idx]).GetLanguageName;
      dlgec.CompleteFile := GetCompleteProposal(Components[idx] as TSynCustomHighlighter);
      if dlgec.ShowModal = mrOK then
        dlgec.SaveToFile;
    finally
      dlgec.Free;
    end;

  end
  else
    showmessage('Unable to locate selected highlighter');
end;

function Tfopts.SetCompletePropos(ComP: TSynCompletionProposal; Highlighter: TSynCustomHighlighter): boolean;
var
  txt: String;
  CodeComplete: TCompletionProposal;
begin
  txt := GetCompleteProposal(Highlighter);
//  if length(txt) <= 0 then //exit;
//    txt := AppPath+'syntax\ComPro'+Highlighter.Name+'.cmp';
  if Highlighter is TSynUniSyn then begin
    with Highlighter as TSynUniSyn do
      CodeComplete := TCompletionProposal.Create(txt, info.General.Name);
    end
  else
    CodeComplete := TCompletionProposal.Create(txt, Highlighter.GetLanguageName);
    
  try
    Comp.Options := [scoUseInsertList, scoUseBuiltInTimer, scoLimitToMatchedText, scoEndCharCompletion, scoCompleteWithTab, scoCompleteWithEnter];
    if CodeComplete.Match then Comp.Options := Comp.Options + [scoLimitToMatchedText];
    if CodeComplete.CaseSen then Comp.Options := Comp.Options + [scoCaseSensitive];
    Comp.InsertList.Text := CodeComplete.InsertList.Text;
    Comp.ItemList.Text := CodeComplete.ItemList.Text;
    Comp.Title := CodeComplete.Title;
    comp.TimerInterval := CodeComplete.Timer;
    Comp.TriggerChars := CodeComplete.Triggers;
    if CodeComplete.UseTimer then
      Comp.Options := Comp.Options + [scoUseBuiltInTimer]
    else
      Comp.Options := Comp.Options - [scoUseBuiltInTimer];
    Comp.EndOfTokenChr := CodeComplete.Tokens;
    if CodeComplete.UseTriggerLength then
      Comp.Tag := CodeComplete.TriggerLength
    else
      Comp.Tag := 0;
  finally
    codeComplete.Free;
  end;
end;

function Tfopts.InitCompleteProposal(ComP: TSynCompletionProposal;
  Highlighter: TSynCustomHighlighter): boolean;
var
  i: integer;
begin
//  for i := low(highlighter.IdentChars) to high(highlighter.IdentChars) do begin
//    Comp.ItemList.Add(highlighter.IdentChars[i])
//  end;
end;

procedure Tfopts.btnFileAssocClick(Sender: TObject);
var
  idx: integer;
  nme, val: String;
  mrs: word;
begin
  //Association Files
  { DONE 3 -otobrien -cExtras : If no highligher selected confirm to associate all file types of all highlighters }
  mrs := MessageDlg('Are you sure you want to association files to ' + scFriendlyName + '?, click Ok to associate selected files or All to associate all files.', mtConfirmation, [mbAll, mbOk, mbCancel], 0);
  if mrs = mrAll then begin
    val := GetAllFileTypes;
  end
  else if mrs = mrOk then begin
    if (vlistsyntax.Row -1) < 0 then
      showmessage('You must select a highlighter first')
    else begin
      idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
      nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
      if (idx < 0) then begin
        CustomHighlighter.LoadFromFile(GetHighlighterDir+'\'+nme+'.hgl');
        val := GetCustomFileTypesFromFilter(CustomHighlighter.Info.General.Extensions);
      end
      else if Components[idx] is TSynCustomHighlighter then begin
        with Components[idx] as TSynCustomHighlighter do begin
          val := GetFileTypesFromFilter(DefaultFilter);
        end;
      end
      else begin
        showmessage('Unable to locate selected highlighter');
        exit;
        end;
    end;
  end
  else
    exit;

  if not CreateFileAssociations(val) then
    Showmessage('Error creating file associations');

  if MessageDlg('Would you like to associate text file too', mtConfirmation, [mbyes, mbno],0) = mrYes then
    CreateFileAssociations('*.txt', true);

end;

function Tfopts.GetAllFileTypes: String;
var
  val: String;
  i: integer;
begin
  val := '';
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      with Components[i] as TSynCustomHighlighter do begin
          val := val + GetFileTypesFromFilter(DefaultFilter) + ';';
      end;
    end;
  end;
  result := val;
end;


function Tfopts.CreateFileAssociations(Ext: String; AssocText: boolean = false): boolean;
var
  i: integer;
  fass: TFileAssoc;
  extlist, alltypes: TStringList;
  val, allfts: String;
begin
  result := false;
  extList := SplitStr(Ext,';');
  try
    fass := TFileAssoc.Create;
    try
        //Setup Program Registion
//          if not fass.LoadProgram(scMyProgram)then begin
        fass.CreateProgram(scMyProgram, scMyProgramDescr, AppPath+scMyIcon);
        //Create Application shell exts
        fass.AddShellExt('open', '"'+Application.ExeName+'" "%1"');
        fass.AddShellExt('print', '"'+Application.ExeName+'" /p "%1"');
        fass.AddShellExt('edit', '"'+Application.ExeName+'" /e "%1"');

        //Take Over txtfile association
        if AssocText then begin
          fass.AddShellExtEx('txtfile', 'open', '"'+ Application.ExeName+'" "%1"');
          fass.AddShellExtEx('txtfile', 'print', '"'+Application.ExeName+'" /p "%1"');
          fass.AddShellExtEx('txtfile', 'edit', '"'+ Application.ExeName+'" /e "%1"');
          fass.AddFileType('.txt');
          fass.AddFileType('.dat');
          fass.AddFileType('.csv');
        end;

        //Add Application to Open with list
        { TODO 5 -oDev -cFile Assoc : Switch GetAllFileTypes to buffered list of extenions }
        allfts := GetAllFileTypes;
        alltypes := SplitStr(allfts,';');
        try
          //Add Edit\OpenWith to context menu
          for i := 0 to alltypes.Count - 1 do begin
            fass.AddFileTypeEdit(StringReplace(alltypes[i],'*', '', [rfReplaceAll]), '"'+Application.ExeName+'" /e "%1"');
            fass.AddToOpenWithList(StringReplace(alltypes[i],'*', '', [rfReplaceAll]));
          end;
          //Register App
          fass.RegisterProgram(scFriendlyName, '"'+Application.ExeName+'" /a "%1"', alltypes);
        finally
          alltypes.Free;
          end;
//          end;

      //Association Select Files type to Large edit
      for i := 0 to extlist.Count - 1 do begin
        fass.AddFileType(StringReplace(extlist[i],'*', '', [rfReplaceAll]));
      end;

      //Tell Windows to update it self
      fass.UpdateSystem;
    finally
      fass.Free;
    end;
  finally
    extlist.Free;
  end;
  result := true;
end;

procedure Tfopts.btnEdFontClick(Sender: TObject);
begin
  fdEditor.Execute;
end;

function Tfopts.LoadKeyStrokes(filename: String): boolean;
var
  fs: TFileStream;
begin
  result := false;
  if not FileExists(Filename) then exit;
  fs := TFileStream.Create(Filename, fmOpenReadWrite);
  try
    skey.LoadFromStream(fs);
  finally;
    fs.Free;
  end;
  result := true;
end;

function Tfopts.SaveKeyStrokes(filename: String): boolean;
var
  fs: TFileStream;
begin
  result := false;
  fs := TFileStream.Create(Filename, fmOpenReadWrite);
  try
    skey.SaveToStream(fs);
  finally;
    fs.Free;
  end;
  result := true;
end;

procedure Tfopts.InitKeyStrokes( OverrideDef: Boolean );
var
  fs: TFileStream;
  mde: Word;
begin
  mde := fmCreate;
  if (FileExists(Apppath+scKeyStrokeFile)) and (not OverrideDef) then exit;
  if FileExists(Apppath+scKeyStrokeFile) then mde := fmOpenReadWrite;
  skey.ResetDefaults;
  fs := TFileStream.Create(Apppath+scKeyStrokeFile, mde);
  try
    skey.SaveToStream(fs);
  finally;
    fs.Free;
  end;
end;

procedure Tfopts.btnSaveKSClick(Sender: TObject);
begin
  SaveCurrentKeyStroke;
  SaveKeyStrokes(Apppath+scKeyStrokeFile);
  DisplayKeyStrokes;
end;

procedure Tfopts.FormDestroy(Sender: TObject);
begin
  skey.Free;
  setting.Free;
end;

procedure Tfopts.btnDefKSClick(Sender: TObject);
begin
  if messageDlg('Are you sure you want to restore defaults?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    InitKeyStrokes(true);
  DisplayKeyStrokes;
end;

procedure Tfopts.DisplayKeyStrokes;
var
  i : integer;
  des, dis: String;
begin
  lbKeys.Clear;
  for i := 0 to skey.Count -1 do begin
    dis := skey[i].DisplayName;
    dis := Copy(dis,3,length(dis));
    lbKeys.Items.AddObject(dis, TOBject(i));
  end;
end;

procedure Tfopts.LoadCommands;
var
  i: integer;
  cm: String;
begin
  cbKSAction.Clear;
  for i := 0 to skey.Count -1 do begin
    cm := EditorCommandToCodeString(skey.Items[i].Command);
    cbKSAction.Items.Add(GetCommandName(cm));
  end;
end;

procedure Tfopts.SaveCurrentKeyStroke;
var
  sc: TShortCut;
  idx: integer;
begin
  if lbKeys.ItemIndex = -1 then begin Showmessage('Select Keystroke first'); exit; end;
  idx := GetCurrentKSIndex;
  sc := TextToShortCut(edtKS.Text);
  skey.Items[idx].ShortCut := sc;
  skey.Items[idx].Command := ConvertCodeStringToCommand('ec'+cbKSAction.Text);
end;

function Tfopts.GetCommandName(Name: String): String;
begin
    result := Copy(name,3,length(name));
end;

procedure Tfopts.lbKeysClick(Sender: TObject);
var
  cm: String;
  i, idx: integer;
begin
  if lbKeys.ItemIndex = -1 then begin Showmessage('Select Keystroke first'); exit; end;
  idx := GetCurrentKSIndex;
  cm := EditorCommandToCodeString(skey.Items[idx].Command);
  i := cbKSAction.Items.IndexOf(GetCommandName(cm));
  if i >= 0 then cbKSAction.ItemIndex := i;
  edtKS.Text := ShortCutToText(skey.Items[idx].ShortCut);
end;

function Tfopts.GetCurrentKSIndex: integer;
begin
  if lbKeys.ItemIndex = -1 then begin Showmessage('Select Keystroke first'); exit; end;
  result := Integer(lbKeys.Items.Objects[lbKeys.ItemIndex]);
end;

procedure Tfopts.SaveOptions;
var
  i,j: integer;
  sec, val: string;
begin
  sec := scIniSetting;
  for i := 0 to ComponentCount -1 do begin
    if Components[i].Tag = 1 then continue;

    //Added to get and save filter list
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
        setting.WriteString(sec, Name+'_DefaultFilter',DefaultFilter);
      end;
    end;

    if Components[i] is TEdit then begin
      with Components[i] as TEdit do begin
        setting.WriteString(sec, Name, Text);
      end;
    end;
    if Components[i] is TCheckBox then begin
      with Components[i] as TCheckBox do begin
        setting.WriteBool(sec, Name, Checked);
      end;
    end;
    if Components[i] is TFontDialog then begin
      with Components[i] as TFontDialog do begin
        setting.WriteInteger(sec, Name+'_size', Font.Size);
        setting.WriteString(sec, Name+'_name', Font.Name);
        setting.WriteBool(sec, Name+'_style_bold', (fsBold in Font.Style));
        setting.WriteBool(sec, Name+'_style_italic', (fsItalic in Font.Style));
        setting.WriteBool(sec, Name+'_style_underline', (fsUnderline in Font.Style));
        setting.WriteBool(sec, Name+'_style_strikeout', (fsStrikeOut in Font.Style));
        setting.WriteInteger(sec, Name+'_color', font.Color);
      end;
    end;

   if Components[i] is TValueListEditor then begin
      with Components[i] as TValueListEditor do begin
        setting.WriteInteger(sec+Name, 'Count', strings.Count);
        for j := 0 to strings.Count - 1 do begin
          setting.WriteString(sec+Name, 'Name'+IntToStr(j), strings.Names[j]);
          setting.WriteString(sec+Name, 'Value'+IntToStr(j), strings.Values[strings.Names[j]]);
        end;
      end
   end

  end;
end;

procedure Tfopts.Button1Click(Sender: TObject);
begin
  SaveOptions;
  if ftoolbarchanged then begin
    fCachebars.Free; //Destroy toolbar cache for callers
    fCachebars := nil;
  end;
end;

procedure Tfopts.GetHighlighterList(var List: TStringList);
var
  i: integer;
  nme: String;
begin
  List.Clear;
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
          nme := GetLanguageName;
          List.Add(nme);
      end;
    end;
  end;
  GetCustomHighlighterList(list);
end;

procedure Tfopts.GetHighlighterFilterList(var List: TStringList);
var
  i: integer;
  val, nme: String;
begin
  List.Clear;
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      with Components[i] as TSynCustomHighlighter do begin
          val := GetFileTypesFromFilter(DefaultFilter);
          nme := GetLanguageName;
          List.Add(nme+'='+val);
      end;
    end;
  end;
end;

function Tfopts.GetSyntaxHighlighterByName(
  AName: String): TSynCustomHighlighter;
var
  types, nme: String;
  i: integer;
begin
  result := nil;
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
        nme := GetLanguageName;
        if nme = AName then begin
          result := TSynCustomHighlighter(self.Components[i]);
          break;
          end;
      end;
    end;
  end;
  if not(assigned(result)) then
    result := GetCustomSyntaxHighlighterByName(aName);
end;

procedure Tfopts.SaveSetting(Section, Name, Value: String);
begin
  setting.WriteString(Section, Name, Value);
end;

procedure Tfopts.SaveSetting(Section, Name: String; Value: Boolean);
begin
  setting.WriteBool(Section, Name, Value);
end;


function Tfopts.GetSetting(Section, Name: String; Value: String): String;
begin
  result := setting.ReadString(Section, Name, Value)
end;

function Tfopts.GetSetting(Section, Name: String; Value: Boolean): boolean;
begin
  result := setting.ReadBool(Section, Name, Value);
end;

procedure Tfopts.vlistSyntaxDblClick(Sender: TObject);
var
  exts, oldexts, nme, tmpext: String;
  idx: integer;
begin
  //Edit List if file exts
  if (vlistsyntax.Row -1) < 0 then begin
    showmessage('You must select a highlighter first');
    exit;
  end;

  idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
  nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
  if idx < 0 then begin
    //Custom Highlighter
    CustomHighlighter.LoadFromFile(GetHighlighterDir + '\' + nme + '.hgl');
    oldexts := GetCustomFileTypesFromFilter( CustomHighlighter.Info.General.Extensions );
    exts := oldexts;
    if inputquery('Update Extensions', 'Current Extensions', exts) then begin
      tmpext := exts;
      exts := StringReplace(exts, ' ', '', [rfReplaceAll]);
      exts := StringReplace(exts, ';', ' ', [rfReplaceAll]);
      exts := StringReplace(exts, '*', '', [rfReplaceAll]);
      exts := StringReplace(exts, '.', '', [rfReplaceAll]);
      CustomHighlighter.Info.General.Extensions := exts;
      CustomHighlighter.SaveToFile(GetHighlighterDir + '\' + nme + '.hgl');
      vlistSyntax.Values[nme] := tmpext;
      end;
  end
  else if Components[idx] is TSynCustomHighlighter then begin
    with Components[idx] as TSynCustomHighlighter do begin
      oldexts := GetFileTypesFromFilter(DefaultFilter);
      exts := oldexts;
      if inputquery('Update Extensions', 'Current Extensions', exts) then begin
        exts := StringReplace(exts, '|', '', [rfReplaceAll]);
        DefaultFilter := StringReplace(DefaultFilter, oldexts, exts, [rfReplaceAll, rfIgnoreCase]);
        exts := StringReplace(exts, ';', ',', [rfReplaceAll]);
        oldexts := StringReplace(oldexts, ';', ',', [rfReplaceAll]);
        DefaultFilter := StringReplace(DefaultFilter, oldexts, exts, [rfReplaceAll, rfIgnoreCase]);
        vlistSyntax.Values[GetLanguageName] := exts;
        end;
      end;
  end
  else
    showmessage('Unable to locate selected highlighter');

end;

function Tfopts.AddExtToHighlighter(Highlighter: TSynCustomHighlighter;
  Ext: String): boolean;
var
  exts, exnew: String;
begin
  if length(ext) <= 0 then exit;
  with highlighter do begin

    if highlighter is TSynUniSyn then begin
      //Custom Highlighter
      CustomHighlighter.LoadFromFile(TSynUniSyn(Highlighter).Filename);
      //CustomHighlighter.LoadFromFile(GetHighlighterDir + '\' + Highlighter.CommonName + '.hgl');
      exts := TSynUniSyn(Highlighter).Info.General.Extensions;
      exnew := UpperCase( StringReplace(ext, '.', '', [rfReplaceAll]) );
      if pos(exnew, exts) < 0 then begin
        TSynUniSyn(Highlighter).Info.General.Extensions := TSynUniSyn(Highlighter).Info.General.Extensions + ' ' + exnew;
        //DefaultFilter := DefaultFilter + ';*' + ext;
        CustomHighlighter.SaveToFile(TSynUniSyn(Highlighter).Filename);
        //CustomHighlighter.SaveToFile(GetHighlighterDir + '\' + Highlighter.CommonName + '.hgl');
        exts := GetCustomFileTypesFromFilter(TSynUniSyn(Highlighter).Info.General.Extensions);
        vlistSyntax.Values[GetLanguageName] := exts;
        end;
      end
    else begin
      DefaultFilter := DefaultFilter + ';*' + ext;
      exts := GetFileTypesFromFilter(DefaultFilter);
      vlistSyntax.Values[GetLanguageName] := exts;
      end;
  end;
end;

procedure Tfopts.btnHelpFileClick(Sender: TObject);
var
  idx: integer;
  sres, sext, shlp, nme: String;
begin
  //Show Dialog to location help file for highlighter
  if (vlistsyntax.Row -1) < 0 then begin
    showmessage('You must select a highlighter first');
    exit;
  end;

  shlp := '';
  idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
  nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
  if (idx < 0) then begin
      shlp := fopts.GetSetting(nme,'HELPFILE', '');
  end
  else begin
    with Components[idx] as TSynCustomHighlighter do begin
      shlp := fopts.GetSetting(Name,'HELPFILE', '');
    end;
  end;

  odhlp.FileName := ExtractFileName(shlp);
  odhlp.InitialDir := ExtractFilePath( shlp );
  if odhlp.Execute then begin
    sext := UpperCase(ExtractFileExt(odhlp.FileName));
    if not((sext = '.CHM') or (sext = '.HLP')) then begin
      sres := '%currentword%';
      if not inputquery('Execute Parameters', 'Enter ParamString', sres) then sres := '';
    end;

    idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
    nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
    if (idx < 0) then begin
        SaveSetting(nme, 'HELPFILE', odhlp.FileName);
        SaveSetting(nme, 'HELPFILEPAR', sres);
    end
    else if Components[idx] is TSynCustomHighlighter then begin
      with Components[idx] as TSynCustomHighlighter do begin
        SaveSetting(Name, 'HELPFILE', odhlp.FileName);
        SaveSetting(Name, 'HELPFILEPAR', sres);
      end;
    end;
  end;
end;

function Tfopts.GetHighlighterHelp(
  Highlighter: TSynCustomHighlighter): String;
begin
  Result := GetSetting('HELP',Highlighter.Name, '')
end;

procedure Tfopts.btnEXEClick(Sender: TObject);
var
  idx: integer;
  sres, sext, sexe, nme: String;
  getrs: boolean;
begin
  //Show Dialog to enter execution for highlighter
  if (vlistsyntax.Row -1) < 0 then begin
    showmessage('You must select a highlighter first');
    exit;
  end;

  sexe := '';
  idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
  nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
  if (idx < 0) then begin
    sexe := fopts.GetSetting(nme,'EXEFILE', '');
  end
  else begin
    with Components[idx] as TSynCustomHighlighter do begin
      sexe := fopts.GetSetting(Name,'EXEFILE', '');
    end;
  end;

  odEXE.FileName := ExtractFileName(sexe);
  odEXE.InitialDir := ExtractFilePath( sexe );
  if odEXE.Execute then begin
    sext := UpperCase(ExtractFileExt(odEXE.FileName));
    sres := '"%1"';
    inputquery('Execute Parameters', 'Enter ParamString', sres);

    getrs := MessageDlg('Is this program DOS based?', mtInformation, [mbyes, mbno], 0) = mrYes;

    idx := integer(vlistSyntax.Strings.Objects[vlistsyntax.Row-1]);
    nme := vlistSyntax.Strings.Names[vlistsyntax.Row-1];
    if idx < 0 then begin
        SaveSetting(nme, 'EXEFILE', odEXE.FileName);
        SaveSetting(nme, 'EXEFILEPAR', sres);
        SaveSetting(nme, 'EXEFILEDOS', getrs);
    end
    else if Components[idx] is TSynCustomHighlighter then begin
      with Components[idx] as TSynCustomHighlighter do begin
        SaveSetting(Name, 'EXEFILE', odEXE.FileName);
        SaveSetting(Name, 'EXEFILEPAR', sres);
        SaveSetting(Name, 'EXEFILEDOS', getrs);
      end;
    end;
  end;
end;

procedure Tfopts.btnAddHelpClick(Sender: TObject);
var
  nme, fle: string;
  idx: integer;
begin
  //Add Help File
  if MessageDlg('Do you wish to use a URL?', mtInformation, [mbyes, mbno], 0) = mrYes then begin
    fle := inputbox('Add Help file', 'Enter URL', '');
    nme := inputbox('Add Help file', 'Enter Help Name', '');
    lveHelp.Strings.Add(nme + '=' + fle);
    end
  else if odhlp.Execute then begin
    nme := inputbox('Add Help file', 'Enter Help Name', '');
    if length(nme) <= 0 then nme := ExtractFileName(odhlp.FileName);
    lveHelp.Strings.Add(nme + '=' + odhlp.FileName);
  end;
end;

procedure Tfopts.Button4Click(Sender: TObject);
begin
  if (lveHelp.Row) < 0 then begin
    showmessage('You must select a help file first');
    exit;
  end;
  lveHelp.DeleteRow(lveHelp.Row);
end;

procedure Tfopts.GetHelp(index: integer; var nme, vle: String);
begin
  nme := lveHelp.Strings.Names[index];
  vle := lvehelp.Strings.Values[lveHelp.Strings.Names[index]];
end;

function Tfopts.GetHelpCount: integer;
begin
  result := lveHelp.Strings.Count;
end;

function Tfopts.GetHelpDir(index: integer): string;
begin
  result := lvehelp.Strings.Values[lvehelp.Strings.Names[index]];
end;

function Tfopts.GetUnicodeRead: Boolean;
begin
  result := cbUnicode.Checked;
end;

procedure Tfopts.bitbtnsetrepdirClick(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Select Repository Directory', '', Dir) then
    edtRepositdir.Text := Dir;
end;

function Tfopts.GetRepositoryDir: String;
var
  redir: string;
  idx: integer;
  lst: string;
begin
  redir := edtRepositdir.text;
  if length(redir) > 0 then begin
    idx := length(redir);
    lst := Copy(redir,idx,1);
    if lst <> '\' then
      redir := redir + '\';
  end;
  result := redir;
end;

function Tfopts.GetBackBuffers: integer;
begin
  result := StrToIntDef(edtBackBufs.Text, 5);
end;

function Tfopts.GetSetting(Section, Name: String; Value: integer): integer;
begin
  result := setting.ReadInteger(Section, Name, Value);
end;

procedure Tfopts.SaveSetting(Section, Name: String; Value: integer);
begin
  setting.WriteInteger(Section, Name, Value);
end;

function Tfopts.GetHighlighterDir: String;
begin
  Result := GetSetting('Highlighters','Directory', '');
  if length(result) <= 0 then begin
    result := AppPath + scDefHighlightDir;
    SaveSetting('Highlighters','Directory', result);
    end;
end;

procedure Tfopts.GetCustomHighlighterList(var List: TStringList);
var
  i: integer;
  nme, hldir: String;
  sr: TSearchRec;
  FileAttrs: Integer;
  srchres: integer;
begin
  //List.Clear;
  hldir := GetHighlighterDir + '\*.hgl';
  FileAttrs := faHidden + faSysFile + faArchive + faAnyFile;

  srchres := FindFirst(hldir, FileAttrs, sr);
  if srchres = 0 then begin
    repeat
      if (sr.Attr and faDirectory) = faDirectory then begin
          //Do Nothing
        end
        else begin
          nme := ExtractFileName(sr.Name);
          nme := StringReplace(nme, ExtractFileExt(nme), '', [rfIgnoreCase]);
          List.Add(nme);
        end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

function Tfopts.GetCustomSyntaxHighlighterByName(
  AName: String): TSynCustomHighlighter;
var
  i: integer;
  nme, hldir: String;
  sr: TSearchRec;
  FileAttrs: Integer;
  srchres: integer;
begin
  //USE SOME TYPE OF CACHE OF CUSTOM HIGHLIGHTERS
  //THE DISK ACCESS KILLS THE SPEED AND EATS MEMORY
  //List.Clear;
  result := nil;
  hldir := GetHighlighterDir + '\' + AName + '.hgl';
  if SEditorHL.FileName = hldir then begin
    result := TSynCustomHighlighter(SEditorHL);
    exit;
  end;
  FileAttrs := faHidden + faSysFile + faArchive + faAnyFile;

  srchres := FindFirst(hldir, FileAttrs, sr);
  if srchres = 0 then begin
    SEditorHL.Clear;
    SEditorHL.LoadFromFile(hldir);
    result := TSynCustomHighlighter(SEditorHL);
    FindClose(sr);
  end;

end;

procedure Tfopts.ShowCustomSyntaxOpts;
var
  i: integer;
  nme, hldir, val: String;
  sr: TSearchRec;
  FileAttrs: Integer;
  srchres: integer;
begin
  hldir := GetHighlighterDir + '\*.hgl';
  FileAttrs := faHidden + faSysFile + faArchive + faAnyFile;

  srchres := FindFirst(hldir, FileAttrs, sr);
  if srchres = 0 then begin
    repeat
      if (sr.Attr and faDirectory) = faDirectory then begin
          //Do Nothing
        end
        else begin
          nme := ExtractFileName(sr.Name);
          nme := StringReplace(nme, ExtractFileExt(nme), '', [rfIgnoreCase]);
          CustomHighlighter.LoadFromFile(GetHighlighterDir + '\' + sr.Name);
          val := GetCustomFileTypesFromFilter(trim(CustomHighlighter.Info.General.Extensions));
          vlistSyntax.Strings.AddObject(nme+'='+val, TObject(-1));
        end;
    until FindNext(sr) <> 0;
    FindClose(sr);
    CustomHighlighter.Clear;
  end;
end;

function Tfopts.GetCustomFileTypesFromFilter(Filter: String): String;
var
  i: integer;
  slist: TStringList;
begin
  result := '';
  if length(filter) <= 0 then exit;
  slist := SplitStr(Filter, Chr(32));
  for i := 0 to slist.Count -1 do begin
    result := result + '*.' + slist[i];
    if i < slist.Count - 1 then result := result + ';';
    end;
end;

function Tfopts.GetCustomSyntaxHighlighter(
  Filename: String): TSynCustomHighlighter;
var
  i: integer;
  nme, hldir, val, ext: String;
  sr: TSearchRec;
  FileAttrs: Integer;
  srchres: integer;
  hlfname: string;
  idx: integer;
begin
  result := nil;
  if (assigned(bufCusSynExt)) then begin
    //Scan Buffered list vs slow disk
    for i := 0 to bufCusSynExt.Count -1 do begin
      val := bufCusSynExt[i];
      idx := Pos(Chr(0181), val);
      if (idx > 1) then begin
        hlfname := Copy(val, idx+1, length(val));
        val := Copy(val, 0, idx-1);
        if pos(lowercase(ext),lowercase(val)) > 0 then begin
          SEditorHL.LoadFromFile(hlfname);
          result := TSynCustomHighlighter(SEditorHL);
          break;
          end;
      end;
    end;
    exit; //Once the buffered list has been create, we will never re-scan highlighter folder
  end;
  //Cached and start up
//  else begin
//    bufCusSynExt := TStringList.Create;
//  end;


  hldir := GetHighlighterDir + '\*.hgl';
  ext := ExtractFileExt(Filename);
  FileAttrs := faHidden + faSysFile + faArchive + faAnyFile;

  srchres := FindFirst(hldir, FileAttrs, sr);
  if srchres = 0 then begin
    repeat
      if (sr.Attr and faDirectory) = faDirectory then begin
          //Do Nothing
        end
        else begin
          hlfname := GetHighlighterDir + '\' + sr.Name;
          SEditorHL.LoadFromFile(hlfname);
          val := GetCustomFileTypesFromFilter(trim(SEditorHL.Info.General.Extensions));
          //bufCusSynExt.Add(val + Chr(0181) + hlfname);
          if pos(lowercase(ext),lowercase(val)) > 0 then begin
            result := TSynCustomHighlighter(SEditorHL);
            break;
            end;
        end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure Tfopts.btnAddHLClick(Sender: TObject);
var
  nme, val: string;
//  syndes :TSynUniDesigner;
  stmp: TStringList;
begin
  //Prompt for a Name, Check for unique name in HL dir, same file and open editer
  nme := InputBox('Enter Highlighter Name', 'Highlighter Name:', '');
  if length(nme) <= 0 then exit;
  if vlistSyntax.Strings.IndexOfName(nme) >= 0 then begin
      Showmessage('A highlighter with the name ' + nme + ' has already been defined');
      exit;
    end;
  //CustomHighlighter.Clear;
  //syndes := TSynUniDesigner.Create(CustomHighlighter);
  //syndes.Execute;
  stmp := TStringList.Create;
  stmp.LoadFromFile(AppPath + 'NoName.hgl');
  stmp.SaveToFile(GetHighlighterDir + '\' + nme + '.hgl');
  stmp.Free;
  ExecuteFile(GetHighlighterDir + '\UniDesigner.exe', '"' + GetHighlighterDir + '\' + nme + '.hgl"');
  //CustomHighlighter.SaveToFile(GetHighlighterDir + '\' + nme + '.hgl');
  val := GetCustomFileTypesFromFilter(trim(CustomHighlighter.Info.General.Extensions));
  vlistSyntax.Strings.AddObject(nme+'='+val, TObject(-1));

  DeleteFile(AppPath+'highlighters.cache');
  LoadCustomHList;

  //syndes.Free;
end;

procedure Tfopts.PageControl1Change(Sender: TObject);
begin
  //Display Files List;
  if (PageControl1.ActivePage = TabSheet4) or (PageControl1.ActivePage = TabSheet3) then begin
    if not(displaydone) then begin
      //Display Stuff here
      ShowSyntaxOpts;
      DisplayKeyStrokes;
      displaydone := true;
      end;
  end;
  if (PageControl1.ActivePage = tsToolbars) then begin
    LoadToolbars;
  end;
end;

function Tfopts.CreateFileAssociationsEx(ext, prog, desc, icon: string): boolean;
var
  i: integer;
  fass: TFileAssoc;
  extlist, alltypes: TStringList;
  val, allfts: String;
begin
  result := false;
  fass := TFileAssoc.Create;
  try
    //Setup Program Registion
    fass.CreateProgram(prog, desc, AppPath+icon);
    //Create Application shell exts
    fass.AddShellExt('open', '"'+Application.ExeName+'" "%1"');

    fass.AddFileType(StringReplace(ext,'*', '', [rfReplaceAll]));

    //Tell Windows to update it self
    fass.UpdateSystem;
  finally
    fass.Free;
  end;
  result := true;
end;

procedure Tfopts.LoadToolbars;
var
  i, j: integer;
  acb: TActionBarItem;
  aitem: TActionClientItem;
  action: TAction;
  ico: TIcon;
begin
    if not(assigned(tbars)) then begin
      //Save Time loading toolbars, only load once per session
      tbars := TNSToolbars.Create;
      tbars.LoadToolbars(ExtractFilePath(application.ExeName) + '\toolbars\');
    end;
    lbToolbars.Items.Clear;
    for i := 0 to tbars.ToolbarCount -1 do begin
      lbToolbars.Items.AddObject(tbars.Toolbars[i].Name, tbars.Toolbars[i]);
    end;
    synCustom.Lines.Clear;
end;

function Tfopts.ShouldWordWrap(filename: String): boolean;
var
  ext: string;
begin
  ext := ExtractFileExt(Filename);
  if (pos(ext, edtwordwrapext.Text) > 0) then
    result := true
  else
    result := false;
end;

procedure Tfopts.lbToolbarsClick(Sender: TObject);
begin
  //Draw Toolbar for selected item
  DisplayCurTbar;
end;

procedure Tfopts.DisplayCurTbar;
begin
  if lbToolbars.ItemIndex < 0 then exit;
  //Render Item
  tCurbar := TNSToolbar( lbToolbars.Items.Objects[lbToolbars.ItemIndex] );
  GetToolbar(tCurbar.Name);
  tCurbar.ActionBar.ActionBar := atbcustom;
  synCustom.Lines.Clear;
  tbarc.Enabled := true;
  if assigned(tCurBtn) then tCurBtn.ActItem.Checked := false;
end;

procedure Tfopts.Button3Click(Sender: TObject);
begin
  aCustomLayout.Show;
end;

procedure Tfopts.OnCustomToolAction(Sender: TObject);
var
  act: TAction;
  scrdir: String;
begin
  act := TAction(Sender);
  act.Checked := true;
  tCurBtn := TNSButton(act.Tag);
  fCurBtnName := tCurBtn.Name;
  if tCurBtn.Toolbar.ExtToolbar then begin
    //Load External Source File
    scrdir := tCurBtn.Toolbar.ToolPath + tCurBtn.Toolbar.Source;
    synCustom.Lines.LoadFromFile(scrdir);
    synCustom.SearchReplace(tCurBtn.Action, '', []);
  end
  else begin
    synCustom.Lines.Text := tCurBtn.Code;
  end
end;

procedure Tfopts.SetActionManager(actman: TActionManager);
begin
  FActMan := actman;
end;

function Tfopts.GetToolbar(name: string): boolean;
var
  ftbar: TNSToolbar;
begin
  result := false;
  ftbar := tbars.FindToolbar(name);
  if not(assigned(ftbar)) then exit; //Can't find toolbar

  //Create Actions and Action Bar
  ftbar.CreateToolbar(FActMan, alcustom, imglistcus, cbarcustom, OnCustomToolAction, true);
end;

procedure Tfopts.aAddBtnExecute(Sender: TObject);
var
  tbdlg: TdToolbarBtn;
  btn: TNSButton;
begin
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  //Add Button
  tbdlg := TdToolbarBtn.Create(self);
  try
    tbdlg.Toolbar := tCurbar;
    if tbdlg.ShowModal = mrOk then begin
      ftoolbarchanged := true;
      btn := tCurbar.AddButton(tbdlg.Name);
      btn.Name :=tbdlg.Name;
      btn.Hint :=tbdlg.Hint;
      btn.Image :=tbdlg.Image;
      btn.Action := tbdlg.Action;
      btn.Save;
      aSaveToolbarExecute(nil);
      tCurbar.Refresh;
      PressButton(tbdlg.Name);
    end;
  finally
    tbdlg.Free;
  end;
end;

procedure Tfopts.aSaveToolbarExecute(Sender: TObject);
begin
  //Save Toolbar
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  ftoolbarchanged := true;
  if assigned(tCurBtn) then begin
    tCurBtn.Code := synCustom.Lines.Text;
    tCurBtn.Save;
  end;
  tCurbar.Save;
end;

procedure Tfopts.aEditBtnExecute(Sender: TObject);
var
  tbdlg: TdToolbarBtn;
begin
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  if not(assigned(tCurBtn)) then begin
    ShowMessage('Select a button first');
    exit;
  end;
  //Add Button
  tbdlg := TdToolbarBtn.Create(self);
  try
    tbdlg.Toolbar := tCurbar;
    tbdlg.Name := tCurBtn.Name;
    tbdlg.Hint := tCurBtn.Hint;
    tbdlg.Image := tCurBtn.Image;
    tbdlg.Action := tCurBtn.Action;
    tbdlg.EditMode := true;
    if tbdlg.ShowModal = mrOk then begin
      ftoolbarchanged := true;
      tCurBtn.Name :=tbdlg.Name;
      tCurBtn.Hint :=tbdlg.Hint;
      tCurBtn.Image :=tbdlg.Image;
      tCurBtn.Action := tbdlg.Action;
      tCurBtn.Save;
      aSaveToolbarExecute(nil);
      tCurbar.Refresh;
      PressButton(tbdlg.Name);
    end;
  finally
    tbdlg.Free;
  end;
end;

procedure Tfopts.aDelBtnExecute(Sender: TObject);
begin
  //Remove Button
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  if not(assigned(tCurBtn)) then begin
    ShowMessage('Select a button first');
    exit;
  end;
  tCurbar.RemoveButton(tCurBtn);
  ftoolbarchanged := true;
  tCurBtn := nil;
  synCustom.Lines.Clear;
  aSaveToolbarExecute(nil);
  tCurbar.Refresh;
  PressLastButton;
end;

procedure Tfopts.aMoveRightExecute(Sender: TObject);
begin
  //Move Current Button right
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  if not(assigned(tCurBtn)) then begin
    ShowMessage('Select a button first');
    exit;
  end;
  tCurbar.MoveButtonRight(tCurBtn);
  ftoolbarchanged := true;
  aSaveToolbarExecute(nil);
  tCurbar.Refresh;
  PressLastButton;
end;

procedure Tfopts.aMoveLeftExecute(Sender: TObject);
begin
  //Move Current Button left
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  if not(assigned(tCurBtn)) then begin
    ShowMessage('Select a button first');
    exit;
  end;
  tCurbar.MoveButtonLeft(tCurBtn);
  ftoolbarchanged := true;
  aSaveToolbarExecute(nil);
  tCurbar.Refresh;
  PressLastButton;
end;

procedure Tfopts.aAddToolbarExecute(Sender: TObject);
var
  dlg: TdToolBar;
  newtbar: TNSToolbar;
begin
  //Add a new toolbar, Open new toolbar dialog
  dlg := TdToolBar.Create(self);
  try
    if dlg.ShowModal = mrok then begin
      if UpperCase(dlg.ToolbarType) = 'EXTERNAL' then
        newtbar := tbars.AddToolbar(dlg.ToolbarName, dlg.ExternalFile)
      else
        newtbar := tbars.AddToolbar(dlg.ToolbarName);
      newtbar.ShowToolbarCaptions := dlg.ShowCaption;
      newtbar.Save;
      LoadToolbars;
      ftoolbarchanged := true;
    end;
  finally
    dlg.Free;
  end;
end;

procedure Tfopts.FormShow(Sender: TObject);
begin
  ftoolbarchanged := false;
  fhighlighterchanged := false;
end;

procedure Tfopts.aRemoveToolbarExecute(Sender: TObject);
var
  tbname: string;
  ftbar: TNSToolbar;
begin
  //Remove toolbar
  if lbToolbars.ItemIndex < 0 then exit;
  tbname := lbToolbars.Items[ lbToolbars.ItemIndex ];
  if MessageDlg('Are you sure you want to remove toolbar "' + tbname + '"' , mtConfirmation, mbYesNoCancel, 0) = mrYes then begin
    ftbar := tbars.FindToolbar(tbname);
    if not(assigned(ftbar)) then exit; //Can't find toolbar
    tbars.RemoveToolbar(ftbar);
    LoadToolbars;
    ftoolbarchanged := true;
  end;
end;

procedure Tfopts.PressLastButton;
begin
  if length( fCurBtnName ) <= 0 then exit;
  PressButton( fCurBtnName );
end;

procedure Tfopts.PressButton(name: string);
var
  ftbar: TNSButton;
begin
  if length( name ) <= 0 then exit;
  if not(assigned(tCurbar)) then exit;
  ftbar := tCurbar.FindButton(name);
  if not(assigned(ftbar)) then exit;
  OnCustomToolAction(ftbar.ActItem);
end;

procedure Tfopts.aRenameToolbarExecute(Sender: TObject);
var
  tbname: string;
  ftbar: TNSToolbar;
  dlg: TdToolBar;
begin
  //Edit toolbar
  if lbToolbars.ItemIndex < 0 then exit;
  tbname := lbToolbars.Items[ lbToolbars.ItemIndex ];

  //Add a new toolbar, Open new toolbar dialog
  dlg := TdToolBar.Create(self);
  try
    ftbar := tbars.FindToolbar(tbname);
    if not(assigned(ftbar)) then exit; //Can't find toolbar
    dlg.EditMode := true;
    dlg.ToolbarName := ftbar.Name;
    if (ftbar.ExtToolbar) then
      dlg.ExternalFile := ftbar.Source;
    dlg.ShowCaption := ftbar.ShowToolbarCaptions;
    if dlg.ShowModal = mrok then begin
    //if InputQuery('Toolbar Rename', 'Enter name:', tbname) then begin
      ftbar.Name := dlg.ToolbarName;
      ftbar.ShowToolbarCaptions := dlg.ShowCaption;
      ftbar.Save;
      lbToolbars.Items[ lbToolbars.ItemIndex ] := tbname;
      ftoolbarchanged := true;
    //end;
    end;
  finally
    dlg.Free;
  end;

end;

procedure Tfopts.aHighlighterToolbarExecute(Sender: TObject);
var
  tbname: string;
  ftbar: TNSToolbar;
  dlgml: TdManageList;
  hl: TStringlist;
begin
  //Highlighter assoicated with toolbar
  //Prompt dialog or highlighters assoicated with toolbar
{  if lbToolbars.ItemIndex < 0 then exit;
  tbname := lbToolbars.Items[ lbToolbars.ItemIndex ];
  ftbar := tbars.FindToolbar(tbname);
  if not(assigned(ftbar)) then exit; //Can't find toolbar}

  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;

  //Update Highlighter List
  dlgml := TdManageList.Create(self);
  hl := TStringlist.Create;
  try
    dlgml.OnAddItem := HLToolBarAdd;
    dlgml.OnRemoveItem := HLToolBarRemove;
    tCurbar.HighlighterList(hl);
    dlgml.LoadList(hl);
    if dlgml.ShowModal = mrOk then begin
      tCurbar.Save;
      ftoolbarchanged := true;
    end;
  finally
    dlgml.Free;
    hl.Free;
  end;
end;

function Tfopts.HLToolBarAdd: string;
var
  hl: TStringlist;
  dlist: TdSelectList;
  hlname: string;
begin
  result := ''; 
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  hl := TStringlist.Create;
  dlist := TdSelectList.Create(self);
  try
    fopts.GetHighlighterList(hl);
    dlist.Title := 'Select Highlighter';
    dlist.LoadList(hl);
    if dlist.ShowModal = mrOk then begin
      //Set Hightlighter
      hlname := dlist.SelectedText;
      if tCurbar.AddHighlighter(hlname) then
        result := hlname;
    end;
  finally
    hl.Free;
    dlist.Free;
  end;
end;

function Tfopts.HLToolBarRemove(item: string): boolean;
begin
  result := false;
  if not(assigned(tCurbar)) then begin
    ShowMessage('Select a toolbar first');
    exit;
  end;
  tCurbar.RemoveHighlighter(item);
  result := true;
end;

procedure Tfopts.GetToolbarsForHighlighter(HLName: string;
  var List: TStringList);
var
  i: integer;
begin
  if not(assigned(fCachebars)) then begin
    fCachebars := TNSToolbars.Create;
    fCachebars.LoadToolbars(ExtractFilePath(application.ExeName) + '\toolbars\');
  end;
  List.Clear;
  for i := 0 to fCachebars.ToolbarCount -1 do begin
    if fCachebars.Toolbars[i].IsHighlighterAssoc(HLName) then
      List.Add(fCachebars.Toolbars[i].Name);
  end;
end;

procedure Tfopts.LoadCustomHList;
var
  i: integer;
  nme, hldir, val, ext: String;
  sr: TSearchRec;
  FileAttrs: Integer;
  srchres: integer;
  hlfname: string;
  idx: integer;
begin
  hldir := GetHighlighterDir + '\*.hgl';
  FileAttrs := faHidden + faSysFile + faArchive + faAnyFile;

  srchres := FindFirst(hldir, FileAttrs, sr);
  if srchres = 0 then begin
    repeat
      if (sr.Attr and faDirectory) = faDirectory then begin
          //Do Nothing
        end
        else begin
          hlfname := GetHighlighterDir + '\' + sr.Name;
          SEditorHL.LoadFromFile(hlfname);
          val := GetCustomFileTypesFromFilter(trim(SEditorHL.Info.General.Extensions));
          bufCusSynExt.Add(val + Chr(0181) + hlfname);
        end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
  SaveBufferedList(bufCusSynExt, AppPath+'highlighters.cache');

end;

procedure Tfopts.SetSyntaxHighlighter(LEFile: TLEFile;
  Filename: String; var found: boolean);
var
  types, ext: String;
  i: integer;
begin
  found := false;
  ext := ExtractFileExt(Filename);
  //Add Skip exts
  if (pos(ext, edtAutoScanIgnore.Text) > 0) then exit;

  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
          if pos(lowercase(ext),lowercase(DefaultFilter)) > 0 then begin
            //SynHL := TSynCustomHighlighter(self.Components[i]);
            LEFile.SetHighlighter(TSynCustomHighlighter(self.Components[i]));
            found := true;
            break;
            end;
      end;
    end;
  end;
  if not(found) then
    SetCustomSyntaxHighlighter(LEFile, Filename, found);
end;

procedure Tfopts.SetSyntaxHighlighterByName(
  LEFile: TLEFile; AName: String; var found: boolean);
var
  types, nme: String;
  i: integer;
begin
  found := false;
  for i := 0 to ComponentCount -1 do begin
    if Components[i] is TSynCustomHighlighter then begin
      if Components[i] is TSynUniSyn then continue;
      with Components[i] as TSynCustomHighlighter do begin
        nme := GetLanguageName;
        if nme = AName then begin
          //SynHL := TSynCustomHighlighter(self.Components[i]);
          LEFile.SetHighlighter(TSynCustomHighlighter(self.Components[i]));
          found := true;
          break;
          end;
      end;
    end;
  end;
  if not(found) then
    SetCustomSyntaxHighlighterByName(LEFile, aName, found);
end;


procedure Tfopts.SetCustomSyntaxHighlighter(
  LEFile: TLEFile; Filename: String; var found: boolean);
var
  i: integer;
  nme, hldir, val, ext: String;
  sr: TSearchRec;
  FileAttrs: Integer;
  srchres: integer;
  hlfname: string;
  idx: integer;
begin
  found := false;
  if (assigned(bufCusSynExt)) then begin
    //Scan Buffered list vs slow disk
    for i := 0 to bufCusSynExt.Count -1 do begin
      val := bufCusSynExt[i];
      idx := Pos(Chr(0181), val);
      if (idx > 1) then begin
        hlfname := Copy(val, idx+1, length(val));
        val := Copy(val, 0, idx-1);
        if pos(lowercase(ext),lowercase(val)) > 0 then begin
          LEFile.SetCustomHighligher(hlfname);
          //SynHL.LoadFromFile(hlfname);
          found := true;
          break;
          end;
      end;
    end;
    exit; //Once the buffered list has been create, we will never re-scan highlighter folder
  end;
end;

procedure Tfopts.SetCustomSyntaxHighlighterByName(
  LEFile: TLEFile; AName: String; var found: boolean);
var
  i: integer;
  nme, hldir: String;
  sr: TSearchRec;
  FileAttrs: Integer;
  srchres: integer;
begin
  //USE SOME TYPE OF CACHE OF CUSTOM HIGHLIGHTERS
  //THE DISK ACCESS KILLS THE SPEED AND EATS MEMORY
  //List.Clear;
  found := false;
  hldir := GetHighlighterDir + '\' + AName + '.hgl';
  FileAttrs := faHidden + faSysFile + faArchive + faAnyFile;

  srchres := FindFirst(hldir, FileAttrs, sr);
  if srchres = 0 then begin
    //LEFile.HighlightObject.Clear;
    LEFile.SetCustomHighligher(hldir);
    //result := TSynCustomHighlighter(SEditorHL);
    found := true;
    FindClose(sr);
  end;
end;

procedure Tfopts.SetMax(const Value: Boolean);
begin
  cbMax.Checked := value;
end;

function Tfopts.GetCRtoCRLF: boolean;
begin
  result := cbCRtoCRLF.Checked;
end;

function Tfopts.GetTagReplaceCodeRep: boolean;
begin
  result := cbTagReplaceCode.Checked;
end;

function Tfopts.GetLFtoCRLF: boolean;
begin
  result := cbLFtoCRLF.Checked;
end;

end.

