inherited dFindReplace: TdFindReplace
  Top = 166
  Caption = 'Find & Replace'
  ClientHeight = 349
  ClientWidth = 459
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 306
    Width = 459
    inherited Button1: TButton
      Left = 374
      TabOrder = 2
    end
    inherited Button2: TButton
      Left = 9
      TabOrder = 3
      Visible = False
    end
    object btnFind: TButton
      Left = 210
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Find'
      TabOrder = 0
      OnClick = btnFindClick
    end
    object btnReplace: TButton
      Left = 292
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Replace'
      TabOrder = 1
      OnClick = btnReplaceClick
    end
  end
  inherited Panel2: TPanel
    Width = 459
    Height = 306
    object Label1: TLabel
      Left = 7
      Top = 16
      Width = 47
      Height = 13
      Caption = 'Find Text:'
    end
    object Label2: TLabel
      Left = 7
      Top = 95
      Width = 67
      Height = 13
      Caption = 'Replace Text:'
    end
    object Label3: TLabel
      Left = 22
      Top = 284
      Width = 51
      Height = 13
      Caption = 'File Types:'
    end
    object mFind: TMemo
      Left = 80
      Top = 17
      Width = 369
      Height = 75
      Lines.Strings = (
        'mFind')
      TabOrder = 0
    end
    object mReplace: TMemo
      Left = 80
      Top = 96
      Width = 369
      Height = 75
      Lines.Strings = (
        'mReplace')
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 189
      Width = 441
      Height = 87
      Caption = ' Find where '
      TabOrder = 2
      object sbtnDir: TSpeedButton
        Left = 371
        Top = 40
        Width = 23
        Height = 22
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = sbtnDirClick
      end
      object rbcurdoc: TRadioButton
        Left = 12
        Top = 21
        Width = 113
        Height = 17
        Caption = 'Current Document'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbfolder: TRadioButton
        Left = 12
        Top = 42
        Width = 65
        Height = 17
        Caption = 'In folder'
        TabOrder = 1
      end
      object edtfolder: TEdit
        Left = 80
        Top = 40
        Width = 289
        Height = 21
        TabOrder = 2
        Text = 'edtfolder'
      end
      object cbsubdir: TCheckBox
        Left = 80
        Top = 64
        Width = 129
        Height = 17
        Caption = 'Include Subdirectories'
        TabOrder = 3
      end
    end
    object edtTypes: TEdit
      Left = 88
      Top = 282
      Width = 289
      Height = 21
      TabOrder = 3
      Text = 'edtTypes'
    end
    object cbBackup: TCheckBox
      Left = 79
      Top = 173
      Width = 97
      Height = 17
      Caption = 'Backup Files'
      TabOrder = 4
    end
  end
end
