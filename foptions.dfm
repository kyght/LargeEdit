object fopts: Tfopts
  Left = 273
  Top = 163
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 431
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 528
    Height = 390
    ActivePage = TabSheet1
    Align = alClient
    Images = frmLEImages.leimgsm
    Style = tsFlatButtons
    TabIndex = 0
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Editor'
      ImageIndex = 49
      DesignSize = (
        520
        358)
      object GroupBox1: TGroupBox
        Left = 8
        Top = 1
        Width = 503
        Height = 119
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' File preferences '
        TabOrder = 0
        object Label4: TLabel
          Left = 10
          Top = 18
          Width = 85
          Height = 13
          Caption = 'Small file size limit:'
        end
        object Label5: TLabel
          Left = 264
          Top = 18
          Width = 26
          Height = 13
          Caption = 'Bytes'
        end
        object edtSmallFileLim: TEdit
          Left = 104
          Top = 15
          Width = 155
          Height = 21
          Hint = 
            'Files with sizes greater then this size are opened as large file' +
            's'
          TabOrder = 0
          Text = '7000000'
        end
        object cbDefSmall: TCheckBox
          Left = 9
          Top = 40
          Width = 158
          Height = 17
          Hint = 'When file size can not be determine, open file as small.'
          Alignment = taLeftJustify
          Caption = 'Open files as small by default: '
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbEditSmall: TCheckBox
          Left = 9
          Top = 59
          Width = 158
          Height = 17
          Hint = 'Open small files in edit mode'
          Alignment = taLeftJustify
          Caption = 'Open small file in edit mode: '
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object cbUnicode: TCheckBox
          Left = 214
          Top = 41
          Width = 158
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Unicode Read Support'
          TabOrder = 3
          Visible = False
        end
        object cbCRtoCRLF: TCheckBox
          Left = 9
          Top = 78
          Width = 185
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Carrage Return to CR + Line Feed'
          TabOrder = 4
        end
        object cbLFtoCRLF: TCheckBox
          Left = 9
          Top = 97
          Width = 185
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Line Feed to CR + Line Feed'
          TabOrder = 5
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 129
        Width = 502
        Height = 66
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Large file options '
        TabOrder = 1
        object Label6: TLabel
          Left = 10
          Top = 21
          Width = 90
          Height = 13
          Caption = 'Default Line Fetch:'
        end
        object Label12: TLabel
          Left = 10
          Top = 45
          Width = 64
          Height = 13
          Caption = 'Back Buffers:'
        end
        object edtDefLines: TEdit
          Left = 109
          Top = 17
          Width = 101
          Height = 21
          TabOrder = 0
          Text = '50000'
        end
        object edtBackBufs: TEdit
          Left = 109
          Top = 41
          Width = 28
          Height = 21
          TabOrder = 1
          Text = '10'
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 203
        Width = 502
        Height = 118
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Editor Options'
        TabOrder = 2
        object Label7: TLabel
          Left = 10
          Top = 22
          Width = 52
          Height = 13
          Caption = 'Undo Max:'
        end
        object Label8: TLabel
          Left = 10
          Top = 46
          Width = 53
          Height = 13
          Caption = 'Tab Width:'
        end
        object Label9: TLabel
          Left = 10
          Top = 96
          Width = 64
          Height = 13
          Caption = 'Change Font:'
        end
        object Label13: TLabel
          Left = 10
          Top = 72
          Width = 56
          Height = 13
          Caption = 'Right Edge:'
        end
        object edtUndoMax: TEdit
          Left = 70
          Top = 20
          Width = 72
          Height = 21
          TabOrder = 0
          Text = '5000'
        end
        object edtTabWidth: TEdit
          Left = 70
          Top = 44
          Width = 30
          Height = 21
          TabOrder = 1
          Text = '2'
        end
        object cbMax: TCheckBox
          Left = 192
          Top = 19
          Width = 116
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Start maximized:'
          TabOrder = 2
        end
        object btnEdFont: TButton
          Left = 84
          Top = 95
          Width = 18
          Height = 17
          Caption = '...'
          TabOrder = 3
          OnClick = btnEdFontClick
        end
        object cbsmarttabs: TCheckBox
          Left = 192
          Top = 37
          Width = 116
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Smart Tabs'
          TabOrder = 4
        end
        object cbusetabs: TCheckBox
          Left = 192
          Top = 55
          Width = 116
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Tab Indent'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object edtrightedge: TEdit
          Left = 70
          Top = 69
          Width = 41
          Height = 21
          TabOrder = 6
          Text = '80'
        end
        object cbtabspaces: TCheckBox
          Left = 344
          Top = 17
          Width = 116
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Tab to Spaces'
          TabOrder = 7
        end
        object cbtrimspaces: TCheckBox
          Left = 344
          Top = 35
          Width = 115
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Trim Trailing Spaces'
          TabOrder = 8
        end
        object cbscrolleol: TCheckBox
          Left = 344
          Top = 53
          Width = 115
          Height = 16
          Alignment = taLeftJustify
          Caption = 'Scoll Past EOL'
          TabOrder = 9
        end
        object cbshowcaret: TCheckBox
          Left = 192
          Top = 72
          Width = 116
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Always Show Caret:'
          TabOrder = 10
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Gutter'
      ImageIndex = 47
      DesignSize = (
        520
        358)
      object Label1: TLabel
        Left = 15
        Top = 121
        Width = 58
        Height = 13
        Caption = 'Digit Count: '
      end
      object Label2: TLabel
        Left = 15
        Top = 145
        Width = 55
        Height = 13
        Caption = 'Left Offset: '
      end
      object Label3: TLabel
        Left = 15
        Top = 169
        Width = 62
        Height = 13
        Caption = 'Right Offset: '
      end
      object cbUseGutter: TCheckBox
        Left = 14
        Top = 9
        Width = 81
        Height = 17
        Caption = 'Use gutter'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 14
        Top = 27
        Width = 498
        Height = 57
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Gutter Options '
        TabOrder = 1
        object cbGLineNums: TCheckBox
          Left = 16
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Line numbers'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cbGLeadZero: TCheckBox
          Left = 16
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Leading zeros'
          TabOrder = 1
        end
        object cbGZeroStart: TCheckBox
          Left = 176
          Top = 24
          Width = 97
          Height = 17
          Caption = 'Zero Start'
          TabOrder = 2
        end
        object cbGUseFont: TCheckBox
          Left = 176
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Use Font Style'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
      object edtGDigCount: TEdit
        Left = 79
        Top = 118
        Width = 37
        Height = 21
        TabOrder = 2
        Text = '4'
      end
      object edtGLeftOff: TEdit
        Left = 79
        Top = 142
        Width = 37
        Height = 21
        TabOrder = 3
        Text = '16'
      end
      object edtGRightOff: TEdit
        Left = 79
        Top = 166
        Width = 37
        Height = 21
        TabOrder = 4
        Text = '2'
      end
      object Font: TButton
        Left = 310
        Top = 49
        Width = 75
        Height = 17
        Caption = 'Font'
        TabOrder = 5
        OnClick = FontClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Keystrokes'
      ImageIndex = 67
      DesignSize = (
        520
        358)
      object GroupBox6: TGroupBox
        Left = 8
        Top = 8
        Width = 503
        Height = 298
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Configure Keystrokes '
        TabOrder = 0
        object Label10: TLabel
          Left = 8
          Top = 246
          Width = 33
          Height = 13
          Caption = 'Action:'
        end
        object Label11: TLabel
          Left = 8
          Top = 275
          Width = 44
          Height = 13
          Caption = 'ShortCut:'
        end
        object lbKeys: TListBox
          Left = 2
          Top = 15
          Width = 499
          Height = 210
          Align = alTop
          ItemHeight = 13
          Sorted = True
          TabOrder = 0
          OnClick = lbKeysClick
        end
        object btnSaveKS: TButton
          Left = 233
          Top = 273
          Width = 75
          Height = 25
          Caption = 'Save'
          TabOrder = 1
          OnClick = btnSaveKSClick
        end
        object btnDefKS: TButton
          Left = 233
          Top = 241
          Width = 75
          Height = 25
          Caption = 'Defaults'
          TabOrder = 2
          OnClick = btnDefKSClick
        end
        object cbKSAction: TComboBox
          Tag = 1
          Left = 57
          Top = 243
          Width = 149
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          Text = 'Select Action'
        end
        object edtKS: TEdit
          Tag = 1
          Left = 57
          Top = 271
          Width = 121
          Height = 21
          TabOrder = 4
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Files'
      ImageIndex = 82
      DesignSize = (
        520
        358)
      object vlistSyntax: TValueListEditor
        Tag = 1
        Left = 8
        Top = 8
        Width = 501
        Height = 259
        Anchors = [akLeft, akTop, akRight, akBottom]
        DefaultColWidth = 180
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
        Strings.Strings = (
          '=')
        TabOrder = 0
        TitleCaptions.Strings = (
          'Highlighter'
          'File extensions')
        OnDblClick = vlistSyntaxDblClick
        ColWidths = (
          202
          293)
      end
      object btnCustomSyn: TButton
        Left = 104
        Top = 300
        Width = 89
        Height = 25
        Caption = 'Edit Colors'
        TabOrder = 1
        OnClick = btnCustomSynClick
      end
      object btnEditComplete: TButton
        Left = 200
        Top = 300
        Width = 90
        Height = 25
        Caption = 'Edit Completion'
        TabOrder = 2
        OnClick = btnEditCompleteClick
      end
      object btnFileAssoc: TButton
        Left = 9
        Top = 333
        Width = 88
        Height = 25
        Caption = 'Association Files'
        TabOrder = 3
        OnClick = btnFileAssocClick
      end
      object btnHelpFile: TButton
        Left = 393
        Top = 300
        Width = 89
        Height = 25
        Caption = 'Help File'
        TabOrder = 4
        OnClick = btnHelpFileClick
      end
      object btnEXE: TButton
        Left = 297
        Top = 300
        Width = 89
        Height = 25
        Caption = 'Execution'
        TabOrder = 5
        OnClick = btnEXEClick
      end
      object btnAddHL: TButton
        Left = 9
        Top = 300
        Width = 89
        Height = 25
        Caption = 'Add Highlighter'
        TabOrder = 6
        OnClick = btnAddHLClick
      end
    end
    object tsToolbars: TTabSheet
      Caption = 'Toolbars'
      ImageIndex = 97
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 520
        Height = 115
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object lbToolbars: TListBox
          Left = 0
          Top = 0
          Width = 403
          Height = 115
          Align = alLeft
          ItemHeight = 13
          TabOrder = 0
          OnClick = lbToolbarsClick
        end
        object bbtnAdd: TBitBtn
          Left = 415
          Top = 2
          Width = 83
          Height = 23
          Action = aAddToolbar
          Caption = 'Add'
          TabOrder = 1
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000376070003760700037607000376
            0700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000376070018A430001AB333000376
            0700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00037607001DA93A0020B940000376
            0700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000376070021AE430026BF4D000376
            0700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00037607000376070003760700037607000376070029B953002EC75D000376
            070003760700037607000376070003760700FF00FF00FF00FF00FF00FF00FF00
            FF00037607004DE5800048E17B0040D973003BD46E003BD46E0032CB64002DBF
            590021AD42001DA93A0016A22B0003760700FF00FF00FF00FF00FF00FF00FF00
            FF000376070055ED88004DE5800048E17B0040D973003BD46E0032CB64002EC7
            5D0026BF4D001FB83D001AB3330003760700FF00FF00FF00FF00FF00FF00FF00
            FF000C7812000376070003760700037607000370060040D9730038D16B000370
            060003700600037006000370060003700600FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000370060047E07A0040D973000370
            0600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00037006004DE5800045DE78000370
            0600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000370060052EB85004DE580000370
            0600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000370060003700600037006000370
            0600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object bbtnRemove: TBitBtn
          Left = 415
          Top = 30
          Width = 83
          Height = 23
          Action = aRemoveToolbar
          Caption = 'Remove'
          TabOrder = 2
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000632DE000632DE00FF00FF000632
            DE000632DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000632DE000632DE00FF00FF00FF00FF000632
            DE000632DE000632DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000632DE000632DE00FF00FF00FF00FF00FF00FF000632
            DE000632DD000632DE000632DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000632DE000632DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000433ED000632DE000632DE000632DE00FF00FF00FF00FF00FF00FF00FF00
            FF000632DE000632DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000632DE000632DE000632DD00FF00FF000632DD000632
            DE000632DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000632DD000533E7000533E7000533E9000632
            DD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF000632E4000632E4000433EF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000632DD000433ED000533E9000433EF000434
            F400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF000434F4000433EF000533EB00FF00FF00FF00FF000434
            F4000335F800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000335F8000433EF000334F800FF00FF00FF00FF00FF00FF00FF00
            FF000335F8000335F800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000335F8000335F8000335F800FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000335F8000335F800FF00FF00FF00FF00FF00FF00FF00FF000335
            F8000335F8000335F800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF000335F800FF00FF00FF00FF000335F8000335
            F8000335F800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000335F8000335
            F800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object bbtnRename: TBitBtn
          Left = 415
          Top = 60
          Width = 83
          Height = 23
          Action = aRenameToolbar
          Caption = 'Edit'
          TabOrder = 3
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFFFFF00000000000000000000000000FFFFFF00000000000000
            000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF0000000000FFFFFF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFFFFF00000000000000000000000000FFFFFF00000000000000
            000000000000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object bbtnhighlighter: TBitBtn
          Left = 415
          Top = 88
          Width = 83
          Height = 23
          Action = aHighlighterToolbar
          Caption = 'Highlighters'
          TabOrder = 4
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00A3676900A3676900A3676900A3676900A3676900A3676900A3676900A367
            6900A3676900A3676900A3676900A3676900A3676900FF00FF00FF00FF00FF00
            FF00B18C8400F7E5D000F1D7B900EECFAD00EECBA100EEC99600ECC58E00EAC1
            8B00EAC18B00EAC18B00EAC18B00EDC79100A3676900FF00FF00FF00FF00FF00
            FF00B1908900F7E5D000BFE9FF006ACDFF006ACDFF006ACDFF006ACDFF003FBF
            FF003FBFFF00E9BF8800E9BF8800EBC38C00A3676900FF00FF00FF00FF00FF00
            FF00B2928B00F9EDDF00BFE9FF00BFE9FF006ACDFF006ACDFF006ACDFF006ACD
            FF003FBFFF00E9BF8800E9BF8800EBC38C00A3676900FF00FF00FF00FF00FF00
            FF00B2968E00FAF2E800F7E5D000F4DEC600F2D8BC00F0D4B600EDCDA800EECB
            A100EDC79100EBC38C00E9BF8800EBC38C00A3676900FF00FF00FF00FF00FF00
            FF00B19D9700FCF8F300BFBFFF007F7FFF007F7FFF007F7FFF003F3FFF00EECF
            AD00EECBA100EDC79100EBC38C00ECC58E00A3676900FF00FF00FF00FF00FF00
            FF00AFA19C00FDFCFB00BFBFFF00BFBFFF007F7FFF007F7FFF007F7FFF00F0D4
            B600EDCDA800EECA9C00EDC79100EDC79100A3676900FF00FF00FF00FF00FF00
            FF00E2AC9A00FDFCFB00FCF8F300FAF2E800F8E8D600F7E5D000F4DEC600F2D8
            BC00F0D4B600EDCDA800EECBA100EEC99600A3676900FF00FF00FF00FF00FF00
            FF00E2AC9A00FDFCFB00FFBFBF00FF7F7F00FF7F7F00FF7F7F00FF7F7F00FF7F
            7F00FF555500FF555500EDCDA800EECBA100A3676900FF00FF00FF00FF00FF00
            FF00E2AC9A00FDFCFB00FFBFBF00FFBFBF00FF7F7F00FF7F7F00FF7F7F00FF7F
            7F00FF7F7F00FF555500F1D7B900EDCCA500A3676900FF00FF00FF00FF00FF00
            FF00E3B29600FDFCFB00FDFCFB00FDFCFB00FDFCFB00FCF8F300FAF2E800F8E8
            D600F7E5D000F7E5D000EED0B200B29B9300A3676900FF00FF00FF00FF00FF00
            FF00E3B29600FDFCFB00C9F7D90094F0B30094F0B30094F0B30086C16A0086C1
            6A00F4DEC600B0887E00A3706F00A3706F00A3676900FF00FF00FF00FF00FF00
            FF00E3B29600FDFCFB00C9F7D900C9F7D90094F0B30094F0B30094F0B30086C1
            6A00C4BDBC00B16F5B00D5863D00D6863C00B5725800FF00FF00FF00FF00FF00
            FF00EDCCA500FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFC
            FB00C4BDBC00B5857400E9BF8800BF774F00FF00FF00FF00FF00FF00FF00FF00
            FF00E5BB8E00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5
            EF00C4BDBC00B7735600B5857400FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00EECFAD00EED0B200EED0B200EED0B200EED0B200EED0B200EED0B200EED0
            B200EED0B200AC6C5F00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 115
        Width = 520
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object cbarcustom: TCoolBar
          Left = 0
          Top = 0
          Width = 520
          Height = 27
          Bands = <
            item
              Control = atbcustom
              ImageIndex = -1
              Width = 516
            end>
          EdgeBorders = [ebLeft, ebTop, ebRight]
          Images = imglistcus
          object atbcustom: TActionToolBar
            Left = 9
            Top = 0
            Width = 503
            Height = 25
            ActionManager = CustomActions
            AllowHiding = True
            Caption = 'Custom Toolbar'
            HorzSeparator = True
            Orientation = boLeftToRight
            ParentShowHint = False
            PersistentHotKeys = False
            ShowHint = True
            Spacing = 0
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 146
        Width = 520
        Height = 212
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 520
          Height = 34
          Align = alTop
          TabOrder = 0
          object tbarc: TToolBar
            Left = 1
            Top = 1
            Width = 518
            Height = 29
            Caption = 'tbarCustom'
            Images = frmLEImages.leimgsm
            TabOrder = 0
            object ToolButton2: TToolButton
              Left = 0
              Top = 2
              Width = 8
              Caption = 'ToolButton2'
              Enabled = False
              ImageIndex = 1
              Style = tbsSeparator
            end
            object ToolButton1: TToolButton
              Left = 8
              Top = 2
              Action = aAddBtn
            end
            object ToolButton9: TToolButton
              Left = 31
              Top = 2
              Action = aEditBtn
            end
            object ToolButton3: TToolButton
              Left = 54
              Top = 2
              Action = aDelBtn
            end
            object ToolButton5: TToolButton
              Left = 77
              Top = 2
              Width = 8
              Caption = 'ToolButton5'
              Enabled = False
              ImageIndex = 48
              Style = tbsSeparator
            end
            object ToolButton4: TToolButton
              Left = 85
              Top = 2
              Action = aMoveLeft
            end
            object ToolButton6: TToolButton
              Left = 108
              Top = 2
              Action = aMoveRight
            end
            object ToolButton7: TToolButton
              Left = 131
              Top = 2
              Width = 8
              Caption = 'ToolButton7'
              Enabled = False
              ImageIndex = 75
              Style = tbsSeparator
            end
            object ToolButton8: TToolButton
              Left = 139
              Top = 2
              Action = aSaveToolbar
            end
          end
        end
        object pcustomtool: TPanel
          Left = 0
          Top = 34
          Width = 520
          Height = 178
          Align = alClient
          TabOrder = 1
          object synCustom: TSynEdit
            Left = 1
            Top = 1
            Width = 518
            Height = 176
            Align = alClient
            CodeFolding = False
            IndentGuides = False
            MatchBrace = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            TabOrder = 0
            Gutter.Font.Charset = DEFAULT_CHARSET
            Gutter.Font.Color = clWindowText
            Gutter.Font.Height = -11
            Gutter.Font.Name = 'Courier New'
            Gutter.Font.Style = []
            Highlighter = SynJScriptCustom
            SearchEngine = SynSearchCustom
            WantTabs = True
          end
        end
      end
    end
    object tsHelp: TTabSheet
      Caption = 'Help'
      ImageIndex = 63
      DesignSize = (
        520
        358)
      object btnAddHelp: TButton
        Left = 8
        Top = 280
        Width = 89
        Height = 25
        Caption = 'Add'
        TabOrder = 0
        OnClick = btnAddHelpClick
      end
      object Button4: TButton
        Left = 104
        Top = 280
        Width = 89
        Height = 25
        Caption = 'Remove'
        TabOrder = 1
        OnClick = Button4Click
      end
      object lveHelp: TValueListEditor
        Left = 8
        Top = 8
        Width = 503
        Height = 232
        Anchors = [akLeft, akTop, akRight, akBottom]
        DefaultColWidth = 160
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect, goThumbTracking]
        Strings.Strings = (
          '=')
        TabOrder = 2
        TitleCaptions.Strings = (
          'Help'
          'Filename')
        ColWidths = (
          160
          337)
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Misc'
      ImageIndex = 71
      DesignSize = (
        520
        358)
      object GroupBox7: TGroupBox
        Left = 8
        Top = 5
        Width = 503
        Height = 65
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Code Repository '
        TabOrder = 0
        DesignSize = (
          503
          65)
        object Label17: TLabel
          Left = 11
          Top = 24
          Width = 72
          Height = 13
          Caption = 'Base Directory:'
        end
        object edtRepositdir: TEdit
          Left = 90
          Top = 21
          Width = 354
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object bitbtnsetrepdir: TBitBtn
          Left = 451
          Top = 21
          Width = 27
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnClick = bitbtnsetrepdirClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
            FF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000FFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
            FF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000FFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
            FF00FFFFFF0000FFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
            FF0000FFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00000000000000000000000000000000000000000000000000000000000000
            00000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF007F7F7F00000000000000000000000000000000007F7F7F00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object cbTagReplaceCode: TCheckBox
          Left = 9
          Top = 45
          Width = 157
          Height = 17
          Alignment = taLeftJustify
          Caption = 'Prompt for replacement tags:'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
      end
      object GroupBox8: TGroupBox
        Left = 8
        Top = 84
        Width = 503
        Height = 46
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Highlighter Options '
        TabOrder = 1
        DesignSize = (
          503
          46)
        object Label14: TLabel
          Left = 8
          Top = 24
          Width = 104
          Height = 13
          Caption = 'Auto Scan Ignore Ext:'
        end
        object edtAutoScanIgnore: TEdit
          Left = 118
          Top = 21
          Width = 369
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = '*.txt; *.dat; *.cvs; *.tsv; *.log'
        end
      end
      object GroupBox9: TGroupBox
        Left = 8
        Top = 198
        Width = 503
        Height = 43
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Script Options '
        TabOrder = 2
        object Label15: TLabel
          Left = 11
          Top = 22
          Width = 41
          Height = 13
          Caption = 'Timeout:'
        end
        object edtscrtimeout: TEdit
          Left = 60
          Top = 19
          Width = 56
          Height = 21
          TabOrder = 0
          Text = '120000'
        end
      end
      object GroupBox10: TGroupBox
        Left = 8
        Top = 142
        Width = 503
        Height = 44
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = ' Editor Options '
        TabOrder = 3
        DesignSize = (
          503
          44)
        object Label16: TLabel
          Left = 8
          Top = 23
          Width = 102
          Height = 13
          Caption = 'Auto Set Word Wrap:'
        end
        object edtwordwrapext: TEdit
          Left = 118
          Top = 19
          Width = 369
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = '*.txt; '
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 390
    Width = 528
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      528
      41)
    object Button1: TButton
      Left = 355
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 441
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object fdGutter: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 515
    Top = 224
  end
  object JScript: TSynJScriptSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 516
    Top = 379
  end
  object VBScript: TSynVBScriptSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 515
    Top = 128
  end
  object HTML: TSynHTMLSyn
    DefaultFilter = 'HTML Document (*.htm,*.html)|*.htm;*.html'
    CommentAttri.Foreground = clGray
    CommentAttri.Style = [fsItalic]
    KeyAttri.Foreground = clBlue
    KeyAttri.Style = []
    ValueAttri.Foreground = clNone
    Left = 547
    Top = 128
  end
  object CPlusPlus: TSynCppSyn
    DefaultFilter = 'C++ Files (*.c,*.cpp,*.h,*.hpp)|*.c;*.cpp;*.h;*.hpp'
    AsmAttri.Foreground = clPurple
    CommentAttri.Foreground = clGreen
    InvalidAttri.Foreground = clRed
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 516
    Top = 315
  end
  object Java: TSynJavaSyn
    CommentAttri.Foreground = clGreen
    InvalidAttri.Foreground = clRed
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 548
    Top = 315
  end
  object Pascal: TSynPasSyn
    AsmAttri.Foreground = clPurple
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 515
    Top = 64
  end
  object VBBasic: TSynVBSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 547
    Top = 64
  end
  object CStylesheets: TSynCssSyn
    CommentAttri.Foreground = clGreen
    NumberAttri.Foreground = clMaroon
    KeyAttri.Foreground = clMaroon
    KeyAttri.Style = []
    Left = 579
    Top = 64
  end
  object PHP: TSynPHPSyn
    DefaultFilter = 
      'PHP Files (*.php,*.php3,*.phtml,*.inc)|*.php;*.php3;*.phtml;*.in' +
      'c'
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 547
    Top = 192
  end
  object XML: TSynXMLSyn
    DefaultFilter = 'XML Document (*.xml,*.xsd,*.xsl,*.xslt)|*.xml;*.xsd;*.xsl;*.xslt'
    AttributeValueAttri.Foreground = clNone
    CommentAttri.Background = clNone
    CommentAttri.Style = []
    WantBracesParsed = False
    Left = 515
    Top = 96
  end
  object Perl: TSynPerlSyn
    DefaultFilter = 'Perl Files (*.pl,*.pm,*.cgi)|*.pl;*.pm;*.cgi'
    CommentAttri.Foreground = clGreen
    InvalidAttri.Foreground = clRed
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 547
    Top = 96
  end
  object Fortran: TSynFortranSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 516
    Top = 283
  end
  object Foxpro: TSynFoxproSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 548
    Top = 283
  end
  object SQL: TSynSQLSyn
    CommentAttri.Foreground = clGreen
    ExceptionAttri.Foreground = clBlue
    FunctionAttri.Foreground = clBlue
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    SQLDialect = sqlStandard
    Left = 515
    Top = 32
  end
  object INI: TSynIniSyn
    SectionAttri.Foreground = clBlue
    KeyAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 547
    Top = 32
  end
  object Assembly: TSynAsmSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 548
    Top = 379
  end
  object Batch: TSynBatSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    Left = 515
    Top = 160
  end
  object AWK: TSynAWKSyn
    DefaultFilter = 'AWK Script (*.awk)|*.awk'
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    Left = 547
    Top = 160
  end
  object fdEditor: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 515
    Top = 256
  end
  object odhlp: TOpenDialog
    Filter = 'Help Files (*.chm,*.hlp)|*.chm;*.hlp|All Files (*.*)|*.*'
    Title = 'Select Help File'
    Left = 16
    Top = 392
  end
  object odExe: TOpenDialog
    Filter = 'Executable Files (*.exe)|*.exe|All Files (*.*)|*.*'
    Title = 'Select Executable File'
    Left = 48
    Top = 392
  end
  object CustomHighlighter: TSynUniSyn
    Left = 516
    Top = 347
  end
  object SEditorHL: TSynUniSyn
    Left = 515
    Top = 192
  end
  object CustomActions: TActionManager
    LinkedActionLists = <
      item
        ActionList = alcustom
        Caption = 'Buttons'
      end>
    Images = imglistcus
    Left = 90
    Top = 360
  end
  object aCustomLayout: TCustomizeDlg
    ActionManager = CustomActions
    StayOnTop = False
    Left = 154
    Top = 360
  end
  object imglistcus: TImageList
    Left = 122
    Top = 360
  end
  object SynSearchCustom: TSynEditSearch
    Left = 120
    Top = 392
  end
  object SynJScriptCustom: TSynJScriptSyn
    CommentAttri.Foreground = clGreen
    KeyAttri.Foreground = clBlue
    NumberAttri.Foreground = clMaroon
    StringAttri.Foreground = clTeal
    Left = 91
    Top = 392
  end
  object alcustom: TActionList
    Images = imglistcus
    Left = 186
    Top = 360
  end
  object lmglstTbar: TImageList
    Left = 256
    Top = 392
  end
  object alistTbar: TActionList
    Images = frmLEImages.leimgsm
    Left = 224
    Top = 392
    object aAddBtn: TAction
      Caption = 'Add Button'
      Hint = 'Add Button'
      ImageIndex = 91
      OnExecute = aAddBtnExecute
    end
    object aEditBtn: TAction
      Caption = 'aEditBtn'
      ImageIndex = 93
      OnExecute = aEditBtnExecute
    end
    object aDelBtn: TAction
      Caption = 'Delete Button'
      Hint = 'Delete Button'
      ImageIndex = 46
      OnExecute = aDelBtnExecute
    end
    object aMoveLeft: TAction
      Caption = 'Move Left'
      Hint = 'Move Left'
      ImageIndex = 73
      OnExecute = aMoveLeftExecute
    end
    object aMoveRight: TAction
      Caption = 'Move Right'
      Hint = 'Move Right'
      ImageIndex = 74
      OnExecute = aMoveRightExecute
    end
    object aSaveToolbar: TAction
      Caption = 'Save Toolbar'
      Hint = 'Save Toolbar'
      ImageIndex = 22
      OnExecute = aSaveToolbarExecute
    end
    object aAddToolbar: TAction
      Caption = 'Add'
      OnExecute = aAddToolbarExecute
    end
    object aRemoveToolbar: TAction
      Caption = 'Remove'
      OnExecute = aRemoveToolbarExecute
    end
    object aRenameToolbar: TAction
      Caption = 'Edit'
      OnExecute = aRenameToolbarExecute
    end
    object aHighlighterToolbar: TAction
      Caption = 'Highlighters'
      OnExecute = aHighlighterToolbarExecute
    end
  end
end
