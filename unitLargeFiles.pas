unit unitLargeFiles;

interface

uses classes, SynEditTextBuffer, graphics, SynEdit, SynEditTypes, SynEditHighlighter,
     SynUniHighlighter;

type
  TLEFile = class;
  TDebugProc = procedure( text: string ) of object;

  TEdtMark = class
  private
    FLine: integer;
    FBookmarkNumber: integer;
    FChar: integer;
    FImageIndex: integer;
    FVisible: boolean;
  public
    property Line: integer read FLine write FLine;
    property BookmarkNumber: integer read FBookmarkNumber write FBookmarkNumber;
    property Char: integer read FChar write FChar;
    property ImageIndex: integer read FImageIndex write FImageIndex;
    property Visible: boolean read FVisible write FVisible;
  end;


  TRemoteFile = class
  private
    FRemoteFile: string;
    FHost: string;
    FUser: string;
    FRemoteDir: string;
    FPort: integer;
    FPass: string;
  public
    property Host: string read FHost write Fhost;
    property Port: integer read FPort write FPort;
    property User: string read FUser write FUser;
    property Pass: string read FPass write FPass;
    property RemoteDir: string read FRemoteDir write FRemoteDir;
    property RemoteFile: string read FRemoteFile write FRemoteFile;
  end;

  TBackBuffer = class
  private
    FBuffer: TStringList;
    FStartLine: integer;
    FEndLine: integer;
  public
    property Buffer: TStringList read FBuffer;
    property StartLine: integer read FStartLine write FStartLine;
    property EndLine: integer read FEndLine write FEndLine;
    constructor Create;
  end;

  TLEFiles = class
  private
    FOnDebug: TDebugProc;
    FList: TList;
    FTmpDir: String;
    FBackBufs: integer;
    FCRtoCRLF: boolean;
    FLFtoCRLF: boolean;
    function GetCount: integer;
    function GetLEFile(index: integer): TLEFile;
  protected
  public
    //Constructor
    constructor Create;

    //File actions
    function AddFile( filename: string; Edit: Boolean = false): TLEFile;
    function AddNew(): TLEFile;

    procedure Remove(index: integer);

    property Items[index: integer]: TLEFile read GetLEFile;
    property Count: integer read GetCount;
    property BackBuffers: integer read FBackBufs write FBackBufs;

    property TempFolder: String read FTmpDir write FTmpDir;
    property CRtoCRLF: boolean read FCRtoCRLF write FCRtoCRLF;
    property LFtoCRLF: boolean read FLFtoCRLF write FLFtoCRLF;

    //Debug stuff
    procedure DebugLog(Text: String);
    property OnDebug: TDebugProc read FOnDebug write FOnDebug;
  end;

  TLEFile = class
  private
    FColIndex: integer;
    FTmpFilename: String;
    FFilename: String;
    FTempOpen: Boolean;
    FFileOpen: Boolean;
    FSaved: Boolean;
    txt: TextFile;
    outf: TextFile;
    FOnDebug: TDebugProc;
    FEndOfFile: Boolean;
    FTotalLine: longint;
    FEditmode: Boolean;
    FCurBuffer: TStringList;
    FResvBuffer: TBackBuffer;
    FIsRemoteFileOpen: Boolean;
    FTmpDir: string;
    FNewFile: Boolean;
    FSaveFile: string;
    FIsChanged: Boolean;
    FIsSmall: Boolean;
    FRemoteFile: TRemoteFile;
    FSaveFilename: String;
    FYPos: integer;
    lastend: Integer;
    FStartLine: integer;
    FLineQuery: string;
    FLineBuffer: Longint;
    FBackBufs: integer;
    FLastBuffilled: integer;
    FCurBackBuf: integer;
    FFilledBuffers: integer;
    FLastCount: integer;
    FBBuffers: TList;
    FCaretY: integer;
    FCaretX: integer;
    FDisplayY: integer;
    FDisplayX: integer;
    FHighlight: String;
    FHLChecked: boolean;
    Fdisname: String;
    FUndoList: TSynEditUndoList;
    FRedoList: TSynEditUndoList;
    FMaxleftchar: integer;
    fIcon: TIcon;
    fIconSet: boolean;
    fimgindex: integer;
    FWordWrap: Boolean;
    FTopLine: integer;
    FHighligherOn: boolean;
    FHighlightName: String;
    FMarks: TStringList;
    FCurToolbars: TStringList;
    FBlockBegin: TBufferCoord;
    FBlockEnd: TBufferCoord;
    FHLSet: boolean;
    FHLObject: TSynCustomHighlighter;
    FHLUniObject: TSynUniSyn;
    FHLUseUni: boolean;
    FCRtoCRLF: boolean;
    FLFtoCRLF: boolean;
    svch: char;
    savedch: boolean;
    FLinksOn: boolean;
    function GetCurBufferText: String;
    procedure SetWordWrap(const Value: Boolean);
    function GetHighlightObj: TSynCustomHighlighter;
  protected
    function GetTmpFileName(Filename: String): String;
    function GetTmpPathFileName(Path, Filename: String): String;
    function GetNewTempFileName: String;
  public
    //Constructor
    constructor Create( BackBufs: integer );

    //Read File
    function GetSelLines(Startl, Endl: Integer; var outtext: String): Integer;
    function GetLines(Lines: Integer; var outtext: String): integer;
    function Next(Lines: String; WriteLines: boolean = true; ResetMemo: boolean = true): boolean; overload;
    function Next(): boolean; overload;
    function Last(): boolean;

    //Back Buffer Functions
    procedure FillBackBuffer;

    //Open Close File
    procedure OpenNew;
    procedure CloseCurFile(WriteLines: boolean = true);
    procedure CleanUpTempFile;
    function OpenCurFile(Edit: Boolean = false): boolean;
    function SaveFile(filename: string; Reopen: Boolean): boolean;
    procedure OutLines;

    //Misc
    procedure ReCalcMaxChar(linetext: string);
    procedure ReCalcMaxCharFull;
    procedure AddBookmark(mark: TSynEditMark);
    procedure ClearBookmark(mark: TSynEditMark);
    procedure SaveBookmarks(marks: TSynEditMarkList);
    procedure SetBookmarks(Editor: TSynEdit);
    procedure ClearBookmarks;

    procedure SetHighlighter(HLObject: TSynCustomHighlighter);
    procedure SetCustomHighligher( filename: string );

    //Debug Function
    procedure DebugLog(Text: String);
    property OnDebug: TDebugProc read FOnDebug write FOnDebug;

    //Properties
    property CollectionIndex: integer read FColIndex write FColIndex;

    property Filename: String read FFilename write FFilename;
    property SaveFilename: String read FSaveFilename write FSaveFilename;
    property EndOfFile: Boolean read FEndOfFile;

    property IsFileOpen: Boolean read FFileOpen;
    property IsSaved: Boolean read FSaved;
    property IsNewFile: Boolean read FNewFile;
    property IsChanged: Boolean read FIsChanged write FIsChanged;
    property IsSmall: Boolean read FIsSmall write FIsSmall;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default false;
    property MaxLeftChar: integer read FMaxleftchar write FMaxleftchar;
    property BlockBegin: TBufferCoord read FBlockBegin write FBlockBegin;
    property BlockEnd: TBufferCoord read FBlockEnd write FBlockEnd;    
    property UndoList: TSynEditUndoList read FUndoList;
    property RedoList: TSynEditUndoList read FRedoList;
    property LineQuery: string read FLineQuery write FLineQuery;
    property LineBuffer: longint read FLineBuffer write FLineBuffer;
    property BackBuffers: integer read FBackBufs write FBackBufs;
    property CRtoCRLF: boolean read FCRtoCRLF write FCRtoCRLF;
    property LFtoCRLF: boolean read FLFtoCRLF write FLFtoCRLF;

    //Nav props
    property YPos: integer read FYPos;
    property StartLine: integer read FStartLine;

    property CaretY: integer read FCaretY write FCaretY;
    property CaretX: integer read FCaretX write FCaretX;
    property DisplayX: integer read FDisplayX write FDisplayX;
    property DisplayY: integer read FDisplayY write FDisplayY;
    property TopLine: integer read FTopLine write FTopLine;

    //Temp file properties
    property TempFolder: String read FTmpDir write FTmpDir;
    property TempFilename: String read FTmpFilename write FTmpFilename;
    property IsTempOpen: Boolean read FTempOpen;

    //Remote File properties
    property IsRemoteFileOpen: Boolean read FIsRemoteFileOpen write FIsRemoteFileOpen;
    property RemoteFile: TRemoteFile read FRemoteFile;

    property Editmode: Boolean read FEditmode;
    property Buffer: TStringList read FCurBuffer;
    property BufferText: String read GetCurBufferText;

    property DisplayName: String read Fdisname write Fdisname;
    property Icon: TIcon read fIcon;
    property ImageIndex: integer read fimgindex write fimgindex;
    property IconSet: boolean read fIconSet write fIconSet default false;
    property Toolbars: TStringList read FCurToolbars;

    property TotalLine: longint read FTotalLine write FTotalLine;
    property Highlight: String read FHighlight write FHighlight;
    property HighlightName: String read FHighlightName write FHighlightName;
    property HLChecked: boolean read FHLChecked write FHLChecked;
    property HLSet: boolean read FHLSet write FHLSet default false;
    property HighligherOn: boolean read FHighligherOn write FHighligherOn;
    property LinksOn: boolean read FLinksOn write FLinksOn;

    property HighlightObject: TSynCustomHighlighter read GetHighlightObj;
  end;

