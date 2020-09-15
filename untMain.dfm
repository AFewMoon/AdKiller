object FrmCloseAD: TFrmCloseAD
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20851#38381#24191#21578'  - By '#30693#20046' '#24278#23567#27874' '#27714#36190#21704'!'
  ClientHeight = 312
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 11
    Top = 10
    Width = 324
    Height = 13
    Caption = #20219#20309#31383#21475#26631#39064#21253#21547#20197#19979#20851#38190#35789#23558#34987#33258#21160#23631#34109'(|'#21518#30340#26159#31383#21475#22823#23567')'
  end
  object lbl2: TLabel
    Left = 17
    Top = 225
    Width = 259
    Height = 13
    Caption = #25302#21160#21491#20391#22270#26631#21040#30456#24212#30340#24191#21578#31383#21475','#21487#33258#21160#33719#21462#26631#39064' '
  end
  object bvl1: TBevel
    Left = 8
    Top = 202
    Width = 348
    Height = 15
    Shape = bsBottomLine
  end
  object btnExpand: TSpeedButton
    Left = 278
    Top = 173
    Width = 73
    Height = 25
    Caption = #28155#21152
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57
      8B5A508453FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF548E59488F4D458C4A49804DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFCFA55955A51995779
      C07E76BF7C468D4B427B45F9FBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF76B07C438F4A65AD6C7DC2827AC1804B92502D71325E9061FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5E7D74E9A5581
      C5877EC385317A36FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF45954C85C78C82C68936823DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A9E538A
      CA9187C98E3C8A43FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF50A6598ECC958BCB9342924AFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF56AD5F93
      CF9A90CE98489A50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF5BB46596D29F94D09C4EA257FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FBB6A9A
      D4A398D3A153AA5DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF63C06F9ED6A79CD4A559B263FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF66C572A2
      D8ABA0D7A95DB868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF68C77467C67365C27062BE6DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = btnExpandClick
  end
  object lblWinSize: TLabel
    Left = 67
    Top = 290
    Width = 3
    Height = 13
  end
  object lbl3: TLabel
    Left = 17
    Top = 247
    Width = 28
    Height = 13
    Caption = #26631#39064':'
  end
  object mmoList: TMemo
    Left = 8
    Top = 35
    Width = 345
    Height = 134
    Lines.Strings = (
      #33150#35759#32593#26032#38395
      #33150#35759#22823#31908#32593#26032#38395
      'QQ'#32593#36141
      #37239#25105#20170#26085#30475#28857'|678*486')
    ScrollBars = ssBoth
    TabOrder = 0
    OnMouseEnter = mmoListMouseEnter
    OnMouseLeave = mmoListMouseLeave
  end
  object chkAutoRun: TCheckBox
    Left = 8
    Top = 176
    Width = 177
    Height = 17
    Caption = #24320#26426#33258#21160#21551#21160#24182#38544#34255#21040#25176#30424
    TabOrder = 1
    OnClick = chkAutoRunClick
  end
  object pnl1: TPanel
    Left = 285
    Top = 225
    Width = 68
    Height = 63
    TabOrder = 2
    object imgFocus: TImage
      Left = 18
      Top = 15
      Width = 32
      Height = 32
      Hint = #25302#21160#35813#22270#26631#36873#25321#30446#26631#31383#21475
      Center = True
      ParentShowHint = False
      ShowHint = True
      OnMouseDown = imgFocusMouseDown
      OnMouseUp = imgFocusMouseUp
    end
  end
  object edtNewKeyword: TEdit
    Left = 51
    Top = 244
    Width = 157
    Height = 21
    TabOrder = 3
  end
  object btnAddNew: TButton
    Left = 214
    Top = 244
    Width = 57
    Height = 25
    Caption = #28155#21152
    TabOrder = 4
    OnClick = btnAddNewClick
  end
  object chkWinSize: TCheckBox
    Left = 51
    Top = 269
    Width = 174
    Height = 17
    Caption = #21516#26102#21305#37197#31383#21475#22823#23567','#36991#20813#35823#21028
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object tmrCheck: TTimer
    Enabled = False
    Interval = 100
    OnTimer = tmrCheckTimer
    Left = 240
    Top = 100
  end
  object rztrycn1: TRzTrayIcon
    PopupMenu = pm1
    OnLButtonDown = rztrycn1LButtonDown
    Left = 176
    Top = 106
  end
  object pm1: TPopupMenu
    Left = 240
    Top = 48
    object mniN1: TMenuItem
      Caption = #26174#31034
      OnClick = mniN1Click
    end
    object mniN2: TMenuItem
      Caption = '-'
    end
    object mniN3: TMenuItem
      Caption = #36864#20986
      OnClick = mniN3Click
    end
  end
  object tmrFocus: TTimer
    Enabled = False
    Interval = 300
    OnTimer = tmrFocusTimer
    Left = 272
    Top = 48
  end
  object il1: TImageList
    BkColor = clFuchsia
    Left = 312
    Top = 104
    Bitmap = {
      494C010102000800300010001000FF00FF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00578B5A0050845300FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00286E2D0025692900216425001E602200FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00548E5900488F4D00458C4A0049804D00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF002D75330074BD7A0072BD780022652600FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FAFCFA0055955A005199570079C07E0076BF7C00468D4B00427B4500F9FB
      F900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00337D390079C07E0076BF7C00266B2B00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF0076B07C00438F4A0065AD6C007DC282007AC180004B9250002D7132005E90
      6100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0039853F007DC282007AC180002B723000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00D5E7D7004E9A550081C587007EC38500317A3600FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF003F8D460081C587007EC38500317A3600FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0045954C0085C78C0082C6890036823D00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0045954C0085C78C0082C6890036823D00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF004A9E53008ACA910087C98E003C8A4300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF004A9E53008ACA910087C98E003C8A4300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0050A659008ECC95008BCB930042924A00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0050A659008ECC95008BCB930042924A00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0056AD5F0093CF9A0090CE9800489A5000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0056AD5F0093CF9A0090CE9800489A5000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF005BB4650096D29F0094D09C004EA25700FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF005BB4650096D29F0094D09C005DAC6500D7E9D900FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF005FBB6A009AD4A30098D3A10053AA5D00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF008ED3960066C1720079C683009AD4A30098D3A1007DC3860054A65D007CB9
      8200FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0063C06F009ED6A7009CD4A50059B26300FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FBFDFB007BCC85007CCA87009ED6A7009CD4A50073C07D006EB87500FAFC
      FB00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0066C57200A2D8AB00A0D7A9005DB86800FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0081CF8B007ECA88007BC885007BC58400FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0068C7740067C6730065C2700062BE6D00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0087D2900088D09100FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FE7FFC3F00000000
      FC3FFC3F00000000F00FFC3F00000000F00FFC3F00000000F83FFC3F00000000
      FC3FFC3F00000000FC3FFC3F00000000FC3FFC3F00000000FC3FFC3F00000000
      FC3FFC1F00000000FC3FF00F00000000FC3FF00F00000000FC3FFC3F00000000
      FC3FFE7F00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end