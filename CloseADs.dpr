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
  hMutex: HWND; // ������󣬷�ֹ�������ظ�ִ��(û�������е�)
  iRet: Integer;
  h: HWND;


begin

  if ParamCount = 0 then
  begin // �޲�������ʱ,�������ظ�����  (������ִ��ʱ���޲�����)

    // =========��ֹ������,������� Ԥ��������ĺ���
    hMutex := CreateMutex(nil, False, 'CloseAD');
    iRet := getLastError;
    if iRet = ERROR_ALREADY_EXISTS then
    begin
      h := FindWindow('TFrmCloseAD', nil);
      // ��ԭ���ڷŵ���ǰ
      if h <> 0 then
      begin
          ShowWindow(h, SW_RESTORE);
          SetForegroundWindow(h);
          //�ͷŻ������
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
  Application.Title := '�رչ��';
  Application.CreateForm(TFrmCloseAD, FrmCloseAD);
  Application.Run;
end.
