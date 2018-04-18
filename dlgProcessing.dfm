object dlgProcess: TdlgProcess
  Left = 266
  Top = 214
  BorderStyle = bsDialog
  Caption = 'Processing'
  ClientHeight = 162
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbStatus: TLabel
    Left = 16
    Top = 16
    Width = 305
    Height = 49
    Alignment = taCenter
    AutoSize = False
    WordWrap = True
  end
  object Bevel1: TBevel
    Left = 16
    Top = 72
    Width = 305
    Height = 6
    Shape = bsBottomLine
  end
  object pbar: TProgressBar
    Left = 16
    Top = 89
    Width = 305
    Height = 16
    Min = 0
    Max = 100
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 128
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
end
