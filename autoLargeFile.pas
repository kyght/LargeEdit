unit autoLargeFile;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, LargeEdit_TLB, StdVcl, unitLargeFiles, fLargePad;

type
  TLargeFile = class(TAutoObject, ILargeFile)
  private
    FLFile: TLEFile;
    FLEditor: TfLEdit;
  protected
    function Get_Filename: WideString; safecall;
    function Get_EndOfFile: WordBool; safecall;
    function Get_IsChanged: WordBool; safecall;
    function Get_IsNewFile: WordBool; safecall;
    function Get_IsSaved: WordBool; safecall;
    function Get_IsSmall: WordBool; safecall;
    function Last: WordBool; safecall;
    function Next: WordBool; safecall;
    function Get_StartLine: Integer; safecall;
    function Get_EditMode: WordBool; safecall;
    function Get_IsRemoteFileOpen: WordBool; safecall;
    function Get_IsTempOpen: WordBool; safecall;
    function Get_TempFilename: WideString; safecall;
    function Get_TotalLine: Integer; safecall;
    function Get_Text: WideString; safecall;
    function Line(index: Integer): WideString; safecall;
    function Get_LineCount: Integer; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    function Get_LineText(index: Integer): WideString; safecall;
    procedure AddLine(const Text: WideString); safecall;
    procedure DeleteLine(index: Integer); safecall;
    procedure Set_LineText(index: Integer; const Value: WideString); safecall;
    { Protected declarations }
  public
    property LargeFile: TLEFile read FLFile write FLFile;
    property LargeEditor: TfLEdit read FLEditor write FLEditor;
  end;

implementation

uses ComServ;

function TLargeFile.Get_Filename: WideString;
begin
  result := LargeFile.Filename;
end;

function TLargeFile.Get_EndOfFile: WordBool;
begin
  result := LargeFile.EndOfFile;
end;

function TLargeFile.Get_IsChanged: WordBool;
begin
  result := LargeFile.IsChanged;
end;

function TLargeFile.Get_IsNewFile: WordBool;
begin
  result := LargeFile.IsNewFile;
end;

function TLargeFile.Get_IsSaved: WordBool;
begin
  result := LargeFile.IsSaved;
end;

function TLargeFile.Get_IsSmall: WordBool;
begin
  result := LargeFile.IsSmall;
end;

function TLargeFile.Last: WordBool;
begin
  result := LargeFile.Last;
end;

function TLargeFile.Next: WordBool;
begin
  result := LargeFile.Next;
end;

function TLargeFile.Get_StartLine: Integer;
begin
  result := LargeFile.StartLine;
end;

function TLargeFile.Get_EditMode: WordBool;
begin
  result := LargeFile.Editmode;
end;

function TLargeFile.Get_IsRemoteFileOpen: WordBool;
begin
  result := LargeFile.IsRemoteFileOpen;
end;

function TLargeFile.Get_IsTempOpen: WordBool;
begin
  result := LargeFile.IsTempOpen;
end;

function TLargeFile.Get_TempFilename: WideString;
begin
  result := LargeFile.TempFilename;
end;

function TLargeFile.Get_TotalLine: Integer;
begin
  result := LargeFile.TotalLine;
end;

function TLargeFile.Get_Text: WideString;
begin
  result := LargeFile.BufferText;
end;

function TLargeFile.Line(index: Integer): WideString;
begin
  if (index >= 0) and (index < LargeFile.Buffer.Count) then
    result := LargeFile.Buffer.Strings[index];
end;

function TLargeFile.Get_LineCount: Integer;
begin
  result := LargeFile.Buffer.Count;
end;

procedure TLargeFile.Set_Text(const Value: WideString);
begin
  LargeFile.Buffer.Text := value;
  LargeEditor.SetCurrentMemo;
end;

function TLargeFile.Get_LineText(index: Integer): WideString;
begin

end;

procedure TLargeFile.AddLine(const Text: WideString);
begin

end;

procedure TLargeFile.DeleteLine(index: Integer);
begin

end;

procedure TLargeFile.Set_LineText(index: Integer; const Value: WideString);
begin

end;

initialization
  TAutoObjectFactory.Create(ComServer, TLargeFile, Class_LargeFile,
    ciMultiInstance, tmApartment);
end.
