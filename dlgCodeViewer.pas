unit dlgCodeViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgTextGrid, Menus, Grids, unitUtils;

type
  TdCodeViewer = class(TdTextGrid)
    procedure sgridDblClick(Sender: TObject);
  private
    FOnSetText: TOnSetText;
    { Private declarations }
  public
    { Public declarations }
    property OnSetText: TOnSetText read FOnSetText write FOnSetText;
  end;

var
  dCodeViewer: TdCodeViewer;

implementation

{$R *.dfm}

procedure TdCodeViewer.sgridDblClick(Sender: TObject);
var
  txt: String;
begin
//  inherited;
  //Don't run inherited Event
  if assigned(FOnSetText) then begin
    txt := sgrid.Cells[sgrid.Col, sgrid.Row];
    FOnSetText(txt);
  end;
end;

end.
