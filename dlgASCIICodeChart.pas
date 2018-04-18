unit dlgASCIICodeChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, Grids;

type
  TdASCIICodes = class(TdStandard)
    StringGrid1: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dASCIICodes: TdASCIICodes;

implementation

{$R *.dfm}

end.
