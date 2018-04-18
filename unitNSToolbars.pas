unit unitNSToolbars;

interface

uses classes, unitxobject, ActnMan, ActnCtrls, ActnList, Graphics, controls, ComCtrls;

type
  TNSToolbar = class;
  TNSButton = class;
  TNSToolbars = class;

  TNSToolbars = class(TObject)
  private
    bufToolbars: TStringList;
    FPath: string;
    function GetToolBarCount: integer;
    function GetToolbars(index: integer): TNSToolbar;
  public
    constructor Create;
    destructor Destroy; override;
    procedure LoadToolbars( path: string );
    function AddToolbar( name: string ): TNSToolbar; overload;
    function AddToolbar( name: string; filename: string ): TNSToolbar; overload;
    function FindToolbar( name: string ): TNSToolbar;
    procedure RemoveToolbar( TBar: TNSToolbar );

    property Toolbars[index: integer]: TNSToolbar read GetToolbars;
    property ToolbarCount: integer read GetToolBarCount;
  end;

  TNSToolbar = class(TObject)
  private
    FName: String;
    FSource: String;
    FXObj: TXObject;
    bufButtons: TStringList;
    FActionBar: TActionBarItem;
    FFilename: String;
    Ftoolpath: string;
    FActList: TActionList;
    FActMan: TActionManager;
    FActionToolbar: TActionToolBar;
    FImgList: TImageList;
    FExtToolbar: boolean;
    FOnExec: TNotifyEvent;
    FGroupItems: boolean;
    FHighlighters: String;
    FShowToolbarCaps: boolean;
    Fhighlist: TStringList;
    function GetButtons(index: integer): TNSButton;
    function GetButtonCount: integer;
    procedure LoadButtons();
    procedure ReloadButtons();
    procedure SetSource(const Value: String);
    procedure SetTBName(const Value: String);
    procedure SetFilename(const Value: String);
    procedure SetShowToolbarCap(const Value: boolean);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Load( filename: string );
    procedure CreateToolbar( ActMan: TActionManager; Actionlist: TActionList; ImgList: TImageList; Parent: TCoolbar; OnExec: TNotifyEvent; GroupItems: Boolean = false);
    function CanAdd(btnname: string): boolean;
    function AddButton(btnname: string): TNSButton;
    function RemoveButton(button: TNSButton): boolean;
    procedure MoveButtonRight(button: TNSButton);
    procedure MoveButtonLeft(button: TNSButton);
    function FindButton(btnname: string): TNSButton;

    procedure Save( afilename: string ); overload;
    procedure Save; overload;
    procedure Refresh;

    function IsHighlighterAssoc( HLName: string ): boolean;
    function AddHighlighter( HLName: string ): boolean;
    procedure RemoveHighlighter( HLName: string );
    procedure HighlighterList( var HList: TStringList );
    procedure SaveHighlightList();

    property ActionBar: TActionBarItem read FActionBar write FActionBar;
    property ActionToolBar: TActionToolBar read FActionToolbar;

    property Name: String read FName write SetTBName;
    property Source: String read FSource write SetSource;
    property Filename: String read FFilename write SetFilename;
    property Highlighters: String read FHighlighters;
    property ToolPath: string read Ftoolpath;
    property ExtToolbar: boolean read FExtToolbar default false;
    property ShowToolbarCaptions: boolean read FShowToolbarCaps write SetShowToolbarCap default false;

    property Buttons[index: integer]: TNSButton read GetButtons;
    property ButtonCount: integer read GetButtonCount;
  end;

  TNSButton = class(TObject)
  private
    FName: String;
    FHint: String;
    FImage: String;
    FAction: String;
    FNSToolbar: TNSToolbar;
    FCode: String;
    FxObj: TXObject;
    FImageIndex: integer;
    FActItem: TAction;
    FActClientItem: TActionClientItem;

  public
    destructor Destroy; override;
    procedure Load( xObj: TXObject; Toolbar: TNSToolbar );
    procedure Save;
    procedure Delete;
    function GetWrappedCode: String;

    property Name: String read FName write FName;
    property Hint: String read FHint write FHint;
    property Image: String read FImage write FImage;
    property ImageIndex: integer read FImageIndex write FImageIndex;
    property Action: String read FAction write FAction;
    property Code: String read FCode write FCode;
    property Toolbar: TNSToolbar read FNSToolbar;
    property XObj: TXObject read FxObj write FxObj;
    property ActItem: TAction read FActItem write FActItem;
    property ActClientItem: TActionClientItem read FActClientItem write FActClientItem;
  end;

