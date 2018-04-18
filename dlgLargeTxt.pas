unit dlgLargeTxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmLargeTEXT = class(TForm)
    mtxt: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FOnClickOK: TNotifyEvent;
    function GetTitle: String;
    procedure SetTitle(const Value: String);
    function GetText: String;
    procedure SetText(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property Title: String read GetTitle write SetTitle;
    property Text: String read GetText write SetText;
    property OnClickOK: TNotifyEvent read FOnClickOK write FOnClickOk;
  end;

var
  frmLargeTEXT: TfrmLargeTEXT;

implementation

{$R *.dfm}

{ TfrmLargeTEXT }

function TfrmLargeTEXT.GetText: String;
begin
  result := self.mtxt.Lines.Text;
end;

function TfrmLargeTEXT.GetTitle: String;
begin
  result := self.Caption;
end;

procedure TfrmLargeTEXT.SetText(const Value: String);
begin
  self.mtxt.Lines.Text := Value;
end;

procedure TfrmLargeTEXT.SetTitle(const Value: String);
begin
  self.Caption := value;
end;

procedure TfrmLargeTEXT.Button2Click(Sender: TObject);
begin
  if assigned(FOnClickOk) then
    FOnClickOk(self)
  else
    modalresult := mrOk;
end;

procedure TfrmLargeTEXT.Button1Click(Sender: TObject);
begin
  close;
end;

end.