implementation

uses sysutils, Dialogs, windows, controls;

{ TLEFiles }

function TLEFiles.AddFile(filename: string; Edit: Boolean = false): TLEFile;
var
  idx: integer;
begin
  idx := Flist.Add(TLEFile.Create(FBackBufs));
  TLEFile(Flist.Items[idx]).CollectionIndex := idx;
  TLEFile(Flist.Items[idx]).TempFolder := FTmpDir;
  TLEFile(Flist.Items[idx]).Filename := filename;
  TLEFile(Flist.Items[idx]).CRtoCRLF := FCRtoCRLF;
  TLEFile(Flist.Items[idx]).LFtoCRLF := FLFtoCRLF;
//  TLEFile(Flist.Items[idx]).OpenCurFile(edit);
  result := TLEFile(Flist.Items[idx]);
end;

function TLEFiles.AddNew: TLEFile;
var
  idx: integer;
begin
  idx := Flist.Add(TLEFile.Create(FBackBufs));
  TLEFile(Flist.Items[idx]).CollectionIndex := idx;
  TLEFile(Flist.Items[idx]).TempFolder := FTmpDir;
  TLEFile(Flist.Items[idx]).OpenNew;
  TLEFile(Flist.Items[idx]).CRtoCRLF := FCRtoCRLF;
  TLEFile(Flist.Items[idx]).LFtoCRLF := FLFtoCRLF;  
  result := TLEFile(Flist.Items[idx]);
