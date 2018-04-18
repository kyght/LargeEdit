object Form1: TForm1
  Left = 255
  Top = 104
  Width = 771
  Height = 587
  Caption = 'Large File Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object memo1: TRichEdit
    Left = 0
    Top = 97
    Width = 763
    Height = 463
    Align = alClient
    PlainText = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 763
    Height = 97
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 664
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Process'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 584
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Next'
      TabOrder = 2
      OnClick = Button3Click
    end
    object elines: TEdit
      Left = 477
      Top = 9
      Width = 100
      Height = 21
      TabOrder = 3
      Text = '100'
    end
    object Button4: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Save'
      TabOrder = 5
      OnClick = Button5Click
    end
    object cbout: TCheckBox
      Left = 416
      Top = 12
      Width = 57
      Height = 17
      Caption = 'Output'
      TabOrder = 6
      OnClick = cboutClick
    end
    object Button6: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Hint = 'Search for a short string'
      Caption = 'Search'
      TabOrder = 7
      OnClick = Button6Click
    end
    object esearch: TEdit
      Left = 336
      Top = 9
      Width = 49
      Height = 21
      TabOrder = 8
    end
    object GroupBox1: TGroupBox
      Left = 416
      Top = 40
      Width = 329
      Height = 49
      Caption = 'Delete Field'
      TabOrder = 9
      object Label1: TLabel
        Left = 9
        Top = 21
        Width = 40
        Height = 13
        Caption = 'Delimiter'
      end
      object Label2: TLabel
        Left = 90
        Top = 21
        Width = 22
        Height = 13
        Caption = 'Field'
      end
      object Label3: TLabel
        Left = 162
        Top = 21
        Width = 27
        Height = 13
        Caption = 'Fields'
      end
      object efld: TEdit
        Left = 121
        Top = 17
        Width = 32
        Height = 21
        TabOrder = 0
        Text = '1'
      end
      object edelim: TEdit
        Left = 56
        Top = 17
        Width = 25
        Height = 21
        TabOrder = 1
        Text = '~'
      end
      object Button7: TButton
        Left = 248
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Delete'
        TabOrder = 2
        OnClick = Button7Click
      end
      object etot: TEdit
        Left = 195
        Top = 17
        Width = 34
        Height = 21
        TabOrder = 3
        Text = '10'
      end
    end
  end
  object od: TOpenDialog
    Left = 16
    Top = 48
  end
  object sd: TSaveDialog
    Left = 56
    Top = 48
  end
end
