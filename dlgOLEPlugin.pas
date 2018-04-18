unit dlgOLEPlugin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, OleCtnrs, autoLargeEdit, LargeEdit_TLB,
  OleCtrls, SHDocVw, psvHost;

type
  Tplugininfo = class
  public
    width: string;
    height: string;
    location: string;
    filename: string;
    guidstr: string;
    menuname: string;
    plugintype: string;
    image: string;
    events: string;
    vieweralign: string;    
    rawtext: string;
  end;

  Tdoleplugin = class(TdStandard)
    papphost: TpsvAppletHost;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FFullView: boolean;
    FLargeEditX: TLargeEditor;
    FViewer: ILEViewer;
    //FViewer: Variant;
    procedure SetFullView(const Value: boolean);
    function GetDisObj: IDispatch;
    { Private declarations }
  public
    { Public declarations }
    procedure Load( pluginfo: Tplugininfo );
    property LargeEditX: TLargeEditor read FLargeEditX write FLargeEditX;
    property FullView: boolean read FFullView write SetFullView;
    property DispatchObject: IDispatch read GetDisObj;
  end;

var
  doleplugin: Tdoleplugin;

implementation

uses comobj, unitUtils;

{$R *.dfm}

{ Tdoleplugin }

procedure Tdoleplugin.Load(pluginfo: Tplugininfo);
var
  loc: string;
begin
  loc := pluginfo.location;
  if (ExtractFileDrive(loc) = '') then loc := AppPath + loc;
  papphost.GUID := pluginfo.guidstr;
  papphost.FileOptions.Folder := loc;
  papphost.FileOptions.FileName := pluginfo.filename;
  papphost.Active := true;
  try
    FViewer := papphost.DefaultDispatch as ILEViewer;
    FViewer.Init(FLargeEditX as ILargeEditor);
  except
  end;
end;

procedure Tdoleplugin.SetFullView(const Value: boolean);
begin
  FFullView := Value;
  Panel1.Visible := not FFullView;
end;

procedure Tdoleplugin.FormDestroy(Sender: TObject);
begin
  inherited;
  FViewer := nil;
end;

procedure Tdoleplugin.FormShow(Sender: TObject);
begin
  inherited;
  papphost.SetFocus;
end;

procedure Tdoleplugin.FormResize(Sender: TObject);
begin
  inherited;
  papphost.Width := panel2.ClientWidth;
  papphost.Height := panel2.ClientHeight;
end;

function Tdoleplugin.GetDisObj: IDispatch;
begin
  try
    result := papphost.DefaultDispatch;
  except
  end;
end;

end.