end;

constructor TLEFiles.Create;
begin
  FList := TList.Create;
end;

procedure TLEFiles.DebugLog(Text: String);
begin
  //if assigned(FOnDebug) then FOnDebug(text);
end;

function TLEFiles.GetCount: integer;
begin
  result := FList.Count;
end;

function TLEFiles.GetLEFile(index: integer): TLEFile;
begin
  result := TLEFile(FList.Items[index]);
end;

procedure TLEFiles.Remove(index: integer);
begin
  FList.Delete(index);
end;

{ TLEFile }

procedure TLEFile.CloseCurFile(WriteLines: boolean);
var
  s: String;
  woutlines: boolean;
begin
  if WriteLines then woutlines := FEditmode else woutlines := WriteLines;
  DebugLog('CloseCurFile WriteLines='+BoolToStr(Writelines, true));
  if editmode and FTempOpen then begin
    if woutlines then begin
      OutLines;
      if FFileOpen then begin
        while not eof(txt) do begin
          Readln(txt,s);
          writeln(outf,s);
        end;
      end;
    end;
    CloseFile(outf);
    FTempOpen := false;
  end;
  if FFileOpen then
    CloseFile(txt);
  FFileOpen := false;
  FLastBuffilled := -1;
  FCurBackBuf := -1;
  //Commented out because Save of small files causes unwanted movement
  //memo1.Lines.Clear;
  DebugLog('CloseCurFile Finish');
