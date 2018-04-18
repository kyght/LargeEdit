unit dlgSelectList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls;

type
  TdSelectList = class(TdStandard)
    listb: TListBox;
  private
    function GetTitle: String;
    procedure SetTitle(const Value: String);
    function Getselected: integer;
    function GetselectedText: String;
    { Private declarations }
  public
    { Public declarations }
    procedure LoadList( List: TStringlist );
    property Title: String read GetTitle write SetTitle;
    property Selected: integer read Getselected;
    property SelectedText: String read GetselectedText;
  end;

var
  dSelectList: TdSelectList;

implementation

{$R *.dfm}

{ TdStandard1 }

function TdSelectList.Getselected: integer;
begin
  result := listb.ItemIndex;
end;

function TdSelectList.GetselectedText: String;
begin
  result := '';
  if listb.ItemIndex >= 0 then
    result := listb.Items[listb.ItemIndex];
end;

function TdSelectList.GetTitle: String;
begin
  result := Caption;
end;

procedure TdSelectList.LoadList(List: TStringlist);
var
  i: integer;
begin
  for i := 0 to list.Count - 1 do begin
    listb.Items.Add(list[i]);
  end;
end;

procedure TdSelectList.SetTitle(const Value: String);
begin
  Caption := Value;
end;

end.