implementation

uses sysutils, VCL_Util;

{ TNSToolbars }

function TNSToolbars.GetToolbars(index: integer): TNSToolbar;
begin
  result := nil;
  if index < bufToolbars.Count then
    result := TNSToolbar(bufToolbars.Objects[index]);
end;

function TNSToolbars.GetToolBarCount: integer;
begin
  result := bufToolbars.Count;
end;

procedure TNSToolbars.LoadToolbars( path: string );
var
  sr: TSearchRec;
  FileAttrs: Integer;
  srdir: string;
  srchres: integer;
  tbar: TNSToolbar;
begin
    if not(assigned(bufToolbars)) then bufToolbars := TStringList.Create;

    FPath := path;
    bufToolbars.Clear;
    srdir := path + '*.*';
    FileAttrs := faHidden + faSysFile + faVolumeID + faDirectory + faArchive;

    FileAttrs := FileAttrs + faAnyFile;
    srchres := FindFirst(srdir, FileAttrs, sr);
    if srchres = 0 then begin
      repeat
        if (sr.Attr and faDirectory) = faDirectory then begin
          if not((sr.Name = '.') or (sr.Name = '..')) then begin
              //Extract File toolbar.xml file from folder
              if fileexists(path + sr.Name + '\toolbar.xml') then begin
                tbar := TNSToolbar.Create;
                tbar.Load(path + sr.Name + '\toolbar.xml');
                bufToolbars.AddObject(tbar.Name, tbar);
              end;
            end;
          end
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
end;

constructor TNSToolbars.Create;
begin
  bufToolbars := TStringList.Create;
end;

function TNSToolbars.FindToolbar(name: string): TNSToolbar;
var
  i: integer;
  tbar: TNSToolbar;
begin
  result := nil;
  for i := 0 to bufToolbars.Count -1 do begin
    tbar := TNSToolbar(bufToolbars.Objects[i]);
    if UpperCase(tbar.Name) = UpperCase(name) then begin
      result := tbar;
      break;
      end; //if
  end; //for
end;

function TNSToolbars.AddToolbar(name: string): TNSToolbar;
var
  srdir: string;
  tbar: TNSToolbar;
  xobj: TXObject;
begin
  srdir := fpath + name;
  if not DirectoryExists(srdir) then MkDir(srdir);

  xobj := TXObject.Create('toolbar');
  xobj.AddProperty('name', name);
  xobj.Save(srdir + '\toolbar.xml');

  tbar := TNSToolbar.Create;
  tbar.Load(srdir + '\toolbar.xml');
  bufToolbars.AddObject(tbar.Name, tbar);
  result := tbar;
end;

function TNSToolbars.AddToolbar(name, filename: string): TNSToolbar;
var
  tbar: TNSToolbar;
  srdir: string;
  scrfile: TStringList;
begin
  tbar := AddToolbar(name);
  srdir := fpath + name + '\' + ExtractFileName(filename);
  if not FileExists(srdir) then begin
    scrfile := TStringList.Create;
    scrfile.LoadFromFile(filename);
    scrfile.SaveToFile(srdir);
    scrfile.Free;
  end;
  tbar.Source := ExtractFileName(filename);
  result := tbar;
