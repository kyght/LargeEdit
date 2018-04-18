unit frmProjectWin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ActnList, ImgList, unitproject,
  unitNSproj, Menus, unitUtils;

type
  TProjectItem = (piProject, piFolder, piFile, piGrouper, piProjectGroup);


  TfProject = class(TForm)
    Panel1: TPanel;
    tproj: TTreeView;
    projectimages: TImageList;
    alproject: TActionList;
    anewproject: TAction;
    aopenproject: TAction;
    aaddfile: TAction;
    adelete: TAction;
    aaddfolder: TAction;
    odlg: TOpenDialog;
    ascandrive: TAction;
    asaveproj: TAction;
    sdlg: TSaveDialog;
    anewprojgroup: TAction;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton11: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton10: TToolButton;
    ToolButton7: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    pmProGroup: TPopupMenu;
    NewProject1: TMenuItem;
    pmProject: TPopupMenu;
    AddFile1: TMenuItem;
    AddFolder1: TMenuItem;
    Remove1: TMenuItem;
    pmFolder: TPopupMenu;
    Remove2: TMenuItem;
    Save1: TMenuItem;
    ProjectFromFolder1: TMenuItem;
    N1: TMenuItem;
    pmFile: TPopupMenu;
    Remove3: TMenuItem;
    AddFile2: TMenuItem;
    AddFolder2: TMenuItem;
    procedure anewprojectExecute(Sender: TObject);
    procedure aaddfileExecute(Sender: TObject);
    procedure aaddfolderExecute(Sender: TObject);
    procedure ascandriveExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure asaveprojExecute(Sender: TObject);
    procedure tprojDblClick(Sender: TObject);
    procedure aopenprojectExecute(Sender: TObject);
    procedure adeleteExecute(Sender: TObject);
    procedure tprojCompare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);
    procedure anewprojgroupExecute(Sender: TObject);
    procedure tprojMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tprojChange(Sender: TObject; Node: TTreeNode);
  private
    FOnSaveProject: TOnSaveFile;
    function GetRootNode: TTreeNode;
    procedure SetRootNode(const Value: TTreeNode);
  private
    FPrjGrg: IProjectGroup;
    FOnOpenFile: TOnOpenFile;
    FFilename: string;
    ARootNode: TTreeNode;
    FOnOpenProject: TOnOpenFile;
    { Private declarations }
    function IsNodeType( node: TTreeNode; itemtype: TProjectItem): boolean;
    function GetCurrentGrouper(): TTreeNode;
    function GetCurrentProjectName(): string;
    function GetProjectItemImage(pitem: IProjectItem): integer;
    procedure AddItem(pnode: TTreeNode; pitem: IProjectItem; var Node: TTreeNode; ShowNode: string = '');
    procedure Refresh( shownode: string = '' );
    procedure SetActionState( node: TTreeNode );
    procedure AddDirtoProj( dir: String; parent: TTreeNode = nil );
    function AddFile( filename: string; parent: TTreeNode = nil ): TTreeNode;
    function AddFolder( foldername: string; parent: TTreeNode = nil): TTreeNode;
    function GetCurrentPath(): string;

    property FRootNode: TTreeNode read GetRootNode write SetRootNode;
  public
    function OpenProject( filename: string ): boolean;
    function AddProject: boolean;
    function AddFileToActive( filename: string ): boolean;
    procedure ShowAddFile;
    procedure ShowAddFolder;
    procedure ShowAddScanFiles;
    procedure DeleteItem;
    procedure NewProjectGroup;

    { Public declarations }
    property OnOpenFile: TOnOpenFile read FOnOpenFile write FOnOpenFile;
    property OnOpenProject: TOnOpenFile read FOnOpenProject write FOnOpenProject;
    property OnSaveProject: TOnSaveFile read FOnSaveProject write FOnSaveProject;
  end;

var
  fProject: TfProject;

implementation

uses comobj, filectrl, frmImages;

{$R *.dfm}

const imgproject = 5;
const imgprojectgroup = 8;
const imgfile = 0;
const imgfolder = 6;

procedure TfProject.anewprojectExecute(Sender: TObject);
begin
  AddProject;
end;

procedure TfProject.aaddfileExecute(Sender: TObject);
begin
  ShowAddFile;
end;

function TfProject.IsNodeType(node: TTreeNode;
  itemtype: TProjectItem): boolean;
