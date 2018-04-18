unit winmacro;

interface

uses
  Windows, Messages;

type
  TwMsg = Longint;
  TwParam = Longint;
  TlParam = Longint;

type
  TWinVersion = record
   WinMajor : Byte;
   WinMinor : Byte;
   DosMajor : Byte;
   DosMinor : Byte;
  end;

  TcbPlaybackFinishedProc = Procedure of object {$IFDEF Win32} stdcall; {$ELSE} ; {$ENDIF}
const
  APPNAME = 'HookIt!';
  CLASSNAME ='HOOKITDIALOGCLASS';
  ID_BTN_START_RECORDING = 101;
  ID_BTN_STOP_RECORDING = 102;
  ID_BTN_PLAYBACK = 103;
  ID_BTN_DONE = IDOK;
  FILENAME = 'HOOKIT.MAC';

const
  MAXMSG = 6500;

type
  PEventMsg = ^TEventMsg;
  TMsgBuff = Array[0..MAXMSG] of TEventMsg;

var
  PlaybackFinishedProc :TcbPlaybackFinishedProc;
  PMsgBuff: ^TMsgBuff;
  TheHook: HHook;
  StartTime: Longint;
  MsgCount: Longint;
  CurrentMsg: Longint;
  ReportDelayTime: Bool;
  SysModalOn: Bool;
  cbPlaybackFinishedProc:
  TcbPlaybackFinishedProc;
  cbAppData: Longint;

