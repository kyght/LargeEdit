unit LargeEdit_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.130.1.0.1.0.1.6  $
// File generated on 10/14/2006 11:52:38 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\NSFiles\LargeEdit6\LargeEdit.tlb (1)
// LIBID: {23227099-40E3-4F85-ACC5-B339A6088F19}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\System32\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  LargeEditMajorVersion = 1;
  LargeEditMinorVersion = 0;

  LIBID_LargeEdit: TGUID = '{23227099-40E3-4F85-ACC5-B339A6088F19}';

  IID_ILargeEditor: TGUID = '{8AC95E91-48A5-4391-8D97-5D76F1249D6D}';
  CLASS_LargeEditor: TGUID = '{D9146CE3-F158-49F8-BD19-F284BC521B3B}';
  IID_ILargeFile: TGUID = '{25F7BC1B-9B92-483E-8C5A-0EB03E178086}';
  CLASS_LargeFile: TGUID = '{5DEA7248-9DA7-45DE-9E26-E3450EF13C82}';
  IID_ILEViewer: TGUID = '{E4B4D117-F6BD-4E35-85DE-64E65578C538}';
  IID_ILEAction: TGUID = '{60FA80DB-A1F2-4CAB-B96B-F050EC703D5D}';
  IID_ILEEvents: TGUID = '{15EB2042-4578-426B-B2DE-B24A144FF4BD}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ILargeEditor = interface;
  ILargeEditorDisp = dispinterface;
  ILargeFile = interface;
  ILargeFileDisp = dispinterface;
  ILEViewer = interface;
  ILEViewerDisp = dispinterface;
  ILEAction = interface;
  ILEActionDisp = dispinterface;
  ILEEvents = interface;
  ILEEventsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  LargeEditor = ILargeEditor;
  LargeFile = ILargeFile;


// *********************************************************************//
// Interface: ILargeEditor
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8AC95E91-48A5-4391-8D97-5D76F1249D6D}
// *********************************************************************//
  ILargeEditor = interface(IDispatch)
    ['{8AC95E91-48A5-4391-8D97-5D76F1249D6D}']
    procedure ShowHelp(const Helpfile: WideString; const Search: WideString); safecall;
    function Get_CaretX: Integer; safecall;
    procedure Set_CaretX(Value: Integer); safecall;
    function Get_CaretY: Integer; safecall;
    procedure Set_CaretY(Value: Integer); safecall;
    procedure ToggleProjectWin; safecall;
    procedure ResultLog(const Text: WideString); safecall;
    function Get_Files(index: Integer): LargeFile; safecall;
    function Get_FileCount: Integer; safecall;
    function Get_CurrentFile: LargeFile; safecall;
    procedure Update; safecall;
    procedure Save; safecall;
    procedure Print; safecall;
    procedure Run; safecall;
    procedure Open(const Filename: WideString); safecall;
    procedure New; safecall;
    procedure SetCurrentFile(const Filename: WideString); safecall;
    function Get_Version: WideString; safecall;
    function Get_Build: Integer; safecall;
    procedure SetHighlighter(const Name: WideString); safecall;
    procedure SpellCheck; safecall;
    procedure FTPOpen; safecall;
    procedure FTPSave; safecall;
    procedure FTPSaveAs; safecall;
    procedure RecKeys; safecall;
    procedure PlayKeys; safecall;
    procedure StopKeys; safecall;
    procedure SaveKeys(const Filename: WideString); safecall;
    procedure OpenKeys(const Filename: WideString); safecall;
    procedure PrintPreview; safecall;
    function Get_SelectedText: WideString; safecall;
    procedure Set_SelectedText(const Value: WideString); safecall;
    procedure Find(const Text: WideString); safecall;
    procedure Replace(const FindText: WideString; const ReplaceText: WideString; All: WordBool); safecall;
    procedure BlockBegin(x: Integer; y: Integer); safecall;
    procedure BlockEnd(x: Integer; y: Integer); safecall;
    procedure ShowMessage(const msg: WideString); safecall;
    function InputBox(const title: WideString; const prompt: WideString; const defvalue: WideString): WideString; safecall;
    procedure RefreshDisplay; safecall;
    function Get_WorkingDirectory: WideString; safecall;
    function ProcessStatus(const status: WideString; progress: Integer; max: Integer): WordBool; safecall;
    procedure ProcessStart(const title: WideString); safecall;
    procedure ProcessEnd; safecall;
    function MessageDialog(const msgtext: WideString; dlgtype: SYSINT): WordBool; safecall;
    procedure ViewAsGrid(const Delimiter: WideString; FirstCols: WordBool); safecall;
    function Get_Session(const PropertyName: WideString): OleVariant; safecall;
    procedure Set_Session(const PropertyName: WideString; Value: OleVariant); safecall;
    procedure CloseCurrent(savecheck: WordBool); safecall;
    property CaretX: Integer read Get_CaretX write Set_CaretX;
    property CaretY: Integer read Get_CaretY write Set_CaretY;
    property Files[index: Integer]: LargeFile read Get_Files;
    property FileCount: Integer read Get_FileCount;
    property CurrentFile: LargeFile read Get_CurrentFile;
    property Version: WideString read Get_Version;
    property Build: Integer read Get_Build;
    property SelectedText: WideString read Get_SelectedText write Set_SelectedText;
    property WorkingDirectory: WideString read Get_WorkingDirectory;
    property Session[const PropertyName: WideString]: OleVariant read Get_Session write Set_Session;
  end;