begin
  case (itemtype) of
    piProject: result := (node.ImageIndex = imgproject);
    piProjectGroup: result := (node.ImageIndex = imgprojectgroup);
    piFolder: result := (node.ImageIndex = imgfolder);
    piFile: result := (node.ImageIndex = imgfile);
    piGrouper: result := (node.ImageIndex = imgfolder) or (node.ImageIndex = imgproject);
  end
end;

procedure TfProject.aaddfolderExecute(Sender: TObject);
begin
  ShowAddFolder;
end;

function TfProject.GetCurrentGrouper: TTreeNode;
var
  valnode: boolean;
begin
    result := nil;
    valnode := IsNodeType(tproj.Selected, piGrouper);
    if not(valnode) and (assigned(tproj.Selected.Parent)) then begin
      valnode := IsNodeType(tproj.Selected.Parent, piGrouper);
      result := tproj.Selected.Parent
      end
    else
      result := tproj.Selected;
end;

procedure TfProject.ascandriveExecute(Sender: TObject);
begin
  ShowAddScanFiles;
end;

procedure TfProject.FormCreate(Sender: TObject);
begin
  //Use Native project be default, if loading a project group or project
  //from Visual Studio or Delphi use custom plugin objects.
  FPrjGrg := TNSProjectGroup.Create;

  FRootNode := tproj.Items.AddChild(nil, 'Project Group');
  FRootNode.ImageIndex := imgprojectgroup;
  FRootNode.SelectedIndex := imgprojectgroup;

end;

function TfProject.GetCurrentProjectName: string;
var
  valnode: boolean;
  curnode: TTreeNode;
begin
    result := '';
    if assigned(tproj.Selected) then
      curnode := tproj.Selected
    else
      curnode := FRootNode;
    valnode := false;
    while not(valnode) do begin
      valnode := IsNodeType(curnode, piProject);
      if not(valnode) then begin
        curnode := curnode.Parent;
        if not(assigned(curnode)) then break;
      end;
    end;

    if valnode then begin
      result := curnode.Text;
    end
end;

procedure TfProject.asaveprojExecute(Sender: TObject);
begin
  if (length(FFilename) <= 0) then begin
    if sdlg.Execute then
      FFilename := sdlg.FileName
    else
      exit;
    end;
  FPrjGrg.SaveProject(FFileName);
  if assigned(FOnSaveProject) then FOnSaveProject(FFilename);  
end;

procedure TfProject.tprojDblClick(Sender: TObject);
var
  prj: IProjectItem;
begin
  //Get Filename and call Open
  if not(assigned(tproj.Selected)) then exit;
  prj := IProjectItem(tproj.Selected.Data);
  if assigned(FOnOpenFile) then
    if prj.GetType = 'file' then FOnOpenFile(prj.GetFullName);
end;

procedure TfProject.aopenprojectExecute(Sender: TObject);
begin
  if odlg.Execute then begin
    OpenProject( odlg.FileName );
  end;
end;

procedure TfProject.Refresh( shownode: string = '' );
var
  i: integer;
  prj: IProjectItem;
  node, snode: TTreeNode;
begin
  if (FRootNode.Count > 0) then
    FRootNode.DeleteChildren;
  snode := nil;
  for i := 0 to FPrjGrg.Count -1 do begin
    prj := FPrjGrg.Projects(i);
    AddItem(FRootNode, prj, snode, shownode );
    FRootNode.Expand(false);
    if assigned(snode) then begin
      snode.MakeVisible;
      snode.Expand(false);
      snode.Selected := true;
    end;
  end;
end;

procedure TfProject.AddItem(pnode: TTreeNode; pitem: IProjectItem; var Node: TTreeNode; ShowNode: string = '');
var
  nitem: TTreeNode;
  i: integer;
begin
  nitem := tproj.Items.AddChild(pnode, pitem.GetName);
  nitem.ImageIndex := GetProjectItemImage(pitem);
  nitem.SelectedIndex := GetProjectItemImage(pitem);
  nitem.Data := TObject(pitem);
  if (pitem.GetFullName = ShowNode) then begin
    node := nitem;
    end;
  for i := 0 to pitem.ItemCount - 1 do begin
    AddItem(nitem,pitem.Items(i), node, shownode);
    end
end;


function TfProject.GetProjectItemImage(pitem: IProjectItem): integer;
begin
    if (lowercase(pitem.GetType()) = 'project') then
      result := imgproject
    else if (lowercase(pitem.GetType()) = 'folder') then
      result := imgfolder
    else if (lowercase(pitem.GetType()) = 'file') then
      result := imgfile;
end;

procedure TfProject.adeleteExecute(Sender: TObject);
begin
  DeleteItem;