end;

constructor TLEFile.Create( BackBufs: integer );
begin
  FHLChecked := false;
  savedch := false;
  FBackBufs := BackBufs;
  Fmaxleftchar := 80;
  FLastBuffilled := -1;
  FCurBackBuf := -1;
  FCaretY := 1;
  FCaretX := 1;
  FDisplayY := 1;
  FDisplayX := 1;
  FCurBuffer := TStringList.Create;
  FCurToolbars := TStringList.Create;
  FMarks := TStringList.Create;
  FResvBuffer := TBackBuffer.Create;
  FLineBuffer := 10000; //Default to 10,000 lines per buffer
  FRemoteFile := TRemoteFile.Create;
  FUndoList := TSynEditUndoList.Create;
  FRedoList := TSynEditUndoList.Create;
  FHLUniObject := TSynUniSyn.Create(nil);
  FHLUseUni := false;
  FIcon := TIcon.Create;
end;

procedure TLEFile.DebugLog(Text: String);
begin
 // if assigned(FOnDebug) then FOnDebug(text);
end;

procedure TLEFile.FillBackBuffer;
var
  i, idx: integer;
begin
  if not(assigned(FBBuffers)) then begin
    FBBuffers := TList.Create;
    for i := 0 to FBackBufs -1 do begin
      FBBuffers.Add(TBackBuffer.Create);
      end;
    end;

  if FLastBuffilled < 0 then
    FLastBuffilled := 0
  else
    FLastBuffilled := FLastBuffilled + 1;
  if FLastBuffilled >= FBackBufs then FLastBuffilled := 0;

  TBackBuffer(FBBuffers.Items[FLastBuffilled]).StartLine := FStartLine;
  TBackBuffer(FBBuffers.Items[FLastBuffilled]).EndLine := FStartLine + FCurBuffer.Count;
  TBackBuffer(FBBuffers.Items[FLastBuffilled]).Buffer.Clear;
  TBackBuffer(FBBuffers.Items[FLastBuffilled]).Buffer.Text := FCurBuffer.Text;

  if FFilledBuffers < FBackBufs then
    FFilledBuffers := FFilledBuffers + 1;
end;

function TLEFile.GetLines(Lines: Integer; var outtext: String): integer;
var
  s: string;
  ch, lsch: char;
  eline: boolean;
  i: Integer;
  str: TStringList;
