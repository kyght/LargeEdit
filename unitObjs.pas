unit unitObjs;

interface

uses SynEditMiscClasses;

  type
    TEditSynGutter = class(TSynGutter)
  private
    FStartValue: integer;
  public
    procedure AutoSizeDigitCount(LinesCount: integer);
    function FormatLineNumber(Line: integer): string;
    property StartValue: integer read FStartValue write FStartValue;
  end;


implementation

{ TEditSynGutter }

procedure TEditSynGutter.AutoSizeDigitCount(LinesCount: integer);
begin
  inherited AutoSizeDigitCount( Fstartvalue + linescount );
end;

function TEditSynGutter.FormatLineNumber(Line: integer): string;
begin
  inherited FormatLineNumber(Fstartvalue + line);
end;

end.
 