// *********************************************************************//
// DispIntf:  ILargeEditorDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8AC95E91-48A5-4391-8D97-5D76F1249D6D}
// *********************************************************************//
  ILargeEditorDisp = dispinterface
    ['{8AC95E91-48A5-4391-8D97-5D76F1249D6D}']
    procedure ShowHelp(const Helpfile: WideString; const Search: WideString); dispid 1;
    property CaretX: Integer dispid 2;
    property CaretY: Integer dispid 3;
    procedure ToggleProjectWin; dispid 4;
    procedure ResultLog(const Text: WideString); dispid 5;
    property Files[index: Integer]: LargeFile readonly dispid 6;
    property FileCount: Integer readonly dispid 7;
    property CurrentFile: LargeFile readonly dispid 8;
    procedure Update; dispid 9;
    procedure Save; dispid 10;
    procedure Print; dispid 11;
    procedure Run; dispid 12;
    procedure Open(const Filename: WideString); dispid 13;
    procedure New; dispid 14;
    procedure SetCurrentFile(const Filename: WideString); dispid 15;
    property Version: WideString readonly dispid 16;
    property Build: Integer readonly dispid 17;
    procedure SetHighlighter(const Name: WideString); dispid 18;
    procedure SpellCheck; dispid 19;
    procedure FTPOpen; dispid 20;
    procedure FTPSave; dispid 21;
    procedure FTPSaveAs; dispid 22;
    procedure RecKeys; dispid 23;
    procedure PlayKeys; dispid 24;
    procedure StopKeys; dispid 25;
    procedure SaveKeys(const Filename: WideString); dispid 26;
    procedure OpenKeys(const Filename: WideString); dispid 27;
    procedure PrintPreview; dispid 28;
    property SelectedText: WideString dispid 29;
    procedure Find(const Text: WideString); dispid 30;
    procedure Replace(const FindText: WideString; const ReplaceText: WideString; All: WordBool); dispid 31;
    procedure BlockBegin(x: Integer; y: Integer); dispid 32;
    procedure BlockEnd(x: Integer; y: Integer); dispid 33;
    procedure ShowMessage(const msg: WideString); dispid 34;
    function InputBox(const title: WideString; const prompt: WideString; const defvalue: WideString): WideString; dispid 35;
    procedure RefreshDisplay; dispid 36;
    property WorkingDirectory: WideString readonly dispid 37;
    function ProcessStatus(const status: WideString; progress: Integer; max: Integer): WordBool; dispid 38;
    procedure ProcessStart(const title: WideString); dispid 39;
    procedure ProcessEnd; dispid 40;
    function MessageDialog(const msgtext: WideString; dlgtype: SYSINT): WordBool; dispid 41;
    procedure ViewAsGrid(const Delimiter: WideString; FirstCols: WordBool); dispid 42;
    property Session[const PropertyName: WideString]: OleVariant dispid 43;
    procedure CloseCurrent(savecheck: WordBool); dispid 44;
  end;

