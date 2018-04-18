unit dlgEditCodeCompletion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, SynCompletionProposal, unitCompProposalFile,
  synedit;

type
  TdEditComplete = class(TdStandard)
    SynComp: TSynCompletionProposal;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    mcc: TMemo;
    Splitter1: TSplitter;
    lbItems: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtTitle: TEdit;
    cbMatch: TCheckBox;
    cbCase: TCheckBox;
    edtTrigs: TEdit;
    edtTokens: TEdit;
    edtTimer: TEdit;
    btnAdd: TButton;
    btnRemove: TButton;
    btnClear: TButton;
    edtTrigLength: TEdit;
    cbUseTrigLen: TCheckBox;
    cbuseTimer: TCheckBox;
    procedure FormDestroy(Sender: TObject);
    procedure lbItemsClick(Sender: TObject);
    procedure mccExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure lbItemsDblClick(Sender: TObject);
    procedure cbUseTrigLenClick(Sender: TObject);
  private
    FCompFile: String;
    ComPro: TCompletionProposal;
    FLanguage: String;
    { Private declarations }
  public
    { Public declarations }
    function SaveToFile: boolean;
    property CompleteFile: String read FCompFile write FCompFile;
    property Language: String read FLanguage write FLanguage;
  end;

var
  dEditComplete: TdEditComplete;

  function GetWorkAtCursor( ASynEdit: TSynEdit ): string;

implementation

{$R *.dfm}

function GetWorkAtCursor( ASynEdit: TSynEdit): string;
var
  ln, tok: String;
  i: integer;
begin
  tok := ''; ln := '';
//  ln := synedit1.LineText;
  ln := ASynEdit.Lines[ASynEdit.CaretY-1];
  if ASynEdit.CaretX < length(ln) then
    if (Ord(ln[ASynEdit.CaretX]) >= 65) and (Ord(ln[ASynEdit.CaretX]) <= 122) then begin
      result := '';
      exit;
    end;
  for i := length(ln) downto 1 do begin
    if (Ord(ln[i]) = VK_SPACE) or (Ord(ln[i]) = VK_RETURN) then break;
    tok := ln[i] + tok;
  end;
  result := tok;
end;



{ TdEditComplete }

function TdEditComplete.SaveToFile: boolean;
begin
  Compro.InsertList.Text := SynComp.InsertList.Text;
  Compro.ItemList.Text := SynComp.ItemList.Text;
  ComPro.Title := edtTitle.Text;
  ComPro.Triggers := edtTrigs.Text;
  ComPro.Tokens := edtTokens.Text;
  if StrToIntDef(edtTimer.Text,1000) < 1000 then
    ComPro.Timer := 1000
  else
    ComPro.Timer := StrToIntDef(edtTimer.Text, 1000);
  ComPro.Match := cbMatch.Checked;
  ComPro.CaseSen := cbCase.Checked;
  ComPro.UseTriggerLength := cbUseTrigLen.Checked;
  ComPro.UseTimer := cbuseTimer.Checked;
  ComPro.TriggerLength := StrToIntDef(edtTrigLength.Text, 3);
  ComPro.SaveToFile;
  result := true;
end;

procedure TdEditComplete.FormDestroy(Sender: TObject);
begin
  inherited;
  ComPro.Free;
end;

procedure TdEditComplete.lbItemsClick(Sender: TObject);
begin
  inherited;
  if lbItems.ItemIndex <= -1 then exit;
  mcc.Lines.Text := SynComp.InsertList.Strings[lbItems.ItemIndex];
end;

procedure TdEditComplete.mccExit(Sender: TObject);
begin
  inherited;
  if lbItems.ItemIndex <= -1 then exit;
  SynComp.InsertList.Strings[lbItems.ItemIndex] := StringReplace(mcc.Lines.Text, #$D#$A, ' ', [rfReplaceAll]);
end;

procedure TdEditComplete.FormShow(Sender: TObject);
begin
  inherited;
  ComPro := TCompletionProposal.Create(CompleteFile, Language);
  SynComp.ItemList.Text := Compro.ItemList.Text;
  SynComp.InsertList.Text := Compro.InsertList.Text;
  lbitems.Items.Text := Compro.ItemList.Text;
  edtTitle.Text := ComPro.Title;
  edtTrigs.Text := ComPro.Triggers;
  edtTokens.Text := ComPro.Tokens;
  edtTimer.Text := IntToStr(ComPro.Timer);
  cbMatch.Checked := ComPro.Match;
  cbCase.Checked := ComPro.CaseSen;
  cbuseTimer.Checked := ComPro.UseTimer;
  cbUseTrigLen.Checked := ComPro.UseTriggerLength;
  edtTrigLength.Text := IntToStr(ComPro.TriggerLength);
end;

procedure TdEditComplete.btnAddClick(Sender: TObject);
var
  txt: String;
  idx: integer;
begin
  inherited;
  txt := InputBox('Add Completion Item','Enter Item Name', '');
  if length(txt) <= 0 then
    Showmessage('You must enter an item name')
  else begin
    idx := lbItems.Items.Add(txt);
    SynComp.ItemList.Add(txt);
    SynComp.InsertList.Add(txt);
    lbItems.ItemIndex := idx;
    mcc.Lines.Text := txt;
    end;
end;

procedure TdEditComplete.btnRemoveClick(Sender: TObject);
begin
  inherited;
  if lbItems.ItemIndex <= -1 then begin Showmessage('Select item first'); exit; end;
  SynComp.ItemList.Delete(lbItems.ItemIndex);
  SynComp.InsertList.Delete(lbItems.ItemIndex);
  lbItems.Items.Delete(lbItems.ItemIndex);
  mcc.Clear;
end;

procedure TdEditComplete.btnClearClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Are you sure you want you remove add items?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then exit;
  lbItems.Clear;
  SynComp.InsertList.Clear;
  SynComp.ItemList.Clear;
  mcc.Clear;
end;

procedure TdEditComplete.lbItemsDblClick(Sender: TObject);
var
  txt: String;
begin
  inherited;
  if lbItems.ItemIndex <= -1 then exit;
  txt := lbItems.Items[lbItems.ItemIndex];
  txt := InputBox('Edit Completion Item','Change Item Name', txt);
  if length(txt) <= 0 then
    Showmessage('You must enter an item name')
  else begin
    lbItems.Items[lbItems.ItemIndex] := txt;
    SynComp.ItemList[lbItems.ItemIndex] := txt;
    end;
end;

procedure TdEditComplete.cbUseTrigLenClick(Sender: TObject);
begin
  inherited;
  edtTrigLength.Enabled := not edtTrigLength.Enabled;
end;

end.
