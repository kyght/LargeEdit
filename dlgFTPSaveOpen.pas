unit dlgFTPSaveOpen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dlgStandard, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP, ComCtrls, ImgList, dlgprocessing,
  Menus, ActnList, ToolWin;

type
  TFtpDlgType = (fdtOpen, fdtSave);

  TdFTPso = class(TdStandard)
    ftp: TIdFTP;
    Panel3: TPanel;
    lvfiles: TListView;
    cbAccounts: TComboBox;
    Label1: TLabel;
    btnSave: TButton;
    GroupBox1: TGroupBox;
    edtHost: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtPort: TEdit;
    Label4: TLabel;
    edtUser: TEdit;
    Label5: TLabel;
    edtPass: TEdit;
    Panel4: TPanel;
    minfo: TMemo;
    Splitter1: TSplitter;
    btnConnect: TButton;
    Label6: TLabel;
    edtFilename: TEdit;
    rbbin: TRadioButton;
    rbascii: TRadioButton;
    imgs: TImageList;
    Button3: TButton;
    pmItems: TPopupMenu;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ActionList1: TActionList;
    aNewFolder: TAction;
    NewFolder1: TMenuItem;
    aDelete: TAction;
    Delete1: TMenuItem;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    aconnect: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    adisconnect: TAction;
    ToolButton7: TToolButton;
    arename: TAction;
    ToolButton8: TToolButton;
    aAbort: TAction;
    Rename1: TMenuItem;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    adirup: TAction;
    od: TOpenDialog;
    sd: TSaveDialog;
    ToolButton11: TToolButton;
    aRefresh: TAction;
    ToolButton12: TToolButton;
    btndisconnect: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure ftpConnected(Sender: TObject);
    procedure ftpDisconnected(Sender: TObject);
    procedure lvfilesDblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure lvfilesClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cbAccountsChange(Sender: TObject);
    procedure ftpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure ftpWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure ftpWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure ftpStatus(axSender: TObject; const axStatus: TIdStatus;
      const asStatusText: String);
    procedure lvfilesCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvfilesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aNewFolderExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure aconnectExecute(Sender: TObject);
    procedure adisconnectExecute(Sender: TObject);
    procedure arenameExecute(Sender: TObject);
    procedure aAbortExecute(Sender: TObject);
    procedure adirupExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure btndisconnectClick(Sender: TObject);
    procedure lvfilesChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
    FWorkCountMax: integer;
    FFTPAccount: TStringList;
    FCurAccount: TStringList;
    FFTPACCFile: String;
    FDlgType: TFtpDlgType;
    dp: TdlgProcess;
    FFilename: String;
    FRemoteFile: String;
    FHost: String;
    FUser: String;
    FPort: Integer;
    FPass: String;
    FRemoteDir: String;
    procedure ListFileOld;
    procedure ListFile;
    function GetFilename: String;
    procedure SetFilename(const Value: String);
    function GetRemoteFile: String;
    procedure SetRemoteFile(const Value: String);
    procedure DeleteItem;
    procedure MakeNewFolder;
    procedure Connect;
    procedure DisConnect;
    procedure Rename;
    function GetLowerPanel: boolean;
    procedure SetLowerPanel(const Value: boolean);
    function GetSelected: string;
  public
    { Public declarations }
    function Execute(DlgType: TFtpDlgType): boolean;
    procedure SendFile;
    procedure RefreshList;
    function FTP_File(Stype: TFtpDlgType; SrcFilename, DisFilename: String): boolean; overload;
    function FTP_File(Stype: TFtpDlgType; SrcFilename, DisFilename: String; binary: boolean): boolean; overload;
    property SelectedFile: string read GetSelected;
    property LowerPanel: boolean read GetLowerPanel write SetLowerPanel;
    property Filename: String read GetFilename write SetFilename;
    property RemoteFile: String read GetRemoteFile write SetRemoteFile;
    property RemoteDir: String read FRemoteDir write FRemoteDIR;
    property Host: String read FHost write FHost;
    property Port: Integer read FPort write FPort;
    property User: String read FUser write FUser;
    property Pass: String read FPass write FPass;
  end;

