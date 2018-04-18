inherited dHexColor: TdHexColor
  Left = 265
  Top = 221
  Caption = 'Hex Colors'
  ClientHeight = 233
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 190
    object btnColorChart: TButton
      Left = 119
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Color Chart'
      TabOrder = 2
      OnClick = btnColorChartClick
    end
  end
  inherited Panel2: TPanel
    Height = 190
    object Label1: TLabel
      Left = 192
      Top = 160
      Width = 49
      Height = 13
      Caption = 'Hex Color:'
    end
    object Label2: TLabel
      Left = 200
      Top = 28
      Width = 23
      Height = 13
      Caption = 'Red:'
    end
    object Label3: TLabel
      Left = 200
      Top = 91
      Width = 24
      Height = 13
      Caption = 'Blue:'
    end
    object Label4: TLabel
      Left = 200
      Top = 59
      Width = 32
      Height = 13
      Caption = 'Green:'
    end
    object pcolor: TPanel
      Left = 16
      Top = 16
      Width = 161
      Height = 157
      BevelOuter = bvLowered
      TabOrder = 0
    end
    object eHexcolor: TEdit
      Left = 253
      Top = 157
      Width = 84
      Height = 21
      TabOrder = 1
      Text = '#000000'
      OnExit = eHexcolorExit
      OnKeyDown = eHexcolorKeyDown
    end
    object eRed: TEdit
      Left = 240
      Top = 24
      Width = 49
      Height = 21
      TabOrder = 2
      Text = '0'
      OnExit = eRedExit
      OnKeyDown = eRedKeyDown
    end
    object eblue: TEdit
      Left = 240
      Top = 88
      Width = 49
      Height = 21
      TabOrder = 3
      Text = '0'
      OnExit = eRedExit
      OnKeyDown = eRedKeyDown
    end
    object egreen: TEdit
      Left = 240
      Top = 55
      Width = 49
      Height = 21
      TabOrder = 4
      Text = '0'
      OnExit = eRedExit
      OnKeyDown = eRedKeyDown
    end
    object btnShowHex: TButton
      Left = 340
      Top = 157
      Width = 22
      Height = 21
      Caption = '...'
      TabOrder = 5
      OnClick = btnShowHexClick
    end
    object rud: TUpDown
      Left = 289
      Top = 24
      Width = 16
      Height = 21
      Associate = eRed
      Min = 0
      Max = 255
      Position = 0
      TabOrder = 6
      Wrap = False
      OnClick = UpDown2Click
    end
    object UpDown2: TUpDown
      Left = 289
      Top = 88
      Width = 16
      Height = 21
      Associate = eblue
      Min = 0
      Max = 255
      Position = 0
      TabOrder = 7
      Wrap = False
      OnClick = UpDown2Click
    end
    object UpDown3: TUpDown
      Left = 289
      Top = 55
      Width = 16
      Height = 21
      Associate = egreen
      Min = 0
      Max = 255
      Position = 0
      TabOrder = 8
      Wrap = False
      OnClick = UpDown2Click
    end
  end
  object dgcol: TColorDialog
    Ctl3D = True
    Options = [cdFullOpen, cdAnyColor]
    Left = 16
    Top = 200
  end
end
