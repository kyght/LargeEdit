unit dlgSpellCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, SynSpellCheck, SynEdit;

type
  TdSpellCheck = class(TdStandard)
    Label1: TLabel;
    edtWord: TEdit;
    Label2: TLabel;
    edtChange: TEdit;
    Label3: TLabel;
    lbsuggest: TListBox;
    btnIgnore: TButton;
    btnChange: TButton;
    btnAdd: TButton;
    btnIgnoreAll: TButton;
    btnChangeAll: TButton;
    btnSuggest: TButton;
    SCheck: TSynSpellCheck;
    btnOptions: TButton;
    procedure SCheckCheckWord(Sender: TObject; AWord: String;
      ASuggestions: TStringList; var ACorrectWord: String;
      var AAction: Integer; const AUndoEnabled: Boolean);
    procedure btnIgnoreClick(Sender: TObject);
    procedure btnIgnoreAllClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SCheckDone(Sender: TObject);
    procedure lbsuggestClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SCheckAbort(Sender: TObject);
    procedure SCheckAddWord(Sender: TObject; AWord: String);
    procedure SCheckSkipWord(Sender: TObject; AWord: String;
      ASkipAll: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOptionsClick(Sender: TObject);
  private
    { Private declarations }
    FEditor: TSynEdit;
    FWaiting: boolean;
    FAction: integer;
    function GetOpenDic: boolean;
    procedure SetEditor(const Value: TSynEdit);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); reintroduce;
    procedure LoadDictionary(Lang, Filename: String);
    procedure CheckSpelling;
    property OpenDictionary: boolean read GetOpenDic;
    property Editor: TSynEdit read FEditor write SetEditor;
  end;

var
  dSpellCheck: TdSpellCheck;

implementation

uses dlgSpelling;

{$R *.dfm}

{ TdSpellCheck }

constructor TdSpellCheck.Create(AOwner: TComponent);
var
  dlgopts: TdSpellingOptions;
begin
  inherited Create(AOwner);
//  FEditor := Editor;
//  SCheck.Editor := FEditor;
  FWaiting := false;
  //Set Dictionary
  dlgopts := TdSpellingOptions.Create(self, SCheck);
  try
    dlgOpts.SetSpellCheck;
  finally
    dlgopts.Free;
  end;  
end;

function TdSpellCheck.GetOpenDic: boolean;
begin
  result := SCheck.OpenDictionary;
end;

procedure TdSpellCheck.LoadDictionary(Lang, Filename: String);
begin
  if not SCheck.OpenDictionary then
    SCheck.LoadDictionary('english', filename);
end;

procedure TdSpellCheck.CheckSpelling;
begin
  SCheck.SpellCheck;
end;

procedure TdSpellCheck.SCheckCheckWord(Sender: TObject; AWord: String;
  ASuggestions: TStringList; var ACorrectWord: String;
  var AAction: Integer; const AUndoEnabled: Boolean);
begin
  inherited;
  if not Visible then Show;
  edtword.Text := AWord;
  lbsuggest.Items.Text := ASuggestions.Text;
  if ASuggestions.Count >= 1 then
    edtChange.Text := ASuggestions[0];
  FWaiting := true;
  while FWaiting do application.ProcessMessages;
  AAction := FAction;
  ACorrectWord := edtChange.text;
  lbsuggest.Items.Clear;
  edtChange.text := '';
end;

procedure TdSpellCheck.btnIgnoreClick(Sender: TObject);
begin
  inherited;
  FWaiting := false;
  FAction := ACTION_SKIP;
end;

procedure TdSpellCheck.btnIgnoreAllClick(Sender: TObject);
begin
  inherited;
  FWaiting := false;
  FAction := ACTION_SKIPALL;
end;

procedure TdSpellCheck.btnChangeClick(Sender: TObject);
begin
  inherited;
  FWaiting := false;
  FAction := ACTION_CORRECT;
end;

procedure TdSpellCheck.btnAddClick(Sender: TObject);
begin
  inherited;
  FWaiting := false;
  FAction := ACTION_ADD;
end;

procedure TdSpellCheck.Button1Click(Sender: TObject);
begin
  inherited;
  FWaiting := false;
  FAction := ACTION_ABORT;
end;

procedure TdSpellCheck.SCheckDone(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TdSpellCheck.lbsuggestClick(Sender: TObject);
begin
  inherited;
  if lbSuggest.ItemIndex < 0 then exit;
  edtChange.text := lbSuggest.Items[lbSuggest.ItemIndex];
end;

procedure TdSpellCheck.Button2Click(Sender: TObject);
begin
  inherited;
  FWaiting := false;
  FAction := ACTION_ABORT;
end;

procedure TdSpellCheck.SCheckAbort(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TdSpellCheck.SCheckAddWord(Sender: TObject; AWord: String);
begin
  inherited;
  SCheck.AddDictWord(AWord);
end;

procedure TdSpellCheck.SCheckSkipWord(Sender: TObject; AWord: String;
  ASkipAll: Boolean);
begin
  inherited;
  SCheck.SkipList.Add(AWord);
end;

procedure TdSpellCheck.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FWaiting := false;
  FAction := ACTION_ABORT;  
  if SCHeck.Modified then
    SCheck.SaveUserDictionary;
end;

procedure TdSpellCheck.btnOptionsClick(Sender: TObject);
var
  dlgopts: TdSpellingOptions;
begin
  inherited;
  dlgopts := TdSpellingOptions.Create(self, SCheck);
  dlgopts.ShowModal;
end;

procedure TdSpellCheck.SetEditor(const Value: TSynEdit);
begin
  FEditor := Value;
  SCheck.Editor := FEditor;  
end;

end.