begin
  DebugLog('GetLines - Lines='+IntToStr(lines));
  result := 0;
  if not self.FFileOpen then begin
    MessageDlg('You must open a file first?', mtInformation, [mbOK], 0);
    exit;
  end;
  str := TStringList.Create;
  try
    //savedch := false;
    for i := 0 to lines - 1 do begin
      if eof(txt) then begin
        //if EndofFile then
          { TODO 1 -cBasic : Check if there is a beep on other OS's }
//          UpdateStatus('End Of File'); // MessageDlg('You have reached the end of the file.', mtInformation, [mbOk], 0);
        FEndOfFile := true;
        break;
      end;
      //Readln(txt, s); // Testing using character read vs line read

      eline := false;
      if (savedch) then s := svch;
      while not(eline) do begin
        Read(txt, ch);
        if (lsch = Chr(13)) and (ch = chr(10)) then begin
          eline := true;
          svch := Chr(0);
          savedch := false;
        end
        else if (FCRtoCRLF and (lsch = Chr(13))) then begin
          //This should be a options, carrage return forces linefeed
          { TODO 2 -oDevelopment -cFileAcces : This should be a options, carrage return forces linefeed }
          eline := true;
          svch := ch;
          savedch := true;
        end
        else if (FLFtoCRLF and (lsch = Chr(10))) then begin
          //This should be a options, linefeed to line
          { TODO 2 -oDevelopment -cFileAcces : This should be a options, linefeed force line recon }
          eline := true;
          svch := ch;
          savedch := true;
        end;
        if not(eline) and (ch <> Chr(13)) and (ch <> Chr(10)) then
          s := s + ch;
        lsch := ch;
        if eof(txt) then begin
          eline := true;
          savedch := false;
          end;
      end;

      result := result + 1;
      totalline := totalline + 1;
      if fMaxLeftChar < (length(s)+10)then fMaxLeftChar := (length(s)+10);
      str.Add(s);
      s := '';
    end;
    if length(str.Text) > 0 then begin
      outtext := str.text;
      //FCurBuffer.Text := outtext;
      end;
  finally
    str.Free;
  end;
  DebugLog('GetLines - End (TotalLines='+IntToStr(totalline));
end;

function TLEFile.GetNewTempFileName: String;
var
  fn: string;
  exists: boolean;
  i: integer;
begin
  exists := true;
  i := 0;
  while exists do begin
    fn := FTmpDir + 'new' + IntToStr(i) + '.ltf';
    exists := FileExists(fn);
    i := i + 1;
  end;
  result := fn;
end;

function TLEFile.GetSelLines(Startl, Endl: Integer;
  var outtext: String): Integer;
var
  s: String;
  ch, lsch, svch: char;
  eline, savedch: boolean;  
  i: Integer;
  str: TStringList;
begin
  DebugLog('GetSelLines - StartLn='+IntToStr(Startl)+' EndLn='+IntToStr(Endl));
  result := 0;
  if not self.FFileOpen then begin
    MessageDlg('You must open a file first?', mtInformation, [mbOK], 0);
    exit;
  end;
  str := TStringList.Create;
  try
    savedch := false;
    for i := 0 to Endl - 1 do begin
      if eof(txt) then begin
        if EndofFile then
          MessageDlg('You have reached the end of the file.', mtInformation, [mbOk], 0);
        FEndOfFile := true;
        break;
      end;

      eline := false;
      if (savedch) then s := svch;
      while not(eline) do begin
        Read(txt, ch);
        if (lsch = Chr(13)) and (ch = chr(10)) then begin
          eline := true;
          svch := Chr(0);
          savedch := false;
        end
        else if (FCRtoCRLF and (lsch = Chr(13))) then begin
          eline := true;
          svch := ch;
          savedch := true;
        end
        else if (FLFtoCRLF and (lsch = Chr(10))) then begin
          //This should be a options, linefeed to line
          { TODO 2 -oDevelopment -cFileAcces : This should be a options, linefeed force line recon }
          eline := true;
          svch := ch;
          savedch := true;
        end;
        if not(eline) and (ch <> Chr(13)) and (ch <> Chr(10)) then
          s := s + ch;
        lsch := ch;
        if eof(txt) then begin
          eline := true;
          savedch := false;
          end;
      end;

      //Readln(txt, s);


      totalline := totalline + 1;
      if i >= Startl-1 then begin
        if fMaxLeftChar < (length(s)+10)then fMaxLeftChar := (length(s)+10);
        str.Add(s);
        s := '';
        result := result + 1;
        end
      else if editmode then
        Writeln(outf, s);
    end;
    if length(str.Text) > 0 then begin
      outtext := str.text;
      //FCurBuffer.Text := outtext;
      end;
  finally
    str.Free;
  end;
  DebugLog('GetSelLines - End (TotalLines='+IntToStr(totalline));
end;

function TLEFile.GetTmpFileName(Filename: String): String;
begin
  result := GetTmpPathFileName(FTmpDir, filename);
end;

function TLEFile.GetTmpPathFileName(Path, Filename: String): String;
var
  fn, newfn: string;
  i: integer;
begin
  fn := ExtractFileName(Filename);
  newfn := Path + '~' + fn;
  i := 0;
  while FileExists(newfn) do begin
    newfn := Path + '~' + IntToStr(i) + fn;
    i := i + 1;
    end;
  result := newfn;
end;

function TLEFile.Next(Lines: String; WriteLines, ResetMemo: boolean): boolean;
var
  sl, el, i, lineshowen: Integer;
  tmp, buf: string;
begin
  result := false;
  if FNewFile then exit;

  //Code to handle forward paging for back buffers
  if FLastCount > 0 then begin
    FLastCount := FLastCount -1;
    if FLastCount = 0 then begin
        FCurBuffer.Clear;
        FCurBuffer.Text := FResvBuffer.Buffer.Text;
        FStartLine := FResvBuffer.StartLine;
        result := true;
        exit;
    end;
    FCurBackBuf := FCurBackBuf +1;
    if FCurBackBuf > FBackBufs -1 then FCurBackBuf := 0;
    FCurBuffer.Clear;
    FCurBuffer.Text := TBackBuffer(FBBuffers.Items[FCurBackBuf]).Buffer.Text;
    FStartLine := TBackBuffer(FBBuffers.Items[FCurBackBuf]).StartLine;
    //FStartLine := totalline - (FLineBuffer * FLastCount);
    result := true;
    exit;
  end;

  try
    if editmode and WriteLines and not(EndOfFile) then
      OutLines;
    tmp := Lines;
    i := pos('-', tmp);
    if i = 0 then begin
      lineshowen := StrToInt(tmp);
      lineshowen := GetLines(lineshowen, buf);
      end
    else begin
      sl := StrToInt(Copy(tmp,0,i-1));
      el := StrToInt(Copy(tmp,i+1,length(tmp)));
      if FCurBuffer.Count >= el then begin
        if (sl+1) = el then
          FYpos := el
        else
          FYpos := sl;
        exit;
      end
      else begin
        if not endOfFile then begin
          if sl < totalline then begin
            if editmode then
              if MessageDlg('Your currently in edit mode and the line your searching for is back, if you continue the remainder of the file will be saved and reopened in read mode and your line will be located. Do you wish to continue?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then begin
                //memo1.Lines.text := buf;
                exit;
              end;
            CloseCurFile;
            FCurBuffer.Clear;
            if not OpenCurFile then exit;
          end;
          lineshowen := el - sl;
          lastend := totalline;
          sl := sl - lastend;
          el := el - lastend;
          lastend := lastend + el;
          lineshowen := GetSelLines(sl,el, buf);
        end //end of file
        else begin
          messageDlg('Line could not be found.', mtError, [mbOK], 0);
          exit;
          end
      end; // else
    end; // i =0
    if lineshowen > 0 then begin
      if resetmemo then begin
        if (totalline - lineshowen) > 1 then
          FillBackBuffer;
        FStartLine := totalline - lineshowen;
        FCurBuffer.Clear;
        FCurBuffer.Text := buf;
        FResvBuffer.Buffer.Clear;
        FResvBuffer.Buffer.Text := buf;
        FResvBuffer.StartLine := FStartLine;
        result := true;
        FCurBackBuf := -1;
        FLastCount := 0;
        end;
      end;
//    if ashowtools.Checked then begin
//      dTextGrid.Refresh;
//    end;
  finally

  end;
end;

function TLEFile.Last(): boolean;
var
  cnt: integer;
begin
  if FLastCount >= FFilledBuffers then begin
    result := false;
    exit;
    end;

  if FCurBackBuf < 0 then
    FCurBackBuf := FLastBuffilled
  else begin
    FCurBackBuf := FCurBackBuf -1;
    if FCurBackBuf < 0 then FCurBackBuf := FBackBufs -1;
    end;

  cnt := FCurBuffer.Count;
  FCurBuffer.Clear;
  FCurBuffer.Text := TBackBuffer(FBBuffers.Items[FCurBackBuf]).Buffer.Text;
  FStartLine := TBackBuffer(FBBuffers.Items[FCurBackBuf]).StartLine;

  FLastCount := FLastCount + 1;
  result := true;
end;

function TLEFile.Next: boolean;
begin
  result := Next(IntToStr(FLineBuffer));
end;

function TLEFile.OpenCurFile(Edit: Boolean): boolean;
var
  msg: array of Char;
  smsg: String;
  msize, i: integer;
begin
  FLastBuffilled := -1;
  FCurBackBuf := -1;
  FIsRemoteFileOpen := false;
  DebugLog('OpenCurFile Edit='+BoolToStr(Edit, true));
  if FFileOpen then CloseFile(txt);
  if FileExists(FFilename) then begin
    AssignFile(txt, FFilename);
    {$I-}
    FileMode := fmOpenReadWrite + fmShareDenyNone; //fmOpenRead + fmShareCompat;
    Reset(txt);
    FileMode := fmOpenReadWrite;
    {$I+}
    if IOResult <> 0 then begin
      result := false;
      FFilename := '';
      msize := 255;
      SetLength(msg, msize);
      FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM,
                    nil,
                    GetLastError,
                    0,
                    PChar(msg),
                    msize,
                    nil);
      for i := 0 to msize do begin
        if msg[i] = #0 then break;
        smsg := smsg + msg[i];
      end;
      MessageDlg(smsg, mtError, [mbOK], 0);
      SetLength(msg, 0);
      OpenNew;
      exit;
    end;
    FileMode := fmOpenReadWrite;
    FEndOfFile := eof(txt);
    FFileOpen := true;
    FSaveFilename := FFilename;
  end;
  totalline := 0;
  if Edit then begin
    FTmpFilename := GetTmpFileName(FFilename);
    if FTempOpen then CloseFile(outf);
    AssignFile(outf, FTmpFilename);
    Rewrite(outf);
    FTempOpen := true;
  end;
  Feditmode := Edit;
  if (editmode) and (not(FNewFile)) then begin FSaveFile := FFilename; FSaved := true; end;
  FIsChanged := false;
  DebugLog('OpenCurFile Finish');
  result := true;
end;

procedure TLEFile.OpenNew;
begin
  DebugLog('OpenNew Start');
  FFilename := ''; //GetNewTempFileName;
  FEditmode := true;
  FNewFile := true;
  FSaveFile := '';
  FSaved := false;
  FIsSmall := true;
  FCurBuffer.Clear;
  FLastBuffilled := -1;
  FCurBackBuf := -1;  
  //**********************
  //if not OpenCurFile(true) then exit;
  FFileOpen := false;
  Fischanged := false;
  DebugLog('OpenNew Finish');
end;

procedure TLEFile.OutLines;
var
  txt: String;
begin
  DebugLog('Output Lines='+IntToStr(FCurBuffer.Count));
  if length( FCurBuffer.Text ) > 0 then begin
    txt := FCurBuffer.Text;
    txt := Copy(txt , 1, length(txt)-2);
    Writeln(outf, txt);
  end;
end;

function TLEFile.SaveFile(filename: string; Reopen: Boolean): boolean;
begin
  if (FNewFile) then begin
    FCurBuffer.SaveToFile(filename);
  end
  else begin
    CloseCurFile;
    CopyFile(PChar(FTmpFilename), PChar(filename), false);
    DeleteFile(pChar(FTmpFilename));
  end;
  FSaved := true;
  FisChanged := false;
  FSaveFilename := filename;
  FFilename := filename;
  FNewFile := false;
  FEndOfFile := false;
  if Reopen then begin
    if not OpenCurFile(true) then exit;
    next(IntToStr(FLineBuffer), false, not IsSmall);
    end
  else
    FCurBuffer.Clear;
  result := true;
end;

function TLEFile.GetCurBufferText: String;
begin
  result := FCurBuffer.Text;
end;

procedure TLEFile.CleanUpTempFile;
begin
  try
    if not FTempOpen then
      if fileexists(FTmpFilename) then
        DeleteFile(PChar(FTmpFilename));
    DebugLog('Delete Temp File '+FTmpFilename);
  except
    //On Error do nothing
  end
end;

procedure TLEFile.ReCalcMaxChar(linetext: string);
var
  s: string;
begin
  s := linetext;
  if fMaxLeftChar < (length(s)+15)then fMaxLeftChar := (length(s)+15);
end;

procedure TLEFile.SetWordWrap(const Value: Boolean);
begin
  FWordWrap := Value;
end;

procedure TLEFile.ReCalcMaxCharFull;
var
  i: integer;
begin
  for i := 0 to FCurBuffer.Count -1 do
    ReCalcMaxChar(FCurBuffer[i]);
end;

procedure TLEFile.SaveBookmarks(marks: TSynEditMarkList);
var
  i, j: integer;
  mk: TEdtMark;
begin
  //SaveMarks
  for i := 0 to marks.Count -1 do begin
    for j := 0 to FMarks.Count - 1 do begin
      mk := TEdtMark(FMarks.Objects[j]);
      if (mk.BookmarkNumber = marks.Items[i].BookmarkNumber) then begin
        mk.Line := marks.Items[i].Line;
        mk.Char := marks.Items[i].Char;
        mk.ImageIndex := marks.Items[i].ImageIndex;
        mk.Visible := marks.Items[i].Visible;
        break; //Break second loop because found
      end;
    end;
  end;
end;

procedure TLEFile.SetBookmarks(Editor: TSynEdit);
var
  i, idx: integer;
  mk: TEdtMark;
  synmark: TSynEditMark;
begin
  //SetMarks
  editor.Marks.Clear; //Clear Marks from editor for this file
  for i := 0 to FMarks.Count -1 do begin
    mk := TEdtMark(FMarks.Objects[i]);
    synmark := TSynEditMark.Create(editor);
    synmark.Line := mk.Line;
    synmark.Char := mk.Char;
    synmark.ImageIndex := mk.ImageIndex;
    synmark.BookmarkNumber := mk.BookmarkNumber;
    synmark.Visible := mk.Visible;
    synmark.InternalImage := false;
    editor.Marks.Add(synmark);
  end
end;

procedure TLEFile.ClearBookmarks;
var
  i: integer;
begin
  for i := 0 to FMarks.Count -1 do begin
   FMarks.Objects[i].Free;
  end;
  FMarks.Clear;
end;

procedure TLEFile.AddBookmark(mark: TSynEditMark);
var
  mk: TEdtMark;
begin
    if FMarks.IndexOf(IntToStr(mark.BookmarkNumber)) > 0 then exit; //Already Saved
    mk := TEdtMark.Create;
    mk.Line := mark.Line;
    mk.Char := mark.Char;
    mk.ImageIndex := mark.ImageIndex;
    mk.BookmarkNumber := mark.BookmarkNumber;
    mk.Visible := mark.Visible;
    FMarks.AddObject(IntToStr(mk.BookmarkNumber), mk);
end;

procedure TLEFile.ClearBookmark(mark: TSynEditMark);
var
  i, didx: integer;
  mk: TEdtMark;
begin
  didx := -1;
  for i := 0 to FMarks.Count - 1 do begin
    mk := TEdtMark(FMarks.Objects[i]);
    if (mk.BookmarkNumber = mark.BookmarkNumber) then begin
      didx := i;
      break;
    end;
  end;
  if didx >= 0 then begin
    FMarks.Objects[didx].Free;
    FMarks.Delete(didx);
  end
end;


function TLEFile.GetHighlightObj: TSynCustomHighlighter;
begin
  if FHLUseUni then
    result := FHLUniObject
  else
    result := FHLObject;
end;

procedure TLEFile.SetCustomHighligher(filename: string);
begin
  FHLUseUni := true;
  FHLUniObject.Clear;
  FHLUniObject.LoadFromFile(filename);
end;

procedure TLEFile.SetHighlighter(HLObject: TSynCustomHighlighter);
begin
  FHLUseUni := false;
  FHLObject := HLObject
end;

{ TBackBuffer }

constructor TBackBuffer.Create;
begin
  FBuffer := TStringList.Create;
end;

end.
