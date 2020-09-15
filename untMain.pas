unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, RzTray, Menus, MMSystem, PngSpeedButton, ImgList,
  Buttons,MyFun;

type
  TFrmCloseAD = class(TForm)
    mmoList: TMemo;
    tmrCheck: TTimer;
    lbl1: TLabel;
    chkAutoRun: TCheckBox;
    rztrycn1: TRzTrayIcon;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    mniN3: TMenuItem;
    pnl1: TPanel;
    imgFocus: TImage;
    tmrFocus: TTimer;
    lbl2: TLabel;
    edtNewKeyword: TEdit;
    btnAddNew: TButton;
    bvl1: TBevel;
    btnExpand: TSpeedButton;
    il1: TImageList;
    chkWinSize: TCheckBox;
    lblWinSize: TLabel;
    lbl3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrCheckTimer(Sender: TObject);
    procedure rztrycn1LButtonDown(Sender: TObject);
    procedure chkAutoRunClick(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure tmrFocusTimer(Sender: TObject);
    procedure imgFocusMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgFocusMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddNewClick(Sender: TObject);
    procedure btnExpandClick(Sender: TObject);
    procedure mmoListMouseEnter(Sender: TObject);
    procedure mmoListMouseLeave(Sender: TObject);
  private
    FExpanded: Boolean;
    FCursorInMemo: Boolean;
    procedure WNDPROC(var message: Tmessage); override;
    procedure GetMousePosHwndAndClassName(Sender: TPoint);
    { Private declarations }
  public
    { Public declarations }
  end;

const
  FILENAME_INFO = 'list.txt';

  PROG_NAME = 'ADKILLER';

  EXPAND_HEIGHT = 333;
  NORMAL_HEIGHT = 231;

var
  FrmCloseAD: TFrmCloseAD;


implementation


{$R *.dfm}


procedure TFrmCloseAD.btnAddNewClick(Sender: TObject);
var
  str: string;
begin
  str := edtNewKeyword.Text;
  if (str = '') then
  begin
    ShowMessage('���ݲ���Ϊ��!');
    Exit;
  end;

  if (str = '��ʼ') then
  begin
    ShowMessage('���,��ӿ�ʼ�˵��ᵼ�²��ϵ����ػ����ڵ�,������!');
    Exit;
  end;

  if (mmoList.Lines.IndexOf(str) = -1) then
  begin
    if chkWinSize.Checked then
    str := str + '|' + lblWinSize.Caption;

    mmoList.Lines.Add(str);
  end;

end;

procedure TFrmCloseAD.btnExpandClick(Sender: TObject);
var
  bm: TBitmap;
begin

  bm := TBitmap.Create;

  if not FExpanded then
    il1.GetBitmap(1, bm)
  else
    il1.GetBitmap(0, bm);

  btnExpand.Glyph.Assign(bm);
  bm.Free;

  if not FExpanded then
    self.Height := EXPAND_HEIGHT
  else
    self.Height := NORMAL_HEIGHT;

  FExpanded := not FExpanded;
end;

procedure TFrmCloseAD.chkAutoRunClick(Sender: TObject);
begin
  AutoRunSetting(PROG_NAME, chkAutoRun.Checked, Application.ExeName);
end;

procedure TFrmCloseAD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mmoList.Lines.SaveToFile(FILENAME_INFO);
end;

procedure TFrmCloseAD.FormCreate(Sender: TObject);
begin

  FExpanded := False;
  FCursorInMemo := False;

  self.Height := NORMAL_HEIGHT;

  chkAutoRun.Checked := IsAutoRun(PROG_NAME);

  AutoRunSetting('closeads', True, Application.ExeName);

  if FileExists(FILENAME_INFO) then
    mmoList.Lines.LoadFromFile(FILENAME_INFO)
  else
  begin
    ShowMessage('������к���Զ���С���� ϵͳ���� ����!');
  end;

  tmrCheck.Enabled := True;

  Application.ShowMainForm := False;

  setImgToControl(imgFocus, 'ImgDrag_Focus');
end;

procedure TFrmCloseAD.GetMousePosHwndAndClassName(Sender: TPoint);
// �Զ�����̵�ʵ�ֲ���
var
  mainHwnd, HWND, PID: tHANDLE;
  aName: array [0 .. 255] of Char;
  t1, title, location: string;
  r: TRect;

  ww, hh: Integer;
begin
  HWND := WindowFromPoint(Sender); // windowfrompoint ��ô���ָ����ľ��
  // flashwindow(HWND, true);
  GetWindowThreadProcessId(HWND, @PID);
  mainHwnd := GetHWndByPID(PID);
  t1 := MyGetWindowText(HWND);

  if (mainHwnd = self.Handle) then
    Exit;

  GetWindowRect(mainHwnd, r);
  ww := r.Right - r.Left;
  hh := r.Bottom - r.Top;
  lblWinSize.Caption := IntToStr(ww) + '*' + IntToStr(hh);

  title := MyGetWindowText(mainHwnd);
  if title = '' then
    MyGetWindowText2(mainHwnd, title);

  if title = '' then
    title := t1;

  // mmo1.Lines.Add(title+ ' '+ lblWinSize.Caption +' '+inttostr(mainHwnd)+' '+inttostr(HWND)+' '+t1);

  edtNewKeyword.Text := title;
end;

procedure TFrmCloseAD.imgFocusMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (tmrFocus.Enabled) then
    Exit;

  tmrFocus.Enabled := True;
  SetSystemCursor(LoadCursor(HInstance, 'CurFocus'), ocr_normal); // ���������״

  setImgToControl(imgFocus, 'ImgDrag_Empty');

  // self.Visible:=false;
  // װ��ͼ��
end;

procedure TFrmCloseAD.imgFocusMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  self.Visible := True;

  PlayResSound('MusSelectTarget');

  tmrFocusTimer(nil); // ��ȡһ��

  SystemParametersinfo(SPI_SETCURSORS, 0, nil, SPIF_SENDCHANGE); // ����ϵͳ�������״ΪĬ��
  tmrFocus.Enabled := False;

  setImgToControl(imgFocus, 'ImgDrag_Focus');
  Application.ShowMainForm := True;
end;

procedure TFrmCloseAD.mmoListMouseEnter(Sender: TObject);
begin
  FCursorInMemo := True;
end;

procedure TFrmCloseAD.mmoListMouseLeave(Sender: TObject);
begin
  FCursorInMemo := False;
end;

procedure TFrmCloseAD.mniN1Click(Sender: TObject);
begin
  rztrycn1LButtonDown(nil);
end;

procedure TFrmCloseAD.mniN3Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCloseAD.WNDPROC(var message: Tmessage);
begin
  if (message.msg = WM_SYSCOMMAND) then
  begin
    if (message.WParam = SC_CLOSE) then
    begin
      message.WParam := SC_MINIMIZE;

      inherited;
      ShowWindow(Application.Handle, SW_HIDE);
    end;
  end;

  inherited WNDPROC(message);
end;

procedure TFrmCloseAD.rztrycn1LButtonDown(Sender: TObject);
begin
  Application.ShowMainForm := True;
  self.WindowState := wsNormal;
  SetForegroundWindow(self.Handle);
  self.Show;
end;

procedure CloseTencentAD();
const
  AD_WIDTH = 262;
  AD_HEIGHT = 182;

var
  hCurrentWindow: HWND;
  szText: array [0 .. 254] of Char;
  strcap: string;
  r: TRect;
begin
  hCurrentWindow := GetWindow(Application.Handle, GW_HWNDFIRST);
  While hCurrentWindow <> 0 Do
  Begin
    If GetWindowRect(hCurrentWindow, r) then
    begin
      If (r.Right - r.Left = AD_WIDTH) and (r.Bottom - r.Top = AD_HEIGHT) then
      begin
        PostMessage(hCurrentWindow, WM_CLOSE, 0, 0);
        Exit;
      end;
    end;
    hCurrentWindow := GetWindow(hCurrentWindow, GW_HWNDNEXT);
  end;
end;

function WinSizeMatch(h: HWND; strSize: string): Boolean;
var
  r: TRect;
  hh, ww: Integer;
  ipos: Integer;
begin
  result := False;

  if not FindStr('*', strSize) then
    Exit;

  try
    ipos := POS('*', strSize);
    ww := StrToInt(COPY(strSize, 1, ipos - 1));
    hh := StrToInt(COPY(strSize, ipos + 1, length(strSize) - ipos));

    GetWindowRect(h, r);

    result := (r.Right - r.Left = ww) and (r.Bottom - r.Top = hh);
  except
    result := False;
  end;
end;

procedure TFrmCloseAD.tmrCheckTimer(Sender: TObject);
var
  i: Integer;
  h, hbutton: HWND;
  sSize, sKeyword: string;
begin
  // �û��޸�ʱ���ж�
  // getcur
  if (GetForegroundWindow = self.Handle) and (FCursorInMemo) then
    Exit;

  CloseTencentAD();

  for i := 0 to mmoList.Lines.count - 1 do
    if (mmoList.Lines[i] <> '') then
    begin
      sKeyword := '';
      sSize := '';
      SplitTwoStr(Trim(mmoList.Lines[i]), sKeyword, sSize, '|');
      h := FindWindowWithStr(sKeyword);
      if (h <> 0) and (h <> self.Handle) then
      begin
        if (sSize <> '') and (not WinSizeMatch(h, sSize)) then
          Continue;

        SendMessage(h, WM_CLOSE, 0, 0);
      end;

    end;

    //�ر�delphi2010�ĸ��´���
  h := FindWindow('TPoolTemplate',
    'Embarcadero RAD Studio 2010 - InstallAware Wizard');
  if h <> 0 then
  begin
    hbutton := FindWindowEx(h, 0, nil, 'Cancel');
    SendMessage(hbutton, WM_LBUTTONDOWN, 0, 0);
    PostMessage(hbutton, WM_LBUTTONUP, 0, 0);

    Sleep(500);

    h := FindWindow('#32770',
      'Embarcadero RAD Studio 2010 - InstallAware Wizard');
    if h <> 0 then
    begin
      hbutton := FindWindowEx(h, 0, nil, '&Yes');
      SendMessage(hbutton, WM_LBUTTONDOWN, 0, 0);
      PostMessage(hbutton, WM_LBUTTONUP, 0, 0);
    end;

  end;

  //�ر�TOM
  h := FindWindow('TBrowserBaseForm', 'TOM-Skype (TM)');
  if h <> 0 then
  begin
    PostMessage(h, WM_CLOSE, 0, 0);
  end;

end;

procedure TFrmCloseAD.tmrFocusTimer(Sender: TObject);
var
  rPos: TPoint;
begin
  if Boolean(GetCursorPos(rPos)) then // getcursorPos �ú�����ȡ����λ�ã�����Ļ�����ʾ��
    GetMousePosHwndAndClassName(rPos); // �����Զ�����̣�
end;

end.
