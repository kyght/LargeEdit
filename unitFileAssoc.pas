unit unitFileAssoc;

interface

uses registry, classes;

type
  TFileAssoc = class(TObject)
  private
    FReg: TRegistry;
    FIcon: String;
    FProgramName: String;
    FDescription: String;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    function LoadProgram( ProgramName: String ): boolean;
    function CreateProgram( ProgramName, Description, Icon: String ): boolean;
    function RegisterProgram(FriendlyName, OpenCommand: String; SupportTypes: TStrings): boolean;
    function AddShellExt( CmdType, Command: String ): boolean;
    function AddShellExtEx( ProgName, CmdType, Command: String ): boolean;
    function AddFileType( Ext: String ): boolean;
    function AddFileTypeEdit( Ext, EditCommand: String ): boolean;
    function AddToOpenWithList( Ext: String ): boolean;
    function CheckAssoc( Ext: String ): String;
    procedure UpdateSystem;
    property Icon: String read FIcon write FIcon;
    property ProgramName: String read FProgramName write FProgramName;
    property Description: String read FDescription write FDescription;
  end;

implementation

uses windows, shlobj, sysutils, forms;

{$I ns.inc}

{ TFileAssoc }

function TFileAssoc.AddFileType(Ext: String): boolean;
var
  pgrKey: String;
begin
  FReg.CloseKey;
  FReg.OpenKey(Ext, True);
  FReg.WriteString('', FProgramName);
  FReg.CloseKey;
end;

function TFileAssoc.AddFileTypeEdit(Ext, EditCommand: String): boolean;
var
  pgrKey: String;
begin
  FReg.CloseKey;
  FReg.OpenKey(Ext, True);

  pgrKey := FReg.ReadString('');
  if length(pgrKey) > 0 then begin
    FReg.CloseKey;
    FReg.OpenKey(pgrKey, true);
    FReg.OpenKey('shell', true);
    FReg.OpenKey('edit', true);
    FReg.WriteString('','Edit with '+scFriendlyName);
    FReg.OpenKey('command', true);
    FReg.WriteString('', EditCommand);
  end
  else
    FReg.WriteString('', FProgramName);

  FReg.CloseKey;
end;

function TFileAssoc.AddShellExt(CmdType, Command: String): boolean;
begin
  FReg.CloseKey;
  FReg.OpenKey(FProgramName, true);
  FReg.OpenKey('shell', true);
  FReg.OpenKey(CmdType, true);
  FReg.OpenKey('command', true);
  FReg.WriteString('', Command);
  FReg.CloseKey;
end;

function TFileAssoc.AddShellExtEx(ProgName, CmdType,
  Command: String): boolean;
begin
  FReg.CloseKey;
  FReg.OpenKey(ProgName, true);
  FReg.OpenKey('shell', true);
  FReg.OpenKey(CmdType, true);
  FReg.OpenKey('command', true);
  FReg.WriteString('', Command);
  FReg.CloseKey;
  FReg.OpenKey(ProgName, true);
  FReg.OpenKey('DefaultIcon', true);
  FReg.WriteString('',Icon);
  FReg.CloseKey;
end;

function TFileAssoc.AddToOpenWithList(Ext: String): boolean;
begin
  FReg.CloseKey;
  FReg.OpenKey(Ext, True);
  FReg.OpenKey('OpenWithList', true);
  FReg.OpenKey(ExtractFileName(Application.exename), true);
  FReg.CloseKey;
end;

function TFileAssoc.CheckAssoc(Ext: String): String;
begin
  result := '';
  if not FReg.OpenKey(Ext, false) then exit;
  result := FReg.ReadString('');
end;

constructor TFileAssoc.Create;
begin
  inherited Create;
  FReg := TRegistry.Create;
  FReg.RootKey := HKEY_CLASSES_ROOT;
end;

function TFileAssoc.CreateProgram(ProgramName, Description, Icon: String): boolean;
begin
  FIcon := Icon;
  FProgramName := ProgramName;
  FDescription := Description;
  FReg.CloseKey;
  FReg.OpenKey(FProgramName, true);
  FReg.WriteString('',Description);
  FReg.OpenKey('DefaultIcon', true);
  FReg.WriteString('',Icon);
  FREg.CloseKey;
end;

destructor TFileAssoc.Destroy;
begin
  FReg.CloseKey;
  FReg.Free;
  inherited;
end;

function TFileAssoc.LoadProgram(ProgramName: String): boolean;
begin
  result := FReg.OpenKey(ProgramName, false);
  if not result then exit;
  FProgramName := ProgramName;
  FDescription := FReg.ReadString('');
  if not FReg.OpenKey('DefaultIcon', false) then exit;
  FIcon := FReg.ReadString('');
end;

function TFileAssoc.RegisterProgram(FriendlyName, OpenCommand: String;
  SupportTypes: TStrings): boolean;
var
  appexe, icofile: String;
  i: integer;
begin
  result := false;

  //Reg Application
  FReg.CloseKey;
  if not FReg.OpenKey('Applications', false) then exit;
  appexe := ExtractFileName(Application.exename);
  if not FReg.OpenKey(appexe, true) then exit;
  if not FReg.OpenKey('shell', true) then exit;
  FReg.WriteString('FriendlyCache',FriendlyName);
  if not FReg.OpenKey('open', true) then exit;
  FReg.WriteString('FriendlyAppName',FriendlyName);
  if not FReg.OpenKey('command', true) then exit;
  FReg.WriteString('',OpenCommand);

  //Reg Types
  FReg.CloseKey;
  if not FReg.OpenKey('Applications', false) then exit;
  if not FReg.OpenKey(appexe, true) then exit;
  if not FReg.OpenKey('SupportedTypes', true) then exit;
  for i := 0 to SupportTypes.Count - 1 do begin
    if Length(SupportTypes[i]) > 0 then
      if not FReg.ValueExists(SupportTypes[i]) then
        FReg.WriteString(StringReplace(SupportTypes[i], '*', '', [rfReplaceAll]), '');
  end;

  //See if Icon is used
  FReg.CloseKey;
  if not FReg.OpenKey('Applications', false) then exit;
  if not FReg.OpenKey(appexe, true) then exit;
  if not FReg.OpenKey('DefaultIcon', true) then exit;
  icofile := ChangeFileExt(Application.ExeName, '.ico');
  FReg.WriteString('',icofile);
  FREg.CloseKey;

  result := true;
end;

procedure TFileAssoc.UpdateSystem;
begin
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
//  SHChangeNotify(SHCNE_UPDATEIMAGE, SHCNF_DWORD
end;

end.
