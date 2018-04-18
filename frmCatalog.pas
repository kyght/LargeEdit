unit frmCatalog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, ActnList, ToolWin, unitUtils, HTTPApp,
  HTTPProd;

type
  TfSQLCata = class(TForm)
    tvsql: TTreeView;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ActionList1: TActionList;
    anew: TAction;
    adelete: TAction;
    aSave: TAction;
    aNewCat: TAction;
    aOpen: TAction;
    il: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    od: TOpenDialog;
    arename: TAction;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    aeditSQL: TAction;
    ToolButton11: TToolButton;
    aCapture: TAction;
    aRefresh: TAction;
    ToolButton7: TToolButton;
    ToolButton12: TToolButton;
    pgoutput: TPageProducer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure anewExecute(Sender: TObject);
    procedure aOpenExecute(Sender: TObject);
    procedure adeleteExecute(Sender: TObject);
    procedure aNewCatExecute(Sender: TObject);
    procedure tvsqlDblClick(Sender: TObject);
    procedure arenameExecute(Sender: TObject);
    procedure aeditSQLExecute(Sender: TObject);
    procedure aCaptureExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure pgoutputHTMLTag(Sender: TObject; Tag: TTag;
      const TagString: String; TagParams: TStrings;
      var ReplaceText: String);
  private
    FTagReplace: boolean;
  protected
    fLoaded: Boolean;
    FBaseDirectory: String;
    FOnSetText: TOnSetText;
    FOnGetText: TOnGetText;
    scbasefolder: string;
    function GetBaseDIR: String;
    function GetDefFolder: String;
    function GetNextFileName(Dir: String): String;
    function DeleteFolder(Directory: String): Boolean;
    procedure SetBaseDir(const Value: String);
  private
    { Private declarations }
    property DefFolder: String read GetDefFolder;
  public
    { Public declarations }
    procedure ReadSQLs(Directory: String; Parent: TTreenode);
    property OnSetText: TOnSetText read FOnSetText write FOnSetText;
    property OnGetText: TOnGetText read FOnGetText write FOnGetText;
    property BaseDIR: String read GetBaseDIR write SetBaseDir;
    property TagReplace: boolean read FTagReplace write FTagReplace default false;
  end;

  TFileInfo = class
  Public
    Attr: Integer;
    Fname: String;
    constructor create(AFName: String; AAttr: integer); reintroduce;
  end;

var
  fSQLCata: TfSQLCata;

implementation

uses dlgLargeTxt, frmImages;

const
  scbasefolder = 'reposit';
  scdefolder = 'My Text';

{$R *.dfm}

function TfSQLCata.GetBaseDIR: String;
begin
  if length(FBaseDirectory) <= 0 then
    result := ExtractFilePath(Application.ExeName)
  else
    result := FBaseDirectory;
end;

procedure TfSQLCata.SetBaseDir(const Value: String);
begin
  if length(Value) > 0 then
    FBaseDirectory := Value;
end;


procedure TfSQLCata.FormCreate(Sender: TObject);
begin
  FBaseDirectory := '';
  scbasefolder := 'reposit';
  fLoaded := false;

//  if not DirectoryExists(DefFolder) then
//    if not ForceDirectories(DefFolder) then
//      showmessage('Error creating default directory ' + DefFolder);
end;

function TfSQLCata.GetDefFolder: String;
begin
  result := BaseDir + scbasefolder + '\' + scdefolder;
end;

procedure TfSQLCata.ReadSQLs(Directory: String; Parent: TTreenode);
var
  sr: TSearchRec;
  found: integer;
  tn: TTreeNode;
  sl: TStringList;