end;

destructor TNSToolbars.Destroy;
var
  i: integer;
  tbar: TNSToolbar;
begin
  for i := 0 to bufToolbars.Count -1 do begin
    tbar := TNSToolbar(bufToolbars.Objects[i]);
    tbar.Free;
  end; //for
  inherited;
end;

procedure TNSToolbars.RemoveToolbar(TBar: TNSToolbar );
var
  srdir: string;
  xobj: TXObject;
  idx: integer;
begin
  srdir := fpath + TBar.Name;
  if not DirectoryExists(srdir) then exit;
  if not FileExists(srdir + '\toolbar.xml') then exit;
  idx := bufToolbars.IndexOf(TBar.Name);
  bufToolbars.Delete(idx);
  TBar.Free;
  RenameFile(srdir + '\toolbar.xml', srdir + '\toolbar.bak');
end;

{ TNSToolbar }

function TNSToolbar.AddButton(btnname: string): TNSButton;
var
  xbtn: TXObject;
begin
  xbtn := FXObj.AddObject('button');
  result := TNSButton.Create;
  bufButtons.AddObject(btnname, result);
  result.Load(xbtn, self);
end;

constructor TNSToolbar.Create;
begin
  FXObj := TXObject.Create;
  Fhighlist := TStringList.Create;
end;

procedure TNSToolbar.CreateToolbar(ActMan: TActionManager; Actionlist: TActionList; ImgList: TImageList; Parent: TCoolbar; OnExec: TNotifyEvent; GroupItems: Boolean);
var
  acb: TActionBarItem;
begin
  if assigned(FActionToolbar) then exit;
  FOnExec := OnExec;
  FGroupItems := GroupItems;
  FImgList := ImgList;
  FActionToolbar := TActionToolBar.Create(parent);
  FActionToolbar.Parent := parent;
  FActionToolbar.Caption := self.Name;
  FActMan := ActMan;
  FActlist := ActionList;
  FActionBar := ActMan.ActionBars.Add;
  FActionBar.AutoSize := true;
  if not FShowToolbarCaps then
    FActionBar.Items.CaptionOptions := coNone
  else
    FActionBar.Items.CaptionOptions := coSelective;
  //FActionBar.ChangesAllowed := [];
  FActionBar.DisplayName := self.Name;
  FActionBar.ActionBar := FActionToolbar;
  LoadButtons;
end;

function TNSToolbar.GetButtonCount: integer;
begin
  result := bufButtons.Count;
end;

function TNSToolbar.GetButtons(index: integer): TNSButton;
begin
  result := nil;
  if index < bufButtons.Count then
    result := TNSButton(bufButtons.Objects[index]);
end;

procedure TNSToolbar.Load(filename: string);
var
  i: integer;
  btn: TNSButton;
