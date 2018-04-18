unit dlgMonthCal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, ComCtrls, StdCtrls, ExtCtrls;

type
  TdMonCal = class(TdStandard)
    mcal: TMonthCalendar;
    procedure FormCreate(Sender: TObject);
  private
    function GetSelDate: TDateTime;
    { Private declarations }
  public
    { Public declarations }
    property SelectedDate: TDateTime read GetSelDate;
  end;

var
  dMonCal: TdMonCal;

implementation

{$R *.dfm}

procedure TdMonCal.FormCreate(Sender: TObject);
begin
  inherited;
  mcal.Date := now;
end;

function TdMonCal.GetSelDate: TDateTime;
begin
  result := mcal.Date;
end;

end.
