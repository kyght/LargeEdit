object dStandard: TdStandard
  Left = 223
  Top = 211
  BorderStyle = bsDialog
  Caption = 'Standard Dialog'
  ClientHeight = 251
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 208
    Width = 373
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      373
      43)
    object Button1: TButton
      Left = 288
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object Button2: TButton
      Left = 203
      Top = 11
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 373
    Height = 208
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
end