begin
  FExtToolbar := false;
  FFilename := filename;
  Ftoolpath := ExtractFilePath(filename);
  if not(assigned(bufButtons)) then bufButtons := TStringList.Create;
  FXObj.Load(filename);
  FName := FXObj.PropertyByName['name'];
  FSource := FXObj.PropertyByName['source'];
  FHighlighters := FXObj.PropertyByName['highlighters'];
  fhighlist := SplitStr(FHighlighters, '\');
  try
    if length(FXObj.PropertyByName['showcaptions']) > 0 then
      FShowToolbarCaps := StrToBool( FXObj.PropertyByName['showcaptions'] )
    else
      FShowToolbarCaps := true;
  except
    FShowToolbarCaps := true;
  end;
  if length(FSource) > 0 then FExtToolbar := true;
  for i := 0 to FXObj.NodeCount -1 do begin
    btn := TNSButton.Create;
    btn.Load( FXObj.NodeObject[i], self );
    bufButtons.AddObject(btn.Name, btn);
  end;
end;

procedure TNSToolbar.Save(afilename: string);
begin
  FXObj.Save(afilename);
end;

procedure TNSToolbar.LoadButtons;
var
  aitem: TActionClientItem;
  action: TAction;
  ico: TIcon;
  j: integer;
begin
  for j := 0 to self.ButtonCount - 1 do begin
    aitem := self.ActionBar.Items.Add;
    aitem.Caption := self.Buttons[j].Name;

    //Create Action
    action := TAction.Create(FActlist);
    action.ActionList := FActlist;
    action.Caption := self.Buttons[j].Name;
    action.Hint := self.Buttons[j].Hint;
    action.Category := self.Name;
    action.Tag := integer(self.Buttons[j]);
    action.OnExecute := FOnExec;
    if FGroupItems then action.GroupIndex := 1;
    self.Buttons[j].ActItem := action;

    //Load Image
    if length(self.Buttons[j].Image) > 0 then begin
      ico := TIcon.Create;
      ico.LoadFromFile(self.ToolPath + self.Buttons[j].Image);
      action.ImageIndex := FImgList.AddIcon(ico);
      aitem.ImageIndex := action.ImageIndex;
      self.Buttons[j].ImageIndex := action.ImageIndex;
    end;

    //Assign Action
    aitem.Action := action;
    self.Buttons[j].ActClientItem := aitem;
  end;
end;

procedure TNSToolbar.Save;
begin
  Self.Save( FFilename );
end;

procedure TNSToolbar.ReloadButtons;
var
  j: integer;
begin
  //This code might kill all the other image index ref in the list
  //don't use right now
  {for j := 0 to self.ButtonCount - 1 do begin
    FImgList.Delete(self.Buttons[j].ImageIndex);
  end;}
  self.ActionBar.Items.Clear;
  LoadButtons;
end;

procedure TNSToolbar.Refresh;
begin
  ReloadButtons;
end;

function TNSToolbar.RemoveButton(button: TNSButton): boolean;
var
  idx: integer;
begin
  result := false;
  idx := bufButtons.IndexOf(button.Name);
  if (idx < 0) then exit;
  button.Delete;
  bufButtons.Objects[idx].Free;
  bufButtons.Delete(idx);
  result := true;
end;

function TNSToolbar.CanAdd(btnname: string): boolean;
begin
  result := (bufButtons.IndexOf(btnname) = -1);
end;

procedure TNSToolbar.MoveButtonLeft(button: TNSButton);
var
  idx: integer;
  lbtn: TNSButton;
begin
  idx := bufButtons.IndexOf(button.Name);
  if (idx < 0) then exit;
  if (idx = 0) then exit; //Already to the far left
  lbtn := TNSButton(bufButtons.Objects[idx-1]);
  FXObj.ExchangeNodes(button.xObj, lbtn.xObj, false);
  bufButtons.Exchange(idx, idx-1);
end;

procedure TNSToolbar.MoveButtonRight(button: TNSButton);
var
  idx: integer;
  rbtn: TNSButton;
begin
  idx := bufButtons.IndexOf(button.Name);
  if (idx < 0) then exit;
  if (idx = bufButtons.Count -1) then exit; //Already to the far right
  rbtn := TNSButton(bufButtons.Objects[idx+1]);
  FXObj.ExchangeNodes(button.xObj, rbtn.xObj);
  bufButtons.Exchange(idx, idx+1);
end;

procedure TNSToolbar.SetSource(const Value: String);
begin
  FSource := Value;
  FXObj.PropertyByName['source'] := FSource;
  FExtToolbar := true;
end;

destructor TNSToolbar.Destroy;
var
  i: integer;
begin
  if assigned(FActionToolbar) then
    FActionToolbar.Visible := false;
  for i := 0 to bufButtons.Count - 1 do begin
    TNSButton(bufButtons.Objects[i]).Free;
  end;
  if assigned(FActionToolbar) then
    FActionToolbar.Free;
  if assigned(Fhighlist) then
    Fhighlist.Free;
  inherited;
end;

function TNSToolbar.FindButton(btnname: string): TNSButton;
var
  i: integer;
  btn: TNSButton;
begin
  result := nil;
  for i := 0 to bufButtons.Count - 1 do begin
    btn := TNSButton(bufButtons.Objects[i]);
    if UpperCase( btn.Name ) = UpperCase( btnname ) then begin
      result := btn;
      end;
  end;
end;

function TNSToolbar.AddHighlighter(HLName: string): boolean;
begin
  result := false;
  if Fhighlist.IndexOf(HLName) >= 0 then exit;
  Fhighlist.Add(HLName);
  SaveHighlightList();
  result := true;
end;

procedure TNSToolbar.HighlighterList(var HList: TStringList);
begin
  HList.Clear;
  if assigned(Fhighlist) then
    HList.Text := fhighlist.Text;
end;

procedure TNSToolbar.RemoveHighlighter(HLName: string);
var
  idx: integer;
begin
  idx := fhighlist.IndexOf(HLName);
  if idx >= 0 then begin
    fhighlist.Delete(idx);
    SaveHighlightList();
    end;
end;

function TNSToolbar.IsHighlighterAssoc(HLName: string): boolean;
begin
  result := (pos(HLName + '\', FHighlighters) > 0)
end;

procedure TNSToolbar.SetTBName(const Value: String);
begin
  FName := Value;
  FXObj.PropertyByName['name'] := FName;
end;


procedure TNSToolbar.SetFilename(const Value: String);
begin
  FFilename := Value;
  FXObj.PropertyByName['filename'] := FFilename;  
end;

procedure TNSToolbar.SetShowToolbarCap(const Value: boolean);
begin
  FShowToolbarCaps := Value;
  FXObj.PropertyByName['showcaptions'] := BoolToStr(FShowToolbarCaps, true);
  if assigned(FActionBar) then begin
    if not FShowToolbarCaps then
      FActionBar.Items.CaptionOptions := coNone
    else
      FActionBar.Items.CaptionOptions := coSelective;
  end;
end;

procedure TNSToolbar.SaveHighlightList;
var
  i: integer;
  fhlist: string;
begin
  if not(assigned(fhighlist)) then exit;
  fhlist := '';
  for i := 0 to fhighlist.Count - 1 do begin
    fhlist := fhlist + fhighlist[i];
    if i < fhighlist.Count - 1 then
      fhlist := fhlist + '\';
  end;
  FXObj.PropertyByName['highlighters'] := fhlist;
end;

{ TNSButton }

procedure TNSButton.Delete;
begin
  FxObj.Delete;
end;

destructor TNSButton.Destroy;
begin
  if assigned(FActItem) then FActItem.Free;
  inherited;
end;

function TNSButton.GetWrappedCode: String;
begin
  result := 'function Run() {' + Chr(13)+ Chr(10);
  result := result + FCode + Chr(13)+ Chr(10);
  result := result + '}'  + Chr(13)+ Chr(10);
end;

procedure TNSButton.Load(xObj: TXObject; Toolbar: TNSToolbar);
begin
  //name="table" hint="HTML Table" image="htable.ico" action="OnHTMLTable"
  FxObj := xobj;
  FName := xObj.PropertyByName['name'];
  FHint := xObj.PropertyByName['hint'];
  FImage := xObj.PropertyByName['image'];
  FAction := xObj.PropertyByName['action'];
  FCode := xObj.InnerText;
  FNSToolbar := Toolbar;
end;

procedure TNSButton.Save;
begin
  FxObj.PropertyByName['name'] := FName;
  FxObj.PropertyByName['hint'] := FHint;
  FxObj.PropertyByName['image'] := FImage;
  FxObj.PropertyByName['action'] := FAction;
  if not(FNSToolbar.ExtToolbar) then
    FxObj.SetData(FCode);
end;

end.