var
  dFTPso: TdFTPso;

implementation

uses
  unitUtils,
  unitDataUtils,
  ftpparse;

const
  icDir = 0;
  icFile = 1;

{$R *.dfm}

function TdFTPso.FTP_File(Stype: TFtpDlgType; SrcFilename, DisFilename: String): boolean;
begin
  result := false;
  if (FWorkCountMax <= 0) and assigned(lvfiles.Selected) then
    FWorkCountMax := StrToIntDef(lvfiles.Selected.SubItems[1], 0);

  if rbbin.Checked then
    ftp.TransferType := ftBinary
  else
    ftp.TransferType := ftASCII;
  if stype = fdtSave then begin
    dp.ProcessCaption := 'Uploading File';
    dp.UpdateStatus('Preparing to upload file', 0, 1, true);
    dp.Show;
    ftp.Put(SrcFilename, DisFilename, false);
    dp.Hide;
    end
  else begin
    dp.ProcessCaption := 'Downloading File';
    dp.UpdateStatus('Preparing to download file', 0, 1, true);
    dp.Show;
    ftp.Get(SrcFilename, DisFilename, true);
    dp.Hide;
    end;
  result := true;
end;


procedure TdFTPso.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  ClearForm(self);
  edtPort.Text := IntToStr(ftp.port);
  dp := TdlgProcess.Create(self);
  FFTPAccount := TStringList.Create;
  FFTPACCFile := AppPath + 'FTP\ftpaccount.lst';
  if fileexists(FFTPACCFile) then
    FFTPAccount.LoadFromFile(FFTPACCFile);
  if not DirectoryExists(ExtractFilePath(FFTPACCFile)) then
    forcedirectories(ExtractFilePath(FFTPACCFile));
  FCurAccount := TStringList.Create;
  for i := 0 to FFTPAccount.Count - 1 do
    cbAccounts.Items.Add(FFTPAccount.Names[i]);
end;

procedure TdFTPso.btnConnectClick(Sender: TObject);
begin
  inherited;
  Connect;
end;

procedure TdFTPso.ListFile;
var
  des: TStringList;
  i, idx: integer;
  item: TListItem;
  txt, name, date, size: string;
  fp: ftpinfo;
begin
  lvfiles.Items.Clear;
  des := TStringList.Create;
  try
    //GetAllDirectories
    minfo.Lines.Add('LIST >');
    ftp.List(des, '*.*', true);
    for i := 0 to des.Count -1 do begin
      minfo.Lines.Add('  ' + des[i]);
      txt := des[i];

      ftpparser(fp, txt, length(txt));
      name := fp.name;
      size := IntToStr(fp.size);
      date := IntToStr(fp.mtime);

      item := lvfiles.Items.Add;
      if Copy(txt, 0, 1) = 'd' then
         item.ImageIndex := icDir
      else
        item.ImageIndex := icFile;
      item.Caption := name;
      item.SubItems.Add(date);
      item.SubItems.Add(size);
    end;
  finally
    des.Free;
  end;
end;

procedure TdFTPso.ListFileOld;
var
  des: TStringList;
  i, idx: integer;
  item: TListItem;
  txt, name, date, size: string;
begin
  lvfiles.Items.Clear;
  des := TStringList.Create;
  try
    //GetAllDirectories
    minfo.Lines.Add('LIST >');
    ftp.List(des, '*.*', true);
    for i := 0 to des.Count -1 do begin
      minfo.Lines.Add('  ' + des[i]);
      txt := des[i];
      name := Trim(Copy(txt, 55, Length(txt)));
      size := Trim(Copy(txt, 30, 13));
      date := Trim(Copy(txt, 42, 14));
      item := lvfiles.Items.Add;
      if Copy(txt, 0, 1) = 'd' then
         item.ImageIndex := icDir
      else
        item.ImageIndex := icFile;
      item.Caption := name;
      item.SubItems.Add(date);
      item.SubItems.Add(size);
    end;
  finally
    des.Free;
  end;
end;

procedure TdFTPso.ftpConnected(Sender: TObject);
begin
  inherited;
