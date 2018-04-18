unit dlgNagScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdCoder3To4, IdBaseComponent, IdCoder;

type
  TdlgNag = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lday: TLabel;
    Label4: TLabel;
    lbtraildays: TLabel;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    Image1: TImage;
    lbUrl: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure lbUrlMouseEnter(Sender: TObject);
    procedure lbUrlMouseLeave(Sender: TObject);
    procedure lbUrlClick(Sender: TObject);
  private
    { Private declarations }
    endapp: boolean;
    txtfile: TextFile;
    FDaysUsed: integer;
    FDaysTrail: integer;
  public
    { Public declarations }
    function IsTrialValid: boolean;
    property DaysUsed: integer read FDaysUsed;
    property DayTrial: integer read FDaysTrail;
    property ShouldCloseApp: boolean read endapp;
  end;

var
  dlgNag: TdlgNag;

implementation

uses registry, unitAppConst, fLargePad, unitutils;

const
  sc_parms: array[0..3] of string = (
        '[LargeEdit]',
        'version=1.0',
        'build=1.0',
        'helpfile=largeedit.chm'
    );

    scfilename = 'le2keyfl.cfg';

{$R *.dfm}

procedure TdlgNag.FormCreate(Sender: TObject);
begin
  FDaysTrail := 45;
  lbtraildays.Caption := IntToStr(DayTrial);
  IsTrialValid;
end;

procedure TdlgNag.Button1Click(Sender: TObject);
begin
  if endapp then begin
    showmessage('Your ' + IntToStr(DayTrial) + ' day trial has ended, Please click Buy.');
    Application.Terminate;
  end
  else
    ModalResult := mrOk;
end;

procedure TdlgNag.Button2Click(Sender: TObject);
begin
  fLEdit.BuyApp;
  if not fLEdit.ValidSerial then
    Application.Terminate
  else
    ModalResult := mrOk;
end;

procedure TdlgNag.Button3Click(Sender: TObject);
begin
  fLEdit.EnterSerial;
  if not fLEdit.ValidSerial then begin
    if endapp then begin
      showmessage('Your ' + IntToStr(DayTrial) + ' day trial has ended, Please click Buy.');
      Application.Terminate;
    end
    else
      ModalResult := mrOk;
    end
  else
    ModalResult := mrOk;
end;

function TdlgNag.IsTrialValid: boolean;
var
  reg: TRegistry;
  dte, fleag: TDateTime;
  dif, dif2, fage, i, psdif: integer;
  fname, ftpcom: String;
  notfound: Boolean;
begin
  endapp := false;
  notfound := false;
  FDaysUsed := -1;
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey(kAPP, true);

    //Check Reg Date Key
    if reg.ValueExists(vInsDat) then
      dte := reg.ReadDateTime(vInsDat)
    else begin
      notfound := true;
      reg.WriteDateTime(vInsDat, now);
      dte := now;
      end;
    dif := round(now - dte);
    FDaysUsed := dif;
    lday.Caption := IntToStr(dif);

    if dif > DayTrial then
      endapp := true;

    //Check File Date
    fname := ExtractFilePath(Application.ExeName) + scfilename;
    if not FileExists(fname) then begin
      AssignFile(txtfile, fname);
      Rewrite(txtFile);
      for i := low(sc_parms) to high(sc_parms) do
        Writeln(txtfile, sc_parms[i]);
      CloseFile(txtFile);
    end
    else begin
        fage := FileAge(fname);
        fleag := FileDateToDateTime(fage);
        if notfound then begin
            reg.WriteDateTime(vInsDat, fleag);
        end;
        if not endapp then begin
          dif2 := round(now - fleag);
          if dif2 > dif then begin
            lday.Caption := IntToStr(dif2);
            FDaysUsed := dif2;
            if dif2 > DayTrial then
              endapp := true;
          end;
        end
    end;

    //Store last DaysUsed and check against current diff for date reset
    psdif := 0;
    if reg.ValueExists(vDysUD) then begin
      ftpcom := reg.ReadString(vDysUD);
      i := pos('|', ftpcom);
      ftpcom := Copy(ftpcom, i+1, length(ftpcom));
      psdif := StrToIntDef(ftpcom, 46);
      if psdif > FDaysUsed then
        FDaysUsed := psdif
      else if psdif < FDaysUsed then begin
        ftpcom := 'inetcomm.dll|' + IntToStr(FDaysUsed);
        reg.WriteString(vDysUD, ftpcom);
        end;
      end
    else begin
      psdif := FDaysUsed;
      ftpcom := 'inetcomm.dll|' + IntToStr(psdif);
      reg.WriteString(vDysUD, ftpcom);
      end;

    if FDaysUsed = -1 then begin
      FDaysUsed := StrToIntDef(lday.Caption, 46);
      endapp := true;
      end;

    if FDaysUsed > DayTrial then
      endapp := true;

    lday.Caption := IntToStr(FDaysUsed);

  finally
    reg.Free;
  end;

  result := not endapp;
end;

procedure TdlgNag.lbUrlMouseEnter(Sender: TObject);
begin
  lbUrl.Font.Style := [fsUnderline];
end;

procedure TdlgNag.lbUrlMouseLeave(Sender: TObject);
begin
  lbUrl.Font.Style := [fsUnderline];
end;

procedure TdlgNag.lbUrlClick(Sender: TObject);
begin
  ExecuteFile(lbUrl.Caption, '');
end;

end.