end;

procedure TfProject.AddDirtoProj(dir: String; parent: TTreeNode);
var
  sr: TSearchRec;
  FileAttrs: Integer;
  srdir: string;
  srchres: integer;
  pnode: TTreenode;
begin
    srdir := dir + '\*.*';
    FileAttrs := faHidden + faSysFile + faVolumeID + faDirectory + faArchive;

    FileAttrs := FileAttrs + faAnyFile;
    srchres := FindFirst(srdir, FileAttrs, sr);
    if srchres = 0 then begin
      repeat
        if (sr.Attr and faDirectory) = faDirectory then begin
          if not((sr.Name = '.') or (sr.Name = '..')) then begin
              pnode := AddFolder(dir + '\' + sr.Name, parent);
              AddDirtoproj(dir + '\' + sr.Name, pnode);
            end;
          end
          else
            AddFile(dir + '\' + sr.Name, parent);
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
end;

function TfProject.AddFile(filename: string; parent: TTreeNode): TTreeNode;
var
  fname: String;
  node, pnode: TTreeNode;
  valnode: boolean;
  prj: IProjectItem;
  item: IProjectItem;
begin
  fname := ExtractFilename(filename);
  if not(assigned(parent)) then
    pnode := GetCurrentGrouper()
  else
    pnode := parent;
  if assigned(pnode) then begin
    node := tproj.Items.AddChild(pnode, fname);
    node.ImageIndex := imgfile;
    node.SelectedIndex := imgfile;
    prj := IProjectItem(pnode.Data); //FPrjGrg.FindProject(GetCurrentProjectName());
    item := prj.AddFile(filename);
    node.Data := TObject(item);
    result := node;
    end
end;

function TfProject.AddFolder(foldername: string; parent: TTreeNode): TTreeNode;
var
  pjname: String;
  node, pnode: TTreeNode;
  prj: IProjectItem;
  item: IProjectItem;
begin
  pjname := ExtractFilename(foldername);
  if length(pjname) <= 0 then exit;
  if not(assigned(parent)) then
    pnode := GetCurrentGrouper()
  else
    pnode := parent;
  node := tproj.Items.AddChild(pnode, pjname);
  node.ImageIndex := imgfolder;
  node.SelectedIndex := imgfolder;
  prj := IProjectItem(pnode.Data); //FPrjGrg.FindProject(GetCurrentProjectName());
  item := prj.AddFolder(pjname);
  node.Data := TObject(item);
  result := node;
end;

function TfProject.AddProject: boolean;
var
  pjname: String;
  node: TTreeNode;
begin
  result := false;
  pjname := Inputbox('Add Project', 'Enter Project Name:', '');
  if length(pjname) <= 0 then exit;
  node := tproj.Items.AddChild(FRootNode, pjname);
  node.ImageIndex := imgproject;
  node.SelectedIndex := imgproject;
  node.Data := TObject(FPrjGrg.AddProject(pjname));
  tproj.Selected := node;
  result := true;
end;

procedure TfProject.tprojCompare(Sender: TObject; Node1, Node2: TTreeNode;
  Data: Integer; var Compare: Integer);
begin
  //Sort Project files
  if (node1.ImageIndex = node2.ImageIndex) then
    Compare := 0
  else if (node1.ImageIndex = imgfolder) and (node2.ImageIndex = imgfile) then
    compare := -1
  else if (node1.ImageIndex = imgfile) and (node2.ImageIndex = imgfolder) then
    compare := 1
  else if (node1.imageindex = imgprojectgroup) then
    compare := 1
  else if (node2.imageindex = imgprojectgroup) then
    compare := -1
  else if (node1.ImageIndex = imgproject) then
    compare := 1
  else if (node2.ImageIndex = imgproject) then
    compare := -1
  else
    compare := 0;
end;

procedure TfProject.anewprojgroupExecute(Sender: TObject);
begin
  NewProjectGroup;
end;

function TfProject.OpenProject(filename: string): boolean;
begin
  result := false;
  if FPrjGrg.LoadProject(fileName) then begin
    FFilename := fileName;
    if assigned(FOnOpenProject) then FOnOpenProject( FFilename );
    result := true;
  end;
  Refresh; 
end;

procedure TfProject.ShowAddFile;
begin
  odlg.InitialDir := GetCurrentPath;
  if odlg.Execute then begin
    AddFile(odlg.filename);
  end
end;

procedure TfProject.ShowAddFolder;
var
  rdir: String;
begin
  rdir := GetCurrentPath;
  if SelectDirectory('Select Folder', '', rdir) then
    AddFolder(rdir);
end;

procedure TfProject.ShowAddScanFiles;
var
  seldir: string;
  rnode: TTreeNode;
begin
  //Prompt user for folder to create project from
  //Scans all files inside the directory and add structure to current project

  if SelectDirectory('Select Folder', '', seldir) then begin
    if length(GetCurrentProjectName) <= 0 then begin
      AddProject;
      if length(GetCurrentProjectName) > 0 then
        AddDirtoProj(seldir);
    end
    else begin
      //Add Folder and then call add
      rnode := AddFolder(seldir);
      AddDirtoProj(seldir, rnode);
    end;
  end
end;

procedure TfProject.DeleteItem;
var
  item, pitem: IProjectItem;
  parnode: TTreeNode;
  parval: string;
  idx: integer;
begin
  //Delete Entry
  if (assigned(tproj.Selected)) then begin
    parnode := tproj.Selected.Parent;
    pitem := IProjectItem(parnode.Data);
    parval := pitem.GetFullName;

    item := IProjectItem(tproj.Selected.Data);
    idx := item.GetIndex;
    item.Delete;

    pitem.RemoveItem(idx);
    Refresh( parval );
  end;
end;

procedure TfProject.NewProjectGroup;
var
  mres: integer;
begin
  //Save Current project, Close project, New Blank project group
  mres := messagedlg('Do you wish to save the project group', mtConfirmation, mbYesNoCancel, 0);
  if mres = mrCancel then exit;
  if (mres = mrYes) then asaveprojExecute(nil);
  FFilename := '';
  FPrjGrg := TNSProjectGroup.Create;
  tproj.Items.Clear;
  FRootNode := tproj.Items.AddChild(nil, 'Project Group');
  FRootNode.ImageIndex := imgprojectgroup;
  FRootNode.SelectedIndex := imgprojectgroup;
end;

function TfProject.GetRootNode: TTreeNode;
begin
  result := tproj.Items.GetFirstNode
end;

procedure TfProject.SetRootNode(const Value: TTreeNode);
begin
  ARootNode := Value;
end;

procedure TfProject.tprojMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  hitnode: TTreeNode;
  mx, my: integer;
begin
  //if right click then show correct popup menu
  if Button <> mbRight then exit;
  hitnode := tproj.GetNodeAt(x,y);
  if not(assigned(hitnode)) then exit;
  mx := mouse.CursorPos.X;
  my := mouse.CursorPos.Y;
  if hitnode.ImageIndex = imgprojectgroup then pmProGroup.Popup(mx, my);
  if hitnode.ImageIndex = imgproject then pmProject.Popup(mx, my);
  if hitnode.ImageIndex = imgfolder then pmFolder.Popup(mx, my);
  if hitnode.ImageIndex = imgfile then pmFile.Popup(mx, my);
{const imgprojectgroup = 8;
const imgfile = 0;
const imgfolder = 6;}

end;

procedure TfProject.SetActionState(node: TTreeNode);
begin
  anewproject.Enabled := false;
  aaddfile.Enabled := false;
  aaddfolder.Enabled := false;
  adelete.Enabled := false;
  if node.ImageIndex = imgprojectgroup then begin
    anewproject.Enabled := true;
  end;
  if ValueInArray([imgproject, imgfolder, imgfile], node.ImageIndex) then begin
    aaddfile.Enabled := true;
    aaddfolder.Enabled := true;
    adelete.Enabled := true;
  end;
end;

procedure TfProject.tprojChange(Sender: TObject; Node: TTreeNode);
begin
  SetActionState(node);
end;

function TfProject.GetCurrentPath: string;
var
  rdir: String;
  gnode: TTreeNode;
  prjitem: IProjectItem;
begin
  rdir := '';
  gnode := tproj.Selected;
  if assigned(gnode) then begin
    prjitem := IProjectItem(gnode.Data);
    rdir := ExtractFilePath( prjitem.GetFullName );
    if length(rdir) <= 0 then
      rdir := ExtractFilePath( FPrjGrg.ProjectGroupFile );
  end;
  result := rdir;
end;

function TfProject.AddFileToActive(filename: string): boolean;
var
  tnode: TTreeNode;
begin
  tnode := GetCurrentGrouper();
  if assigned(tnode) and IsNodeType(tnode, piGrouper) then
    AddFile(filename)
  else
    MessageDlg('You must select a project first.', mtError, [mbOK], 0);
end;

end.
