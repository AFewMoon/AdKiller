unit MyFun;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,Registry,Forms,MMSystem,ExtCtrls;

procedure setImgToControl(Control: TControl; imgName: string);

procedure getBitMapResource(saveto: TBitmap; imgName: string);

procedure PlayResSound(MusName: string);

function FindWindowWithStr(str: string): HWND;
procedure AutoRunSetting(keyname: string; IsAutoRun: Boolean;
  ProgramAdd: string);

function IsAutoRun(keyname: string): Boolean;
function GetProcessNameFromHandle(h: tHANDLE): string;
function GetHWndByPID(const hPID: tHANDLE): tHANDLE;

function GetExeFilePathByHandle(wh: tHANDLE): string;

function MyGetWindowText(h: HWND): string;

function MyGetWindowText2(h: HWND; var Text: string): Integer;

function DevicePathToWin32Path(Path: String): String;

function FindStr(Key, str: string): Boolean;

function PosExByIndex(ch: Char; s: string; index: Integer): Integer;

procedure SplitTwoStr(src: string; var s1, s2: string; delimiter: Char);


function GetProcessImageFileNameW(hProcess: tHANDLE; lpImageFileName: LPTSTR;
  nSize: DWORD): DWORD; stdcall; external 'psapi.dll';

implementation



procedure SplitTwoStr(src: string; var s1, s2: string; delimiter: Char);
Var
  F: Word;
begin
  F := POS(delimiter, src);
  if F = 0 then
  begin
    s1 := src; // 不存在分隔符时,直接把整个值给s1
    s2 := '';
  end
  else
  begin
    s1 := COPY(src, 1, F - 1);
    s2 := COPY(src, F + 1, length(src) - F);
  end;

end;

function PosExByIndex(ch: Char; s: string; index: Integer): Integer;
var
  i, count: Integer;
begin
  result := 0;
  count := 0;
  for i := 1 to length(s) do
    if (s[i] = ch) and (count < index) then
    begin
      count := count + 1;
      if count = index then
      begin
        result := i;
        Break;
      end;
    end;
end;

function FindStr(Key, str: string): Boolean;
begin
  result := POS(Key, str) <> 0;
end;

var
  DeviceDosNameList: array [0 .. 25] of string;

function DevicePathToWin32Path(Path: String): String;
{$J+}
const
  DevListInited: Integer = 0;
{$J-}
var
  Drive: Char;
  Text, pathRemain: string;
  count: Integer;
  buf, szDeviceName: array [0 .. MAX_PATH - 1] of Char;
