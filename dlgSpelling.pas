unit dlgSpelling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, ComCtrls, StdCtrls, ExtCtrls, SynSpellCheck;

type
  TdSpellingOptions = class(TdStandard)
    PageControl1: TPageControl;
    tsSpelling: TTabSheet;
    GroupBox1: TGroupBox;
    cbAuto: TCheckBox;
    cbCursor: TCheckBox;
    cbIgnoreNums: TCheckBox;
    cbIgnoreChar: TCheckBox;
    cbSuggest: TCheckBox;
    cbSelWord: TCheckBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    cbDics: TComboBox;
    lDownload: TLabel;
    cbKeepCase: TCheckBox;
    procedure lDownloadMouseEnter(Sender: TObject);
    procedure lDownloadMouseLeave(Sender: TObject);
    procedure lDownloadClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FSpellCheck: TSynSpellCheck;
    function LoadDicfromDir(dicname: string): string;
    function LoadDicListfromDir(var outlist: TStringList): boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent; SpellCheck: TSynSpellCheck); reintroduce;
    procedure DisplayOptions;
    procedure LoadOptions;
    procedure SaveOptions;
    procedure SetSpellCheck;
  end;

var
  dSpellingOptions: TdSpellingOptions;

implementation

uses unitutils, inifiles;

const
  scSpell = 'Spelling';

{$I ns.inc}

{$R *.dfm}

procedure TdSpellingOptions.lDownloadMouseEnter(Sender: TObject);
begin
  inherited;
  lDownload.Font.Style := [fsUnderline];
end;

procedure TdSpellingOptions.lDownloadMouseLeave(Sender: TObject);
begin
  inherited;
  lDownload.Font.Style := [];
end;

procedure TdSpellingOptions.lDownloadClick(Sender: TObject);
begin
  inherited;
  ExecuteFile(scDownloadDic, '');
end;

constructor TdSpellingOptions.Create(AOwner: TComponent;
  SpellCheck: TSynSpellCheck);
begin
  inherited create(AOwner);
  FSpellCheck := SpellCheck;
  DisplayOptions;
  LoadOptions;
end;

procedure TdSpellingOptions.LoadOptions;
var
  Ini: TIniFile;
  opt: TSynSpellCheckOptions;
  tmp: String;
  idx: integer;
begin
  opt := FSpellCheck.Options;
  Ini := TIniFile.Create(AppPath+'spell.ini');
  try
    cbAuto.Checked := ini.ReadBool(scSpell, cbAuto.Name, sscoAutoSpellCheck in opt );
    cbIgnoreChar.Checked := ini.ReadBool(scSpell, cbIgnoreChar.Name, sscoIgnoreSingleChars in opt);
    cbIgnoreNums.Checked := ini.ReadBool(scSpell, cbIgnoreNums.Name, sscoIgnoreWordsWithNumbers in opt);
    cbKeepCase.Checked := ini.ReadBool(scSpell, cbKeepCase.Name, sscoMaintainCase in opt);
    cbSelWord.Checked := ini.ReadBool(scSpell, cbSelWord.Name, sscoSelectWord in opt);
    cbCursor.Checked := ini.ReadBool(scSpell, cbCursor.Name, sscoStartFromCursor in opt);
    cbSuggest.Checked := ini.ReadBool(scSpell, cbSuggest.Name, sscoSuggestWords in opt);
    tmp := ini.ReadString(scSpell, 'dictionary', 'English'); //'English');
    idx := cbDics.Items.IndexOf(tmp);
    if idx >= 0 then
      cbDics.ItemIndex := idx
    else
      cbDics.Text := tmp;
  finally
    ini.Free;
  end;
end;

procedure TdSpellingOptions.SaveOptions;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(AppPath+'spell.ini');
  try
    ini.WriteBool(scSpell, cbAuto.Name, cbAuto.Checked);
    ini.WriteBool(scSpell, cbIgnoreChar.Name, cbIgnoreChar.Checked);
    ini.WriteBool(scSpell, cbIgnoreNums.Name, cbIgnoreNums.Checked);
    ini.WriteBool(scSpell, cbKeepCase.Name, cbKeepCase.Checked);
    ini.WriteBool(scSpell, cbSelWord.Name, cbSelWord.Checked);
    ini.WriteBool(scSpell, cbCursor.Name, cbCursor.Checked);
    ini.WriteBool(scSpell, cbSuggest.Name, cbSuggest.Checked);
    ini.WriteString(scSpell, 'dictionary', cbDics.Text);
  finally
    ini.Free;
  end;
end;

procedure TdSpellingOptions.SetSpellCheck;
var
  opt: TSynSpellCheckOptions;
  fspell, fspname: string;
