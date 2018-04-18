unit dlgColorHex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, ComCtrls;

type
  TdHexColor = class(TdStandard)
    pcolor: TPanel;
    eHexcolor: TEdit;
    Label1: TLabel;
    eRed: TEdit;
    eblue: TEdit;
    egreen: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnShowHex: TButton;
    rud: TUpDown;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    dgcol: TColorDialog;
    btnColorChart: TButton;
    procedure eRedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eHexcolorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnShColorClick(Sender: TObject);
    procedure btnShowHexClick(Sender: TObject);
    procedure btnShowColorRClick(Sender: TObject);
    procedure eRedExit(Sender: TObject);
    procedure eHexcolorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnColorChartClick(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
  private
    function GetHexColor: String;
    procedure DisplayColor;
    procedure DisplayHex;
    procedure RefreshColors( AColor: TColor );
    { Private declarations }
  public
    { Public declarations }
    property HexColor: String read GetHexColor;
  end;

var
  dHexColor: TdHexColor;

implementation

uses
  unitutils;

{$R *.dfm}

procedure TdHexColor.DisplayColor;
var
  r,g,b: integer;
  cl: TColor;
begin
  inherited;
  r := StrToIntDef(ered.Text, 0);
  b := StrToIntDef(eblue.Text, 0);
  g := StrToIntDef(egreen.Text, 0);
  cl := rgb(r, g, b);
  pcolor.Color := cl;
  eHexColor.Text := '#' + TColorToHex( cl );
end;

function TdHexColor.GetHexColor: String;
begin
  result := eHexcolor.Text;
end;

procedure TdHexColor.eRedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_RETURN then
    DisplayColor;
end;

procedure TdHexColor.DisplayHex;
var
  tmp: String;
begin
  tmp := StringReplace(eHexcolor.text, '#', '', [rfReplaceAll, rfIgnoreCase]);
  pcolor.Color := HexToTColor( tmp );
  ered.Text := IntToStr(GetRValue(pcolor.Color));
  egreen.Text := IntToStr(GetGValue(pcolor.Color));
  eblue.Text := IntToStr(GetBValue(pcolor.Color));
end;

procedure TdHexColor.eHexcolorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = vk_RETURN then
    DisplayHex;
end;

procedure TdHexColor.btnShColorClick(Sender: TObject);
begin
  inherited;
  DisplayColor;
  DisplayHex;
end;

procedure TdHexColor.btnShowHexClick(Sender: TObject);
begin
  inherited;
  DisplayHex;
end;

procedure TdHexColor.btnShowColorRClick(Sender: TObject);
begin
  inherited;
  DisplayColor;
end;

procedure TdHexColor.eRedExit(Sender: TObject);
begin
  inherited;
  DisplayColor;
end;

procedure TdHexColor.eHexcolorExit(Sender: TObject);
begin
  inherited;
  DisplayHex;
end;

procedure TdHexColor.FormShow(Sender: TObject);
begin
  inherited;
  DisplayHex;
end;

procedure TdHexColor.btnColorChartClick(Sender: TObject);
begin
  inherited;
  if dgcol.Execute then begin
    RefreshColors(dgcol.Color);
  end;
end;

procedure TdHexColor.RefreshColors(AColor: TColor);
begin
    pcolor.color := AColor;
    ered.Text := IntToStr(GetRValue(AColor));
    egreen.Text := IntToStr(GetGValue(AColor));
    eblue.Text := IntToStr(GetBValue(AColor));
    eHexColor.Text := '#' + TColorToHex( AColor );
end;

procedure TdHexColor.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
  inherited;
  DisplayColor;
end;

end.