//  minfo.Lines.Add('Connected to ' + ftp.Host + ' on port ' + IntToStr(ftp.port));
end;

procedure TdFTPso.ftpDisconnected(Sender: TObject);
begin
  inherited;
//  minfo.Lines.Add('Disconnected from ' + ftp.Host + ' on port ' + IntToStr(ftp.port));
end;

procedure TdFTPso.lvfilesDblClick(Sender: TObject);
begin
  inherited;
  //List sub dir
  if lvfiles.Selected.ImageIndex = icDir then begin
    ftp.ChangeDir(lvfiles.Selected.Caption);
    listfile;
    end
  else if lvfiles.Selected.ImageIndex = icfile then begin
    edtfilename.Text := lvfiles.Selected.Caption;
  end;
end;

function TdFTPso.Execute(DlgType: TFtpDlgType): boolean;
begin
  FDlgType := DlgType;
  result := self.ShowModal = mrOk;
end;

procedure TdFTPso.Button2Click(Sender: TObject);
begin
  inherited;
  if FDlgType = fdtOpen then begin
    if lvfiles.Selected.ImageIndex = icfile then begin
      if length(edtfilename.Text) <= 0 then begin
        Showmessage('Please enter a local save file name');
        end
      else begin
        if Length(ExtractFilePath(edtfilename.text)) <= 0 then
          edtfilename.text := AppPath + 'FTP\Files\' + ExtractFilename(edtfilename.text);
        if not DirectoryExists(ExtractFilePath(edtfilename.text)) then
          forcedirectories(ExtractFilePath(edtfilename.text));
        FWorkCountMax := StrToIntDef(lvfiles.Selected.SubItems[1], 0);
        FTP_File(FDlgType, lvfiles.Selected.Caption, edtfilename.Text);
        RemoteFile := lvfiles.Selected.Caption;
        RemoteDir := ftp.RetrieveCurrentDir;
        FFilename := edtfilename.Text;
        modalresult := mrok;
        end;
      end
    else
      Showmessage('Please select a file to open');
    end
  else if FDlgType = fdtSave then begin
    if length(edtfilename.text) > 0 then begin
      FWorkCountMax := GetSizeOfFile(Filename);
      FTP_File(FDlgType, Filename, ExtractFileName(edtfilename.text));
      RemoteFile := ExtractFileName(edtfilename.text);
      RemoteDir := ftp.RetrieveCurrentDir;
      modalresult := mrok;
      end
    else
      showmessage('Please enter a file name to save as');
  end;
end;

function TdFTPso.GetFilename: String;
begin
  result := FFilename;
end;

procedure TdFTPso.lvfilesClick(Sender: TObject);
begin
  inherited;
  if assigned(lvfiles.Selected) then begin
    if lvfiles.Selected.ImageIndex = icfile then begin
      edtfilename.Text := lvfiles.Selected.Caption;
    end;
  end;
end;

procedure TdFTPso.btnSaveClick(Sender: TObject);
var
  fname: String;
  i: integer;
begin
  inherited;
  if length(cbAccounts.Text) <= 0 then begin
    showmessage('You must enter an account name first');
    exit;
    end;
  //Save FTP account Setting
  cbAccounts.Text := StringReplace(cbAccounts.Text, '=', '', [rfReplaceAll, rfIgnoreCase]);
  FCurAccount.Text := '';
  FCurAccount.Add('HOST='+edthost.Text);
  FCurAccount.Add('PORT='+edtport.Text);
  FCurAccount.Add('USER='+edtuser.Text);
  FCurAccount.Add('PASS='+edtpass.Text);
  if FFTPAccount.IndexOfName(cbAccounts.Text) >= 0 then begin
    fname := FFTPAccount.Values[cbAccounts.Text];
    end
  else begin
    i := FFTPAccount.Add(cbAccounts.Text + '=tmp.txt' );
    fname := AppPath + 'FTP\acc' + inttoStr(i) + '.fac';
    FFTPAccount.Values[cbAccounts.Text] := fname;
  end;
  FCurAccount.SaveToFile(fname);
  FFTPAccount.SaveToFile(FFTPACCFile);
end;

procedure TdFTPso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Disconnect;
end;