begin
  result := '';

  if DevListInited = 0 then
  begin
    DevListInited := 1;
    for Drive := 'A' to 'Z' do
    begin
      if QueryDosDevice(PChar(Drive + ':'), buf, MAX_PATH) <> 0 then
        DeviceDosNameList[Ord(Drive) - Ord('A')] := buf
      else
        DeviceDosNameList[Ord(Drive) - Ord('A')] := '';
    end;
  end;

  count := PosExByIndex('\', Path, 3);
  if count < 0 then // 没有3个斜线
    Exit;

  pathRemain := COPY(Path, count, length(Path));
  // Result:='C:'+pathRemain;
  // exit;

  Delete(Path, count, length(Path));
  for Drive := 'A' to 'Z' do
  begin
    // if QueryDosDevice(szDeviceName, buf, MAX_PATH) <> 0 then
    begin
      if SameText(Path, DeviceDosNameList[Ord(Drive) - Ord('A')]) then
      begin
        result := Drive + ':' + pathRemain;
        Exit;
      end;
    end;
  end;
  result := '';
end;

function MyGetWindowText2(h: HWND; var Text: string): Integer;
var
  buf: Array [0 .. 255] Of Char;
begin
  result := GetWindowText(h, buf, 250);
  if result = 0 then
    Text := ''
  else
    Text := StrPas(buf);
end;

function MyGetWindowText(h: HWND): string;
var
  txtLength: Integer;
  buffer: array [0 .. 250] of Char;
begin
  txtLength := SendMessage(h, WM_GETTEXTLENGTH, 0, 0);
  if txtLength <= 0 then
  begin
    result := '';
    Exit;
  end;

  SendMessage(h, WM_GETTEXT, 250, longint(@buffer[0]));
  result := buffer;
end;

function GetExeFilePathByHandle(wh: tHANDLE): string;
var
  PID: Cardinal;
  pHandle: tHANDLE;
  buf: array [0 .. MAX_PATH] of Char;

  size: DWORD;
  CurrentProcName: PChar;

begin
  FillChar(buf, sizeof(buf), 0);
  { 先获取进程 ID }
  GetWindowThreadProcessId(wh, @PID);
  { 再获取进程句柄 }
  pHandle := OpenProcess(PROCESS_ALL_ACCESS, False, PID);
  { 获取进程路径 }

  // GetMem(CurrentProcName, 512);

  GetProcessImageFileNameW(pHandle, buf, sizeof(buf));
  CloseHandle(pHandle);
  result := DevicePathToWin32Path(buf);
end;

// 跟据ProcessId获取进程的窗口句柄
function GetHWndByPID(const hPID: tHANDLE): tHANDLE;
type
  PEnumInfo = ^TEnumInfo;

  TEnumInfo = record
    ProcessId: DWORD;
    HWND: tHANDLE;
  end;

  function EnumWindowsProc(Wnd: DWORD; var EI: TEnumInfo): BOOL; stdcall;
  var
    PID: DWORD;
  begin
    GetWindowThreadProcessId(Wnd, @PID);
    result := (PID <> EI.ProcessId) or (not IsWindowVisible(Wnd)) or
      (not IsWindowEnabled(Wnd));

    if not result then
      EI.HWND := Wnd;
  end;

  function FindMainWindow(PID: DWORD): DWORD;
  var
    EI: TEnumInfo;
  begin
    EI.ProcessId := PID;
    EI.HWND := 0;
    EnumWindows(@EnumWindowsProc, Integer(@EI));
    result := EI.HWND;
  end;

begin
  if hPID <> 0 then
    result := FindMainWindow(hPID)
  else
    result := 0;
end;

// 从主窗口里取出.传参必须是主窗口
function GetProcessNameFromHandle(h: tHANDLE): string;
var
  // dwProcessID: DWORD;
  appName: string;
begin
  // GetWindowThreadProcessId(h, dwProcessID);

  result := ExtractFileName(GetExeFilePathByHandle(h));
end;

function IsAutoRun(keyname: string): Boolean;
var
  Reg: TRegistry;
begin
  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);

    result := Reg.ReadString(keyname) <> '';
    Reg.CloseKey;
  finally
    Reg.Free;
  end;
end;

procedure AutoRunSetting(keyname: string; IsAutoRun: Boolean;
  ProgramAdd: string);
var
  Reg: TRegistry;
begin
  try
    try
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);

      if IsAutoRun then
      begin
        if Reg.ReadString(keyname) <> ProgramAdd then
          Reg.WriteString(keyname, ProgramAdd);
      end
      else if Reg.ValueExists(keyname) then
        Reg.DeleteValue(keyname);

      Reg.CloseKey;
    finally
      Reg.Free;
    end;
  except
  end;

end;

function FindWindowWithStr(str: string): HWND;
var
  hCurrentWindow: HWND;
  szText: array [0 .. 254] of Char;
  strcap: string;
begin
  result := 0;
  hCurrentWindow := GetWindow(Application.Handle, GW_HWNDFIRST);
  While hCurrentWindow <> 0 Do
  Begin
    If GetWindowText(hCurrentWindow, @szText, 255) > 0 then
    begin
      strcap := szText;
      if (POS(str, strcap) > 0) then
      begin
        result := hCurrentWindow;
        Exit;
      end;
    end;
    hCurrentWindow := GetWindow(hCurrentWindow, GW_HWNDNEXT);
  end;
end;

procedure PlayResSound(MusName: string);
var
  hResInfo, hRes: tHANDLE;
  PtrSound: PChar;
begin
  hResInfo := FindResource(HInstance, PChar(MusName), 'WAVE');
  hRes := LoadResource(HInstance, hResInfo);
  if hRes > 32 then { its   a   good   load }
  begin { lock   the   resource }
    PtrSound := LockResource(hRes);
    sndplaysound(PtrSound, snd_async or snd_Memory);
  end;
end;

procedure getBitMapResource(saveto: TBitmap; imgName: string);
begin
  saveto.LoadFromResourceName(HInstance, imgName);
end;

procedure setImgToControl(Control: TControl; imgName: string);
var
  bm: TBitmap;
begin
  bm := TBitmap.Create;
  getBitMapResource(bm, imgName);

  if Control is TImage then
    TImage(Control).Picture.Bitmap := bm;

  bm.Free;
end;


end.
