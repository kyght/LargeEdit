unit dlgTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ImgList, dlgStandard, Menus;

type
  TdlgType = (dtOpen, dtSave);

  Tdtempwin = class(TdStandard)
    imglist: TImageList;
    tvfolders: TTreeView;
    Splitter1: TSplitter;
    lvfiles: TListView;
    lfilename: TLabel;
    edtFilename: TEdit;
    popFolder: TPopupMenu;
    NewFolder1: TMenuItem;
    DeleteFolder1: TMenuItem;
    RenameFolder1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure tvfoldersClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure NewFolder1Click(Sender: TObject);
    procedure RenameFolder1Click(Sender: TObject);
    procedure DeleteFolder1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvfilesClick(Sender: TObject);
    procedure tvfoldersChange(Sender: TObject; Node: TTreeNode);
    procedure edtFilenameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FText: string;
    FFilename: string;
    FdlgType: TdlgType;
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshTree();
    procedure RefreshFiles();

    property Text: string read FText write FText;
    property dlgType: TdlgType read FdlgType write FdlgType;
    property Filename: string read FFilename write FFilename;
  end;

var
  dtempwin: Tdtempwin;

implementation

uses Registry, ShellAPI, unitUtils;

{$R *.dfm}

{ Tdtempwin }

procedure Tdtempwin.RefreshTree;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  srdir: string;
  srchres: integer;
  pnode: TTreenode;
begin
    tvfolders.Items.Clear;
    srdir := ExtractFilePath(application.ExeName) + '\templates\*.*';
    FileAttrs := faHidden + faSysFile + faVolumeID + faDirectory + faArchive;

    FileAttrs := FileAttrs + faAnyFile;
    srchres := FindFirst(srdir, FileAttrs, sr);
    if srchres = 0 then begin
      repeat
        if (sr.Attr and faDirectory) = faDirectory then begin
          if not((sr.Name = '.') or (sr.Name = '..')) then begin
              tvfolders.Items.AddChild(nil, sr.Name);
            end;
          end
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
end;

procedure Tdtempwin.FormCreate(Sender: TObject);
begin
  RefreshTree;
  if tvfolders.Items.Count > 0 then tvfolders.Items.Item[0].Selected := true;
  RefreshFiles;
end;

procedure Tdtempwin.RefreshFiles;
var
  sr: TSearchRec;
  FileAttrs: Integer;
  srdir: string;
  srchres: integer;
  item: TListItem;
  SmallIcon: HICON;
  lsticon: TIcon;
begin
    if not(assigned(tvfolders.Selected)) then exit;
    lvfiles.Items.Clear;
    srdir := ExtractFilePath(application.ExeName) + '\templates\' + tvfolders.Selected.Text + '\*.*';
    FileAttrs := faHidden + faSysFile + faVolumeID + faDirectory + faArchive;

    FileAttrs := FileAttrs + faAnyFile;
    srchres := FindFirst(srdir, FileAttrs, sr);
    if srchres = 0 then begin
      repeat
        if (sr.Attr and faDirectory) = faDirectory then begin
          if not((sr.Name = '.') or (sr.Name = '..')) then begin
              //tvfolders.Items.AddChild(nil, sr.Name);
            end;
          end
        else begin
          item := lvfiles.Items.Add;
          item.Caption := sr.Name;
          GetAssociatedIcon(sr.Name, nil, @SmallIcon);
          if SmallIcon <> 0 then begin
            lsticon := ticon.Create;
            lsticon.Handle := SmallIcon;
            item.ImageIndex := imglist.AddIcon(lsticon);
            icon.Handle := smallicon;
            //lsticon.SaveToFile('c:\backup\' + ChangeFileExt(sr.name, '.ico'));
            end;
        end;
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
end;

procedure Tdtempwin.tvfoldersClick(Sender: TObject);
begin
  imglist.Clear;
  RefreshFiles;
end;

procedure Tdtempwin.btnOKClick(Sender: TObject);
var
  slist: TStringlist;
  stmpfile: String;
begin
  if not(assigned(tvfolders.Selected)) then begin
    showmessage('Select a folder first');
    ModalResult := mrNone;
    exit;
  end;
  if (dlgType = dtopen ) then begin
    if not(assigned(lvfiles.Selected)) then begin
      showmessage('Select a file first');
      ModalResult := mrNone;
      exit;
    end;
    //Open and read file contains
    stmpfile := ExtractFilePath(application.ExeName) + '\templates\' + tvfolders.Selected.Text + '\' + lvfiles.Selected.Caption;
    slist := TStringlist.Create;
    slist.LoadFromFile(stmpfile);
    FText := slist.Text;
    slist.Free;
    FFilename := stmpfile;
  end
  else begin
    stmpfile := ExtractFilePath(application.ExeName) + '\templates\' + tvfolders.Selected.Text + '\' + edtFilename.Text;
    slist := TStringlist.Create;
    slist.Text := FText;
    slist.SaveToFile(stmpfile);
    slist.Free;
  end;
  ModalResult := mrOK;
end;

procedure Tdtempwin.NewFolder1Click(Sender: TObject);
var
  fldname: String;
begin
  inherited;
  fldname := InputBox('Create New Folder', 'Folder Name:', '');
  if length(fldname) > 0 then begin
    ForceDirectories(ExtractFilePath(application.ExeName) + '\templates\' + fldname);
    RefreshTree;
  end;
end;

procedure Tdtempwin.RenameFolder1Click(Sender: TObject);
var
  oldname, newname: string;
begin
  inherited;
  oldname := tvfolders.Selected.Text;
  newname := InputBox('Rename Folder', 'Folder Name:', '');
  if (length(oldname) > 0) and (length(newname) > 0) then
    RenameFile(oldname, newname );
end;

procedure Tdtempwin.DeleteFolder1Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if not(assigned(tvfolders.Selected)) then begin
    showmessage('Select a folder first');
    exit;
  end;
  if lvfiles.Items.Count > 0 then begin
    if MessageDlg('Would you like to delete all templates in this folder?', mtConfirmation, mbYesNoCancel, 0) = mrYes then begin
      //Delete each file first
      for i := 0 to lvfiles.Items.Count -1 do
        DeleteFile( ExtractFilePath(application.ExeName) + '\templates\' + tvfolders.Selected.Text + '\' + lvfiles.Items[i].Caption );
      RemoveDir(ExtractFilePath(application.ExeName) + '\templates\' + tvfolders.Selected.Text);
    end
  end
  else
    RemoveDir(ExtractFilePath(application.ExeName) + '\templates\' + tvfolders.Selected.Text);
  RefreshTree;
end;

procedure Tdtempwin.FormShow(Sender: TObject);
begin
  inherited;
  lfilename.Visible := (FdlgType = dtSave);
  edtfilename.Visible := (FdlgType = dtSave);
  edtFilename.Text := ExtractFilename(FFilename);
  if (FdlgType = dtopen) then
    self.Caption := 'New File from Template'
  else
    self.Caption := 'Save As Template';
end;

procedure Tdtempwin.lvfilesClick(Sender: TObject);
begin
  inherited;
  if assigned(lvfiles.Selected) then
    edtFilename.Text := lvfiles.Selected.Caption;
end;

procedure Tdtempwin.tvfoldersChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  imglist.Clear;
  RefreshFiles;
end;

procedure Tdtempwin.edtFilenameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    btnOKClick(sender);
end;

end.
