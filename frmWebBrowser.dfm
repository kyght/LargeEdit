object fWebBrowser: TfWebBrowser
  Left = 350
  Top = 186
  Width = 540
  Height = 457
  Caption = 'Web Browser'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object web: TWebBrowser
    Left = 0
    Top = 40
    Width = 532
    Height = 352
    Align = alClient
    TabOrder = 0
    ControlData = {
      4C000000FC360000612400000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E126208000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 532
    Height = 40
    ButtonHeight = 36
    ButtonWidth = 50
    Caption = 'ToolBar1'
    Flat = True
    Images = frmLEImages.leimgsm
    ShowCaptions = True
    TabOrder = 1
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 8
      Top = 0
      Caption = 'Back'
      ImageIndex = 73
      OnClick = ToolButton4Click
    end
    object ToolButton5: TToolButton
      Left = 58
      Top = 0
      Caption = 'Forward'
      ImageIndex = 74
      OnClick = ToolButton5Click
    end
    object ToolButton7: TToolButton
      Left = 108
      Top = 0
      Caption = 'Stop'
      ImageIndex = 19
      OnClick = ToolButton7Click
    end
    object ToolButton6: TToolButton
      Left = 158
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 166
      Top = 0
      Caption = 'Refresh'
      ImageIndex = 53
      OnClick = ToolButton1Click
    end
    object ToolButton10: TToolButton
      Left = 216
      Top = 0
      Caption = 'Navigate'
      ImageIndex = 37
      OnClick = ToolButton10Click
    end
    object ToolButton11: TToolButton
      Left = 266
      Top = 0
      Caption = 'Print'
      ImageIndex = 26
      OnClick = ToolButton11Click
    end
    object ToolButton8: TToolButton
      Left = 316
      Top = 0
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 324
      Top = 0
      Caption = 'Close'
      ImageIndex = 46
      OnClick = ToolButton9Click
    end
    object ToolButton3: TToolButton
      Left = 374
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 532
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
  end
end
