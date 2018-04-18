unit dlgFileList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, dlgStandardTool, Menus;

type
  TFileOpenEvent = procedure(filename, line: String) of object;

  TdFileList = class(TdStandardTool)
    lvfiles: TListView;
    imglst: TImageList;
    popfilelist: TPopupMenu;
    Export1: TMenuItem;
    CopyAll1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure lvfilesDblClick(Sender: TObject);
    procedure CopyAll1Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
  private
    FFileOpenEvent: TFileOpenEvent;
    { Private declarations }
  public
    { Public declarations }
    procedure AddFile( Name, Path, Line, Text: String);
    procedure Clear;
    property OnOpenFile: TFileOpenEvent read FFileOpenEvent write FFileOpenEvent;
  end;

var
  dFileList: TdFileList;

implementation

uses Clipbrd, frmImages;

{$R *.dfm}

procedure TdFileList.AddFile(Name, Path, Line, Text: String);
var
  item: TlistItem;
begin
  item := lvfiles.Items.Add;
  item.Caption := Name;
  item.ImageIndex := 21;
  item.SubItems.Add(Path);
  item.SubItems.Add(Line);
  item.SubItems.Add(Text);
end;

procedure TdFileList.Clear;
begin
  lvfiles.Clear;
end;

procedure TdFileList.FormCreate(Sender: TObject);
begin
  lvfiles.Clear;
end;

procedure TdFileList.lvfilesDblClick(Sender: TObject);
var
  nme, pth, lne: String;
begin
  if lvfiles.ItemIndex <= -1 then exit;
  nme := lvfiles.Items[lvfiles.ItemIndex].Caption;
  pth := lvfiles.Items[lvfiles.ItemIndex].SubItems[0];
  lne := lvfiles.Items[lvfiles.ItemIndex].SubItems[1];
  if assigned(FFileOpenEvent) then
    FFileOpenEvent(pth + nme, lne);
end;

procedure TdFileList.CopyAll1Click(Sender: TObject);
var
  i,j: integer;
  grid, line: string;
begin
  inherited;
  //Copy All
  grid := '';
  for i := 0 to lvfiles.Items.Count - 1 do begin
    line := '';
    line := line + lvfiles.Items[i].Caption + chr(9);
    for j := 0 to lvfiles.Items[i].SubItems.Count - 1 do begin
      line := line + lvfiles.Items[i].SubItems[j];
      if j < lvfiles.Items[i].SubItems.Count - 1 then line := line + chr(9);
    end;
    grid := grid + line + chr(13) + chr(10);
  end;
  clipboard.AsText := grid;
end;

procedure TdFileList.Export1Click(Sender: TObject);
begin
  inherited;
  clipboard.AsText := lvfiles.Selected.Caption;
end;

end.
