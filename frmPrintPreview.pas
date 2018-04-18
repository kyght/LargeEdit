unit frmPrintPreview;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, ToolWin, ActnList, ImgList, Dialogs,
  SynEditPrintPreview, Menus, AppEvnts, Printers;

type
  TfPrintPre = class(TForm)
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
    SynEditPrintPreview: TSynEditPrintPreview;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrintPre: TfPrintPre;

implementation

uses fLargePad, frmImages;

{$R *.DFM}

procedure TfPrintPre.FormShow(Sender: TObject);
begin
  SynEditPrintPreview.UpdatePreview;
  SynEditPrintPreview.FirstPage;
  if Printer.PrinterIndex >= 0 then
    PrintCmd.Hint := 'Print (' + Printer.Printers[Printer.PrinterIndex] +
      ')|Print the document on ' + Printer.Printers[Printer.PrinterIndex];
end;

procedure TfPrintPre.FirstCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.FirstPage;
end;

procedure TfPrintPre.PrevCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.PreviousPage;
end;

procedure TfPrintPre.NextCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.NextPage;
end;

procedure TfPrintPre.LastCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.LastPage;
end;

procedure TfPrintPre.ZoomCmdExecute(Sender: TObject);
begin
  SynEditPrintPreview.ScaleMode := pscWholePage;
end;

procedure TfPrintPre.PrintCmdExecute(Sender: TObject);
begin
//  SynEditPrintPreview.Print;
  fLEdit.PrintDialog;
end;

procedure TfPrintPre.CloseCmdExecute(Sender: TObject);
begin
  Close;
end;

procedure TfPrintPre.Fitto1Click(Sender: TObject);
begin
  case (Sender as TMenuItem).Tag of
    -1: SynEditPrintPreview.ScaleMode := pscWholePage;
    -2: SynEditPrintPreview.ScaleMode := pscPageWidth;
  else
    SynEditPrintPreview.ScalePercent := (Sender as TMenuItem).Tag;
  end;
end;

procedure TfPrintPre.ApplicationEvents1Hint(Sender: TObject);
begin
  StatusBar.Panels[0].Text := '  ' + Application.Hint;
end;

procedure TfPrintPre.SynEditPrintPreviewMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var
  FScale: Integer;
begin
  FScale := SynEditPrintPreview.ScalePercent;
  if Button = mbLeft then begin
    if SynEditPrintPreview.ScaleMode = pscWholePage then
      SynEditPrintPreview.ScalePercent := 100
    else begin
      FScale := FScale * 2;
      if FScale > 400 then
        FScale := 400;
      SynEditPrintPreview.ScalePercent := FScale;
    end;
  end
  else begin
    FScale := FScale div 2;
    if FScale < 25 then
      FScale := 25;
    SynEditPrintPreview.ScalePercent := FScale;
  end;
end;

procedure TfPrintPre.SynEditPrintPreviewPreviewPage(
  Sender: TObject; PageNumber: Integer);
begin
  StatusBar.Panels[1].Text := ' Page: ' + IntToStr(SynEditPrintPreview.PageNumber);
end;

end.

