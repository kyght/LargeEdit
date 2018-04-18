unit dlgManageList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgSelectList, StdCtrls, ExtCtrls, ToolWin, ComCtrls, ActnList;

type
  TOnAddItem = function(): string of Object;
  TOnRemoveItem = function(item: string): boolean of Object;

  TdManageList = class(TdSelectList)
    ToolBar1: TToolBar;
    actlist: TActionList;
    aAddItem: TAction;
    aRemoveItem: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure aAddItemExecute(Sender: TObject);
    procedure aRemoveItemExecute(Sender: TObject);
  private
    FOnAddItem: TOnAddItem;
    FOnRemoveItem: TOnRemoveItem;
    { Private declarations }
  public
    { Public declarations }
    property OnAddItem: TOnAddItem read FOnAddItem write FOnAddItem;
    property OnRemoveItem: TOnRemoveItem read FOnRemoveItem write FOnRemoveItem;
  end;

var
  dManageList: TdManageList;

implementation

uses frmImages;

{$R *.dfm}

procedure TdManageList.aAddItemExecute(Sender: TObject);
var
  res: string;
begin
  inherited;
  //Add Item
  if assigned(FOnAddItem) then
    res := FOnAddItem;
  if length(res) > 0 then
    listb.Items.Add(res);
end;

procedure TdManageList.aRemoveItemExecute(Sender: TObject);
begin
  inherited;
  //Remove Item
  if listb.ItemIndex < 0 then begin
    ShowMessage('Select a highlighter first');
    exit;
  end;
  if assigned(FOnRemoveItem) then begin
    if FOnRemoveItem(listb.Items[listb.ItemIndex]) then
      listb.Items.Delete(listb.ItemIndex);
  end;
end;

end.
