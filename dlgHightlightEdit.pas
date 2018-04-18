unit dlgHightlightEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEditHighlighter, SynHighlighterSQL, StdCtrls, ColorGrd, ExtCtrls,
  CheckLst, SynEdit, Buttons;

type
  TdlgHighlightEditor = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cdlg: TColorDialog;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    cg: TColorGrid;
    lb: TListBox;
    cbStyle: TCheckListBox;
    SynEdit1: TSynEdit;
    sbNone: TSpeedButton;
    procedure lbClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cgChange(Sender: TObject);
    procedure cbStyleClickCheck(Sender: TObject);
    procedure sbNoneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    syn: TSynCustomHighlighter;
    highlight: TSynHighlighterAttributes;
    function ColorToIndex(color: TColor): integer;
    procedure DisplayAttributes;
    function GetAttributesByName(AName: String): TSynHighlighterAttributes;
    procedure DisplaySample;
    function GetFilterExts(Filter: String): TStringList;
    procedure SetSyntax(const Value: TSynCustomHighlighter);
  public
    { Public declarations }
    property MasterSyn: TSynCustomHighlighter read syn write SetSyntax;
  end;

var
  dlgHighlightEditor: TdlgHighlightEditor;

implementation

uses vcl_util;

const
  scTitle = 'Highlight Editor';

{$R *.DFM}

function TdlgHighlightEditor.ColorToIndex(color: TColor): integer;
begin
  case color of
    clBlack: result := 0;
    clMaroon: result := 1;
    clGreen: result := 2;
    clOlive: result := 3;
    clNavy: result := 4;
    clPurple: result := 5;
    clTeal: result := 6;
    clGray: result := 7;
    clSilver: result := 8;
    clRed: result := 9;
    clLime: result := 10;
    clYellow: result := 11;
    clBlue: result := 12;
    clFuchsia: result := 13;
    clAqua: result := 14;
    clWhite: result := -1;
  else
    result := -1;
  end;
end;

procedure TdlgHighlightEditor.lbClick(Sender: TObject);
var
  nme: String;
  i: integer;
begin
  if lb.ItemIndex = -1 then exit;
  nme := lb.Items[lb.ItemIndex];
  highlight := GetAttributesByName(nme);
  if not assigned(highlight) then
    if assigned(syn.Attribute[lb.ItemIndex]) then
      highlight := syn.Attribute[lb.ItemIndex];
  if not assigned(highlight) then raise exception.Create('Unable to locate highlight attribute');

  cg.BackgroundIndex := ColorToIndex(highlight.Background);
  cg.ForegroundIndex := ColorToIndex(highlight.Foreground);

  for i := 0 to cbStyle.Count -1 do
    cbStyle.Checked[i] := false;

  if fsBold in highlight.Style then
    cbStyle.Checked[0] := true;
  if fsItalic in highlight.Style then
    cbStyle.Checked[1] := true;
  if fsUnderline in highlight.Style then
    cbStyle.Checked[2] := true;
  if fsStrikeout in highlight.Style then
    cbStyle.Checked[3] := true;


{  if lb.ItemIndex = -1 then exit;
  case lb.ItemIndex of
    0: highlight := syn.CommentAttri;
    1: highlight := syn.DataTypeAttri;
    2: highlight := syn.ExceptionAttri;
    3: highlight := syn.FunctionAttri;
    4: highlight := syn.IdentifierAttri;
    5: highlight := syn.KeyAttri;
    6: highlight := syn.NumberAttri;
    7: highlight := syn.SpaceAttri;
    8: highlight := syn.StringAttri;
    9: highlight := syn.SymbolAttri;
    10: highlight := syn.VariableAttri;
    11: highlight := syn.PLSQLAttri;
    12: highlight := syn.SQLPLusAttri;
  end;

  cg.BackgroundIndex := ColorToIndex(highlight.Background);
  cg.ForegroundIndex := ColorToIndex(highlight.Foreground);

  if fsBold in highlight.Style then
    cbStyle.Checked[0] := true;
  if fsItalic in highlight.Style then
    cbStyle.Checked[1] := true;
  if fsUnderline in highlight.Style then
    cbStyle.Checked[2] := true;
  if fsStrikeout in highlight.Style then
    cbStyle.Checked[3] := true;}
