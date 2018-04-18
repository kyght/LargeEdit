unit dlgTextGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandardTool, Grids, Menus, fLargePad;

type
  TGetText = function: string of object;
  TMoveCaret = procedure(X, Y: integer) of object;
  TChangeText = procedure(XStart, XEnd, Y: integer; Text: String) of object;
  TGetDelimitText = function(XStart, Y: integer; Delimiter: Char): String of object;

  TdTextGrid = class(TdStandardTool)
    sgrid: TStringGrid;
    gridmenu: TPopupMenu;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    Copy1: TMenuItem;
    CopywithHeaders1: TMenuItem;
    Select1: TMenuItem;
    Column1: TMenuItem;
    Row1: TMenuItem;
    Data1: TMenuItem;
    SelectwithHeaders1: TMenuItem;
    Data2: TMenuItem;
    Column2: TMenuItem;
    Row2: TMenuItem;
    Export1: TMenuItem;
    FixedLength1: TMenuItem;
    NoDelimiter1: TMenuItem;
    Delimiter1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Delimited1: TMenuItem;
    procedure Refresh1Click(Sender: TObject);
    procedure sgridDblClick(Sender: TObject);
    procedure sgridSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure sgridGetEditText(Sender: TObject; ACol, ARow: Integer;
      var Value: String);
    procedure Copy1Click(Sender: TObject);
    procedure CopywithHeaders1Click(Sender: TObject);
    procedure Data1Click(Sender: TObject);
    procedure Data2Click(Sender: TObject);
    procedure Column2Click(Sender: TObject);
    procedure Column1Click(Sender: TObject);
    procedure Row1Click(Sender: TObject);
    procedure Row2Click(Sender: TObject);
    procedure Delimiter1Click(Sender: TObject);
    procedure NoDelimiter1Click(Sender: TObject);
    procedure Delimited1Click(Sender: TObject);
  private
    { Private declarations }
    FText: String;
    FCurCellValue: String;
    FDelimiter: Char;
    FFirstRowColumns: boolean;
    FOnGetText: TGetText;
    FOnSetCaret: TMoveCaret;
    FOnChangeText: TChangeText;
    FOnGetDelimitText: TGetDelimitText;
    FHeader: String;
    FOffSet: integer;
    FOffSetOverride: Boolean;
    FLEedit: TfLEdit;
    function GetRowOffSet: integer;
    procedure SetRowOffSet(offset: integer);
    procedure ClearRowOffSet();
    function GetRowText(rowid: integer): String;
    function GetRowColText(rowid, colid: integer): String;
    procedure ClearGrid( grid: TStringGrid );
    procedure SetCell(Col, Row: Integer; Text: String);
    procedure SetCellGrid(Col, Row: Integer; Text: String; SGrid: TStringGrid);
    procedure SetTextAtRow(Row: Integer; Text: TStringList);
    procedure SetRowCount( Count: Integer );
    procedure SetColumns( Text: String; Delimiter: Char; FirstRowColumns: Boolean );
    procedure SetTextAtRowGrid(Row: Integer; Text: TStringList; SGrid: TStringGrid);
    function GetDelimitedGrid(Delimiter: String; Headers: Boolean): String;
    function ExportToFixed(delimiter: string): String;
    procedure SelectData();
    procedure DeSelectData();
  public
    { Public declarations }
    procedure LoadGrid( Text: String; Delimiter: Char; FirstRowColumns: Boolean; Refresh: boolean = false );
    procedure Refresh;
    property HeaderLine: String read FHeader write FHeader;
    property OnGetText: TGetText read FOnGetText write FOnGetText;
    property OnSetCaret: TMoveCaret read FOnSetCaret write FOnSetCaret;
    property OnChangeText: TChangeText read FOnChangeText write FOnChangeText;
    property OnGetDelimitText: TGetDelimitText read FOnGetDelimitText write FOnGetDelimitText;
    property LEEditor: TfLEdit read FLEedit write FLEedit;
  end;

var
  dTextGrid: TdTextGrid;

implementation

uses vcl_util, Clipbrd, dlgViewGrid, math;

{$R *.dfm}

{ TdTextGrid }

procedure TdTextGrid.ClearGrid(grid: TStringGrid);
var
  i, j: integer;
begin
  for i := 0 to grid.RowCount -1 do
    for j := 0 to grid.ColCount -1 do
      grid.Cells[j,i] := '';
  grid.ColCount := 2;
  grid.RowCount := 2;
end;

procedure TdTextGrid.LoadGrid(Text: String; Delimiter: Char; FirstRowColumns: Boolean; Refresh: boolean = false);
var
  txt, spt: TStringList;
  lne: String;
  i, j, rows, currow: integer;
  outline: boolean;
