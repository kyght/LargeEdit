unit unitCompProposalFile;

interface

uses inifiles, classes;

type
  TCompletionProposal = class
  private
    ini: Tinifile;
    FFilename: String;
    FInsertListFile: String;
    FItemListFile: String;
    FInsertList: TStringList;
    FItemList: TStringList;
    FTitle: String;
    FMatch: Boolean;
    FCaseSen: Boolean;
    FTriggers: String;
    FTimer: Integer;
    FTokens: String;
    FLanguage: String;
    FUseTriggerLength: Boolean;
    FTriggerLength: integer;
    FUseTimer: Boolean;
  public
    constructor Create(filename, Language: String);
    destructor Destroy;
    function SaveToFile: boolean;
    property Filename: String read FFilename;
    //Completion Properties
    property InsertList: TStringList read FInsertList write FInsertList;
    property ItemList: TStringList read FItemList write FItemList;
    property Title: String read FTitle write FTitle;
    property Triggers: String read FTriggers write FTriggers;
    property Tokens: String read FTokens write FTokens;
    property Timer: Integer read FTimer write FTimer;
    property Match: Boolean read FMatch write FMatch;
    property CaseSen: Boolean read FCaseSen write FCaseSen;
    property UseTriggerLength: Boolean read FUseTriggerLength write FUseTriggerLength;
    property UseTimer: Boolean read FUseTimer write FUseTimer;
    property TriggerLength: integer read FTriggerLength write FTriggerLength;
    property LanguageName: String read FLanguage;
  end;

implementation

uses sysutils;

const
  scCompSec = 'CodeProposal';

  scInsertList = 'InsertList';
  scITemList = 'ItemList';
  scTitle = 'Title';
  scMatch = 'Match';
  scCaseSen = 'CaseSen';
  scTriggers = 'Triggers';
  scUseTriggerLength = 'UseTriggerLength';
  scTriggerLength = 'TriggerLength';
  scTimer = 'Timer';
  scUseTimer = 'UseTimer';
  scTokens = 'Tokens';
  scLanguage = 'Language';


{ TCompletionProposal }

constructor TCompletionProposal.Create(filename, Language: String);
begin
  inherited Create;
  ini := Tinifile.Create(filename);
  FFilename := Filename;
  FLanguage := Language;
  FInsertList := TStringList.Create;
  FItemList := TStringList.Create;

  FInsertListFile :=  Format('%s', [
    ChangeFileExt(filename, '.cin')
  ]);
  FItemListFile :=  Format('%s', [
    ChangeFileExt(filename, '.cit')
  ]);

  FInsertListFile := ini.ReadString(scCompSec,scInsertList,FInsertListFile);
  FItemListFile := ini.ReadString(scCompSec,scITemList,FItemListFile);

  if FileExists(FInsertListFile) then
    FInsertList.LoadFromFile(FInsertListFile)
  else begin
    FInsertListFile :=  Format('%s', [
      ChangeFileExt(filename, '.cin')
    ]);
    if FileExists(FInsertListFile) then
      FInsertList.LoadFromFile(FInsertListFile);
  end;

  if FileExists(FItemListFile) then
    FItemList.LoadFromFile(FItemListFile)
  else begin
    FItemListFile :=  Format('%s', [
      ChangeFileExt(filename, '.cit')
    ]);
    if FileExists(FItemListFile) then
      FItemList.LoadFromFile(FItemListFile);
  end;

  FTitle := Format('%s Code Completion', [FLanguage]);
  FTitle := ini.ReadString(scCompSec, scTitle, FTitle);

  FMatch := True;
  FMatch := ini.ReadBool(scCompSec, scMatch, FMatch);

  FCaseSen := False;
  FCaseSen := ini.ReadBool(scCompSec, scCaseSen, FCaseSen);

  FTriggers := '.';
  FTriggers := ini.ReadString(scCompSec, scTriggers, FTriggers);
  FTriggers := StringReplace(FTriggers,'$SPACE$', ' ', [rfReplaceAll]);

  FTimer := 1000;
  FTimer := ini.ReadInteger(scCompSec, scTimer, FTimer);

  FTokens := '()[]. ';
  FTokens := ini.ReadString(scCompSec, scTokens, FTokens);
  FTokens := StringReplace(FTokens,'$SPACE$', ' ', [rfReplaceAll]);

  FUseTriggerLength := false;
  FUseTriggerLength := ini.ReadBool(scCompSec, scUseTriggerLength, FUseTriggerLength);

  FUseTimer := false;
  FUseTimer := ini.ReadBool(scCompSec, scUseTimer, FUseTimer);

  FTriggerLength := 3;
  FTriggerLength := ini.ReadInteger(scCompSec, scTriggerLength, FTriggerLength);
end;

destructor TCompletionProposal.Destroy;
begin
  ini.Free;
end;

function TCompletionProposal.SaveToFile: boolean;
begin
  //Write Comp Complete
  ini.WriteString(scCompSec,scInsertList,FInsertListFile);
  ini.WriteString(scCompSec,scITemList,FItemListFile);
  FInsertList.SaveToFile(FInsertListFile);
  FItemList.SaveToFile(FItemListFile);

  //Write Comp Properties
  ini.WriteString(scCompSec, scTitle, FTitle);
  ini.WriteBool(scCompSec, scMatch, FMatch);
  ini.WriteBool(scCompSec, scCaseSen, FCaseSen);
  FTriggers := StringReplace(FTriggers,' ', '$SPACE$', [rfReplaceAll]);
  ini.WriteString(scCompSec, scTriggers, FTriggers);
  ini.WriteInteger(scCompSec, scTimer, FTimer);
  FTokens := StringReplace(FTokens,' ', '$SPACE$', [rfReplaceAll]);
  ini.WriteString(scCompSec, scTokens, FTokens);
  ini.WriteBool(scCompSec, scUseTriggerLength, FUseTriggerLength);
  ini.WriteBool(scCompSec, scUseTimer, FUseTimer);
  ini.WriteInteger(scCompSec, scTriggerLength, FTriggerLength);
  ini.WriteString(scCompSec,scLanguage, FLanguage);

  ini.UpdateFile;
end;

end.