procedure TdFTPso.FormDestroy(Sender: TObject);
begin
  inherited;
  FFTPAccount.Free;
  FCurAccount.Free;
  dp.Free;
end;

procedure TdFTPso.cbAccountsChange(Sender: TObject);
var
  fname : String;
begin
  inherited;
  //Load Account
  if length(cbAccounts.Text) <= 0 then begin
    showmessage('You must enter an account selected first');
    exit;
    end;
  if FFTPAccount.IndexOfName(cbAccounts.Text) >= 0 then begin
    fname := FFTPAccount.Values[cbAccounts.Text];
    FCurAccount.LoadFromFile(fname);
    edthost.Text := FCurAccount.Values['HOST'];
    edtport.Text := FCurAccount.Values['PORT'];
    edtuser.Text := FCurAccount.Values['USER'];
    edtpass.Text := FCurAccount.Values['PASS'];
  end;
end;

procedure TdFTPso.ftpWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
  inherited;
  if AWorkCountMax <> 0 then
    FWorkCountMax := AWorkCountMax;
  if dp.Visible then
    dp.UpdateStatus('Starting File Transfer', 0, FWorkCountMax, true);
end;

procedure TdFTPso.ftpWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  inherited;
  if dp.Visible then
    dp.UpdateStatus('File Transfer Complete', FWorkCountMax, FWorkCountMax, true);
end;

