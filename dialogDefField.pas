unit dialogDefField;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TdlgDelField = class(TForm)
    lbDelimiter: TLabel;
    edtDelimit: TEdit;
    lbNumOfFields: TLabel;
    edtNumFields: TEdit;
    lbDelField: TLabel;
    edtDelField: TEdit;
    lbOutFile: TLabel;
    edtOutput: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    SpeedButton1: TSpeedButton;
    sd: TSaveDialog;
    cbDel: TComboBox;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtDelimitExit(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbDelChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FNumOfFields: integer;
    FDeleteField: integer;
    FOutFilename: String;
    FDelimiter: String;
    FFirstLine: String;
    { Private declarations }
  public
    { Public declarations }
    function GetDelimiter: Char;
    property FirstLine: String read FFirstLine write FFirstLine;
    property OutFilename: String read FOutFilename write FOutFilename;
    property Delimiter: String read FDelimiter write FDelimiter;
    property NumOfFields: integer read FNumOfFields write FNumOfFields;
    property DeleteField: integer read FDeleteField write FDeleteField;
  end;

var
  dlgDelField: TdlgDelField;

implementation

uses unitUtils, vcl_util;

{$R *.DFM}

procedure TdlgDelField.SpeedButton1Click(Sender: TObject);
begin
  if sd.Execute then
    edtoutput.Text := sd.filename;
end;

procedure TdlgDelField.FormCreate(Sender: TObject);
begin
  FoutFilename := AppPath + 'output.txt';
  edtoutput.Text := FoutFilename;
end;

procedure TdlgDelField.edtDelimitExit(Sender: TObject);
var
  char: String;
  list: TStringList;
begin
//  Calculate Fields
  char := edtDelimit.text;
  if length(char) <= 0 then exit;
  list := SplitStr(FFirstLine, char[1]);
  edtNumFields.Text := IntToStr(list.count);
end;

procedure TdlgDelField.btnOKClick(Sender: TObject);
begin
    FNumOfFields := StrToIntDef(edtNumFields.text, 0);
    FDeleteField := StrToIntDef(edtDelField.text, 0);
    FOutFilename := edtOutput.text;
    FDelimiter := edtDelimit.text;
    ModalResult := mrOk;
end;

procedure TdlgDelField.cbDelChange(Sender: TObject);
begin
  if cbDel.ItemIndex < 0 then exit;
  if LowerCase( cbDel.Items[cbDel.ItemIndex] ) = 'custom' then
    EnableControl( edtDelimit )
  else
    DisableControl( edtDelimit );
end;

function TdlgDelField.GetDelimiter: Char;
begin
  case cbDel.ItemIndex of
    0: result := ',';
    1: result := #9;
    2: result := '|';
    3: result := '~';
    4: if length(edtDelimit.text) >= 1 then
        result := edtDelimit.Text[1]
       else
        result := ',';
    else
      result := ',';
  end;
end;

procedure TdlgDelField.FormShow(Sender: TObject);
begin
    DisableControl( edtDelimit );
end;

end.