// *********************************************************************//
// Interface: ILargeFile
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {25F7BC1B-9B92-483E-8C5A-0EB03E178086}
// *********************************************************************//
  ILargeFile = interface(IDispatch)
    ['{25F7BC1B-9B92-483E-8C5A-0EB03E178086}']
    function Get_Filename: WideString; safecall;
    function Get_IsSaved: WordBool; safecall;
    function Get_IsNewFile: WordBool; safecall;
    function Get_IsChanged: WordBool; safecall;
    function Get_IsSmall: WordBool; safecall;
    function Get_EndOfFile: WordBool; safecall;
    function Next: WordBool; safecall;
    function Last: WordBool; safecall;
    function Get_StartLine: Integer; safecall;
    function Get_TotalLine: Integer; safecall;
    function Get_IsRemoteFileOpen: WordBool; safecall;
    function Get_IsTempOpen: WordBool; safecall;
    function Get_TempFilename: WideString; safecall;
    function Get_EditMode: WordBool; safecall;
    function Line(index: Integer): WideString; safecall;
    function Get_LineCount: Integer; safecall;
    function Get_Text: WideString; safecall;
    procedure Set_Text(const Value: WideString); safecall;
    procedure AddLine(const Text: WideString); safecall;
    procedure DeleteLine(index: Integer); safecall;
    function Get_LineText(index: Integer): WideString; safecall;
    procedure Set_LineText(index: Integer; const Value: WideString); safecall;
    property Filename: WideString read Get_Filename;
    property IsSaved: WordBool read Get_IsSaved;
    property IsNewFile: WordBool read Get_IsNewFile;
    property IsChanged: WordBool read Get_IsChanged;
    property IsSmall: WordBool read Get_IsSmall;
    property EndOfFile: WordBool read Get_EndOfFile;
    property StartLine: Integer read Get_StartLine;
    property TotalLine: Integer read Get_TotalLine;
    property IsRemoteFileOpen: WordBool read Get_IsRemoteFileOpen;
    property IsTempOpen: WordBool read Get_IsTempOpen;
    property TempFilename: WideString read Get_TempFilename;
    property EditMode: WordBool read Get_EditMode;
    property LineCount: Integer read Get_LineCount;
    property Text: WideString read Get_Text write Set_Text;
    property LineText[index: Integer]: WideString read Get_LineText write Set_LineText;
  end;

// *********************************************************************//
// DispIntf:  ILargeFileDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {25F7BC1B-9B92-483E-8C5A-0EB03E178086}
// *********************************************************************//
  ILargeFileDisp = dispinterface
    ['{25F7BC1B-9B92-483E-8C5A-0EB03E178086}']
    property Filename: WideString readonly dispid 1;
    property IsSaved: WordBool readonly dispid 2;
    property IsNewFile: WordBool readonly dispid 3;
    property IsChanged: WordBool readonly dispid 4;
    property IsSmall: WordBool readonly dispid 5;
    property EndOfFile: WordBool readonly dispid 6;
    function Next: WordBool; dispid 7;
    function Last: WordBool; dispid 8;
    property StartLine: Integer readonly dispid 10;
    property TotalLine: Integer readonly dispid 11;
    property IsRemoteFileOpen: WordBool readonly dispid 12;
    property IsTempOpen: WordBool readonly dispid 13;
    property TempFilename: WideString readonly dispid 14;
    property EditMode: WordBool readonly dispid 15;
    function Line(index: Integer): WideString; dispid 17;
    property LineCount: Integer readonly dispid 9;
    property Text: WideString dispid 19;
    procedure AddLine(const Text: WideString); dispid 16;
    procedure DeleteLine(index: Integer); dispid 18;
    property LineText[index: Integer]: WideString dispid 21;
  end;