procedure TdFTPso.ftpWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
  inherited;
  if dp.Visible then
    if not dp.UpdateStatus('Transfering File' + #$D#$A +  IntToStr(AWorkCount) + ' bytes of '+ IntToStr(FWorkCountMax) +' transfered', AWorkCount, FWorkCountMax, true) then
      ftp.Abort;
end;

procedure TdFTPso.ftpStatus(axSender: TObject; const axStatus: TIdStatus;
  const asStatusText: String);
var
  optext: String;
begin
  inherited;
  case axStatus of
    hsResolving: optext := 'Resolving';
    hsConnecting: optext := 'Connecting';
    hsConnected: optext := 'Connected';
    hsDisconnecting: optext := 'Disconnecting';
    hsDisconnected: optext := 'Disconnected';
    else
      optext := 'Text';
  end;
  minfo.Lines.Add(asStatusText);
end;

procedure TdFTPso.lvfilesCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
  inherited;
  if (item1.ImageIndex = icDir) and (item2.ImageIndex = icFile) then
    compare := -1
  else if (item2.ImageIndex = icDir) and (item1.ImageIndex = icFile) then
    compare := 1
  else
    compare := CompareText(item1.Caption, item2.Caption);
end;

procedure TdFTPso.SetFilename(const Value: String);
begin
  FFilename := value;
end;

function TdFTPso.GetRemoteFile: String;
begin
  result := FRemoteFile;
end;

procedure TdFTPso.SetRemoteFile(const Value: String);
begin
  FRemoteFile := value;
end;

procedure TdFTPso.SendFile;
begin
  ftp.host := FHost;
  ftp.port := FPort ;
  ftp.Password := FPass;
  ftp.User := FUser;
  ftp.Connect;
  if not ftp.Connected then begin
    Messagedlg('Unable to connect to remote server, please try save as.', mtInformation, [mbok], 0);
    exit;
    end;
  ftp.ChangeDir(remotedir);
  if ftp.RetrieveCurrentDir <> remotedir then begin
    Messagedlg('Unable to change to remote directory, please try save as.', mtInformation, [mbok], 0);
    exit;
  end;

  if not FTP_File(fdtSave, filename, remotefile) then begin
    Messagedlg('Unable to save file to remote server, please try save as.', mtInformation, [mbok], 0);
  end;
end;

procedure TdFTPso.lvfilesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_DELETE then begin
    DeleteItem;
  end;
end;

procedure TdFTPso.DeleteItem;
begin
  if not assigned( lvfiles.Selected ) then
    Showmessage('You must select a file first')
  else begin
    if lvfiles.Selected.ImageIndex = icfile then begin
      if messagedlg('Are you sure you want to delete the selected file?', mtconfirmation, [mbYes, mbNo], 0 ) = mryes then begin
        ftp.Delete(lvfiles.Selected.Caption);
        listfile;
        end;
      end
    else if lvfiles.Selected.ImageIndex = icDir then begin
      if messagedlg('Are you sure you want to delete the selected directory?', mtconfirmation, [mbYes, mbNo], 0 ) = mryes then begin
        ftp.RemoveDir(lvfiles.Selected.Caption);
        listfile;
        end;
      end;
    end;
end;

procedure TdFTPso.MakeNewFolder;
var
  vle: string;
begin
  vle := '';
  if inputquery('New Folder', 'Enter Folder Name', vle) then begin
    if length(vle) > 0 then begin
      ftp.MakeDir(vle);
      ListFile;
    end;
  end
end;

procedure TdFTPso.aNewFolderExecute(Sender: TObject);
begin
  inherited;
  MakeNewFolder;
end;

procedure TdFTPso.aDeleteExecute(Sender: TObject);
begin
  inherited;
  DeleteItem;
end;

procedure TdFTPso.Connect;
begin
  if ftp.Connected then ftp.Disconnect;
  ftp.User := edtUser.Text;
  ftp.Password := edtPass.Text;
  ftp.Host := edtHost.Text;
  FHost := ftp.host;
  FPort := ftp.port;
  FPass := ftp.Password;
  FUser := ftp.User;
  ftp.Connect;
  ListFile;
end;

procedure TdFTPso.aconnectExecute(Sender: TObject);
begin
  inherited;
  Connect;
end;

procedure TdFTPso.DisConnect;
begin
  if ftp.Connected then ftp.Disconnect;
  lvfiles.Clear;
  edtfilename.Text := '';
end;

procedure TdFTPso.adisconnectExecute(Sender: TObject);
begin
  inherited;
  Disconnect;
end;

procedure TdFTPso.arenameExecute(Sender: TObject);
begin
  inherited;
  Rename;
end;

procedure TdFTPso.Rename;
var
  vle: string;
begin
  if not assigned( lvfiles.Selected ) then
    Showmessage('You must select a file\dir first')
  else begin
    vle := '';
    if inputquery('Rename', 'Enter New Name', vle) then begin
      if length(vle) > 0 then begin
        ftp.Rename(lvfiles.Selected.Caption, vle);
        ListFile;
      end;
    end
    end;
end;

procedure TdFTPso.aAbortExecute(Sender: TObject);
begin
  inherited;
  ftp.Abort;
  listFile;
end;

procedure TdFTPso.adirupExecute(Sender: TObject);
begin
  inherited;
  ftp.ChangeDirUp;
  listFile;
end;

procedure TdFTPso.Button3Click(Sender: TObject);
begin
  inherited;
  if FDlgType = fdtSave then begin
    if od.Execute then edtfilename.Text := od.FileName
    end
  else begin
    if sd.Execute then edtfilename.Text := sd.FileName;
    end
end;

procedure TdFTPso.aRefreshExecute(Sender: TObject);
begin
  inherited;
  ListFile;
end;

function TdFTPso.GetLowerPanel: boolean;
begin
  result := panel1.Visible
end;

procedure TdFTPso.SetLowerPanel(const Value: boolean);
begin
  panel1.Visible := value;
end;

function TdFTPso.GetSelected: string;
begin
  if assigned( lvfiles.Selected ) then
    result := lvfiles.Selected.Caption
  else
    result := '';
end;

procedure TdFTPso.RefreshList;
begin
  ListFile;
end;

function TdFTPso.FTP_File(Stype: TFtpDlgType; SrcFilename, DisFilename: String; binary: boolean): boolean;
begin
  if binary then
    rbbin.Checked := true
  else
    rbascii.Checked := true;
  FTP_File(Stype, srcfilename, disfilename);
end;

procedure TdFTPso.btndisconnectClick(Sender: TObject);
begin
  inherited;
  DisConnect;
end;

procedure TdFTPso.lvfilesChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  inherited;
  //Update Item if in open mode
  if assigned(lvfiles.Selected) then begin
    if lvfiles.Selected.ImageIndex = icfile then begin
      edtfilename.Text := lvfiles.Selected.Caption;
    end;
  end;
end;

end.