function StartRecording: Integer {$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
function StopRecording(lpFileName: PChar): Longint {$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
function Playback(lpFileName: PChar; EndPlayProc: TcbPlaybackFinishedProc): Integer {$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
procedure MacroInit;

implementation

{ ***********************************************************************
}
{ function JournalRecordProc(Code:
Integer;                               }
{
   wParam: TwParam;                             }
{
   lParam: TlParam): Longint;                   }
{ Parameters: action to perform
and message data.                         }
{ Returns: zero unless code
< 0, in which case return the result          }
{          from CallNextHookEx().
                                        }
{ ***********************************************************************
}
function JournalRecordProc(Code: Integer; wParam: TwParam; lParam: TlParam): Longint
{$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
begin
  JournalRecordProc := 0;
  case Code of
    HC_ACTION: begin
      if SysModalOn then exit;
      if MsgCount > MAXMSG then exit;
     {record the message}
      PMsgBuff^[MsgCount] := PEventMsg(lParam)^;
     {set the delta time of the message}
      Dec(PMsgBuff^[MsgCount].Time,StartTime);
      Inc(MsgCount);
      exit;
    end;

    HC_SYSMODALON: begin
      SysModalOn := True;
      CallNextHookEx(TheHook, Code, wParam, lParam);
      exit;
    end;

    HC_SYSMODALOFF: begin
      SysModalOn := False;
      CallNextHookEx(TheHook,Code, wParam, lParam);
      exit;
    end;

  end;
  if code < 0 then
    JournalRecordProc := CallNextHookEx(TheHook, Code, wParam, lParam);
end;


{ ***********************************************************************
}
{ function StartRecording:
Integer;                                       }
{ Parameters: none.
                                                }
{ Returns: non zero if successful.
                                       }
{ ***********************************************************************
}
function StartRecording: Integer
{$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
begin
  StartRecording := 0;
  if pMsgBuff <> nil then exit;
  GetMem(PMsgBuff, Sizeof(TMsgBuff));
  if PMsgBuff = nil then exit;
  SysModalOn := False;
  MsgCount := 0;
  StartTime := GetTickCount;
  TheHook := SetWindowsHookEx(WH_JOURNALRECORD, JournalRecordProc, hInstance, 0);
  if TheHook <> 0 then begin
    StartRecording := 1;
    exit;
  end else begin
    FreeMem(PMsgBuff, Sizeof(TMsgBuff));
    PMsgBuff := nil;
  end;
end;


{ ***********************************************************************
}
{ function StopRecording(lpFileName:
PChar): Integer;                     }
{ Parameters: pointer to filename
to save to.                             }
{ Returns: number of records
written.                                     }
{          -1 if not recording.
                                          }
{          -2 unable to unhook.
                                          }
{ ***********************************************************************
}
function StopRecording(lpFileName: PChar): Longint
{$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
var
  TheFile: File;
begin
  if PMsgBuff = nil then begin
    StopRecording := -1;
    exit;
  end;
  if UnHookWindowsHookEx(TheHook) = False then begin
    StopRecording := -2;
    exit;
  end;
  TheHook := 0;
  if MsgCount > 0 then begin
    Assign(TheFile, lpFileName);
   {$I-}
    Rewrite(TheFile, Sizeof(TEventMsg));
   {$I+}
    if IOResult <> 0 then begin
      FreeMem(PMsgBuff, Sizeof(TMsgBuff));
      PMsgBuff := nil;
      StopRecording := 0;
      exit;
    end;
   {$I-}
    Blockwrite(TheFile, PMsgBuff^, MsgCount);
   {$I+}
    if IOResult <> 0 then begin
      FreeMem(PMsgBuff, Sizeof(TMsgBuff));
      PMsgBuff := nil;
      StopRecording := 0;
     {$I-}
      Close(TheFile);
     {$I+}
      if IOResult <> 0 then exit;
      exit;
    end;
   {$I-}
    Close(TheFile);
   {$I+}
    if IOResult <> 0 then begin
      FreeMem(PMsgBuff, Sizeof(TMsgBuff));
      PMsgBuff := nil;
      StopRecording := 0;
      exit;
    end;
  end;
  FreeMem(PMsgBuff, Sizeof(TMsgBuff));
  PMsgBuff := nil;
  StopRecording := MsgCount;
end;


{ ***********************************************************************
}
{ function JournalPlaybackProc(Code:
Integer;                             }
{
     wParam: TwParam;                           }
{
     lParam: TlParam): Longint;                 }
{ Parameters: action to perform
and message data.                         }
{ Returns:  if Code < 0,
returns the result from CallNextHookEx(),        }
{            otherwise returns
the requested time to wait to fire         }
{            the next event
or zero.                                      }
{ ***********************************************************************
}
function JournalPlaybackProc(Code: Integer; wParam: TwParam; lParam: TlParam): Longint
  {$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
var
  TimeToFire: Longint;
begin
  JournalPlaybackProc := 0;
  case Code of
    HC_SKIP: begin
     {get the next message}
      Inc(CurrentMsg);
      ReportDelayTime := True;
     {are we finished?}
      if CurrentMsg >= (MsgCount-1) then
        if TheHook <> 0 then
          if UnHookWindowsHookEx(TheHook) = True then begin
            TheHook := 0;
            FreeMem(PMsgBuff, Sizeof(TMsgBuff));
            PMsgBuff := nil;
           {callback to the application announcing we are finished}
            cbPlaybackFinishedProc;
          end;
      exit;
    end;

    HC_GETNEXT: begin
     {play the current message}
      PEventMsg(lParam)^ := PMsgBuff^[CurrentMsg];
      PEventMsg(lParam)^.Time := StartTime + PMsgBuff^[CurrentMsg].Time;
     {if first time this message has played - report the delay time}
      if ReportDelayTime then begin
        ReportDelayTime := False;
        TimeToFire := PEventMsg(lParam)^.Time - GetTickCount;
        if TimeToFire > 0 then JournalPlaybackProc := TimeToFire;
      end;
      exit;
    end;

    HC_SYSMODALON:begin
     {something is wrong}
      SysModalOn := True;
      CallNextHookEx(TheHook, Code, wParam, lParam);
      exit;
    end;

    HC_SYSMODALOFF:begin
     {we have been hosed by the system - our hook has been pulled!}
      SysModalOn := False;
      TheHook := 0;
      FreeMem(PMsgBuff, Sizeof(TMsgBuff));
      PMsgBuff := nil;
     {callback to the application announcing we are finished}
      cbPlaybackFinishedProc;
      CallNextHookEx(TheHook, Code, wParam, lParam);
      exit;
    end;

  end;
  If code < 0  then
    JournalPlaybackProc := CallNextHookEx(TheHook, Code, wParam, lParam);
end;


{ ***********************************************************************
}
{ function Playback(lpFileName:
PChar;                                    }
{                    EndPlayProc:
TcbPlaybackFinishedProc;                }
{                    AppData:
Longint): Integer;                          }
{ Parameters: pointer to filename
to play.                                }
{             application's
EndPlay callback function.                    }
{             application's
defined data.                                 }
{ Returns: non zero if successful.
                                       }
{ ***********************************************************************
}
function Playback(lpFileName: PChar; EndPlayProc: TcbPlaybackFinishedProc): Integer
{$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
var
  TheFile: File;
begin
  Playback := 0;
  If PMsgBuff <> nil then exit;
  GetMem(PMsgBuff, Sizeof(TMsgBuff));
  If PMsgBuff = nil then exit;
  Assign(TheFile, lpFileName);
 {$I-}
  Reset(TheFile, Sizeof(TEventMsg));
 {$I+}
  if IOResult <> 0 then begin
    FreeMem(PMsgBuff, Sizeof(TMsgBuff));
    PMsgBuff := nil;
    exit;
  end;
 {$I-}
  MsgCount := FileSize(TheFile);
 {$I+}
  if IOResult <> 0 then begin
    FreeMem(PMsgBuff, Sizeof(TMsgBuff));
    PMsgBuff := nil;
   {$I-}
    Close(TheFile);
   {$I+}
    if IOResult <> 0 then exit;
    exit;
  end;
  if MsgCount = 0 then begin
    FreeMem(PMsgBuff, Sizeof(TMsgBuff));
    PMsgBuff := nil;
   {$I-}
    Close(TheFile);
   {$I+}
    if IOResult <> 0 then exit;
    exit;
  end;
 {$I-}
  Blockread(TheFile, PMsgBuff^, MsgCount);
 {$I+}
  if IOResult <> 0 then begin
    FreeMem(PMsgBuff, Sizeof(TMsgBuff));
    PMsgBuff := nil;
   {$I-}
    Close(TheFile);
   {$I+}
    if IOResult <> 0 then exit;
    exit;
  end;
 {$I-}
  Close(TheFile);
 {$I+}
  if IOResult <> 0 then begin
    FreeMem(PMsgBuff, Sizeof(TMsgBuff));
    PMsgBuff := nil;
    exit;
  end;
  CurrentMsg := 0;
  ReportDelayTime := True;
  SysModalOn := False;
 {save the application's callback procedure}
  cbPlaybackFinishedProc := EndPlayProc;
 {save the application's defined data parameter}
//  cbAppData := AppData;
  StartTime := GetTickCount;
  TheHook := SetWindowsHookEx(WH_JOURNALPLAYBACK, JournalPlayBackProc, hInstance, 0);
  if TheHook = 0 then begin
    FreeMem(PMsgBuff, Sizeof(TMsgBuff));
    PMsgBuff := nil;
    exit;
  end;
  Playback := 1;
end;

//procedure PlaybackFinished(AppData: Longint) {$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
{begin
  EnableWindow(GetDlgItem(hWnd(AppData), ID_BTN_START_RECORDING), True);
  EnableWindow(GetDlgItem(hWnd(AppData), ID_BTN_STOP_RECORDING), False);
  EnableWindow(GetDlgItem(hWnd(AppData), ID_BTN_PLAYBACK), True);
  EnableWindow(GetDlgItem(hWnd(AppData), ID_BTN_DONE), True);
  SetFocus(GetDlgItem(hWnd(AppData), ID_BTN_PLAYBACK));
end;}

//function MainDlgProc(Dialog: HWnd;
//                     Msg:TwMsg;
//                     WParam:TwParam;
//                     LParam:TlParam): Bool {$IFDEF Win32} stdcall; {$ELSE} ; export; {$ENDIF}
{begin
  MainDlgProc := True;
  case Msg Of
    WM_INITDIALOG: begin
      EnableWindow(GetDlgItem(Dialog, ID_BTN_START_RECORDING), True);
      EnableWindow(GetDlgItem(Dialog, ID_BTN_STOP_RECORDING), False);
      EnableWindow(GetDlgItem(Dialog, ID_BTN_PLAYBACK), False);
      EnableWindow(GetDlgItem(Dialog, ID_BTN_DONE), True);
      exit;
    end;

    WM_COMMAND: begin
      case WParam of
        ID_BTN_START_RECORDING: begin
            EnableWindow(GetDlgItem(Dialog, ID_BTN_STOP_RECORDING), True);
            SetFocus(GetDlgItem(Dialog,     ID_BTN_STOP_RECORDING));
            EnableWindow(GetDlgItem(Dialog, ID_BTN_START_RECORDING), False);
            EnableWindow(GetDlgItem(Dialog, ID_BTN_PLAYBACK), False);
            EnableWindow(GetDlgItem(Dialog, ID_BTN_DONE), False);
            if StartRecording = 0 then begin
              EnableWindow(GetDlgItem(Dialog, ID_BTN_START_RECORDING), True);
              SetFocus(GetDlgItem(Dialog,ID_BTN_START_RECORDING));
              EnableWindow(GetDlgItem(Dialog,ID_BTN_STOP_RECORDING), False);
              EnableWindow(GetDlgItem(Dialog,ID_BTN_PLAYBACK), False);
              EnableWindow(GetDlgItem(Dialog,ID_BTN_DONE), True);
              Messagebox(Dialog, 'Unable to start recording!', APPNAME, MB_OK);
            end;
          exit;
        end;

        ID_BTN_STOP_RECORDING: begin
          if StopRecording(FILENAME) > 0 then begin
            EnableWindow(GetDlgItem(Dialog, ID_BTN_START_RECORDING), True);
            EnableWindow(GetDlgItem(Dialog, ID_BTN_PLAYBACK), True);
            SetFocus(GetDlgItem(Dialog, ID_BTN_PLAYBACK));
          end else begin
            EnableWindow(GetDlgItem(Dialog, ID_BTN_START_RECORDING), True);
            SetFocus(GetDlgItem(Dialog, ID_BTN_START_RECORDING));
            EnableWindow(GetDlgItem(Dialog, ID_BTN_PLAYBACK), False);
          end;
          EnableWindow(GetDlgItem(Dialog, ID_BTN_STOP_RECORDING), False);
          EnableWindow(GetDlgItem(Dialog, ID_BTN_DONE), True);
          exit;
        end;

        ID_BTN_PLAYBACK: begin
          EnableWindow(GetDlgItem(Dialog, ID_BTN_START_RECORDING), False);
          EnableWindow(GetDlgItem(Dialog, ID_BTN_STOP_RECORDING), False);
          EnableWindow(GetDlgItem(Dialog, ID_BTN_PLAYBACK), False);
          EnableWindow(GetDlgItem(Dialog, ID_BTN_DONE), False);
          if PlayBack(FILENAME, PlaybackFinishedProc, Dialog) = 0 then begin
            EnableWindow(GetDlgItem(Dialog, ID_BTN_START_RECORDING), True);
            EnableWindow(GetDlgItem(Dialog, ID_BTN_STOP_RECORDING), False);
            EnableWindow(GetDlgItem(Dialog, ID_BTN_PLAYBACK), True);
            EnableWindow(GetDlgItem(Dialog, ID_BTN_DONE), True);
            SetFocus(GetDlgItem(hWnd(Dialog), ID_BTN_PLAYBACK));
          end;
          exit;
        end;

        ID_BTN_DONE: begin
          EndDialog(Dialog, ID_BTN_DONE);
          exit;
        end;
}//      end; {wParam}

//    end; {WM_COMMAND}
{
    WM_CLOSE: begin
      FreeProcInstance(@PlaybackFinishedProc);
      EndDialog(Dialog, IDOK);
      exit;
    end;

  end;
  MainDlgProc := False;
end;
}

procedure MacroInit;
var
  WindowClass: TWndClass;
  WinVer: TWinVersion;
begin
  Longint(WinVer) := GetVersion;
  if ((WinVer.WinMajor < 3) OR
      ((WinVer.WinMajor = 3) AND
       (WinVer.WinMinor <  10)) ) then begin
    Messagebox(0, 'Microsoft Windows 3.10 or greater required!',
               APPNAME,
               MB_OK);
    halt;
  end;
  if FindWindow(CLASSNAME, APPNAME) <> 0 then begin
    Messagebox(0, 'Multiple Sessions not allowed',
               APPNAME,
               MB_OK);
    halt;
  end;
{  @PlaybackFinishedProc := MakeProcInstance(@PlaybackFinished, hInstance);
  If @PlaybackFinishedProc = nil then begin
    Messagebox(0, 'Cannot create instance thunk!', APPNAME, MB_OK);
    halt;
  end;}
end;

end.
