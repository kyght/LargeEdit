unit dlgSTcodeViewer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandardTool, Grids;

type
  TdCodeViewer = class(TdStandardTool)
    sg: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  dCodeViewer: TdCodeViewer;

implementation

{$R *.dfm}

end.
