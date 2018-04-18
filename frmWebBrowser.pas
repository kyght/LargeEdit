unit frmWebBrowser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, ComCtrls, ToolWin, ExtCtrls;

type
  TfWebBrowser = class(TForm)
    web: TWebBrowser;
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
    Panel1: TPanel;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
  private
    FOnCloseViewer: TNotifyEvent;
    { Private declarations }
  public
    { Public declarations }
    procedure Navigate( location: String );
    property OnCloseViewer: TNotifyEvent read FOnCloseViewer write FOnCloseViewer;
  end;

var
  fWebBrowser: TfWebBrowser;

implementation

uses frmImages;

{$R *.dfm}

{ TfWebBrowser }

procedure TfWebBrowser.Navigate(location: String);
begin
  try
    if (length(location) > 0) then
      web.Navigate(location);
  except
  end;
end;

procedure TfWebBrowser.ToolButton4Click(Sender: TObject);
begin
  try
    web.GoBack;
  except
  end;
end;

procedure TfWebBrowser.ToolButton5Click(Sender: TObject);
begin
  try
    web.GoForward;
  except
  end;
end;

procedure TfWebBrowser.ToolButton1Click(Sender: TObject);
begin
  try
    web.Refresh;
  except
  end;
end;

procedure TfWebBrowser.ToolButton7Click(Sender: TObject);
begin
  try
    web.Stop;
  except
  end;
end;

procedure TfWebBrowser.ToolButton9Click(Sender: TObject);
begin
  //Close this window
  if assigned( FOnCloseViewer ) then
    FOnCloseViewer( sender );
end;


procedure TfWebBrowser.ToolButton10Click(Sender: TObject);
var
  url: string;
begin
  url := InputBox('Navigate', 'Enter Address', 'http://' );
  if (length(url) > 0) then web.Navigate( url );
end;

procedure TfWebBrowser.ToolButton11Click(Sender: TObject);
var
  wdoc: Variant;
begin
  wdoc := web.Document;
  wdoc.parentWindow.Print;
end;

end.
