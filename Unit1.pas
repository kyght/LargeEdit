unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    memo1: TRichEdit;
    Panel1: TPanel;
    Button1: TButton;
    od: TOpenDialog;
    Button2: TButton;
    Button3: TButton;
    elines: TEdit;
    Button4: TButton;
    Button5: TButton;
    sd: TSaveDialog;
    cbout: TCheckBox;
    Button6: TButton;
    esearch: TEdit;
    GroupBox1: TGroupBox;
    efld: TEdit;
    edelim: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button7: TButton;
    Label3: TLabel;
    etot: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure cboutClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    txt: TextFile;
    outf: TextFile;
    lastend: Integer;
    procedure ProcessFile(MinLength: Integer; OutFile: String);
    procedure GetLines(Lines: Integer);
    procedure GetSelLines(Startl, Endl: Integer);
    procedure DeleteField(Del: String; Field, NumofFields: Integer; OutFile: String);
    procedure OutLines;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses vcl_util;

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if od.Execute then begin
    AssignFile(txt, od.FileName);
    Reset(txt);
  end;
end;

procedure TForm1.ProcessFile(MinLength: Integer; OutFile: String);
var
  s, t: String;
begin
  AssignFile(outf, outFile);
  Rewrite(outf);
  while not eof(txt) do begin
    Readln(txt, s);
    while (length(s) <= MinLength) do begin
      t := s;
      Readln(txt, s);
      t := t + s;
      s := t;
    end;
    writeln(outf, s);
  end;
  CloseFile(outf);
  ShowMessage('Done');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if sd.Execute then begin
    ProcessFile(StrToInt(elines.text), sd.FileName);
  end;
  Screen.Cursor := crDefault;
end;

procedure TForm1.GetLines(Lines: Integer);
var
  s: String;
  i: Integer;
  str: TStringList;
begin
  str := TStringList.Create;
  try
    for i := 0 to lines do begin
      if eof(txt) then begin
        Showmessage('End of File');
        break;
      end;
      Readln(txt, s);
      str.Add(s);
    end;
    if length(str.Text) > 0 then
      memo1.Lines.Text := str.text;
  finally
    str.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  sl, el, i: Integer;
  tmp: String;
begin
  Screen.Cursor := crHourGlass;
  if cbout.Checked then
    OutLines;
  memo1.Lines.Clear;
  tmp := elines.text;
  i := pos('-', tmp);
  if i = 0 then
    GetLines(StrToInt(elines.text))
  else begin
    sl := StrToInt(Copy(tmp,0,i-1));
    el := StrToInt(Copy(tmp,i+1,length(tmp)));
    sl := sl - lastend;
    el := el - lastend;
    lastend := lastend + el;
    GetSelLines(sl,el);
  end;
  Screen.Cursor := crDefault;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if sd.Execute then begin
    memo1.Lines.SaveToFile(sd.FileName);
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  s: String;
begin
  if cbout.Checked then begin
    Screen.Cursor := crHourGlass;
    while not eof(txt) do begin
      readln(txt,s);
      writeln(outf,s);
    end;
    CloseFile(outf);
    Screen.Cursor := crDefault;
  end;
  CloseFile(txt);
end;

procedure TForm1.OutLines;
begin
  if length( memo1.Lines.Text ) > 0 then
    Writeln(outf, memo1.Lines.Text);
end;

procedure TForm1.cboutClick(Sender: TObject);
begin
  if sd.Execute then begin
    AssignFile(outf, sd.Filename);
    Rewrite(outf);
  end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  i, totallen, len, StartPos, ToEnd, FoundAt: integer;
  s: String;
begin
  Screen.Cursor := crHourGlass;
  len := StrToInt(esearch.text);
  for i := 0 to memo1.Lines.Count - 1 do begin
    s := memo1.Lines[i];
    totallen := totallen + length(s);
    if length(s) <= len then begin
      StartPos := 0;
      ToEnd := Length(memo1.lines.Text) - StartPos;
      FoundAt := Memo1.FindText(s, StartPos, ToEnd, [stMatchCase]);
      if FoundAt <> -1 then
      begin
        Memo1.SetFocus;
        memo1.SelStart := FoundAt;
        memo1.SelLength := Length(s);
      end;
      break;
      //memo1.SelStart := totallen;
    end;
  end;
  Screen.Cursor := crDefault;
end;

procedure TForm1.GetSelLines(Startl, Endl: Integer);
var
  s: String;
  i: Integer;
  str: TStringList;
begin
  str := TStringList.Create;
  try
    for i := 0 to Endl do begin
      if eof(txt) then begin
        Showmessage('End of File');
        break;
      end;
      Readln(txt, s);
      if i >= Startl then
        str.Add(s)
      else if cbout.Checked then
        Writeln(outf, s);
    end;
    if length(str.Text) > 0 then
      memo1.Lines.Text := str.text;
  finally
    str.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lastend := 0;
end;

procedure TForm1.DeleteField(Del: String; Field, NumofFields: Integer;  OutFile: String);
var
  s, t: String;
  d: char;
  fields: TStringList;
  function GetDelLine: String;
  var i: integer;
  begin
    result := '';
    for i := 0 to fields.Count - 1 do
      result := result + Fields[i] + del;
  end;
begin
  AssignFile(outf, outFile);
  Rewrite(outf);
  d := del[1];
  while not eof(txt) do begin
    Readln(txt, s);
    if assigned(fields) then
      fields.Free;
    fields := SplitStr(s,d);
    while (fields.Count < NumofFields) do begin
      t := s;
      Readln(txt, s);
      t := t + s;
      s := t;
      fields.Free;
      fields := SplitStr(s,d);
    end;
    fields[field] := '';
    s := GetDelLine;
    writeln(outf, s);
  end;
  CloseFile(outf);
  ShowMessage('Done');
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  if sd.Execute then begin
    DeleteField(edelim.Text,StrToInt(efld.text),StrToInt(etot.text),sd.Filename);
  end;
  Screen.Cursor := crDefault;
end;

end.