begin
  opt := FSpellCheck.Options;
  Exclude(opt, sscoAutoSpellCheck);
  Exclude(opt, sscoIgnoreSingleChars);
  Exclude(opt, sscoIgnoreWordsWithNumbers);
  Exclude(opt, sscoMaintainCase);
  Exclude(opt, sscoSelectWord);
  Exclude(opt, sscoStartFromCursor);
  Exclude(opt, sscoSuggestWords);

  if cbAuto.Checked then
    Include(opt, sscoAutoSpellCheck);

  if cbIgnoreChar.Checked then
    Include(opt, sscoIgnoreSingleChars);

  if cbIgnoreNums.Checked then
    Include(opt, sscoIgnoreWordsWithNumbers);

  if cbKeepCase.Checked then
    Include(opt, sscoMaintainCase);

  if cbSelWord.Checked then
    Include(opt, sscoSelectWord);

  if cbCursor.Checked then
    Include(opt, sscoStartFromCursor);

  if cbSuggest.Checked then
    Include(opt, sscoSuggestWords);

  FSpellCheck.Options := opt;

  if length(cbDics.Text) <= 0 then
    fspname := 'English'
  else
    fspname := cbDics.Text;

  if (FSpellCheck.Dictionary <> fspell) or (not FSpellCheck.OpenDictionary) then begin
    if FSpellCheck.DictionaryExists(fspname) then begin
      if FSpellCheck.OpenDictionary then
        FSpellCheck.CloseDictionary;
      FSpellCheck.LoadDictionary(fspname);
    end
    else begin
      //Showmessage('Dictionary is not installed');
      //Get dictionary directory for a file like the name.
      fspell := LoadDicfromDir( fspname );
      if length(fspell) > 0 then
      if FSpellCheck.OpenDictionary then
        FSpellCheck.CloseDictionary;
      FSpellCheck.LoadDictionary(fspname, fspell);
      end;
  end;
end;

procedure TdSpellingOptions.DisplayOptions;
var
  opt: TSynSpellCheckOptions;
  list: TStringList;
  idx: integer;
begin
  opt := FSpellCheck.Options;
  cbAuto.Checked := sscoAutoSpellCheck in opt;
  cbIgnoreChar.Checked := sscoIgnoreSingleChars in opt;
  cbIgnoreNums.Checked := sscoIgnoreWordsWithNumbers in opt;
  cbKeepCase.Checked := sscoMaintainCase in opt;
  cbSelWord.Checked := sscoSelectWord in opt;
  cbCursor.Checked := sscoStartFromCursor in opt;
  cbSuggest.Checked := sscoSuggestWords in opt;

  list := TStringList.Create;
  try
    FSpellCheck.GetDictionaryList(list);
    if length(list.Text) > 0 then
      cbDics.Items.Text := list.Text
    else begin
      LoadDicListfromDir(list);
      cbDics.Items.Text := list.Text
    end;
  finally
    list.free;
  end;

  idx := cbDics.Items.IndexOf(FSpellCheck.Dictionary);
  if idx >= 0 then cbDics.ItemIndex := idx;
end;

procedure TdSpellingOptions.Button2Click(Sender: TObject);
begin
  inherited;
//  SetSpellCheck;  
  SaveOptions;
  if (FSpellCheck.Dictionary <> cbDics.Text) then
    messagedlg('You have changed the language, the application must be restarted before the change takes effect.',mtInformation, [mbOK], 0);
  Close;
end;

procedure TdSpellingOptions.FormShow(Sender: TObject);
begin
  inherited;
  DisplayOptions;
end;

function TdSpellingOptions.LoadDicfromDir(dicname: string): string;
var
  fd: WIN32_FIND_DATA;
  hnd, i: integer;
  fname, findname: string;
begin
  fname := AppPath + 'Dictionary\' + dicname + '*';
  hnd := FindFirstFile(Pchar(fname), fd);
  if hnd = INVALID_HANDLE_VALUE then
    result := ''
  else begin
    findname := fd.cFileName;
    if ((fd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0) then
      result := AppPath + 'Dictionary\' + findname
    else
      result := '';
  end;
end;

function TdSpellingOptions.LoadDicListfromDir(var outlist: TStringList): boolean;
var
  fd: WIN32_FIND_DATA;
  hnd, i: integer;
  fname, findname, langname: string;
  prs: boolean;
begin
  fname := AppPath + 'Dictionary\*.dic';
  hnd := FindFirstFile(Pchar(fname), fd);
  if hnd = INVALID_HANDLE_VALUE then
    result := false
  else begin
    prs := true;
    while prs do begin
      findname := fd.cFileName;
      if ((fd.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0) then begin
        langname := '';
        i := Pos('.', findname);
        if i > 1 then
          langname := Copy(findname, 1, i-1);
        if length(langname) > 0 then
          outlist.Add(langname);
        //AppPath + 'Dictionary\' + findname
      end;
      prs := FindNextFile(hnd, fd);
    end;
  end;
end;

end.
