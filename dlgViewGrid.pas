unit dlgViewGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls;

type
  TdelMode = (dmSelect, dmView);

  TdViewGrid = class(TdStandard)
    Label1: TLabel;
    eDel: TEdit;
    cbColumns: TCheckBox;
    cbDel: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure cbDelChange(Sender: TObject);
  private
    function GetDelimiter: Char;
    function GetFirstLineColumns: boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure SetMode(mode: TdelMode);
    property Delimiter: Char read GetDelimiter;
    property FirstLineColumns: boolean read GetFirstLineColumns;
  end;

var
  dViewGrid: TdViewGrid;

implementation

uses unitUtils;

{$R *.dfm}

{ TdViewGrid }

function TdViewGrid.GetDelimiter: Char;
begin
  case cbDel.ItemIndex of
    0: result := ',';
    1: result := #9;
    2: result := '|';
    3: result := '~';
    4: if length(edel.text) >= 1 then
        result := edel.Text[1]
       else
        result := ',';
    else
      result := ',';
  end;
end;

function TdViewGrid.GetFirstLineColumns: boolean;
begin
  result := cbColumns.Checked;
end;

procedure TdViewGrid.FormShow(Sender: TObject);
begin
  inherited;
  DisableControl( edel );
end;

procedure TdViewGrid.cbDelChange(Sender: TObject);
begin
  inherited;
  if cbDel.ItemIndex < 0 then exit;
  if LowerCase( cbDel.Items[cbDel.ItemIndex] ) = 'custom' then
    EnableControl( edel )
  else
    DisableControl( edel );
end;

procedure TdViewGrid.SetMode(mode: TdelMode);
begin
  if mode = dmSelect then begin
    self.Caption := 'Select Delimiter';
    cbColumns.Visible := false;
  end
  else begin
    self.Caption := 'View Grid';
    cbColumns.Visible := true;
  end;
end;

end.
