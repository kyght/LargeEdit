inherited dEditComplete: TdEditComplete
  Left = 196
  Top = 166
  Caption = 'Edit Code Completion'
  ClientHeight = 351
  ClientWidth = 601
  OldCreateOrder = True
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 308
    Width = 601
    DesignSize = (
      601
      43)
    inherited Button1: TButton
      Left = 513
    end
    inherited Button2: TButton
      Left = 428
    end
    object btnAdd: TButton
      Left = 7
      Top = 5
      Width = 75
      Height = 17
      Caption = 'Add'
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnRemove: TButton
      Left = 103
      Top = 5
      Width = 75
      Height = 17
      Caption = 'Remove'
      TabOrder = 3
      OnClick = btnRemoveClick
    end
    object btnClear: TButton
      Left = 199
      Top = 5
      Width = 75
      Height = 17
      Caption = 'Clear'
      TabOrder = 4
      OnClick = btnClearClick
    end
  end
  inherited Panel2: TPanel
    Width = 601
    Height = 308
    object Splitter1: TSplitter
      Left = 289
      Top = 97
      Width = 6
      Height = 211
      Cursor = crHSplit
      Beveled = True
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 601
      Height = 97
      Align = alTop
      Caption = ' Setting '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 46
        Width = 90
        Height = 13
        Caption = 'Trigger Characters:'
      end
      object Label2: TLabel
        Left = 16
        Top = 21
        Width = 23
        Height = 13
        Caption = 'Title:'
      end
      object Label5: TLabel
        Left = 416
        Top = 21
        Width = 35
        Height = 13
        Caption = 'Interval'
      end
      object Label6: TLabel
        Left = 16
        Top = 71
        Width = 61
        Height = 13
        Caption = 'End Tokens:'
      end
      object edtTitle: TEdit
        Left = 45
        Top = 19
        Width = 172
        Height = 21
        TabOrder = 0
        Text = 'edtTitle'
      end
      object cbMatch: TCheckBox
        Left = 256
        Top = 37
        Width = 97
        Height = 17
        Caption = 'Limit to Match'
        TabOrder = 1
      end
      object cbCase: TCheckBox
        Left = 256
        Top = 54
        Width = 97
        Height = 17
        Caption = 'Case Sensitive'
        TabOrder = 2
      end
      object edtTrigs: TEdit
        Left = 110
        Top = 43
        Width = 107
        Height = 21
        TabOrder = 3
        Text = 'edtTrigs'
      end
      object edtTokens: TEdit
        Left = 86
        Top = 68
        Width = 91
        Height = 21
        TabOrder = 4
        Text = 'edtTokens'
      end
      object edtTimer: TEdit
        Left = 349
        Top = 17
        Width = 61
        Height = 21
        TabOrder = 5
        Text = 'edtTimer'
      end
      object edtTrigLength: TEdit
        Left = 350
        Top = 69
        Width = 50
        Height = 21
        Enabled = False
        TabOrder = 6
        Text = 'edtTrigLength'
      end
      object cbUseTrigLen: TCheckBox
        Left = 256
        Top = 72
        Width = 89
        Height = 17
        Caption = 'Trigger Length'
        TabOrder = 7
        OnClick = cbUseTrigLenClick
      end
      object cbuseTimer: TCheckBox
        Left = 256
        Top = 20
        Width = 74
        Height = 17
        Caption = 'Use Timer'
        TabOrder = 8
      end
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 97
      Width = 289
      Height = 211
      Align = alLeft
      Caption = ' Complete Items '
      TabOrder = 1
      object lbItems: TListBox
        Left = 2
        Top = 15
        Width = 285
        Height = 194
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnClick = lbItemsClick
        OnDblClick = lbItemsDblClick
      end
    end
    object GroupBox3: TGroupBox
      Left = 295
      Top = 97
      Width = 306
      Height = 211
      Align = alClient
      Caption = ' Complete Code '
      TabOrder = 2
      object mcc: TMemo
        Left = 2
        Top = 15
        Width = 302
        Height = 194
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
        OnExit = mccExit
      end
    end
  end
  object SynComp: TSynCompletionProposal
    Options = [scoLimitToMatchedText, scoUseInsertList, scoUseBuiltInTimer, scoEndCharCompletion]
    Width = 262
    EndOfTokenChr = '()[]. '
    TriggerChars = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clBtnText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <>
    ShortCut = 16416
    Left = 568
    Top = 64
  end
end
