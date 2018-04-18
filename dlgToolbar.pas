unit dlgToolbar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, Buttons;

type
  TdToolBar = class(TdStandard)
    Label1: TLabel;
    edttbarname: TEdit;
    rgtoolType: TRadioGroup;
    lbfilename: TLabel;
    edtfilename: TEdit;
    btnFilename: TSpeedButton;
    cbshowcaps: TCheckBox;
    odscr: TOpenDialog;
    procedure rgtoolTypeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnFilenameClick(Sender: TObject);
  private
    FToolbarName: string;
    FExternalFile: string;
    FToolbarType: string;
    FShowCaption: boolean;
    FEditMode: boolean;
    procedure SetExtFile(const Value: string);
    procedure SetToolName(const Value: string);
    procedure SetToolType(const Value: string);
    procedure SetShowCaption(const Value: boolean);
    procedure SetEditMode(const Value: boolean);
    { Private declarations }
  public
    { Public declarations }
    property ToolbarName: string read FToolbarName write SetToolName;
    property ToolbarType: string read FToolbarType write SetToolType;
    property ExternalFile: string read FExternalFile write SetExtFile;
    property ShowCaption: boolean read FShowCaption write SetShowCaption;
    property EditMode: boolean read FEditMode write SetEditMode;
  end;

var
  dToolBar: TdToolBar;

implementation

uses unitUtils;

{$R *.dfm}

procedure TdToolBar.rgtoolTypeClick(Sender: TObject);
var
  en: boolean;
begin
  inherited;
  en := (rgtoolType.ItemIndex = 1);
  lbfilename.Visible := en;
  edtfilename.Visible := en;
  btnFilename.Visible := en;
end;

procedure TdToolBar.Button2Click(Sender: TObject);
begin
  inherited;
  FToolbarName := edttbarname.Text;
  FToolbarType := rgtoolType.Items[rgtooltype.ItemIndex];
  FExternalFile := edtfilename.Text;
  FShowCaption := cbshowcaps.Checked;
end;

procedure TdToolBar.SetExtFile(const Value: string);
begin
  FExternalFile := Value;
  edtfilename.Text := FExternalFile;
end;

procedure TdToolBar.SetToolName(const Value: string);
begin
  FToolbarName := Value;
  edttbarname.Text := FToolbarName;
end;

procedure TdToolBar.SetToolType(const Value: string);
var
  idx: integer;
begin
  FToolbarType := Value;
  idx := rgtoolType.Items.IndexOf(value);
  if idx >= 0 then rgtoolType.ItemIndex := idx;

end;

procedure TdToolBar.SetShowCaption(const Value: boolean);
begin
  FShowCaption := Value;
  cbshowcaps.Checked := FShowCaption;
end;

procedure TdToolBar.SetEditMode(const Value: boolean);
begin
  FEditMode := Value;
  rgtoolType.Visible := not(FEditMode);
  lbfilename.Visible := not(FEditMode);
  edtfilename.Visible := not(FEditMode);
  btnFilename.Visible := not(FEditMode);
end;

procedure TdToolBar.btnFilenameClick(Sender: TObject);
begin
  inherited;
  if length(odscr.InitialDir) <= 0 then odscr.InitialDir := AppPath + 'scripts';
  if odscr.Execute then begin
    odscr.InitialDir := ExtractFilePath(odscr.FileName);
    edtfilename.Text := odscr.FileName;
  end
end;

end.