begin
  FText := Text;
  FDelimiter := Delimiter;
  FFirstRowColumns := FirstRowColumns;

  ClearGrid(sgrid);
  txt := TStringList.Create;
  currow := 0;
  try
    txt.Text := Text;
    rows := txt.count - GetRowOffSet;
    if Refresh and FirstRowColumns then rows := rows + 1;
    SetRowCount(rows);
    for i := 0 to txt.count - 1 do begin
      outline := true;
      //if not FirstRowColumns then
      //  currow := currow + 1;
      lne := txt[i];
      if i = 0 then begin
        if not(refresh) and FirstRowColumns then FHeader := lne;
        SetColumns(FHeader, Delimiter, FirstRowColumns);
        if (FHeader <> lne) then
          SetRowOffSet(0)
        else
          ClearRowOffSet();
        if FirstRowColumns and (FHeader = lne) then begin
          outline := false;
          end
        else
          currow := currow + 1;
      end;
      if outline then begin
        spt := SplitStr(lne, Delimiter);
        if sgrid.ColCount <= spt.Count then
          sgrid.ColCount := spt.Count+1;
        try
          SetTextAtRow(currow, spt);
        finally
          spt.Free;
        end;
      end; //if outline
      currow := currow + 1
    end;
  finally
    txt.Free;
  end;
end;

procedure TdTextGrid.SetCell(Col, Row: Integer; Text: String);
var
  ln: integer;
begin
  sgrid.Cells[Col,Row] := Text;
  ln := length(text);
  if ln = 0 then ln := 1;
  ln := ln * sgrid.Font.Size;
  if ln > 500 then ln := 500;
  if sgrid.ColWidths[col] < ln then
    sgrid.ColWidths[col] := ln;
end;

procedure TdTextGrid.SetColumns(Text: String; Delimiter: Char;
  FirstRowColumns: Boolean);
var
  spt: TStringList;
  i: integer;
begin
  spt := SplitStr(Text, Delimiter);
  try
    sgrid.ColCount := spt.Count+1;
    if FirstRowColumns then begin
      SetTextAtRow(0, spt);
    end
    else begin
      for i := 0 to sgrid.ColCount - 1 do
        SetCell(i+1, 0, IntToStr(i+1));
    end;
  finally
    spt.Free;
  end;
end;

procedure TdTextGrid.SetRowCount(Count: Integer);
var
  i: integer;
begin
  if count > sgrid.RowCount then
    sgrid.RowCount := Count+1;
  for i := 1 to sgrid.RowCount - 1 do
    sgrid.Cells[0,i] := IntToStr(i);
end;

procedure TdTextGrid.SetTextAtRow(Row: Integer; Text: TStringList);
var
  i: integer;
begin
  for i := 0 to Text.Count - 1 do
    SetCell(i+1, row, text[i]);
end;

procedure TdTextGrid.Refresh1Click(Sender: TObject);
var
  txt: String;
  c, r: integer;
begin
  inherited;
  if assigned(FOnGetText) then
    txt := FOnGetText
  else
    txt := FText;

  c := sgrid.Col;
  r := sgrid.Row;
  LoadGrid(txt, FDelimiter, FFirstRowColumns, true);
  sgrid.Col := c;
  sgrid.Row := r;
end;

procedure TdTextGrid.sgridDblClick(Sender: TObject);
var
  txt: String;
  x,y: integer;
begin
  inherited;
  //Locate Text in file
  if assigned(FOnSetCaret) then begin
    txt := GetRowColText(sgrid.Row, sgrid.Col-1);
    x := length(txt)+1;
    y := sgrid.Row+GetRowOffSet;
    FOnSetCaret( x, y );
  end;
end;

function TdTextGrid.GetRowText(rowid: integer): String;
var
  i: integer;
begin
  result := '';
  for i := 1 to sgrid.ColCount -1 do begin
    result := result + sgrid.Cells[i,rowid];
    if i < sgrid.ColCount -1 then
      result := result + FDelimiter;
    end;
end;

function TdTextGrid.GetRowColText(rowid, colid: integer): String;
var
  i: integer;
begin
  result := '';
  for i := 1 to colid do begin
    result := result + sgrid.Cells[i,rowid];
    if i < sgrid.ColCount -1 then
      result := result + FDelimiter;
  end;
end;

procedure TdTextGrid.sgridSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: String);
var
  txt, coltext, curtext: String;
  xs, xe, y: integer;