begin
  found := findfirst(directory + '\*.*', faAnyFile, sr);
  if found <> 0 then exit;

  sl := TStringList.Create;
  if FileExists(directory + '\cats.lst') then
    sl.LoadFromFile(Directory + '\cats.lst');
  try
    while found = 0 do begin
      if sr.Attr = faDirectory then begin
        if (sr.Name = '.') or (sr.Name = '..') then begin
          found := FindNext(sr);
          continue;
        end;
        tn := tvsql.Items.AddChild(parent, sr.Name);
        tn.ImageIndex := 1;
        tn.SelectedIndex := 1;
        tn.Data := TFileInfo.create(directory + '\' + sr.Name, sr.Attr);
        tn.Text := sr.Name;
        ReadSqls(directory + '\' + sr.Name, tn)
      end
      else begin
        if sr.Name = 'cats.lst' then begin
          found := FindNext(sr);
          continue;
        end;
        tn := tvsql.Items.AddChild(parent, sr.Name);
        tn.ImageIndex := 0;
        tn.SelectedIndex := 0;
        if length(sl.Values[sr.Name]) > 0 then
          tn.Text := sl.Values[sr.Name]
        else
          tn.Text := sr.Name;
        tn.Data := TFileInfo.create(directory + '\' + sr.Name, sr.Attr);
      end;
      found := FindNext(sr);
    end;
  finally
    sl.Free;
    findClose(sr);
  end;
end;

procedure TfSQLCata.FormShow(Sender: TObject);
begin
  if not DirectoryExists(BaseDIR + scbasefolder) then
    if not ForceDirectories(BaseDir + scbasefolder) then begin
      showmessage('Error creating base directory ' + BaseDir + scbasefolder);
      close;
    end;
  if not fLoaded then begin
    ReadSQLs(BaseDIR + scbasefolder, nil);
    fLoaded := true;
  end;
end;

procedure TfSQLCata.anewExecute(Sender: TObject);
var
  fi: TFileInfo;
  na, filen: String;
  newitem, par: TTreeNode;
  lt: TfrmLargeTEXT;
  sl: TStringList;
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
    na := inputbox('Enter Name', 'Name', '');
    if length(na) <= 0 then exit;
    lt := TfrmLargeTEXT.Create(self);
    try
      lt.Title := 'Enter Text';
      if lt.ShowModal = mrCancel then exit;
      filen := GetNextFileName(fi.Fname);
      sl := TStringList.Create;
      try
        sl.Text := lt.Text;
        sl.SaveToFile(filen);
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
    finally
      lt.Free;
    end;
  end;
end;

{ TFileInfo }

constructor TFileInfo.create(AFName: String; AAttr: integer);
begin
  inherited Create;
  self.Fname := AFName;
  self.Attr := AAttr;
end;

function TfSQLCata.GetNextFileName(Dir: String): String;
var
  i: integer;
begin
  i := 0;
  result := Dir + '\tx' + IntToStr(i) + '.txt';
  while FileExists(result) do begin
    i := i + 1;
    result := Dir + '\tx' + IntToStr(i) + '.txt';
  end;
end;

procedure TfSQLCata.aOpenExecute(Sender: TObject);
var
  fi: TFileInfo;
  na, filen: String;
  newitem: TTreeNode;
  sl: TStringList;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select Catalog first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faDirectory then begin
    na := inputbox('Enter Name', 'Name', '');
    if length(na) <= 0 then exit;
    if not od.Execute then exit;
    filen := GetNextFileName(fi.Fname);
    sl := TStringList.Create;
    try
      sl.LoadFromFile(od.FileName);
      sl.SaveToFile(filen);
      if FileExists(fi.Fname + '\cats.lst') then
        sl.LoadFromFile(fi.Fname + '\cats.lst')
      else
        sl.Clear;
      sl.Add(ExtractFileName(filen) + '=' + na);
      sl.SaveToFile(fi.Fname + '\cats.lst');
      newitem := tvsql.Items.AddChild(tvsql.selected, na);
      newitem.Text := na;
      newitem.ImageIndex := 0;
      newitem.SelectedIndex := 0;
      newitem.Data := TFileInfo.create(filen, faArchive);
    finally
      sl.Free;
    end;
  end;
end;

procedure TfSQLCata.adeleteExecute(Sender: TObject);
var
  fi: TFileInfo;
  i: integer;
  sl: TStringList;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select File first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    if MessageDlg('Are you sure you want to delete this file?', mtWarning, [mbYes, mbNo],0) = mrNo then exit;

    sl := TStringList.Create;
    try
      if FileExists(ExtractFilePath(fi.Fname) + 'cats.lst') then begin
        sl.LoadFromFile(ExtractFilePath(fi.Fname) + 'cats.lst');
        i := sl.IndexOfName(ExtractFileName(fi.Fname));
        if i >= 0 then
          sl.Delete(i);
        tvsql.Selected.Delete;
        sl.SaveToFile(ExtractFilePath(fi.Fname) + 'cats.lst');
      end;
      DeleteFile(fi.Fname);
    finally
      sl.Free;
    end;
  end
  else if fi.Attr = faDirectory then begin
    if MessageDlg('Are you sure you want to delete this catalog and all its contains.', mtWarning, [mbYes, mbNo],0) = mrNo then exit;

    DeleteFolder(fi.Fname);
    tvsql.selected.DeleteChildren;
    tvsql.Selected.Delete;
  end;
end;

procedure TfSQLCata.aNewCatExecute(Sender: TObject);
var
  fi: TFileInfo;
  parnode, newitem: TTreeNode;
  newdir, subdir, pardir: String;
begin
  if not assigned(tvsql.Selected) then begin
    pardir := BaseDir + scbasefolder;
    parnode := nil;
  end
  else if assigned(tvsql.selected.parent) then begin
    fi := TFileInfo(tvsql.selected.parent.data);
    pardir := fi.Fname;
    parnode := tvsql.selected.parent;
  end
  else begin
    pardir := BaseDir + scbasefolder;
    parnode := nil;
  end;

  subdir := inputbox('Enter Catalog Name', 'Name', '');
  if length(subdir) <= 0 then exit;
  newdir := pardir + '\' + subdir;
  if DirectoryExists(newdir) then begin
    Showmessage('This Catalog already exists');
    exit;
  end;
  if not ForceDirectories(newDir) then begin
    Showmessage('Error creating catalog ' + newdir);
    exit;
  end;
  newitem := tvsql.Items.AddChild(parnode, subdir);
  newitem.Text := subdir;
  newitem.ImageIndex := 1;
  newitem.SelectedIndex := 1;
  newitem.Data := TFileInfo.create(newdir, faDirectory);
end;

procedure TfSQLCata.tvsqlDblClick(Sender: TObject);
var
  txt, ltxt: String;
  fi: TFileInfo;
  sl: TStringList;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select File first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    sl := TStringList.Create;
    try
      if FileExists(fi.Fname) then
        sl.LoadFromFile(fi.Fname);
      txt := sl.Text;

      //Check for and do parameter replacement
      if (TagReplace) then begin
        pgoutput.HTMLDoc.Text := txt;
        txt := pgoutput.Content;
      end;

      //Remove last Carrage Return
      if (length(txt) > 2) then ltxt := Copy(txt, length(txt)-1, 2);
      if ltxt = (Chr(13)+Chr(10)) then txt := Copy(txt, 0, length(txt)-2);


    finally
      sl.Free;
    end;
    if length(txt) > 0 then
      FOnSetText(txt);
  end;
end;

procedure TfSQLCata.arenameExecute(Sender: TObject);
var
  fi: TFileInfo;
  newname: String;
  i: integer;
  sl: TStringList;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select File first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    sl := TStringList.Create;
    newname := inputbox('Rename', 'New Name' , '' );
    if length(newname) <= 0 then exit;
    try
      if FileExists(ExtractFilePath(fi.Fname) + 'cats.lst') then
        sl.LoadFromFile(ExtractFilePath(fi.Fname) + 'cats.lst')
      else
        sl.Clear;
      i := sl.IndexOfName(ExtractFileName(fi.Fname));
      if i >= 0 then
        sl.Values[ExtractFileName(fi.Fname)] := newname
      else
        sl.Add(ExtractFileName(fi.Fname) + '=' + newname);
      sl.SaveToFile(ExtractFilePath(fi.Fname) + 'cats.lst');
      tvsql.Selected.Text := newname;
    finally
      sl.Free;
    end;
  end;
end;

procedure TfSQLCata.aeditSQLExecute(Sender: TObject);
var
  fi: TFileInfo;
  sl: TStringList;
  lt: TfrmLargeTEXT;
begin
  if not assigned(tvsql.Selected) then begin
    Showmessage('Select File first');
    exit;
  end;
  fi := TFileInfo(tvsql.selected.data);
  if fi.Attr = faArchive then begin
    lt := TfrmLargeTEXT.Create(self);
    try
      sl := TStringlist.Create;
      try
        if FileExists(fi.Fname) then
          sl.LoadFromFile(fi.Fname);
        lt.Title := 'Edit Text';
        lt.Text := sl.Text;
        if lt.ShowModal = mrCancel then exit;
        sl.Text := lt.Text;
        sl.SaveToFile(fi.Fname);
      finally
        sl.Free;
      end;
    finally
      lt.Free;
    end;
  end;
end;

procedure TfSQLCata.aCaptureExecute(Sender: TObject);
var
  fi: TFileInfo;
  na, filen, txt: String;
  newitem, par: TTreeNode;
  sl: TStringList;
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
    txt := FOnGetText;
    if length(txt) <= 0 then begin
      MessageDlg('There is no text to capture.', mtInformation, [mbok], 0);
      exit;
    end;
    na := inputbox('Enter Name', 'Name', '');
    if length(na) <= 0 then exit;
    txt := FOnGetText;
    filen := GetNextFileName(fi.Fname);
    sl := TStringList.Create;
    try
      sl.Text := txt;
      sl.SaveToFile(filen);
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

function TfSQLCata.DeleteFolder(Directory: String): Boolean;
var
  sr: TSearchRec;
  found: integer;
begin
  result := true;
  found := findfirst(directory + '\*.*', faAnyFile, sr);
  if found <> 0 then exit;
  while found = 0 do begin
    if sr.Attr = faDirectory then begin
      if (sr.Name = '.') or (sr.Name = '..') then begin
        found := FindNext(sr);
        continue;
      end;
      result := DeleteFolder(directory + '\' + sr.Name)
    end
    else begin
      result := DeleteFile(directory + '\' + sr.Name);
      if not result then
        raise Exception.Create('Error Deleting File, the following file maybe in use:' + directory + '\' + sr.Name);
    end;
    found := FindNext(sr);
  end;
  findClose(sr);
  result := removedir(directory);
  if not result then
    raise Exception.Create('Error Deleting Catalog, the following directory or files contained within maybe in use:' + directory);
end;

procedure TfSQLCata.aRefreshExecute(Sender: TObject);
begin
  tvsql.Items.Clear;
  ReadSQLs(BaseDIR + scbasefolder, nil);
end;

procedure TfSQLCata.pgoutputHTMLTag(Sender: TObject; Tag: TTag;
  const TagString: String; TagParams: TStrings; var ReplaceText: String);
var
  repval: string;
begin
  repval := TagString;
  if InputQuery('Replace Parameter', TagString, repval) then
    ReplaceText := repval;
end;

end.
