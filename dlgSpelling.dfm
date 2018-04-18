inherited dSpellingOptions: TdSpellingOptions
  Left = 388
  Top = 162
  Caption = 'Spelling Options'
  ClientHeight = 338
  ClientWidth = 332
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 295
    Width = 332
    inherited Button1: TButton
      Left = 247
    end
    inherited Button2: TButton
      Left = 162
      OnClick = Button2Click
    end
  end
  inherited Panel2: TPanel
    Width = 332
    Height = 295
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 332
      Height = 295
      ActivePage = tsSpelling
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object tsSpelling: TTabSheet
        Caption = 'Spelling'
        object GroupBox1: TGroupBox
          Left = 8
          Top = 7
          Width = 305
          Height = 144
          Caption = ' General Options '
          TabOrder = 0
          object cbAuto: TCheckBox
            Left = 24
            Top = 21
            Width = 113
            Height = 17
            Caption = 'Auto Spell Check'
            TabOrder = 0
          end
          object cbCursor: TCheckBox
            Left = 24
            Top = 53
            Width = 97
            Height = 17
            Caption = 'Start from Cursor'
            TabOrder = 1
          end
          object cbIgnoreNums: TCheckBox
            Left = 24
            Top = 69
            Width = 177
            Height = 17
            Caption = 'Ignore words with numbers'
            TabOrder = 2
          end
          object cbIgnoreChar: TCheckBox
            Left = 24
            Top = 85
            Width = 145
            Height = 17
            Caption = 'Ignore single charactors'
            TabOrder = 3
          end
          object cbSuggest: TCheckBox
            Left = 24
            Top = 37
            Width = 97
            Height = 17
            Caption = 'Suggest words'
            TabOrder = 4
          end
          object cbSelWord: TCheckBox
            Left = 24
            Top = 101
            Width = 145
            Height = 17
            Caption = 'Select incorrect word'
            TabOrder = 5
          end
          object cbKeepCase: TCheckBox
            Left = 24
            Top = 117
            Width = 97
            Height = 17
            Caption = 'Maintain case'
            TabOrder = 6
          end
        end
        object GroupBox2: TGroupBox
          Left = 8
          Top = 156
          Width = 305
          Height = 75
          Caption = ' Dictionary Options '
          TabOrder = 1
          object Label1: TLabel
            Left = 14
            Top = 26
            Width = 83
            Height = 13
            Caption = 'Select Dictionary:'
          end
          object lDownload: TLabel
            Left = 108
            Top = 51
            Width = 130
            Height = 13
            Caption = 'Download more dictionaries'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            OnClick = lDownloadClick
            OnMouseEnter = lDownloadMouseEnter
            OnMouseLeave = lDownloadMouseLeave
          end
          object cbDics: TComboBox
            Left = 106
            Top = 24
            Width = 186
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
          end
        end
      end
    end
  end
end
