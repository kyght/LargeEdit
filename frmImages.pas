unit frmImages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList;

type
  TfrmLEImages = class(TForm)
    leimgsm: TImageList;
    imgsmdis: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
    function AddImage( filename: string ): integer;
  end;

var
  frmLEImages: TfrmLEImages;

implementation

uses unitUtils;

{$R *.dfm}

{ TfrmLEImages }

function TfrmLEImages.AddImage(filename: string): integer;
var
  ico: TIcon;
  fname: string;
begin
  result := -1;
  fname := filename;
  if (ExtractFileDrive(fname) = '') then fname := AppPath + fname;
  if not(FileExists(fname)) then exit;
  ico := TIcon.Create;
  ico.LoadFromFile(fname);
  result := leimgsm.AddIcon(ico);
end;

end.
