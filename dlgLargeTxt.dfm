object frmLargeTEXT: TfrmLargeTEXT
  Left = 226
  Top = 226
  BorderStyle = bsToolWindow
  Caption = 'Large Text'
  ClientHeight = 295
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object mtxt: TMemo
    Left = 0
    Top = 0
    Width = 384
    Height = 257
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 257
    Width = 384
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
