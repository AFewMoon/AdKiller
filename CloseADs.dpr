program CloseADs;

{$IF CompilerVersion >= 21.0}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}
{$IFEND}


uses
  Forms,
  Windows,
  untMain in 'untMain.pas' {FrmCloseAD},
  MyFun in 'MyFun.pas';

{$R *.res}

{$R res\res_common.res}


var
  hMutex: HWND; // 互斥对象，防止主程序重复执行(没有命令行的)
  iRet: Integer;
  h: HWND;


begin

  if ParamCount = 0 then
  begin // 无参数运行时,不允许重复运行  (主程序执行时是无参数的)

    // =========防止重运行,必须放在 预处理参数的后面
    hMutex := CreateMutex(nil, False, 'CloseAD');
    iRet := getLastError;
    if iRet = ERROR_ALREADY_EXISTS then
    begin
      h := FindWindow('TFrmCloseAD', nil);
      // 把原窗口放到最前
      if h <> 0 then
      begin
          ShowWindow(h, SW_RESTORE);
          SetForegroundWindow(h);
          //释放互斥对象
          ReleaseMutex(hMutex);
          Application.Terminate;
          exit;
      end;

      ReleaseMutex(hMutex);
      Exit;
    end;
  end;


  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := '关闭广告';
  Application.CreateForm(TFrmCloseAD, FrmCloseAD);
  Application.Run;
end.