// *********************************************************************//
// Interface: ILEViewer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4B4D117-F6BD-4E35-85DE-64E65578C538}
// *********************************************************************//
  ILEViewer = interface(IDispatch)
    ['{E4B4D117-F6BD-4E35-85DE-64E65578C538}']
    procedure Init(const LEdit: ILargeEditor); safecall;
  end;

// *********************************************************************//
// DispIntf:  ILEViewerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4B4D117-F6BD-4E35-85DE-64E65578C538}
// *********************************************************************//
  ILEViewerDisp = dispinterface
    ['{E4B4D117-F6BD-4E35-85DE-64E65578C538}']
    procedure Init(const LEdit: ILargeEditor); dispid 1;
  end;

// *********************************************************************//
// Interface: ILEAction
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {60FA80DB-A1F2-4CAB-B96B-F050EC703D5D}
// *********************************************************************//
  ILEAction = interface(IDispatch)
    ['{60FA80DB-A1F2-4CAB-B96B-F050EC703D5D}']
    procedure Init(const LEdit: ILargeEditor); safecall;
    procedure OnClick(const menuname: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ILEActionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {60FA80DB-A1F2-4CAB-B96B-F050EC703D5D}
// *********************************************************************//
  ILEActionDisp = dispinterface
    ['{60FA80DB-A1F2-4CAB-B96B-F050EC703D5D}']
    procedure Init(const LEdit: ILargeEditor); dispid 1;
    procedure OnClick(const menuname: WideString); dispid 2;
  end;

// *********************************************************************//
// Interface: ILEEvents
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {15EB2042-4578-426B-B2DE-B24A144FF4BD}
// *********************************************************************//
  ILEEvents = interface(IDispatch)
    ['{15EB2042-4578-426B-B2DE-B24A144FF4BD}']
    procedure OnOpen(const lefile: LargeFile); safecall;
    procedure OnSave(const lefile: ILargeFile); safecall;
    procedure OnChange(const lefile: ILargeFile); safecall;
    procedure OnClose(const lefile: ILargeFile); safecall;
    procedure OnTabChange(const lefile: ILargeFile); safecall;
  end;

// *********************************************************************//
// DispIntf:  ILEEventsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {15EB2042-4578-426B-B2DE-B24A144FF4BD}
// *********************************************************************//
  ILEEventsDisp = dispinterface
    ['{15EB2042-4578-426B-B2DE-B24A144FF4BD}']
    procedure OnOpen(const lefile: LargeFile); dispid 1;
    procedure OnSave(const lefile: ILargeFile); dispid 2;
    procedure OnChange(const lefile: ILargeFile); dispid 3;
    procedure OnClose(const lefile: ILargeFile); dispid 4;
    procedure OnTabChange(const lefile: ILargeFile); dispid 5;
  end;

// *********************************************************************//
// The Class CoLargeEditor provides a Create and CreateRemote method to          
// create instances of the default interface ILargeEditor exposed by              
// the CoClass LargeEditor. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLargeEditor = class
    class function Create: ILargeEditor;
    class function CreateRemote(const MachineName: string): ILargeEditor;
  end;

// *********************************************************************//
// The Class CoLargeFile provides a Create and CreateRemote method to          
// create instances of the default interface ILargeFile exposed by              
// the CoClass LargeFile. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoLargeFile = class
    class function Create: ILargeFile;
    class function CreateRemote(const MachineName: string): ILargeFile;
  end;

implementation

uses ComObj;

class function CoLargeEditor.Create: ILargeEditor;
begin
  Result := CreateComObject(CLASS_LargeEditor) as ILargeEditor;
end;

class function CoLargeEditor.CreateRemote(const MachineName: string): ILargeEditor;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LargeEditor) as ILargeEditor;
end;

class function CoLargeFile.Create: ILargeFile;
begin
  Result := CreateComObject(CLASS_LargeFile) as ILargeFile;
end;

class function CoLargeFile.CreateRemote(const MachineName: string): ILargeFile;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_LargeFile) as ILargeFile;
end;

end.
