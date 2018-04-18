unit dlgProcessing;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TdlgProcess = class(TForm)
    lbStatus: TLabel;
    pbar: TProgressBar;
    Bevel1: TBevel;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FProcessCaption: String;
    FCancel: boolean;
    LastTime: TTimeStamp;
    procedure SetProcessCaption(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    function UpdateStatus( Text: String; Current, Max: Integer; UpdateNow: boolean = false): boolean;
    property ProcessCaption: String read FProcessCaption write SetProcessCaption;
  end;

var
  dlgProcess: TdlgProcess;

implementation

{$R *.DFM}

{ TdlgProcess }

function TdlgProcess.UpdateStatus(Text: String; Current,
  Max: Integer; UpdateNow: boolean = false): boolean;
var
  curtime: TTimeStamp;
  dif: integer;
begin
  if FCancel then begin
    result := false;
    exit;
  end;
  curtime := DateTimeToTimeStamp(now);
  dif := (curtime.Date + curtime.time) - (lasttime.date + lasttime.time);
  if (dif >= 2000) or UpdateNow then begin
    lbStatus.caption := Text;
    if pbar.Max <> Max then
      pbar.Max := Max;
    pbar.Position := Current;
    application.ProcessMessages;
    LastTime := DateTimeToTimeStamp(now);
  end;
  result := true;
end;

procedure TdlgProcess.FormCreate(Sender: TObject);
begin
  FCancel := false;
end;

procedure TdlgProcess.btnCancelClick(Sender: TObject);
begin
  FCancel := true;
  lbStatus.caption := 'Attempting to cancel process.';
  btnCancel.Enabled := false;
end;

procedure TdlgProcess.SetProcessCaption(const Value: String);
begin
  FProcessCaption := Value;
  Caption := FProcessCaption;
end;

procedure TdlgProcess.FormShow(Sender: TObject);
begin
  FCancel := false;
end;

end.
