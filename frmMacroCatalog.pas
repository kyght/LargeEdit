unit frmMacroCatalog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmCatalog, ActnList, ImgList, ComCtrls, ToolWin, unitUtils,
  SynMacroRecorder;

type
  TfMacCat = class(TfSQLCata)
    procedure FormCreate(Sender: TObject);
    procedure aCaptureExecute(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure tvsqlDblClick(Sender: TObject);
    procedure aeditSQLExecute(Sender: TObject);
    procedure anewExecute(Sender: TObject);
  private
    FOnGetMacro: TOnGetMacro;
    FOnOpenMacro: TOnMacroAction;
    FOnPlayMacro: TOnMacroAction;
    FOnPlayManyMacro: TOnMacroAction;
    procedure PlaySelectedMacro;
    procedure PlaySelectedMacroMany;    
    procedure OpenSelectedMacro;
    { Private declarations }
  public
    { Public declarations }
    property OnGetMacro: TOnGetMacro read FOnGetMacro write FOnGetMacro;
    property OnPlayMacro: TOnMacroAction read FOnPlayMacro write FOnPlayMacro;
    property OnOpenMacro: TOnMacroAction read FOnOpenMacro write FOnOpenMacro;
    property OnPlayManyMacro: TOnMacroAction read FOnPlayManyMacro write FOnPlayManyMacro;    
  end;

var
  fMacCat: TfMacCat;

implementation

{$R *.dfm}

procedure TfMacCat.FormCreate(Sender: TObject);
begin
  inherited;
  FBaseDirectory := '';
  scbasefolder := 'macros';
end;



procedure TfMacCat.aCaptureExecute(Sender: TObject);
var
  fi: TFileInfo;
  na, filen, txt: String;
  newitem, par: TTreeNode;
  sl: TStringList;
  fobj: TObject;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select Catalog first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    if assigned(tvsql.selected.parent) then begin
      fi := TFileInfo(tvsql.selected.Parent.Data);
      par := tvsql.selected.Parent;
    end;
  end
  else
    par := tvsql.selected;

  if fi.Attr = faDirectory then begin
    fobj := FOnGetMacro;
    if not(assigned(fobj)) then begin
      MessageDlg('There is no macro to capture.', mtInformation, [mbok], 0);
      exit;
    end;
    na := inputbox('Enter Name', 'Name', '');
    if length(na) <= 0 then exit;
    filen := GetNextFileName(fi.Fname);
    sl := TStringList.Create;
    try
      TSynMacroRecorder(fobj).SaveToFile(filen);
      if FileExists(fi.Fname + '\cats.lst') then
        sl.LoadFromFile(fi.Fname + '\cats.lst')
      else
        sl.Clear;
      sl.Add(ExtractFileName(filen) + '=' + na);
      sl.SaveToFile(fi.Fname + '\cats.lst');
    finally
      sl.Free;
    end;
    newitem := tvsql.Items.AddChild(par, na);
    newitem.Text := na;
    newitem.ImageIndex := 0;
    newitem.SelectedIndex := 0;
    newitem.Data := TFileInfo.create(filen, faArchive);
  end;
end;


procedure TfMacCat.aOpenExecute(Sender: TObject);
begin
  //PlayMacro
  PlaySelectedMacroMany;
end;

procedure TfMacCat.PlaySelectedMacro;
var
  txt: String;
  fi: TFileInfo;
  sl: TStringList;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select File first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    if FileExists(fi.Fname) then begin
      if assigned(FOnPlayMacro) then
        FOnPlayMacro(fi.Fname);
    end
  end;
end;

procedure TfMacCat.tvsqlDblClick(Sender: TObject);
begin
  PlaySelectedMacro;
end;

procedure TfMacCat.aeditSQLExecute(Sender: TObject);
begin
  //Open Macro
end;

procedure TfMacCat.OpenSelectedMacro;
var
  txt: String;
  fi: TFileInfo;
  sl: TStringList;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select File first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    if FileExists(fi.Fname) then begin
      if assigned(FOnOpenMacro) then
        FOnOpenMacro(fi.Fname);
    end
  end;
end;

procedure TfMacCat.PlaySelectedMacroMany;
var
  txt: String;
  fi: TFileInfo;
  sl: TStringList;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select File first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    if FileExists(fi.Fname) then begin
      if assigned(FOnPlayManyMacro) then
        FOnPlayManyMacro(fi.Fname);
    end
  end;
end;

procedure TfMacCat.anewExecute(Sender: TObject);
begin
  PlaySelectedMacro;
end;

end.
