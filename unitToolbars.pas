unit unitToolbars;

interface

uses classes, unitxobject;

type
  TNSToolbar = class;
  TNSButton = class;

  TNSToolbars = class
  private
    bufToolbars: TStringList;
    function GetToolBarCount: integer;
    function GetToolbars(index: integer): TNSToolbar;
  public
    constructor Create;
    procedure LoadToolbars( path: string );

    property Toolbars[index: integer]: TNSToolbar read GetToolbars;
    property ToolbarCount: integer read GetToolBarCount;
  end;

  TNSToolbar = class
  private
    FName: String;
    FSource: String;
    FXObj: TXObject;
    bufButtons: TStringList;
    function GetButtons(index: integer): TNSButton;
    function GetButtonCount: integer;
  public
    constructor Create;
    procedure Load( filename: string );

    property Name: String read FName write FName;
    property Source: String read FSource write FSource;

    property Buttons[index: integer]: TNSButton read GetButtons;
    property ButtonCount: integer read GetButtonCount;
  end;

  TNSButton = class
  private
    FName: String;
    FHint: String;
    FImage: String;
    FAction: String;

  public
    procedure Load( xObj: TXObject );

    property Name: String read FName write FName;
    property Hint: String read FHint write FHint;
    property Image: String read FImage write FImage;
    property Action: String read FAction write FAction;
  end;

implementation

uses sysutils;

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

{ TNSToolbar }

constructor TNSToolbar.Create;
begin
  FXObj := TXObject.Create;
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
  FXObj.Load(filename);
  FName := FXObj.PropertyByName('name');
  FSource := FXObj.PropertyByName('source');
  for i := 0 to FXObj.ObjectCount -1 do begin
    btn := TNSButton.Create;
    btn.Load( FXObj.Objects[i] );
    bufButtons.AddObject(btn.Name, btn);
  end;
end;

{ TNSButton }

procedure TNSButton.Load(xObj: TXObject);
begin
  //name="table" hint="HTML Table" image="htable.ico" action="OnHTMLTable"
  FName := xObj.PropertyByName('name');
  FHint := xObj.PropertyByName('hint');
  FImage := xObj.PropertyByName('image');
  FAction := xObj.PropertyByName('action');
end;

end.
