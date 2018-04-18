inherited dSpellCheck: TdSpellCheck
  Left = 220
  Top = 209
  Caption = 'Spell Check'
  ClientHeight = 202
  ClientWidth = 418
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 159
    Width = 418
    inherited Button1: TButton
      Left = 333
      OnClick = Button1Click
    end
    inherited Button2: TButton
      Left = 248
      OnClick = Button2Click
    end
    object btnOptions: TButton
      Left = 163
      Top = 11
      Width = 75
      Height = 25
      Caption = 'Options...'
      TabOrder = 2
      OnClick = btnOptionsClick
    end
  end
  inherited Panel2: TPanel
    Width = 418
    Height = 159
    object Label1: TLabel
      Left = 9
      Top = 15
      Width = 81
      Height = 13
      Caption = 'Not in Dictionary:'
    end
    object Label2: TLabel
      Left = 9
      Top = 41
      Width = 52
      Height = 13
      Caption = 'Change &to:'
    end
    object Label3: TLabel
      Left = 9
      Top = 65
      Width = 61
      Height = 13
      Caption = 'Suggestio&ns:'
    end
    object edtWord: TEdit
      Left = 99
      Top = 12
      Width = 309
      Height = 21
      Color = clBtnFace
      Enabled = False
      TabOrder = 8
    end
    object edtChange: TEdit
      Left = 99
      Top = 38
      Width = 309
      Height = 21
      TabOrder = 4
    end
    object lbsuggest: TListBox
      Left = 99
      Top = 65
      Width = 142
      Height = 88
      ItemHeight = 13
      TabOrder = 7
      OnClick = lbsuggestClick
    end
    object btnIgnore: TButton
      Left = 248
      Top = 65
      Width = 75
      Height = 25
      Caption = '&Ignore'
      TabOrder = 1
      OnClick = btnIgnoreClick
    end
    object btnChange: TButton
      Left = 248
      Top = 96
      Width = 75
      Height = 25
      Caption = '&Change'
      TabOrder = 0
      OnClick = btnChangeClick
    end
    object btnAdd: TButton
      Left = 248
      Top = 128
      Width = 75
      Height = 25
      Caption = '&Add'
      TabOrder = 3
      OnClick = btnAddClick
    end
    object btnIgnoreAll: TButton
      Left = 333
      Top = 65
      Width = 75
      Height = 25
      Caption = 'I&gnore All'
      TabOrder = 2
      OnClick = btnIgnoreAllClick
    end
    object btnChangeAll: TButton
      Left = 333
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Change A&ll'
      TabOrder = 5
      Visible = False
    end
    object btnSuggest: TButton
      Left = 333
      Top = 128
      Width = 75
      Height = 25
      Caption = '&Suggest'
      TabOrder = 6
      Visible = False
    end
  end
  object SCheck: TSynSpellCheck
    Apostrophes = #39'`'#180
    CheckAttribs.Strings = (
      'Comment'
      'Text'
      'String'
      'Documentation')
    DictionaryPath = 'C:\Program Files\Common Files\SynSpell\'
    Options = [sscoIgnoreSingleChars, sscoIgnoreWordsWithNumbers, sscoMaintainCase, sscoSelectWord, sscoSuggestWords, sscoTrimApostrophes]
    UserDirectory = 'C:\Program Files\Common Files\SynSpell\'
    OnAbort = SCheckAbort
    OnAddWord = SCheckAddWord
    OnCheckWord = SCheckCheckWord
    OnDone = SCheckDone
    OnSkipWord = SCheckSkipWord
    Left = 8
    Top = 168
  end
end
