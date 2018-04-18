unit frmPrintPreviewHex;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, ActnList, ImgList, Dialogs,
  MPHexEditorEx, Menus, AppEvnts, Printers, QuickRpt, QRCtrls;

type
  TfPrintPreHex = class(TForm)
    ImageList: TImageList;
    ActionList: TActionList;
    FirstCmd: TAction;
    PrevCmd: TAction;
    NextCmd: TAction;
    LastCmd: TAction;
    ZoomCmd: TAction;
    PrintCmd: TAction;
    CloseCmd: TAction;
    ToolBar1: TToolBar;
    FirstBtn: TToolButton;
    PrevBtn: TToolButton;
    NextBtn: TToolButton;
    LastBtn: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    PrintBtn: TToolButton;
    ToolButton4: TToolButton;
    CloseBtn: TToolButton;
    StatusBar: TStatusBar;
    PopupMenu1: TPopupMenu;
    Fitto1: TMenuItem;
    Pagewidth1: TMenuItem;
    N1: TMenuItem;
    N251: TMenuItem;
    N501: TMenuItem;
    N1001: TMenuItem;
    N2001: TMenuItem;
    N4001: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    qrimg: TImage;
    hsb: TScrollBar;
    vsb: TScrollBar;

    procedure FirstCmdExecute(Sender: TObject);
    procedure PrevCmdExecute(Sender: TObject);
    procedure NextCmdExecute(Sender: TObject);
    procedure LastCmdExecute(Sender: TObject);
    procedure ZoomCmdExecute(Sender: TObject);
    procedure PrintCmdExecute(Sender: TObject);
    procedure CloseCmdExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Fitto1Click(Sender: TObject);
    procedure ApplicationEvents1Hint(Sender: TObject);
    procedure SynEditPrintPreviewMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SynEditPrintPreviewPreviewPage(Sender: TObject;
      PageNumber: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure hsbScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure vsbScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
  private
    { Private declarations }
    FScale: Integer;
    FHexEditor: TMPHexEditorEx;
    CurPage: TMetaFile;
    CurPageNum: integer;
    MaxPages: integer;
    Drawrec: TRect;
    procedure ShowPage(Num: Integer);
    procedure ReDrawScale( Scale: integer );
    procedure DrawPicture;
  public
    { Public declarations }
    function ShowPreview(HexEdit: TMPHexEditorEx): boolean;
  end;

var
  fPrintPreHex: TfPrintPreHex;

implementation

uses frmHexEditor;

{$R *.DFM}

procedure TfPrintPreHex.FormShow(Sender: TObject);
begin
  CurPageNum := 1;
  FScale := 100;
  MaxPages := FHexEditor.PrintNumPages;
  ShowPage(CurPageNum);

{  if Printer.PrinterIndex >= 0 then
    PrintCmd.Hint := 'Print (' + Printer.Printers[Printer.PrinterIndex] +
      ')|Print the document on ' + Printer.Printers[Printer.PrinterIndex];}
end;

procedure TfPrintPreHex.FirstCmdExecute(Sender: TObject);
begin
  CurPageNum := 1;
  ShowPage(CurPageNum);
//  SynEditPrintPreview.FirstPage;
end;

procedure TfPrintPreHex.PrevCmdExecute(Sender: TObject);
begin
  if CurPageNum > 1 then begin
    CurPageNum := CurPageNum -1;
    ShowPage(CurPageNum);
    end;
//  SynEditPrintPreview.PreviousPage;
end;

procedure TfPrintPreHex.NextCmdExecute(Sender: TObject);
begin
  if CurPageNum < MaxPages then begin
    CurPageNum := CurPageNum +1;
    ShowPage(CurPageNum);
    end;
//  SynEditPrintPreview.NextPage;
end;

procedure TfPrintPreHex.LastCmdExecute(Sender: TObject);
begin
  CurPageNum := MaxPages;
  ShowPage(CurPageNum);
//  SynEditPrintPreview.LastPage;
end;

procedure TfPrintPreHex.ZoomCmdExecute(Sender: TObject);
begin
//  SynEditPrintPreview.ScaleMode := pscWholePage;
end;

procedure TfPrintPreHex.PrintCmdExecute(Sender: TObject);
begin
//  SynEditPrintPreview.Print;
//  fLEdit.PrintDialog;
  fHexEdit.PrintDialog;
end;

procedure TfPrintPreHex.CloseCmdExecute(Sender: TObject);
begin
  Close;
end;

procedure TfPrintPreHex.Fitto1Click(Sender: TObject);
begin
  case (Sender as TMenuItem).Tag of
    -1: ReDrawScale(100);
    -2: ReDrawScale(150);
  else
    ReDrawScale((Sender as TMenuItem).Tag);
  end;
end;

procedure TfPrintPreHex.ApplicationEvents1Hint(Sender: TObject);
begin
  StatusBar.Panels[0].Text := '  ' + Application.Hint;
end;

procedure TfPrintPreHex.SynEditPrintPreviewMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
//  FScale := SynEditPrintPreview.ScalePercent;
  if Button = mbLeft then begin
//    if SynEditPrintPreview.ScaleMode = pscWholePage then
//      SynEditPrintPreview.ScalePercent := 100
//    else begin
      FScale := FScale * 2;
      if FScale > 400 then
        FScale := 400;
//      SynEditPrintPreview.ScalePercent := FScale;
//    end;
  end
  else begin
    FScale := FScale div 2;
    if FScale < 25 then
      FScale := 25;
//    SynEditPrintPreview.ScalePercent := FScale;
  end;
  ReDrawScale(FScale);
end;

procedure TfPrintPreHex.SynEditPrintPreviewPreviewPage(
  Sender: TObject; PageNumber: Integer);
begin
//  StatusBar.Panels[1].Text := ' Page: ' + IntToStr(SynEditPrintPreview.PageNumber);
end;

function TfPrintPreHex.ShowPreview(HexEdit: TMPHexEditorEx): boolean;
begin
  FHexEditor := HexEdit;
  showmodal;
end;

procedure TfPrintPreHex.ShowPage(Num: Integer);
begin
  if assigned(CurPage) then begin CurPage.Free; CurPage := nil end;
  try
    CurPage := FHexEditor.PrintPreview(num);
  except
  end;
  if assigned(CurPage) then begin
    Drawrec := qrimg.BoundsRect;
    DrawPicture;
{    qrimg.Canvas.FloodFill(qrimg.ClientWidth, qrimg.ClientHeight, clWhite, fsBorder);
    qrimg.Canvas.StretchDraw(qrimg.BoundsRect, curpage);
    hsb.Max := qrimg.BoundsRect.Right;
    hsb.Min := qrimg.BoundsRect.Left;
    hsb.Position := Round(qrimg.Width / 2);
    vsb.Max := qrimg.BoundsRect.Bottom;
    vsb.Min := qrimg.BoundsRect.Top;
    vsb.Position := Round(qrimg.Height / 2);
    }
    end;
end;

procedure TfPrintPreHex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if assigned(CurPage) then CurPage.Free;
  CurPage := nil;
end;

procedure TfPrintPreHex.ReDrawScale(Scale: integer);
var
  scl: integer;
begin
  scl := Scale - 100;
  Drawrec.Top := qrimg.BoundsRect.Top - scl;
  Drawrec.Left := qrimg.BoundsRect.Left - scl;
  Drawrec.Right := qrimg.BoundsRect.right + scl;
  Drawrec.Bottom := qrimg.BoundsRect.Bottom + scl;

  DrawPicture;
//  qrimg.Canvas.FloodFill(qrimg.ClientWidth, qrimg.ClientHeight, clWhite, fsBorder);
//  qrimg.Canvas.StretchDraw(Drawrec, curpage);

  FScale := Scale;
end;

procedure TfPrintPreHex.hsbScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  //Scrolling
  if Scrollcode in [scLineUp, scTop, scPageup] then begin
    DrawRec.Left := DrawRec.Left + ScrollPos;
    DrawRec.Right := DrawRec.Right + ScrollPos;
    end
  else if Scrollcode in [scLineDown, scBottom, scPagedown] then begin
    DrawRec.Left := DrawRec.Left - ScrollPos;
    DrawRec.Right := DrawRec.Right - ScrollPos;
    end;
  DrawPicture;
end;

procedure TfPrintPreHex.DrawPicture;
var
  blank: TRect;
begin
//    qrimg.Canvas.FloodFill(qrimg.ClientWidth, qrimg.ClientHeight, clWhite, fsBorder);
  blank.Left := -100;
  blank.Top := -100;
  blank.Right := 1000;
  blank.Bottom := 1000;
  with qrimg do begin
    Canvas.Brush.Color := clWhite;
//    Canvas.FillRect(self.BoundsRect);
//    Canvas.FillRect(Drawrec);
    Canvas.FillRect(blank);
//    Canvas.FloodFill(ClientWidth, ClientHeight, clWhite, fsBorder);
    Canvas.StretchDraw(Drawrec, curpage);
  end;
//    hsb.Max := Drawrec.Right;
//    hsb.Min := Drawrec.Left;
//    hsb.Position := Round(Drawrec.Right / 2);
//    vsb.Max := Drawrec.Bottom;
//    vsb.Min := Drawrec.Top;
//    vsb.Position := Round(Drawrec.Bottom / 2);
end;

procedure TfPrintPreHex.vsbScroll(Sender: TObject; ScrollCode: TScrollCode;
  var ScrollPos: Integer);
begin
  //Scrolling
  if Scrollcode in [scLineUp, scTop, scpageup] then begin
    DrawRec.Top := DrawRec.Top + ScrollPos;
    DrawRec.Bottom := DrawRec.Bottom + ScrollPos;
    end
  else if Scrollcode in [scLineDown, scBottom, scPageDown] then begin
    DrawRec.Top := DrawRec.Top - ScrollPos;
    DrawRec.Bottom := DrawRec.Bottom - ScrollPos;
    end;
  DrawPicture;
end;

end.

