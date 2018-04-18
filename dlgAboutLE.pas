unit dlgAboutLE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  TdlgAbout = class(TForm)
    Bevel1: TBevel;
    lbCompanyTitle: TLabel;
    lbTitle: TLabel;
    lbVersion: TLabel;
    lbCompany: TLabel;
    lbCopyright: TLabel;
    lbUrl: TLabel;
    btnOK: TButton;
    Image1: TImage;
    lbsupport: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lbUrlClick(Sender: TObject);
    procedure lbUrlMouseEnter(Sender: TObject);
    procedure lbUrlMouseLeave(Sender: TObject);
    procedure lbsupportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgAbout: TdlgAbout;

implementation

uses rsFileVersion, unitUtils;

{$I ns.inc}

{$R *.dfm}

procedure TdlgAbout.FormCreate(Sender: TObject);
var
  fv: TrsFileVersion;
begin
  lbTitle.Caption := Application.Title;
  lbCompanyTitle.Caption := scCompany;
  lbCompany.Caption := scCompany;
  lbCopyright.Caption := scCopyright;
  lbUrl.Caption := scURL;
  lbsupport.Caption := scSupport;

  if FileExists(AppPath+scProductImg) then
    Image1.Picture.LoadFromFile(AppPath+scProductImg)
  else
    Image1.Picture.Icon := application.Icon;

  fv := TrsFileVersion.Create;
  try
    if fv.GetFileVersion(Application.ExeName) then begin
      //File Verison info
      lbVersion.Caption := format('Version %s (Build %d)', [fv.Version, fv.Build])
    end;
  finally
    fv.Free;
  end;
end;

procedure TdlgAbout.lbUrlClick(Sender: TObject);
begin
  ExecuteFile(lbUrl.Caption, '');
end;

procedure TdlgAbout.lbUrlMouseEnter(Sender: TObject);
begin
  if Sender is TLabel then
    with Sender as TLabel do
      Font.Style := [fsUnderline];
end;

procedure TdlgAbout.lbUrlMouseLeave(Sender: TObject);
begin
  if Sender is TLabel then
    with Sender as TLabel do
      Font.Style := [];
end;

procedure TdlgAbout.lbsupportClick(Sender: TObject);
begin
  ExecuteFile(scSupportMail, '');
end;

end.