begin
  inherited;
  //Change Text in file
  if assigned(FOnChangeText) then begin
    txt := GetRowColText(ARow, ACol-1);
    xs := length(txt)+1;
    y := ARow+GetRowOffSet;
    if assigned(FOnGetDelimitText) then
      curtext := FOnGetDelimitText(xs, y, FDelimiter)
    else
      curtext := FCurCellValue;
    xe := xs + length(curtext);
    coltext := value;
    FOnChangeText( xs, xe, y, coltext );
    FCurCellValue := value;
  end;
end;

procedure TdTextGrid.sgridGetEditText(Sender: TObject; ACol, ARow: Integer;
  var Value: String);
begin
  inherited;
  FCurCellValue := value;
end;

function TdTextGrid.GetRowOffSet: integer;
begin
  if (FOffSetOverride) then begin
    result := FOffSet;
  end
  else begin
    if FFirstRowColumns then
      result := 1
    else
      result := 0;
  end;
end;

procedure TdTextGrid.SetTextAtRowGrid(Row: Integer; Text: TStringList;
  SGrid: TStringGrid);
var
  i: integer;
begin
  for i := 0 to Text.Count - 1 do
    SetCellGrid(i+1, row, text[i], SGrid);
end;

procedure TdTextGrid.SetCellGrid(Col, Row: Integer; Text: String;
  SGrid: TStringGrid);
var
  ln: integer;
begin
  SGrid.Cells[Col,Row] := Text;
  ln := length(text);
  if ln = 0 then ln := 1;
  ln := ln * SGrid.Font.Size;
  if SGrid.ColWidths[col] < ln then
    SGrid.ColWidths[col] := ln;
end;

procedure TdTextGrid.Refresh;
begin
  if length(FText) > 0 then
    Refresh1Click(nil);
end;

procedure TdTextGrid.SetRowOffSet(offset: integer);
begin
  FOffSet := offset;
  FOffSetOverride := true;
end;

procedure TdTextGrid.ClearRowOffSet;
begin
  FOffSetOverride := false;
end;

function TdTextGrid.GetDelimitedGrid(Delimiter: String; Headers: Boolean): String;
var
  i, j, cnt, total: integer;
  rec: String;
  outlist, selfields: TStringList;
  sel: boolean;
  scol, ecol, srow, erow: integer;
begin
  outlist := TStringList.Create;
  selfields := TStringList.Create;
  try
    //Check for selected columns
    scol := SGrid.Selection.Left;
    ecol := SGrid.Selection.Right;
    srow := SGrid.Selection.Top;
    erow := SGrid.Selection.Bottom;

    sel := false;
    with SGrid do begin
      cnt := 0;
      total := erow - srow;
      if headers then begin
        rec := '';
        for i := scol to ecol do begin
          if i = ecol then
            rec := rec + Cells[i, 0]
          else
            rec := rec + Cells[i, 0] + delimiter;
        end;
        outlist.Add(rec);
      end;

      for i := srow to erow do begin
        cnt := cnt + 1;
        rec := '';

        for j := scol to ecol do begin
          if j = selfields.Count - 1 then
            rec := rec + Cells[j, i]
          else
            rec := rec + Cells[j, i] + delimiter;
        end;

        outlist.Add(rec);
        //SetStatus('Copying to Clipboard', 'Record ' + IntToStr(cnt) + ' of ' + IntToStr(total));
        //application.ProcessMessages;
      end;
    end;
    result := outlist.Text;
  finally
    outlist.Free;
    selfields.Free;
  end;
end;


procedure TdTextGrid.Copy1Click(Sender: TObject);
var
  txt: string;
begin
  inherited;
  txt := GetDelimitedGrid(Chr(9), false);
  clipboard.AsText := txt;
end;

procedure TdTextGrid.CopywithHeaders1Click(Sender: TObject);
var
  txt: string;
begin
  inherited;
  txt := GetDelimitedGrid(Chr(9), true);
  clipboard.AsText := txt;
end;

procedure TdTextGrid.Data1Click(Sender: TObject);
var
  SelRect: TGridRect;
begin
  inherited;
  SelRect.Left := 1;
  SelRect.Top := 1;
  SelRect.Right := SGrid.ColCount -1;
  SelRect.Bottom := SGrid.RowCount -1;
  SGrid.Selection := SelRect;
end;

procedure TdTextGrid.Data2Click(Sender: TObject);
var
  SelRect: TGridRect;
begin
  inherited;
  SelRect.Left := 0;
  SelRect.Top := 0;
  SelRect.Right := SGrid.ColCount -1;
  SelRect.Bottom := SGrid.RowCount -1;
  SGrid.Selection := SelRect;
end;

procedure TdTextGrid.Column2Click(Sender: TObject);
var
  SelRect: TGridRect;
