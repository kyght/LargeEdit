unit dlgToolButton;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, Buttons, ExtDlgs, unitNSToolbars;

type
  TdToolbarBtn = class(TdStandard)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbaction: TLabel;
    edtName: TEdit;
    edtHint: TEdit;
    edtImage: TEdit;
    edtAction: TEdit;
    SpeedButton1: TSpeedButton;
    opicdlg: TOpenPictureDialog;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FImage: String;
    FAction: String;
    FName: String;
    FHint: String;
    FNSToolbar: TNSToolbar;
    FEditMode: boolean;
    { Private declarations }
  public
    { Public declarations }
    property Name: String read FName write FName;
    property Hint: String read FHint write FHint;
    property Image: String read FImage write FImage;
    property Action: String read FAction write FAction;
    property Toolbar: TNSToolbar read FNSToolbar write FNSToolbar;
    property EditMode: boolean read FEditMode write FEditMode default false;
  end;

var
  dToolbarBtn: TdToolbarBtn;

implementation

uses unitUtils;

{$R *.dfm}

procedure TdToolbarBtn.FormShow(Sender: TObject);
begin
  inherited;
  edtName.Text := FName;
  edtHint.Text := FHint;
  edtImage.Text := FImage;
  edtAction.Text := FAction;
  lbaction.Visible := (length(FNSToolbar.Source) > 0);
  edtAction.Visible := (length(FNSToolbar.Source) > 0);
end;

procedure TdToolbarBtn.SpeedButton1Click(Sender: TObject);
var
  des: String;
begin
  inherited;
  //Show dialog, Copy icon to toolbar folder
  if length(opicdlg.InitialDir) <= 0 then
    opicdlg.InitialDir := AppPath + 'Resources\Icon';
  if opicdlg.Execute then begin
    opicdlg.InitialDir := ExtractFilePath(opicdlg.FileName);
    if UpperCase(FNSToolbar.ToolPath) <> UpperCase(ExtractFilePath( opicdlg.filename )) then begin
      des := FNSToolbar.ToolPath + ExtractFileName( opicdlg.filename );
      CopyFile(PChar(opicdlg.filename), Pchar(des), false);
    end;
    edtImage.Text := ExtractFileName( opicdlg.filename );
  end;
end;

procedure TdToolbarBtn.Button2Click(Sender: TObject);
begin
  inherited;
  if length(edtName.Text) <= 0 then begin
    ShowMessage('Enter a button name');
    exit;
  end;
  if not(FEditMode) and not(FNSToolbar.CanAdd(edtName.Text)) then begin
    ShowMessage('Button named "' + edtName.Text + '" already exists');
    exit;
  end;
  FName := edtName.Text;
  FHint := edtHint.Text;
  FImage := edtImage.Text;
  FAction := edtAction.Text;
  ModalResult := mrOk;
end;

end.
