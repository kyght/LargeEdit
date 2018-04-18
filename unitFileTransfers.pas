unit unitFileTransfers;

interface

uses IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP;

type
  TFTPHandler = class
  private
  public
    function Send_File_FTP(User, Passward, Host, Filename, DisDir: String): Boolean;
    property User: read FUser write FUser    
  end;

implementation




{ TFTPHandler }

function TFTPHandler.Send_File_FTP(User, Passward, Host, Filename,
  DisDir: String): Boolean;
var
  ftp: TIdFTP;
begin
  ftp: TIdFTP.Create(nil);
  try
    ftp.
  finally
    ftp.Free
  end;
end;

end.