begin
  inherited;
  SelRect.Left := SGrid.Col;
  SelRect.Top := 0;
  SelRect.Right := SGrid.Col;
  SelRect.Bottom := SGrid.RowCount -1;
  SGrid.Selection := SelRect;
end;

procedure TdTextGrid.Column1Click(Sender: TObject);
var
  SelRect: TGridRect;
begin
  inherited;
  SelRect.Left := SGrid.Col;
  SelRect.Top := 1;
  SelRect.Right := SGrid.Col;
  SelRect.Bottom := SGrid.RowCount -1;
  SGrid.Selection := SelRect;
end;

procedure TdTextGrid.Row1Click(Sender: TObject);
var
  SelRect: TGridRect;
begin
  inherited;
  SelRect.Left := 1;
  SelRect.Top := SGrid.Row;
  SelRect.Right := SGrid.ColCount-1;
  SelRect.Bottom := SGrid.Row;
  SGrid.Selection := SelRect;
end;

procedure TdTextGrid.Row2Click(Sender: TObject);
var
  SelRect: TGridRect;
begin
  inherited;
  SelRect.Left := 0;
  SelRect.Top := SGrid.Row;
  SelRect.Right := SGrid.ColCount-1;
  SelRect.Bottom := SGrid.Row;
  SGrid.Selection := SelRect;
end;

function TdTextGrid.ExportToFixed(delimiter: string): String;
var
  i, j, wth, start, reclen, offset: integer;
  outtxt, cell: string;
  rec: TRect;
begin
  outtxt := '';
  start := 1;
  if FFirstRowColumns then start := 0;
  for j := start to sgrid.RowCount -1 do begin
    for i := 1 to sgrid.ColCount -1 do begin
      offset := 0;
      wth := sgrid.ColWidths[i];
      if wth > sgrid.Font.PixelsPerInch then
        offset := Round(wth / sgrid.Font.PixelsPerInch);
      wth := Ceil(wth / sgrid.Font.Size) + offset;
      //wth := Round(wth / (sgrid.Font.Height*-1));

      cell := sgrid.Cells[i, j];
      if length(cell) > wth then
        cell := Copy(cell, 0, wth)
      else
        cell := cell + StringOfChar(' ', (wth - length(cell)));
      outtxt := outtxt + cell + delimiter;
    end;
    outtxt := outtxt + Chr(13) + Chr(10);
  end;
  result := outtxt;
end;

procedure TdTextGrid.Delimiter1Click(Sender: TObject);
var
  txt: string;
  dlg: TdViewGrid;
begin
  inherited;
  //Ask user about delimiter and get fixed;
  dlg := TdViewGrid.Create(self);
  dlg.SetMode(dmSelect);
  if dlg.ShowModal = mrOK then begin
    txt := ExportToFixed(dlg.Delimiter);
    //Open New window and load with fixed text output
    LEEditor.OpenNewMulti();
    LEEditor.CurLEfile.Buffer.Text := txt;
    LEEditor.SetCurrentMemo;
  end;
end;

procedure TdTextGrid.NoDelimiter1Click(Sender: TObject);
var
  txt: string;
begin
  inherited;
  //Open New window and load with fixed text output
  txt := ExportToFixed('');
  LEEditor.OpenNewMulti();
  LEEditor.CurLEfile.Buffer.Text := txt;
  LEEditor.SetCurrentMemo;
end;

procedure TdTextGrid.Delimited1Click(Sender: TObject);
var
  txt: string;
  dlg: TdViewGrid;
begin
  inherited;
  //Ask user about delimiter and get fixed;
  dlg := TdViewGrid.Create(self);
  dlg.SetMode(dmSelect);
  if dlg.ShowModal = mrOK then begin
    SelectData;
    txt := GetDelimitedGrid(dlg.Delimiter, FFirstRowColumns);
    DeSelectData;
    //Open New window and load with fixed text output
    LEEditor.OpenNewMulti();
    LEEditor.CurLEfile.Buffer.Text := txt;
    LEEditor.SetCurrentMemo;
  end;
end;

procedure TdTextGrid.SelectData;
var
  SelRect: TGridRect;
begin
  SelRect.Left := 1;
  SelRect.Top := 1;
  SelRect.Right := SGrid.ColCount -1;
  SelRect.Bottom := SGrid.RowCount -1;
  SGrid.Selection := SelRect;
end;

procedure TdTextGrid.DeSelectData;
var
  SelRect: TGridRect;
begin
  SelRect.Left := 1;
  SelRect.Top := 1;
  SelRect.Right := 1;
  SelRect.Bottom := 1;
  SGrid.Selection := SelRect;
end;

end.
