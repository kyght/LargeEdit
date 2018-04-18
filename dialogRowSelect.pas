unit dialogRowSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  dlgStandard, StdCtrls, ExtCtrls, Db, Grids, DBGrids, unitDataUtils;

type
  TdlgRowSelect = class(TdStandard)
    DBGrid1: TDBGrid;
    ds: TDataSource;
    dsilbxGo: TButton;
    txtSearchCriteria: TEdit;
    procedure txtSearchCriteriaChange(Sender: TObject);
    procedure dsilbxGoClick(Sender: TObject);
  private
    { Private declarations }
    FData: TDataSet;
    FSM: TSearchByMethod;
  public
    constructor Create(AOwner: TComponent; Data: TDataSet; SM: TSearchByMethod); reintroduce;
    function Execute: Boolean;
    property Data: TDataSet read FData;
    { Public declarations }
  end;

var
  dlgRowSelect: TdlgRowSelect;

implementation

{$R *.DFM}

constructor TdlgRowSelect.Create(AOwner: TComponent; Data: TDataSet;
  SM: TSearchByMethod);
begin
  inherited Create(AOwner);
  FData := Data;
  FSM := SM;
end;

function TdlgRowSelect.Execute: Boolean;
begin
  ds.DataSet := FData;
  if Showmodal = mrOk then
    result := true
  else
    result := false;
end;

procedure TdlgRowSelect.txtSearchCriteriaChange(Sender: TObject);
begin
  inherited;
  if ( Length( Trim( TEdit(Sender).Text ) ) > 0 ) then
    dsilbxGo.Enabled := true
  else
    dsilbxGo.Enabled := false;
end;

procedure TdlgRowSelect.dsilbxGoClick(Sender: TObject);
begin
  inherited;
  FData := FSM(txtSearchCriteria.Text);
end;

end.