end;

procedure TdlgHighlightEditor.FormShow(Sender: TObject);
begin
  synedit1.Highlighter := syn;
  Caption  := scTitle + ' - ' + syn.LanguageName;
  DisplayAttributes;
  lb.ItemIndex := 0;
  lbClick(sender);
  DisplaySample;
end;

procedure TdlgHighlightEditor.cgChange(Sender: TObject);
begin
  if cg.BackgroundIndex <> -1 then begin
    highlight.Background := cg.BackgroundColor;
    if (highlight.Foreground = clNone) then
      sbNone.Caption := 'FG'
    else
      sbNone.Caption := '';
  end;

  if cg.ForegroundIndex <> -1 then begin
    highlight.Foreground := cg.ForegroundColor;
    if (highlight.Background = clNone) then
      sbNone.Caption := 'BG'
    else
      sbNone.Caption := '';
  end
end;

procedure TdlgHighlightEditor.cbStyleClickCheck(Sender: TObject);
begin
  if cbStyle.Checked[0] then
    highlight.Style := highlight.Style + [fsBold]
  else
    highlight.Style := highlight.Style - [fsBold];
  if cbStyle.Checked[1] then
    highlight.Style := highlight.Style + [fsItalic]
  else
    highlight.Style := highlight.Style - [fsItalic];
  if cbStyle.Checked[2] then
    highlight.Style := highlight.Style + [fsUnderLine]
  else
    highlight.Style := highlight.Style - [fsUnderLine];
  if cbStyle.Checked[3] then
    highlight.Style := highlight.Style + [fsStrikeOut]
  else
    highlight.Style := highlight.Style - [fsStrikeOut];
end;

procedure TdlgHighlightEditor.sbNoneMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then begin
    highlight.Background := clNone;
    sbNone.Caption := 'BG';
    cg.BackgroundIndex := -1;
  end
  else if Button = mbLeft then begin
    highlight.Foreground := clNone;
    sbNone.Caption := 'FG';
    cg.ForegroundIndex := -1;
  end;
end;

procedure TdlgHighlightEditor.Button1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TdlgHighlightEditor.DisplayAttributes;
var
  i: integer;
  nme: String;
begin
  lb.Items.Clear;
  for i := 0 to syn.AttrCount -1 do begin
    nme := syn.Attribute[i].Name;
    lb.Items.Add(nme);
  end;
end;

function TdlgHighlightEditor.GetAttributesByName(
  AName: String): TSynHighlighterAttributes;
var
  i: integer;
  nme: String;
begin
  for i := 0 to syn.AttrCount -1 do begin
    nme := syn.Attribute[i].Name;
    if uppercase(nme) = uppercase(AName) then begin
      result := syn.Attribute[i];
      break;
      end;
  end;
end;

procedure TdlgHighlightEditor.DisplaySample;
var
  spl, test: String;
  exts: TStringList;
  i: integer;
begin
  Synedit1.Lines.Clear;
  if length(MasterSyn.SampleSource) > 0 then begin
    Synedit1.Lines.Text := MasterSyn.SampleSource;
    exit;
  end;

  spl := extractfilepath(application.ExeName) + 'samples\sample';
  exts := GetFilterExts(syn.DefaultFilter);
  try
    for i := 0 to exts.Count - 1 do begin
       test := spl + exts[i];
       test := StringReplace(test,'*', '', [rfReplaceAll, rfIgnoreCase]);
       if fileexists(test) then begin
        Synedit1.Lines.LoadFromFile(test);
        break;
        end;
    end;
  finally
    exts.Free;
  end
end;

function TdlgHighlightEditor.GetFilterExts(Filter: String): TStringList;
var
  px: integer;
  exts: String;
begin
  px := Pos('|', Filter);
  if px = 0 then
    exts := filter
  else
    exts := Copy(Filter,px+1, length(filter));

  result := SplitStr(exts,';');
end;

procedure TdlgHighlightEditor.SetSyntax(
  const Value: TSynCustomHighlighter);
begin
  syn := Value;
end;

procedure TdlgHighlightEditor.Button2Click(Sender: TObject);
begin
  ModalResult := MrCancel;
end;

end.
