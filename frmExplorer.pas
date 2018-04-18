unit frmExplorer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ShellCtrls, unitUtils, ToolWin;

type
  Tfexplorer = class(TForm)
    shltree: TShellTreeView;
    shllist: TShellListView;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Timer1: TTimer;
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure shltreeEnter(Sender: TObject);
    procedure shllistEnter(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure shltreeEdited(Sender: TObject; Node: TTreeNode;
      var S: String);
    procedure Timer1Timer(Sender: TObject);
  private
    FOnOpenFile: TOnOpenFile;
    FSelected: string;
    { Private declarations }
  public
    { Public declarations }
    property OnOpenFile: TOnOpenFile read FOnOpenFile write FOnOpenFile;
  end;

var
  fexplorer: Tfexplorer;

implementation

uses frmImages, shlobj;

{$R *.dfm}

procedure Tfexplorer.ToolButton3Click(Sender: TObject);
begin
  //Open file
  if length(shllist.SelectedFolder.PathName) <= 0 then exit;
  if assigned(FOnOpenFile) then
    FOnOpenFile(shllist.SelectedFolder.PathName);
end;

procedure Tfexplorer.ToolButton1Click(Sender: TObject);
var
  fname: string;
  cfile: TStringList;
begin
  //Enter path
  if length(shltree.SelectedFolder.PathName) <= 0 then exit;
  fname := InputBox('New File', 'Enter Filename:', '');
  if length(fname) <= 0 then exit;
  fname := shltree.SelectedFolder.PathName + '\' + fname;
  cfile := TStringList.Create;
  cfile.SaveToFile(fname);
  cfile.Free;
  shllist.Refresh;
  if assigned(FOnOpenFile) then
    FOnOpenFile(fname);
end;

procedure Tfexplorer.ToolButton5Click(Sender: TObject);
var
  fldname: string;
  delnode: TTreeNode;
  pitem, paritem: PItemIDList;
begin
  if length(FSelected) <= 0 then exit;
  if (FSelected = 'Folders') then begin
    if length(shltree.SelectedFolder.PathName) <= 0 then exit;
    fldname := shltree.SelectedFolder.PathName;
    delnode := shltree.Selected;
    pitem := shltree.SelectedFolder.AbsoluteID;
    paritem := shltree.SelectedFolder.Parent.AbsoluteID;
    shltree.Selected := shltree.Selected.Parent;
    if (MessageDlg('Are you sure you want to remove folder, ' + fldname + '?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then begin
      RmDir(fldname);
      SHChangeNotify(SHCNE_RMDIR, SHCNF_IDLIST, pitem, nil);
      SHChangeNotify(SHCNE_UPDATEDIR, SHCNF_IDLIST, paritem, nil);
      shltree.Refresh( shltree.Selected );
    end;
  end
  else if (FSelected = 'Files') then begin
    if length(shllist.SelectedFolder.PathName) <= 0 then exit;
    if (MessageDlg('Are you sure you want to delete file, ' + shllist.SelectedFolder.PathName + '?', mtConfirmation, mbYesNoCancel, 0) = mrYes) then begin
      if not DeleteFile(shllist.SelectedFolder.PathName) then  RaiseLastWin32Error; //Showmessage('Unable to delete file');
      shllist.Refresh;
    end;
  end;
end;

procedure Tfexplorer.ToolButton6Click(Sender: TObject);
var
  fname: string;
  cfile: TStringList;
begin
  //Enter path
  if length(shltree.SelectedFolder.PathName) <= 0 then exit;
  fname := InputBox('New Folder', 'Enter Foldername:', '');
  if length(fname) <= 0 then exit;
  fname := shltree.SelectedFolder.PathName + '\' + fname;
  MkDir(fname);
  shltree.Refresh( shltree.Selected );
end;

procedure Tfexplorer.shltreeEnter(Sender: TObject);
begin
  FSelected := 'Folders';
end;

procedure Tfexplorer.shllistEnter(Sender: TObject);
begin
  FSelected := 'Files';
end;

procedure Tfexplorer.ToolButton8Click(Sender: TObject);
begin
  if assigned(shltree.Selected) then shltree.Refresh(shltree.Selected);
end;

procedure Tfexplorer.shltreeEdited(Sender: TObject; Node: TTreeNode;
  var S: String);
begin
  Timer1.Enabled := true;
end;

procedure Tfexplorer.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if assigned(shltree.Selected.Parent) then shltree.Refresh(shltree.Selected.Parent);
  if assigned(shltree.Selected) then shltree.Refresh(shltree.Selected);  
end;

end.
