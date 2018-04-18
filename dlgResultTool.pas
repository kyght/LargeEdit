unit dlgResultTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandardTool, StdCtrls, Menus;

type
  TdResultTool = class(TdStandardTool)
    mrs: TMemo;
    pmemo: TPopupMenu;
    clear1: TMenuItem;
    Copy1: TMenuItem;
    CopyAll1: TMenuItem;
    procedure clear1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure CopyAll1Click(Sender: TObject);
  private
    function GetResMemo: TMemo;
    { Private declarations }
  public
    { Public declarations }
    property ResultMemo: TMemo read GetResMemo; 
  end;

var
  dResultTool: TdResultTool;

implementation

{$R *.dfm}

uses Clipbrd;

{ TdResultTool }

function TdResultTool.GetResMemo: TMemo;
begin
  result := mrs;
end;

procedure TdResultTool.clear1Click(Sender: TObject);
begin
  inherited;
  mrs.Lines.Clear;
end;

procedure TdResultTool.Copy1Click(Sender: TObject);
begin
  inherited;
  clipboard.AsText := mrs.SelText;
end;

procedure TdResultTool.CopyAll1Click(Sender: TObject);
begin
  inherited;
  clipboard.AsText := mrs.Lines.Text;
end;

end.
