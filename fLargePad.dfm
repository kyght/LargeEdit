object fLEdit: TfLEdit
  Left = 245
  Top = 128
  Width = 735
  Height = 563
  Caption = 'LargeEdit'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splitsubwin: TSplitter
    Left = 0
    Top = 487
    Width = 727
    Height = 1
    Cursor = crArrow
    Align = alBottom
    AutoSnap = False
    MinSize = 75
    OnCanResize = splitsubwinCanResize
  end
  object sbar: TStatusBar
    Left = 0
    Top = 490
    Width = 727
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Position'
        Width = 80
      end
      item
        Alignment = taCenter
        Width = 80
      end
      item
        Width = 300
      end>
    SimplePanel = False
  end
  object pRuler: TPanel
    Left = 0
    Top = 86
    Width = 727
    Height = 19
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '| | | | 5 | | | | 10'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Visible = False
  end
  object pSubWindow: TPanel
    Left = 0
    Top = 488
    Width = 727
    Height = 2
    Align = alBottom
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 2
    object pcTools: TPageControl
      Left = 0
      Top = 0
      Width = 727
      Height = 2
      Align = alClient
      Enabled = False
      TabOrder = 0
    end
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 727
    Height = 86
    AutoSize = True
    Bands = <
      item
        Control = ATBMain
        ImageIndex = -1
        MinHeight = 26
        Width = 723
      end
      item
        Control = ATBEdit
        ImageIndex = -1
        MinHeight = 26
        Width = 723
      end
      item
        Control = ATBMacro
        ImageIndex = -1
        MinHeight = 26
        Width = 723
      end>
    ParentShowHint = False
    ShowHint = True
    object ATBEditor: TActionToolBar
      Left = 9
      Top = 0
      Width = 670
      Height = 26
      ActionManager = ActionManager
      AllowHiding = True
      Caption = 'Edit Tool Bar'
      HorzSeparator = True
      Orientation = boLeftToRight
      ParentShowHint = False
      PersistentHotKeys = False
      ShowHint = True
      Spacing = 0
      Visible = False
    end
    object ActionToolBar1: TActionToolBar
      Left = 9
      Top = 0
      Width = 670
      Height = 25
      AllowHiding = True
      Caption = 'Macro Tool Bar'
      HorzSeparator = True
      Orientation = boLeftToRight
      PersistentHotKeys = False
      Spacing = 0
    end
    object ATBEdit: TActionToolBar
      Left = 9
      Top = 28
      Width = 710
      Height = 26
      ActionManager = ActionManager
      AllowHiding = True
      Caption = 'Edit Tool Bar'
      HorzSeparator = True
      Orientation = boLeftToRight
      PersistentHotKeys = False
      PopupMenu = PopupMenu2
      Spacing = 0
    end
    object ATBMacro: TActionToolBar
      Left = 9
      Top = 56
      Width = 710
      Height = 26
      ActionManager = ActionManager
      AllowHiding = True
      Caption = 'Macro Tool Bar'
      HorzSeparator = True
      Orientation = boLeftToRight
      PersistentHotKeys = False
      PopupMenu = PopupMenu2
      Spacing = 0
    end
    object ATBMain: TActionToolBar
      Left = 9
      Top = 0
      Width = 710
      Height = 26
      ActionManager = ActionManager
      AllowHiding = True
      Caption = 'Main Tool Bar'
      HorzSeparator = True
      Orientation = boLeftToRight
      PersistentHotKeys = False
      PopupMenu = PopupMenu2
      Spacing = 0
    end
  end
  object pruler2: TPanel
    Left = 0
    Top = 105
    Width = 727
    Height = 16
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = '....5....5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Pitch = fpFixed
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
  end
  object srcc: TScriptControl
    Left = 448
    Top = 144
    Width = 32
    Height = 32
    ControlData = {
      2143341208000000ED030000ED030000D2F1594E010000001400000010270000
      01000000}
  end
  object pcontent: TPanel
    Left = 0
    Top = 121
    Width = 727
    Height = 366
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 6
    object spltproj: TSplitter
      Left = 141
      Top = 1
      Width = 3
      Height = 364
      Cursor = crHSplit
    end
    object pproject: TPanel
      Left = 1
      Top = 1
      Width = 140
      Height = 364
      Align = alLeft
      TabOrder = 0
    end
    object pmain: TPanel
      Left = 144
      Top = 1
      Width = 582
      Height = 364
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ptabs: TPanel
        Left = 0
        Top = 0
        Width = 582
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object tabsfile: TTabControl
          Left = 0
          Top = 0
          Width = 582
          Height = 25
          Align = alTop
          HotTrack = True
          OwnerDraw = True
          PopupMenu = poptabs
          TabOrder = 0
          Tabs.Strings = (
            'file1.txt'
            'file2.txt')
          TabIndex = 0
          OnChange = tabsfileChange
          OnChanging = tabsfileChanging
          OnDrawTab = tabsfileDrawTab
        end
      end
      object peditor: TPanel
        Left = 0
        Top = 27
        Width = 582
        Height = 337
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object splitviewer: TSplitter
          Left = 544
          Top = 0
          Width = 4
          Height = 337
          Cursor = crHSplit
          Align = alRight
          Visible = False
        end
        object wscript: TScriptControl
          Left = 336
          Top = 16
          Width = 32
          Height = 32
          OnError = wscriptError
          ControlData = {
            2143341208000000ED030000ED030000D2F1594E010000002200000010270000
            010007004A00530063007200690070007400}
        end
        object pviewer: TPanel
          Left = 548
          Top = 0
          Width = 34
          Height = 337
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
        end
        object memo1: TSynEdit
          Left = 0
          Top = 0
          Width = 544
          Height = 337
          Align = alClient
          CodeFolding = False
          IndentGuides = False
          MatchBrace = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          PopupMenu = PopupMenu1
          TabOrder = 2
          OnClick = memo1Click
          OnDragDrop = memo1DragDrop
          OnDragOver = memo1DragOver
          OnKeyDown = memo1KeyDown
          OnKeyUp = memo1KeyUp
          BookMarkOptions.BookmarkImages = imglistBookmarks
          BorderStyle = bsNone
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -11
          Gutter.Font.Name = 'Terminal'
          Gutter.Font.Style = []
          Gutter.ShowLineNumbers = True
          Gutter.Width = 20
          MaxScrollWidth = 1025
          MaxUndo = 1524
          Options = [eoAutoIndent, eoDragDropEditing, eoDropFiles, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces, eoTrimTrailingSpaces]
          SearchEngine = SynSearch
          WantTabs = True
          WordWrapGlyph.MaskColor = clFuchsia
          OnChange = memo1Change
          OnClearBookmark = memo1ClearBookmark
          OnDropFiles = memo1DropFiles
          OnPlaceBookmark = memo1PlaceBookmark
          OnReplaceText = memo1ReplaceText
          RemovedKeystrokes = <
            item
              Command = ecLineBreak
              ShortCut = 8205
            end
            item
              Command = ecContextHelp
              ShortCut = 112
            end>
          AddedKeystrokes = <>
        end
      end
    end
  end
  object od: TOpenDialog
    DefaultExt = 'txt'
    Filter = 
      'All Files (*.*)|*.*|Text Files (*.txt, *.dat, *.csv)|*.txt; *.da' +
      't; *.csv'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open File'
    Left = 200
    Top = 160
  end
  object sd: TSaveDialog
    DefaultExt = 'txt'
    Filter = 
      'All Files (*.*)|*.*|Text Files (*.txt, *.dat, *.csv)|*.txt; *.da' +
      't; *.csv'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save File'
    Left = 240
    Top = 160
  end
  object MainActions: TActionList
    Images = frmLEImages.leimgsm
    Left = 8
    Top = 160
    object aopen: TAction
      Category = 'File'
      Caption = '&Open'
      Hint = 'Open file'
      ImageIndex = 30
      ShortCut = 16463
      OnExecute = aopenExecute
    end
    object aopenedit: TAction
      Category = 'File'
      Caption = 'Open in &Edit Mode'
      Hint = 'Open file in edit mode'
      ImageIndex = 49
      OnExecute = aopeneditExecute
    end
    object anext: TAction
      Category = 'Action'
      Caption = '&Next'
      Hint = 'Fetch the next block of lines'
      ImageIndex = 34
      ShortCut = 16452
      OnExecute = anextExecute
    end
    object aclosefile: TAction
      Category = 'File'
      Caption = '&Close'
      Hint = 'Close file'
      ShortCut = 16499
      OnExecute = aclosefileExecute
    end
    object ASave: TAction
      Category = 'File'
      Caption = '&Save'
      Hint = 'Save file'
      ImageIndex = 22
      ShortCut = 16467
      OnExecute = ASaveExecute
    end
    object adelfield: TAction
      Category = 'Action'
      Caption = 'Delete Field'
      Hint = 'Delete a field from a DAT file'
      ImageIndex = 46
      OnExecute = adelfieldExecute
    end
    object aSaveCur: TAction
      Category = 'File'
      Caption = 'Save Selection'
      Hint = 'Save Selection '
      OnExecute = aSaveCurExecute
    end
    object aLongLn: TAction
      Category = 'Search'
      Caption = '&Long Lines'
      Hint = 'Find lines with a number of charactors'
      OnExecute = aLongLnExecute
    end
    object aFind: TAction
      Category = 'Search'
      Caption = '&Find...'
      Hint = 'Find text'
      ImageIndex = 92
      ShortCut = 16454
      OnExecute = aFindExecute
    end
    object aReplace: TAction
      Category = 'Search'
      Caption = '&Replace...'
      Hint = 'Replace text'
      ImageIndex = 104
      ShortCut = 16466
      OnExecute = aReplaceExecute
    end
    object aSaveClose: TAction
      Category = 'File'
      Caption = 'Save && Close'
      Hint = 'Save & Close'
      ShortCut = 24643
      OnExecute = aSaveCloseExecute
    end
    object aexit: TAction
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit'
      ShortCut = 32883
      OnExecute = aexitExecute
    end
    object aSelectMode: TAction
      Category = 'Edit'
      Caption = 'Block Select'
      Hint = 'Turn on block selecting'
      OnExecute = aSelectModeExecute
    end
    object aEditCopy: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy'
      ImageIndex = 24
      OnExecute = aEditCopyExecute
    end
    object aEditCut: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut'
      ImageIndex = 25
      OnExecute = aEditCutExecute
    end
    object aEditPaste: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste'
      ImageIndex = 23
      OnExecute = aEditPasteExecute
    end
    object aEditSelectAll: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All'
      OnExecute = aEditSelectAllExecute
    end
    object aEditDelete: TEditDelete
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 46
      ShortCut = 16430
      OnExecute = aEditDeleteExecute
    end
    object aEditUndo: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo'
      ImageIndex = 99
      ShortCut = 16474
      OnExecute = aEditUndoExecute
    end
    object aFileNew: TAction
      Category = 'File'
      Caption = '&New'
      Hint = 'New file'
      ImageIndex = 21
      ShortCut = 16462
      OnExecute = aFileNewExecute
    end
    object aRecMac: TAction
      Category = 'WinMac'
      Caption = 'Record'
      Hint = 'Record Mouse & Keyboard Movements'
      ImageIndex = 86
      ShortCut = 49234
      OnExecute = aRecMacExecute
    end
    object aPlayMac: TAction
      Category = 'WinMac'
      Caption = 'Play'
      Hint = 'Playback Mouse & Keyboard Movements'
      ImageIndex = 85
      ShortCut = 49232
      OnExecute = aPlayMacExecute
    end
    object aSaveMac: TAction
      Category = 'WinMac'
      Caption = 'Save'
      Hint = 'Save Mouse & Keyboard Movements'
      ImageIndex = 89
      OnExecute = aSaveMacExecute
    end
    object aStopMac: TAction
      Category = 'WinMac'
      Caption = 'Stop'
      Enabled = False
      Hint = 'Stop Recording'
      ImageIndex = 87
      ShortCut = 49235
      OnExecute = aStopMacExecute
    end
    object aShowRuler: TAction
      Category = 'Tools'
      Caption = '&Ruler Toolbar'
      Hint = 'Show Ruler'
      Visible = False
      OnExecute = aShowRulerExecute
    end
    object aKMPlay: TAction
      Category = 'KeyMarco'
      Caption = '&Playback'
      Enabled = False
      Hint = 'Playback previously recorded keystrokes'
      ImageIndex = 85
      ShortCut = 123
      OnExecute = aKMPlayExecute
    end
    object AKMStop: TAction
      Category = 'KeyMarco'
      Caption = '&Stop'
      Enabled = False
      Hint = 'Stop recording keystrokes'
      ImageIndex = 87
      ShortCut = 122
      OnExecute = AKMStopExecute
    end
    object aKMRec: TAction
      Category = 'KeyMarco'
      Caption = '&Record'
      Hint = 'Start recording keystrokes'
      ImageIndex = 86
      ShortCut = 121
      OnExecute = aKMRecExecute
    end
    object aKMSave: TAction
      Category = 'KeyMarco'
      Caption = 'S&ave'
      Hint = 'Save keystrokes to file'
      ImageIndex = 89
      OnExecute = aKMSaveExecute
    end
    object aKMOpen: TAction
      Category = 'KeyMarco'
      Caption = '&Open'
      Hint = 'Open keystrokes from file'
      ImageIndex = 90
      OnExecute = aKMOpenExecute
    end
    object aOptions: TAction
      Category = 'Tools'
      Caption = '&Options'
      Hint = 'Editor options'
      OnExecute = aOptionsExecute
    end
    object aSaveAs: TAction
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As'
      OnExecute = aSaveAsExecute
    end
    object aEditRedo: TAction
      Category = 'Edit'
      Caption = '&Redo'
      Hint = 'Redo'
      ImageIndex = 100
      ShortCut = 24666
      OnExecute = aEditRedoExecute
    end
    object aShowMacro: TAction
      Category = 'Tools'
      Caption = 'Key M&acro Toolbar'
      Hint = 'Show Macro Toolbar'
      OnExecute = aShowMacroExecute
    end
    object aKMPlayPerLine: TAction
      Category = 'KeyMarco'
      Caption = 'Play per line'
      Enabled = False
      Hint = 'Play the recorded keystrokes multiple times'
      ImageIndex = 88
      OnExecute = aKMPlayPerLineExecute
    end
    object aGotoLine: TAction
      Category = 'Search'
      Caption = '&Goto Line'
      Hint = 'Goto line #'
      ImageIndex = 103
      ShortCut = 16455
      OnExecute = aGotoLineExecute
    end
    object aPrintPreview: TAction
      Category = 'File'
      Caption = 'Print P&review'
      Hint = 'Print Preview|Preview current document before printing'
      ImageIndex = 27
      OnExecute = aPrintPreviewExecute
    end
    object aPrint: TAction
      Category = 'File'
      Caption = '&Print'
      Hint = 'Print Document'
      ImageIndex = 26
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aPrinterSetup: TAction
      Category = 'File'
      Caption = 'Printer Setup...'
      Hint = 'Printer Setup'
      OnExecute = aPrinterSetupExecute
    end
    object aEmailTxt: TAction
      Category = 'SendTo'
      Caption = 'As &Text'
      Hint = 'Email as Text'
      ImageIndex = 39
      OnExecute = aEmailTxtExecute
    end
    object aEmailAttach: TAction
      Category = 'SendTo'
      Caption = 'As &Attachment'
      Hint = 'Email as Attachment'
      ImageIndex = 40
      OnExecute = aEmailAttachExecute
    end
    object aExpHTML: TAction
      Category = 'SendTo'
      Caption = '&HTML...'
      Hint = 'Export as HTML'
      ImageIndex = 77
      OnExecute = aExpHTMLExecute
    end
    object aExpRTF: TAction
      Category = 'SendTo'
      Caption = '&RTF...'
      Hint = 'Export as Rich Text'
      ImageIndex = 76
      OnExecute = aExpRTFExecute
    end
    object aAbout: TAction
      Category = 'Help'
      Caption = '&About'
      Hint = 'About'
      OnExecute = aAboutExecute
    end
    object aSpellCheck: TAction
      Category = 'Tools'
      Caption = '&Spell Check'
      Hint = 'Spell Check'
      ImageIndex = 84
      ShortCut = 118
      OnExecute = aSpellCheckExecute
    end
    object aextendfr: TAction
      Category = 'Search'
      Caption = 'Extended Find && Replace'
      Hint = 
        'Extended File & Replace|Search multiple documents at the same ti' +
        'me'
      ImageIndex = 60
      OnExecute = aextendfrExecute
    end
    object aShowTools: TAction
      Category = 'Tools'
      Caption = 'Show &Tools'
      Hint = 'Show Tools'
      OnExecute = aShowToolsExecute
    end
    object aIndent: TAction
      Category = 'Edit'
      Caption = 'Indent'
      Hint = 'Indent'
      ImageIndex = 28
      OnExecute = aIndentExecute
    end
    object aUnIndent: TAction
      Category = 'Edit'
      Caption = 'UnIndent'
      Hint = 'UnIndent'
      ImageIndex = 29
      OnExecute = aUnIndentExecute
    end
    object aUserTBar: TAction
      Category = 'Tools'
      Caption = '&User Toolbar'
      Hint = 'Show User Toolbar'
      OnExecute = aUserTBarExecute
    end
    object aSelHighLight: TAction
      Category = 'Tools'
      Caption = 'Select &HighLighter...'
      Hint = 'Select Highlighter'
      ImageIndex = 82
      OnExecute = aSelHighLightExecute
    end
    object aCustomUserBar: TAction
      Category = 'Tools'
      Caption = 'Customize Toolbar'
      Hint = 'Customize User Toolbar'
      OnExecute = aCustomUserBarExecute
    end
    object aViewAsGrid: TAction
      Category = 'View'
      Caption = 'View as &Grid'
      Hint = 'View data text in grid format'
      ImageIndex = 62
      OnExecute = aViewAsGridExecute
    end
    object anethome: TAction
      Category = 'Help'
      Caption = 'NetLegger Home Page'
      Hint = 
        'NetLegger Homepage|Get more information on this and other produc' +
        'ts'
      ImageIndex = 44
      OnExecute = anethomeExecute
    end
    object ahelp: TAction
      Category = 'Help'
      Caption = 'Context Help'
      Hint = 
        'Context Help|Displays help related to the component currently se' +
        'lected'
      ImageIndex = 64
      ShortCut = 112
      OnExecute = ahelpExecute
    end
    object ahelpTopics: TAction
      Category = 'Help'
      Caption = 'Help Topics'
      Hint = 'Help Topics|Displays a list of help topics'
      ImageIndex = 63
      OnExecute = ahelpTopicsExecute
    end
    object aenterserial: TAction
      Category = 'Help'
      Caption = 'Enter Serial Number...'
      Hint = 
        'Enter Serial Number|Enter Serial Number you received after purch' +
        'asing LargeEdit'
      OnExecute = aenterserialExecute
    end
    object abuyLE: TAction
      Category = 'Help'
      Caption = 'Buy LargeEdit...'
      Hint = 'Buy LargeEdit|Purchase your copy of LargeEdit'
      ImageIndex = 5
      OnExecute = abuyLEExecute
    end
    object anetsupport: TAction
      Category = 'Help'
      Caption = 'NetLegger Support Page'
      Hint = 
        'NetLegger Support|Have problems using this product, contact our ' +
        'support centre'
      OnExecute = anetsupportExecute
    end
    object aupdates: TAction
      Category = 'Help'
      Caption = 'Check for Updates'
      Hint = 'Check for Update|Get the lastest updates to LargeEdit'
      OnExecute = aupdatesExecute
    end
    object aonlinehelp: TAction
      Category = 'Help'
      Caption = 'Online Help'
      Hint = 'Online Help|Help is available online at anytime'
      OnExecute = aonlinehelpExecute
    end
    object atutorials: TAction
      Category = 'Help'
      Caption = 'Tutorials'
      Hint = 'Tutorials|Video tutorials on How to use LargeEdit'
      OnExecute = atutorialsExecute
    end
    object auppercase: TAction
      Category = 'Edit'
      Caption = 'Upper'
      Hint = 'Upper Case Selection'
      ImageIndex = 11
      OnExecute = auppercaseExecute
    end
    object alowercase: TAction
      Category = 'Edit'
      Caption = 'Lower'
      Hint = 'Lower Case Selection'
      ImageIndex = 10
      OnExecute = alowercaseExecute
    end
    object aAsciiCode: TAction
      Category = 'Edit'
      Caption = 'ASCII Code'
      Hint = 'Insert an ASCII code charactor'
      OnExecute = aAsciiCodeExecute
    end
    object aASCIIvalue: TAction
      Category = 'Tools'
      Caption = 'Get ASCII Code'
      OnExecute = aASCIIvalueExecute
    end
    object aNumCount: TAction
      Category = 'Edit'
      Caption = 'Num Count'
      Hint = 'Insert the numeric value for a range of numbers'
      OnExecute = aNumCountExecute
    end
    object aViewASCIICodes: TAction
      Category = 'Tools'
      Caption = 'View ASCII Codes'
      Hint = 
        'View ASCII Chart|View a list of ASCII code values includes hex, ' +
        'dec, and oct'
      OnExecute = aViewASCIICodesExecute
    end
    object aGetCharforCode: TAction
      Category = 'Tools'
      Caption = 'Get Charactor'
      Hint = 'Get Charactor|Find out the charactor for a code'
      OnExecute = aGetCharforCodeExecute
    end
    object aSymName: TAction
      Category = 'Tools'
      Caption = 'View Symbol Names'
      Hint = 'View Symbol Name|View a list of ASCII Symbols and their names'
      OnExecute = aSymNameExecute
    end
    object aviewHTMLcodes: TAction
      Category = 'Tools'
      Caption = 'View HTML codes'
      Hint = 'View HTML Codes|View a list of HTML codes'
      OnExecute = aviewHTMLcodesExecute
    end
    object arunfile: TAction
      Category = 'Action'
      Caption = 'Run File'
      Hint = 'Run File|Runs the file with the associated program'
      ImageIndex = 61
      ShortCut = 120
      OnExecute = arunfileExecute
    end
    object aOpenHex: TAction
      Category = 'File'
      Caption = 'Open as Hex...'
      ImageIndex = 58
      OnExecute = aOpenHexExecute
    end
    object aHtmlColors: TAction
      Category = 'Tools'
      Caption = 'HTML Colors'
      Hint = 'HTML Colors|Find the hex value for a color'
      ImageIndex = 38
      OnExecute = aHtmlColorsExecute
    end
    object aCalendar: TAction
      Category = 'Tools'
      Caption = 'Calendar'
      Hint = 'Calendar|View a calendar and select a date to insert'
      ImageIndex = 13
      OnExecute = aCalendarExecute
    end
    object aReposit: TAction
      Category = 'Tools'
      Caption = 'Code Repository'
      Hint = 'Code Repository|Store you text and code snipets for quick recall'
      ImageIndex = 36
      OnExecute = aRepositExecute
    end
    object aFindNext: TAction
      Category = 'Search'
      Caption = 'Find Next'
      Hint = 'Find Next|Find the next occurence of the last find'
      ImageIndex = 105
      ShortCut = 114
      OnExecute = aFindNextExecute
    end
    object aFtpSaveAs: TAction
      Category = 'File'
      Caption = 'FTP Save As...'
      OnExecute = aFtpSaveAsExecute
    end
    object aftpOpen: TAction
      Category = 'File'
      Caption = 'FTP Open...'
      OnExecute = aftpOpenExecute
    end
    object aFTPSave: TAction
      Category = 'File'
      Caption = 'FTP Save'
      OnExecute = aFTPSaveExecute
    end
    object aHexMode: TAction
      Category = 'File'
      Caption = 'Switch to Hex Mode'
      ImageIndex = 14
      OnExecute = aHexModeExecute
    end
    object aOpenMac: TAction
      Category = 'WinMac'
      Caption = 'Open'
      Hint = 'Open Marco'
      ImageIndex = 90
      OnExecute = aOpenMacExecute
    end
    object aNextLong: TAction
      Category = 'Search'
      Caption = 'Next Long Line'
      OnExecute = aNextLongExecute
    end
    object aLineRange: TAction
      Category = 'Search'
      Caption = 'Line Range'
      OnExecute = aLineRangeExecute
    end
    object anewwindow: TAction
      Category = 'File'
      Caption = 'New Window'
      Visible = False
      OnExecute = anewwindowExecute
    end
    object aXpath: TAction
      Category = 'Action'
      Caption = 'XPath Search'
      ImageIndex = 16
      OnExecute = aXpathExecute
    end
    object aMacRepos: TAction
      Category = 'Tools'
      Caption = 'Macro Repository'
      Hint = 
        'Macro Repository|Store you frequently used marcos here for quick' +
        ' recall'
      ImageIndex = 69
      Visible = False
      OnExecute = aMacReposExecute
    end
    object aSMCreate: TAction
      Category = 'ScrMac'
      Caption = 'Create'
      ImageIndex = 109
      OnExecute = aSMCreateExecute
    end
    object aSMPlay: TAction
      Category = 'ScrMac'
      Caption = 'Play'
      ImageIndex = 108
      OnExecute = aSMPlayExecute
    end
    object aSMEdit: TAction
      Category = 'ScrMac'
      Caption = 'Edit'
      ImageIndex = 107
      OnExecute = aSMEditExecute
    end
    object aSMPlayMany: TAction
      Category = 'ScrMac'
      Caption = 'Play Multiples'
      ImageIndex = 110
      OnExecute = aSMPlayManyExecute
    end
    object aprojectwin: TAction
      Category = 'View'
      Caption = 'Project Window'
      Hint = 'Project Explorer'
      ImageIndex = 78
      OnExecute = aprojectwinExecute
    end
    object aprior: TAction
      Category = 'Action'
      Caption = '&Prevous'
      Hint = 'Load prior block of lines'
      ImageIndex = 33
      ShortCut = 24644
      OnExecute = apriorExecute
    end
    object aDelDup: TAction
      Category = 'Action'
      Caption = 'Sort && Remove Duplicates'
      OnExecute = aDelDupExecute
    end
    object anexttab: TAction
      Caption = 'Next Tab'
      ShortCut = 16393
      OnExecute = anexttabExecute
    end
    object apretab: TAction
      Caption = 'Previous Tab'
      ShortCut = 24585
      OnExecute = apretabExecute
    end
    object aWebPreview: TAction
      Category = 'View'
      Caption = 'Web Preview'
      Hint = 'Web Browser View'
      ImageIndex = 37
      OnExecute = aWebPreviewExecute
    end
    object aopenproject: TAction
      Category = 'Project'
      Caption = 'Open Project Group'
      Hint = 'Open Project Group'
      ImageIndex = 81
      OnExecute = aopenprojectExecute
    end
    object aaddproject: TAction
      Category = 'Project'
      Caption = 'Add Project'
      Hint = 'Add Project'
      ImageIndex = 45
      OnExecute = aaddprojectExecute
    end
    object aaddfolder: TAction
      Category = 'Project'
      Caption = 'Add Folder'
      Hint = 'Add Folder'
      ImageIndex = 52
      OnExecute = aaddfolderExecute
    end
    object aaddfile: TAction
      Category = 'Project'
      Caption = 'Add File'
      Hint = 'Add File'
      ImageIndex = 21
      OnExecute = aaddfileExecute
    end
    object ascanfiles: TAction
      Category = 'Project'
      Caption = 'Scan && Add Folders\Files'
      Hint = 'Scan & Add Folders\Files'
      ImageIndex = 51
      OnExecute = ascanfilesExecute
    end
    object adeleteprojitem: TAction
      Category = 'Project'
      Caption = 'Delete'
      Hint = 'Delete Item'
      ImageIndex = 46
      OnExecute = adeleteprojitemExecute
    end
    object anewprojgroup: TAction
      Category = 'Project'
      Caption = 'New Project Group'
      Hint = 'New Project Group'
      ImageIndex = 50
      OnExecute = anewprojgroupExecute
    end
    object abaseencode: TAction
      Category = 'Action'
      Caption = 'Base64Encode'
      OnExecute = abaseencodeExecute
    end
    object ashowhex: TAction
      Category = 'View'
      Caption = 'Hex View'
      Hint = 'Hex View'
      ImageIndex = 58
      OnExecute = ashowhexExecute
    end
    object axslttrans: TAction
      Category = 'Action'
      Caption = 'Transform'
      OnExecute = axslttransExecute
    end
    object axsltrefresh: TAction
      Category = 'Action'
      Caption = 'Refresh'
      OnExecute = axsltrefreshExecute
    end
    object atransxnode: TAction
      Category = 'Action'
      Caption = 'Transform XNODE'
      OnExecute = atransxnodeExecute
    end
    object alighton: TAction
      Category = 'Tools'
      Caption = 'Highlighter On'
      Hint = 'Highlighter On\Off'
      ImageIndex = 48
      OnExecute = alightonExecute
    end
    object asavetemplate: TAction
      Category = 'File'
      Caption = 'Save As Template...'
      OnExecute = asavetemplateExecute
    end
    object aopentemplate: TAction
      Category = 'File'
      Caption = 'New (Template)...'
      OnExecute = aopentemplateExecute
    end
    object asaveall: TAction
      Category = 'File'
      Caption = 'Save All'
      Hint = 'Save All'
      ImageIndex = 98
      ShortCut = 24659
      OnExecute = asaveallExecute
    end
    object acloseall: TAction
      Category = 'File'
      Caption = 'Close All'
      OnExecute = acloseallExecute
    end
    object aexplorewin: TAction
      Category = 'View'
      Caption = 'Explorer Window'
      Hint = 'Windows Explorer'
      ImageIndex = 80
      OnExecute = aexplorewinExecute
    end
    object aSMPlayLast: TAction
      Category = 'ScrMac'
      Caption = 'Play Last'
      Enabled = False
      ShortCut = 16507
      OnExecute = aSMPlayLastExecute
    end
    object awordwrap: TAction
      Category = 'Edit'
      Caption = 'Word Wrap'
      Hint = 'Word Wrap'
      ImageIndex = 83
      OnExecute = awordwrapExecute
    end
    object afindprevious: TAction
      Category = 'Search'
      Caption = 'Find Previous'
      Hint = 'Find Previous|Find the previous occurence of the last find'
      ShortCut = 8306
      OnExecute = afindpreviousExecute
    end
    object aSortAsc: TAction
      Category = 'Action'
      Caption = 'Sort Ascending'
      ImageIndex = 101
      OnExecute = aSortAscExecute
    end
    object aSortDesc: TAction
      Category = 'Action'
      Caption = 'Sort Descending'
      ImageIndex = 102
      OnExecute = aSortDescExecute
    end
    object aSortAscRmDup: TAction
      Category = 'Action'
      Caption = 'Ascending'
      OnExecute = aSortAscRmDupExecute
    end
    object aSortDescRmDup: TAction
      Category = 'Action'
      Caption = 'Descending'
      OnExecute = aSortDescRmDupExecute
    end
    object aSetBookmark: TAction
      Category = 'Edit'
      Caption = 'Bookmark 0'
      OnExecute = aSetBookmarkExecute
    end
    object aGotoBookmark: TAction
      Category = 'Edit'
      Caption = 'Bookmark 0'
      OnExecute = aGotoBookmarkExecute
    end
    object aSetBookmark1: TAction
      Tag = 1
      Category = 'Edit'
      Caption = 'Bookmark 1'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark2: TAction
      Tag = 2
      Category = 'Edit'
      Caption = 'Bookmark 2'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark3: TAction
      Tag = 3
      Category = 'Edit'
      Caption = 'Bookmark 3'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark4: TAction
      Tag = 4
      Category = 'Edit'
      Caption = 'Bookmark 4'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark5: TAction
      Tag = 5
      Category = 'Edit'
      Caption = 'Bookmark 5'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark6: TAction
      Tag = 6
      Category = 'Edit'
      Caption = 'Bookmark 6'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark7: TAction
      Tag = 7
      Category = 'Edit'
      Caption = 'Bookmark 7'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark8: TAction
      Tag = 8
      Category = 'Edit'
      Caption = 'Bookmark 8'
      OnExecute = aSetBookmarkExecute
    end
    object aSetBookmark9: TAction
      Tag = 9
      Category = 'Edit'
      Caption = 'Bookmark 9'
      OnExecute = aSetBookmarkExecute
    end
    object aGotoBookmark1: TAction
      Tag = 1
      Category = 'Edit'
      Caption = 'Bookmark 1'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark2: TAction
      Tag = 2
      Category = 'Edit'
      Caption = 'Bookmark 2'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark3: TAction
      Tag = 3
      Category = 'Edit'
      Caption = 'Bookmark 3'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark4: TAction
      Tag = 4
      Category = 'Edit'
      Caption = 'Bookmark 4'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark5: TAction
      Tag = 5
      Category = 'Edit'
      Caption = 'Bookmark 5'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark6: TAction
      Tag = 6
      Category = 'Edit'
      Caption = 'Bookmark 6'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark7: TAction
      Tag = 7
      Category = 'Edit'
      Caption = 'Bookmark 7'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark8: TAction
      Tag = 8
      Category = 'Edit'
      Caption = 'Bookmark 8'
      OnExecute = aGotoBookmarkExecute
    end
    object aGotoBookmark9: TAction
      Tag = 9
      Category = 'Edit'
      Caption = 'Bookmark 9'
      OnExecute = aGotoBookmarkExecute
    end
    object aSMPlayFunc: TAction
      Category = 'ScrMac'
      Caption = 'Play Function'
      ImageIndex = 111
      OnExecute = aSMPlayFuncExecute
    end
    object addcurrent: TAction
      Category = 'Project'
      Caption = 'Add Current File'
      ImageIndex = 48
      OnExecute = addcurrentExecute
    end
    object addfilegroup: TAction
      Category = 'Project'
      Caption = 'Add Open Files'
      ImageIndex = 112
      OnExecute = addfilegroupExecute
    end
    object afileproperties: TAction
      Category = 'File'
      Caption = 'Properties...'
      OnExecute = afilepropertiesExecute
    end
    object amanualactivate: TAction
      Category = 'Help'
      Caption = 'Manual Activate...'
      Visible = False
      OnExecute = amanualactivateExecute
    end
    object ascripthelp: TAction
      Category = 'Help'
      Caption = 'LargeEdit Scripting Help'
      OnExecute = ascripthelpExecute
    end
    object amatchbracket: TAction
      Category = 'Search'
      Caption = 'Matching Bracket'
      OnExecute = amatchbracketExecute
    end
    object aclicklinks: TAction
      Category = 'Tools'
      Caption = 'Links On'
      OnExecute = aclicklinksExecute
    end
  end
  object fd: TFindDialog
    OnFind = fdFind
    Left = 88
    Top = 160
  end
  object rd: TReplaceDialog
    Options = [frDown, frHideUpDown]
    OnFind = rdFind
    OnReplace = rdReplace
    Left = 128
    Top = 160
  end
  object ImageList1: TImageList
    Left = 168
    Top = 160
    Bitmap = {
      494C010149004A00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003001000001002000000000000030
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001010FF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      FF00000000001010FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000001010FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000001010
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000FFFF0000FF000000FF000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000FFFF
      0000FF000000FF000000C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000000000084848400C6C6C600FF00
      0000FF000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF008484
      00008484000084848400C6C6C600FFFF0000C6C6C60000000000848484008484
      8400C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFF0000C6C6C600FFFF0000C6C6C60000000000C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF008484
      000084848400FFFF0000FFFFFF00FFFF0000C6C6C600FFFF000000000000C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF0084848400FFFFFF00FFFF0000FFFFFF00FFFF0000C6C6C60000000000C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF0084848400FFFFFF00FFFF0000FFFFFF0000000000C6C6C600C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFF00008400
      0000FFFFFF0084840000848484008484840000000000C6C6C600FFFFFF008400
      0000FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF0000000000000000000000000084848400C6C6C60084000000FFFF
      FF00FFFFFF0084840000FFFF0000848400000084000084000000FFFFFF00FFFF
      FF0084000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00000000000000000084848400FFFFFF00FFFF00008400
      0000FFFFFF0084840000FFFFFF00FFFF00008484000084000000FFFFFF008400
      0000FFFF0000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000FF000000000084848400FFFFFF00FFFFFF00C6C6
      C600FFFFFF00FFFFFF00848400008484000084840000FFFFFF00FFFFFF00C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF0000000000000000000000
      000000000000000000000000FF000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      0000000000000000FF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000639C9C00639C9C00639C
      9C00639C9C00639C9C00639C9C00639C9C00639C9C00639C9C00639C9C00639C
      9C00639C9C00639C9C00639C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000063630000636300006363000063
      6300006363000063630000636300006363000063630000636300006363000063
      63000063630000636300639C9C00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000000000000000000BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000639C9C009CCECE009CCECE009CCE
      CE009CCECE009CCECE009CCECE009CCECE009CCECE009CCECE009CCECE009CCE
      CE00639C9C00639C9C0000636300000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008484000000
      0000BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000639C9C00FFFFFF00FFFF
      FF009CCECE00FFFFFF00FFFFFF009CCECE00FFFFFF00FFFFFF009CCECE00FFFF
      FF00FFFFFF009CCECE0000636300000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000639C9C00FFFFFF00FFFF
      FF009CCECE00FFFFFF00FFFFFF009CCECE00FFFFFF00FFFFFF009CCECE00FFFF
      FF00FFFFFF009CCECE00639C9C00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF0000FFFF0000000000000000000000
      00000000000000000000000000000000000000000000639C9C009CCECE009CCE
      CE0063319C0063319C0063319C0063319C009CCECE009CCECE009CCECE009CCE
      CE009CCECE009CCECE00639C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      00000000000000000000000000000000000000000000639C9C00FFFFFF00FFFF
      FF0063319C00FFFFFF00FFFFFF0063319C00FFFFFF00FFFFFF009CCECE00FFFF
      FF00FFFFFF009CCECE00639C9C00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000C6C6C600000000000000000000000000639C9C00FFFFFF00FFFF
      FF0063319C00FFFFFF00FFFFFF0063319C00FFFFFF00FFFFFF009CCECE00FFFF
      FF00FFFFFF009CCECE00639C9C00000000000000000000000000000000000000
      000000FFFF0000000000000000000000000000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF0000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000639C9C009CCECE009CCE
      CE0063319C0063319C0063319C0063319C009CCECE009CCECE009CCECE009CCE
      CE009CCECE009CCECE00639C9C00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C60000FFFF0000FFFF0000FFFF0000000000000000008484
      84000000000000000000000000000000000000000000639C9C00FFFFFF00FFFF
      FF009CCECE00FFFFFF00FFFFFF009CCECE00FFFFFF00FFFFFF009CCECE00FFFF
      FF00FFFFFF009CCECE00639C9C00000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600FFFFFF0000FFFF0000FFFF0000FFFF0000FFFF000000
      00000000000000000000000000000000000000000000639C9C00FFFFFF00FFFF
      FF009CCECE00FFFFFF00FFFFFF009CCECE00FFFFFF00FFFFFF009CCECE00FFFF
      FF00FFFFFF009CCECE00639C9C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000000000000000000000000000000000000000009C3131009C3131009C31
      31009C3131009C3131009C3131009C3131009C3131009C3131009C3131009C31
      31009C3131009C313100006363009C3131000000000000000000000000007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF0000FFFF0000FF
      FF0000FFFF0000000000000000000000000000000000CE633100CE633100CE63
      3100CE633100CE633100CE633100CE633100CE633100CE633100CE633100CE63
      3100CE633100CE6331009C3131009C3131000000000000000000000000000000
      00000000000000FFFF000084840000FFFF000084840000FFFF00008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000848400008484000084
      8400008484000000000000000000000000000000000000000000CE9C6300CE9C
      6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C6300CE9C
      6300CE9C6300CE9C6300CE9C63009C3131000000000000000000000000000000
      00000000000000000000000000000084840000FFFF000084840000FFFF000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400848484000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000848484008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00008400000084000000840000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF00FF00FF00
      FF0000000000FFFFFF000000000000000000FFFFFF000084000000840000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF00000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FF000000FF00
      0000FF00000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF0000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00008400000084
      0000008400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000080800006363630052525200B5B5
      B500000000004A4A4A0094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C8C8C00ADADAD00B5B5B5000000
      0000D6D6D600FFFFFF00C6C6C60000000000B5B5B5007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400D6D6D600C6C6C6002121
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5A5A50000000000C6C6C6000000
      00000000000000000000000000000000000000000000FF00000000000000FF00
      00000000000000000000FF0000000000000000000000FF000000000000000000
      0000FF00000000000000FF000000FF000000000000000000000000000000FF00
      000000000000FF0000000000000000000000FF0000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000000
      000000000000000000000000000000000000292929007B7B7B00848484000000
      0000BDBDBD00DEDEDE00A5A5A500E7E7E70094949400ADADAD005A5A5A000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      00000000000000000000FF0000000000000000000000FF000000000000000000
      0000FF00000000000000FF00000000000000000000000000000000000000FF00
      0000FF000000000000000000000000000000FF0000000000000000000000FF00
      0000000000000000000000000000000000000000000000FFFF00000000000084
      8400008484000084840000848400008484000084840000848400008484000084
      84000000000000000000000000000000000084848400A5A5A500ADADAD002121
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7E7E700FFFFFF00080808005252
      52005A5A5A005A5A5A00C6C6C6000000000000000000FF00000000000000FF00
      00000000000000000000FF0000000000000000000000FF000000FF000000FF00
      0000FF00000000000000FF00000000000000000000000000000000000000FF00
      000000000000FF0000000000000000000000FF0000000000000000000000FF00
      0000FF00000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008484000084840000848400008484000084840000848400008484000084
      84000084840000000000000000000000000084848400BDBDBD00DEDEDE001818
      1800FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CECECE005A5A5A000000000000000000FF00000000000000FF00
      000000000000FF000000FF000000FF00000000000000FF000000000000000000
      0000FF00000000000000FF00000000000000000000000000000000000000FF00
      0000FF0000000000000000000000FF000000FF000000FF00000000000000FF00
      0000FF0000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000084840000848400008484000084840000848400008484000084
      840000848400008484000000000000000000292929007B7B7B007B7B7B000000
      00007B6B6B006B5A5A006B5A5A006B5A5A009C9C9C00E7E7E700A5A5A500DEDE
      DE00A5A5A500F7F7F7005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400A5A5A500ADADAD003121
      21008CFFFF0084FFFF0084FFFF0084FFFF006B5A5A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005A5A5A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      00000000000000000000000000000000000084848400BDBDBD00C6C6C6002918
      180094FFFF008CFFFF008CFFFF008CFFFF0073636300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005A5A5A00000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      000000000000000000000000000000000000292929007B7B7B00848484000800
      0000216B6B00215A5A00215A5A001863630042393900EFEFEF00A5A5A500DEDE
      DE00A5A5A500EFEFEF005A5A5A00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400A5A5A500ADADAD002121
      2100FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005A5A5A0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400BDBDBD00C6C6C6001818
      1800FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005A5A5A0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000292929007B7B7B007B7B7B000000
      0000737373006B6B6B006B6B6B006B6B6B00737373006B6B6B006B6B6B006B6B
      6B006B6B6B00737373006B6B6B0000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A00D6D6D600D6D6D6004A4A
      4A00EFEFEF009C9C9C00A5A5A500949494007B7B7B00A5A5A500A5A5A500A5A5
      A500A5A5A5009494940063636300000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005A5A5A00DEDEDE00DEDEDE004A4A
      4A00FFFFFF00B5B5B500A5A5A500ADADAD007B7B7B00DEDEDE009C9C9C00BDBD
      BD00BDBDBD00B5B5B5006B6B6B00000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000212121005A5A5A005A5A5A001818
      18007B7B7B007B7B7B007B7B7B005A5A5A00292929007B7B7B007B7B7B007B7B
      7B007B7B7B005A5A5A0029292900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF000084840000FFFF000000
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400000000000000
      0000000000000000000000000000000000008400840000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000084848400C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF000084840000FFFF000000
      0000FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000008400840084008400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF000000000000FFFF0000FFFF0000FF
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF0000848400008484000084
      8400FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000084
      8400008484000000000000000000000000008400840084008400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840000000000000000000000
      00000084840000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000008400840084008400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000FFFFFF00FFFFFF0084008400000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840084848400848484008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008400
      840000000000000000008484840084848400FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF000084840000FFFF0000FFFF00C6C6
      C6000000000000000000000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C60000848400C6C6C60000FFFF000084840000FFFF000084
      840000FFFF00008484000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008400
      84008400840084008400000000008484840084848400FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000084840000FFFF0000FFFF0000FF
      FF00C6C6C60000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000848400C6C6C60000FFFF000084840000FF
      FF0000848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000084008400840084008400840000000000848484008484840000000000FFFF
      FF000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000000000FFFF0000FF
      FF0000FFFF00C6C6C600000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C60000848400C6C6C60000FFFF000084
      840000000000000084000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF0000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00C6C6C60000000000000000000000000000848400848484000000000000FF
      FF0000FFFF0000FFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000848400C6C6C6000000
      00000000FF00000084000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400FFFFFF00FFFFFF0000000000000000008484840084848400848484008484
      8400848484000000000000FFFF0000FFFF00C6C6C6008484840084848400C6C6
      C60000FFFF0000FFFF00000000000000000084848400FFFFFF00C6C6C600C6C6
      C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000FF00000084000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400FFFFFF0000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF00008484000084840000FF
      FF0000FFFF0000FFFF00000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00C6C6C600848484000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00848484000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000084840000FFFF0000FFFF0000FFFF0000FF
      FF00C6C6C60000848400000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000084
      8400008484000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400FFFFFF00C6C6
      C60084848400C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840084848400FFFF
      FF0084848400FFFFFF0084848400848484000000000000000000000000000000
      000000000000FFFFFF000000FF000000FF000000FF000000FF000000FF00FFFF
      FF00008400000084000000840000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00000000000000000000848484008484840084848400FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF00FF00
      0000FF000000FF000000FFFFFF00000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000008484000084840000848400008484000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000084
      8400008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF008400000000000000000000000000000000000000FFFF0000000000000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FF000000FF00
      0000FF000000FFFFFF00FFFFFF00000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      00008400000000000000000000000000000000000000FFFF00000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF008400000000000000000000000000000000000000FFFF000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000084
      0000008400000084000000840000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000000000000000000000000000000000000FFFF00000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      00000084840000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF0000000000FFFFFF00000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF00000000000000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF00FFFFFF0000FFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00008400000084
      000000840000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000008484
      8400000000008484840000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000848484000000000000000000FFFF00008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFFFF00FFFF
      FF000084000000840000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFF000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FF000000FF000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000000000000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000000000008484
      84008484840000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000008484840000000000000000008484
      84000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000FF000000000000000000000000000000FFFFFF00000000000000
      000000840000FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000084
      00000084000000840000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000000000000000000000000000FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      000000000000000000000000000000000000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400FFFFFF00FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000FFFF000084840000848400FFFF000000000000FFFFFF000000
      000000000000000000000000000000000000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      84008484840084848400000000000000000000848400FFFFFF000084840000FF
      FF00FFFFFF00FFFFFF00FFFFFF000084840000848400FFFFFF00FFFFFF0000FF
      FF00FFFFFF0000848400FFFFFF0000848400FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840084848400000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6008484840000000000000000000084840000FFFF00FFFFFF000084
      8400FFFFFF0000FFFF0000848400FFFFFF00FFFFFF0000848400FFFFFF00FFFF
      FF000084840000FFFF00FFFFFF0000848400FFFF000000000000FFFFFF000000
      000000000000000000000000000000000000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000848400C6C6
      C600C6C6C600C6C6C600008484000084840000848400C6C6C600C6C6C600C6C6
      C6000084840084848400000000000000000000848400FFFFFF00FFFFFF0000FF
      FF00C6C6C60000848400FFFFFF0000FFFF00FFFFFF00FFFFFF0000848400C6C6
      C600FFFFFF00FFFFFF00FFFFFF0000848400FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840000FFFF000084
      8400C6C6C6000084840000000000000000000000000000848400C6C6C6000084
      8400C6C6C6008484840000000000000000000084840000FFFF00FFFFFF00FFFF
      FF000084840000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF000084
      8400FFFFFF0000FFFF00FFFFFF0000848400FFFF000000000000FFFFFF000000
      000000000000000000000000000000000000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF000084840000000000FFFFFF00FFFFFF0000FFFF000000000000848400C6C6
      C600C6C6C60084848400000000000000000000848400FFFFFF00FFFFFF000084
      8400FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF0000848400FFFFFF00FFFFFF0000848400FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFF000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000000000008484840000FFFF00C6C6
      C60000000000FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF00000000000084
      8400C6C6C6008484840000000000000000000084840000FFFF0000848400FFFF
      FF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFF
      FF00FFFFFF0000848400FFFFFF0000848400FFFF000000000000FFFFFF000000
      000000000000000000000000000000000000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000084848400C6C6C6000000
      000000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF000000
      0000008484008484840000000000000000000084840000848400FFFFFF0000FF
      FF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FF
      FF00FFFFFF00FFFFFF000084840000848400FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840000000000FFFF0000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFF
      FF00000000000084840000000000000000000084840000848400008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      840000848400008484000084840000848400FFFF000000000000FFFFFF000000
      000000000000000000000000000000000000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000084848400FFFFFF00FFFF
      FF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF00FFFFFF00FFFFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFF0000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      000000000000000000000000000000000000000000000021A5000021A5000021
      A5000021A5000021A5000021A5000021A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C6008484
      840000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B007B7B7B0000000000FFFF0000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000084848400848484000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000000000000000000084848400C6C6
      C600848400000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000084848400FFFF
      FF000000000000000000FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000007B7B7B000000000000000000000000007B7B7B00000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000000000008484
      0000FFFFFF0084840000000000000000000000000000FFFF0000848484008484
      840084848400000000000000000000000000000000000000000084848400FFFF
      FF00000000000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000000000000000
      000084840000FFFFFF000000000084840000FFFF000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000000000000000
      00000000000084840000FFFFFF00000000008484000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000084840000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000007B7B7B000000000000000000000000007B7B7B00000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000084840000FFFFFF0084840000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000008484000000000000C6C6C6000000
      000084848400000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B0000000000FFFF0000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008484840000FF
      FF0000000000848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFF000000000000FFFF000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF008484
      840000FFFF00848484000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600FFFFFF00848484000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840084848400FFFF
      FF0084848400C6C6C6000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60084848400000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000FFFF0000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084000000FFFF0000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C60084000000FFFF0000FF000000FF000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF0084000000FFFF0000FF000000FF000000C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      00000000000084848400C6C6C600FF000000FF000000C6C6C600FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C60000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      0000C6C6C600000000008484840084848400C6C6C600FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00C6C6C600C6C6C600FFFF
      FF00FFFFFF000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFF0000C6C6
      C600FFFF0000C6C6C60000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000C6C6
      C600FFFFFF000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFF0000FFFFFF00FFFF
      0000C6C6C600FFFF000000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFF0000FFFF
      FF00FFFF0000C6C6C60000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00FFFF
      0000FFFFFF0000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      840000000000C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFF
      FF0084848400000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6008484
      840000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      0000840000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF00000084000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      FF00000084000000FF0000000000008484000000000000000000000000000000
      0000000000007B7B7B000000000000000000000000007B7B7B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000007B7B7B0000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000848400008484000000000000000000000000000000
      0000000000000000FF000000FF000000000000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00BDBDBD000000000000000000BDBDBD00BDBDBD00BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000848400008484000000000000000000000000000000
      00000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00BDBDBD000000000000000000BDBDBD00BDBDBD00BDBD
      BD000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      FF00000084000000FF0000848400000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBDBD00BDBD
      BD000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF0000000000000000007B7B7B00000000000000
      000000000000FFFFFF00000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF0000000000000000007B7B7B000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000000000000000000000000000000007B7B7B000000
      0000FFFFFF00000000007B7B7B00000000000000000000000000000084000000
      84000000840000008400000084000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000000000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000007B7B7B0000000000000000000000000000848400008484000084
      84000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF000000000000FF000000000000FF000000FF000000FF00
      0000FF000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000008484000084840000848400000000000000
      000000000000000000000000000000000000000000007B7B7B000000FF000000
      FF000000FF000000000000FF000000FF000000FF000000000000FF000000FF00
      0000FF0000007B7B7B000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000000000FF000000FF000000FF000000FF000000FF000000000000FF00
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000848400008484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF000000FF000000FF000000FF000000FF00000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF0000000000BDBD
      BD00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400000000000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000FF000000FF000000FF0000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000007B7B7B000000000000000000000000007B7B7B00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      00000000000000000000000000007B7B7B000000000000000000000000007B7B
      7B00000000007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B007B7B
      7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484000000000000FFFF00848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF000000000000FFFF00FFFFFF000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400848484008484840084848400000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      0000008484000000000000000000000000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000FFFF0000FFFF
      0000FFFF00000000000000FFFF00FFFFFF0000FFFF000000000000FFFF000000
      0000008484000000000000000000000000000000000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF0084848400000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      0000FFFF0000FFFF00000000000000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C6008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFF0000000000000000000000000000000000000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BDBDBD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00000000000000FFFF0000000000000000000000000000FFFF00000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF000000000000FFFF000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000008484840000000000000000000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000FFFFFF000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      000084000000840000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF007B7B7B00FFFFFF000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF007B7B7B00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      000084000000840000000000000000000000000000000000000000FFFF0000FF
      FF0000000000FFFFFF0000FFFF007B7B7B0000FFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF007B7B7B00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      00008400000084000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF000000000000FFFF00FFFFFF007B7B7B00FFFFFF0000FFFF000000000000FF
      FF0000FFFF0000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF007B7B7B00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000008484840000000000000000000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      000084000000840000000000000000000000000000000000000000FFFF0000FF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000848484000000000000000000000000000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      000000000000840000000000000000000000000000000000000000FFFF0000FF
      FF0000FFFF0000000000FFFFFF0000FFFF00FFFFFF000000000000FFFF0000FF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00000000000000
      000000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000000000000000000000000000000000008400
      0000000000000000000084000000000000000000000084000000840000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      00008400000084000000840000008400000084848400FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840000000000000000000000
      0000008484000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000000000000000008400
      0000000000000000000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF008400000084000000840000008400
      00008400000084000000FFFFFF008400000084848400FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000840000008400000084000000000000008400000000000000000000008400
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000084840084848400848484008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000000000000000
      000000000000FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000084000000840000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00840000008400000084000000FFFF
      FF008400000084000000840000008400000084848400FFFFFF00FFFFFF008484
      8400848484008484840084848400FFFFFF000084840000FFFF0000FFFF00C6C6
      C6000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000000000000000000000000000000000000000
      0000000000000000000084000000000000008400000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF00840000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084848400000000000084840000FFFF0000FFFF0000FF
      FF00C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFFFF008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000084000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00840000000000000000FFFF0000FF
      FF0000FFFF00C6C6C600000000000000000000000000FFFFFF00000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000FFFFFF008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      00008400000000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00C6C6C60000000000000000000000000000848400848484000000000000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000008484840084848400848484008484
      8400848484000000000000FFFF0000FFFF00C6C6C6008484840084848400C6C6
      C60000FFFF0000FFFF00000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000084000000840000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF00008484000084840000FF
      FF0000FFFF0000FFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      000000000000000000000084840000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF0000FFFF00C6C6C600848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000084840000FFFF0000FFFF0000FFFF0000FF
      FF00C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000084840000848400008484000084
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00000000000000000000000000000000000000FF000000
      FF0000000000000000007B7B7B00000000007B7B7B00000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF000000000000000000000000000000FF00000000000000
      FF000000FF000000FF007B7B7B00000000007B7B7B0000000000000000000000
      00000000FF000000FF000000000000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF000000000000000000000000000000000000000000000000000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF000000000000000000000000000000000000FFFF000000000000FF
      FF000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF000000000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF00BDBDBD0000FFFF00000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000000000000000FF000000FF00000000000000
      000000000000000000007B7B7B00000000007B7B7B0000000000000000000000
      0000000000000000FF000000FF000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000840000000000000084000000FF00000000000000
      0000000000000000FF000000FF0000000000000000000000000000000000FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000FFFF0000000000FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
      FF00000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000007B7B7B00000000000000000000000000000000007B7B7B000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000000000000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000000000007B7B
      7B00000000000000000000000000000000007B7B7B0000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B00000000000000000000000000000000007B7B7B0000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF00000000007B7B7B00000000007B7B7B0000000000000000000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B7B7B00000000000000
      000000000000000000007B7B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      00007B7B7B007B7B7B007B7B7B0000FFFF0000FFFF007B7B7B007B7B7B007B7B
      7B007B7B7B0000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      0000000000000000000000000000000000000000000000FFFF007B7B7B007B7B
      7B000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      0000000000000000000000000000000000007B7B7B007B7B7B0000FFFF000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000007B7B7B0000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF00000000000000000000000000000000FF000000
      FF000000FF000000FF000000FF000000FF000000000000000000000000000000
      00000000000000000000000000000000000000FFFF0000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF00000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      000000000000000000000000000000000000000000000000000000FFFF007B7B
      7B007B7B7B0000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF000000000000000000007B7B7B000000FF000000
      FF0000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000FFFF0000FFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF000000000000FFFF0000FFFF0000FFFF000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD0000000000BDBDBD00000000007B7B7B000000
      000000000000000000000000000000000000000000007B7B7B007B7B7B0000FF
      FF000000000000000000FF000000FF00000000000000000000000000FF000000
      00000000000000000000FFFF0000000000007B7B7B000000FF00000000000000
      00000000000000000000000000000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF0000000000BDBDBD00000000007B7B7B00000000007B7B7B000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000084840000000000FF000000FF00000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007B7B7B00000000007B7B7B00000000007B7B7B00000000007B7B7B000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000084840000000000000000000000000000000000000000000000FF000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00000000000000000000FF000000FF00000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000FF
      FF0000FFFF00000000000000000000000000000000000000000000000000FFFF
      FF00BDBDBD00BDBDBD00BDBDBD007B7B7B007B7B7B007B7B7B007B7B7B007B7B
      7B00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      FF0000000000000000000000000000000000000000000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B7B
      7B000000FF000000000000000000000000000000000000FFFF0000FFFF000000
      000000000000000000000000000000FFFF0000FFFF0000000000000000000000
      00000000000000FFFF0000FFFF00000000000000000000000000000000000000
      000000000000000000007B7B7B007B7B7B007B7B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000000000FFFF0000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      00007B7B7B007B7B7B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD000000
      0000BDBDBD00BDBDBD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD00BDBD
      BD00BDBDBD00BDBDBD000000000000000000000000000000000000FFFF00BDBD
      BD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000FFFF000000000000FF
      FF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FF
      FF0000000000FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000FFFF000000
      000000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBDBD0000FFFF00BDBD
      BD0000FFFF0000000000FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000840000008400000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF000000000000000000000000000000FF000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF00000084000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000FF000000
      FF0000000000000000000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF000000FF000000FF000000
      84000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000BDBDBD0000000000FF000000FF000000FF00
      00000000FF00FF000000FF000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      FF000000FF000000000000000000FF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      00000084840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      FF000000FF000000FF00000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000FF000000FF000000000000000000FF00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000000000FF
      FF000000000000848400000000000000000000000000FFFFFF00000000000000
      00000000000000000000FFFFFF0000000000FFFFFF00000000000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000FFFF000000
      000000FFFF0000000000008484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00000000007B7B7B00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000FF00000000000000
      00000000FF000000FF00000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF000000000000FFFF00008484000084840000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000084840000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00FFFFFF000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000000000FFFFFF0000000000BDBD
      BD00FFFFFF0000000000FFFFFF000000000000000000000000007B7B7B000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300100000100010000000000800900000000000000000000
      000000000000000000000000FFFFFF00FC00000000000000F000000000000000
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000100000000000000030000000000000007000000000000001F000000000000
      007F00000000000001FF000000000000FFFFFFFFFFFF0000FEFFE767FFFF0001
      FEFFDB5BFFEF0001B6DDDB5BFFFF000186ADDB5BFFEF0001B6ADDA5BBBEF0001
      CEA9E767BAE80001CEDDFFFFD6EB0001FEFFFFFFEEAB0001FEFFF677D6430001
      FFBFF5B7BAEB0001FF9FF5B7BB7D0001E00FF5B7FF7D0001FF9FE5A7FFBB0003
      FFBFF677FFC70007FFFFFFFFFFFF000FFFFFFFFF8000C01FFFFF8FFF8000C00F
      FFFF87FF0000E007FFFFC1FF0000E003FFFFE0FF8000E003FFFFF03F8000E007
      B473F81F8000E00785AD000F8000E007B46F80038000E007CDADE0018000E007
      CC73E00F8000E007FFFFF00F8000C007FFFFF8038000C007FFFFFC018000E007
      FFFFFE01C000F803FFFFFF01FFFFFC03FE1FFBFFC003FFFFFE0FFBFF8001FFFF
      FC07F81F0001FFFFF903FBFF0001FFFFF8C3FBFF0001FFFFF8C3FFFF0001FFFF
      F8C3FBDF0000E473F8C3FDBF0000D5AFF8C3FE7F0000F5AFF8C3FDBF0000CC73
      F8C3FBDF0000FDFFF8C3FBFF0001FDFFF8D3FBFF0001FFFFF8B7F81F0001FFFF
      FAEFFBFF0001FFFFFF1FFBFF0003FFFFFFFF09FFFFFFFFFFFFFF003FFFFFFFFF
      001F001FADB4EB6F000F001F8DB5E76F00070001AD85EB6700030001A8B5E627
      00010001FFFFFFFF00000001FFFFFFFF001F0001F9FFF9FF001F0001F8FFF8FF
      001F0001007F007F8FF10001003F003FFFF90001007F007FFF750001F8FFF8FF
      FF8F0001F9FFF9FFFFFF0001FFFFFFFFFFFF003FFC01FFFF3F7F00070001FFFF
      0F3F00070001C007C71F00070001C007E31F00070001C007F01F003F0001C007
      F81F00070000C007CC1F00070001C007C00F00030003C007E00700010003C007
      F00300010003C007FF8100010003C007FFC1F801000FC00FFFF0FC01001FC01F
      FFFCFE03003FC03FFFFFFF07007FFFFFF000FFFFFF7E0000F000C001BFFF0000
      F0008031F0030000F0008031E003E007F0008031E003E007F0008001E003E007
      70008001E003E007100080012003E00700008FF1E002E00700008FF1E003E007
      00008FF1E003E00700008FF1E003FFFF00008FF1E003F81F00008FF5FFFFF81F
      00FF8001BF7DF81FF1FFFFFF7F7EFFFFFFFF000CE000B7E3FFF80008E000876D
      20F80001E000B423007F0063E000CF6D007C00C3E000CFE3003C01EBE000FFFF
      000F016B0000C3C3000400230000C3C3000C00670000C10301FF000F0000C003
      E3FC000F0000C003FFFC000F8000E007FFFF005F8000E007FFF8003F8000E00F
      FFF8007FC63FF18FFFFFFFFFC63FF18FFFFFFFFFFFFFFFFF0001C007FFFFFFFF
      0000BFEBFFFF000000010005800100001F807E31800100001DF17E3580010000
      1C800006800100001C717FEA800100001C008014800100001C71C00A80010000
      1C80E001800100001DF1E007800100001F80F0078001FFFF0001F0038001FFFF
      0000F803FFFFFFFF0001FFFFFFFFFFFFFFFFFFFF7F87C001000100017F87C001
      000100013FCFC001000100018F87C0011FF11FF1C787C0011FF11DF1C387C001
      18311CF1E007C00118311C71F03FC00118311C31F83FC00118311C71FC1FC001
      18311CF1FE03C0011FF11DF1FF01C0011FF11FF1FF81C00100010001FF81C003
      00010001FF81C00700010001FFC3C00FFFFFFFFFFFCFFF07FFFFFFFFFF87FF07
      FFFFEFFDC003FF07FFFFC7FFC003FF0FFFFFC3FBC003C007FFF7E3F7C003C003
      C1F7F1E78003C003C3FBF8CF0003C003C7FBFC1F0003C007CBFBFE3F0003C00F
      DCF7FC1F8003C01FFF0FF8CFC003C01FFFFFE1E7C003C01FFFFFC3F3C007C03F
      FFFFC7FDC00FC07FFFFFFFFFC01FC0FFFEFFFFFFFFFFFFFFFEFFFFFFF9FFFC00
      FC7FFE00F6CF8000FC7FFE00F6B70000F83FFE00F6B70000F83F8000F8B70000
      F01F8000FE8F0001F01F8000FE3F0003E00F8000FF7F0003E00F8001FE3F0003
      FC7F8003FEBF0003FC7F8007FC9F0FC3FC7F807FFDDF0003FC7F80FFFDDF8007
      FC7F81FFFDDFF87FFC7FFFFFFFFFFFFFFFFFFFDFF862FFFF8003FFCF80E0F83F
      0001FFC701E010100001000301E0E00F0001000131E1C0070001000031C18003
      00010001C181800300010003C307800300010007FE1780030001000FCC378003
      0001001FA877C0070001007F40F7E00F000100FF01E33018000101FFC1E3F83F
      000103FFC0E3FFFF8003FFFFC83FFFFFFFFDFFFFFEFFFEFFFFF88017FFFFFFFF
      FFF1FFF7E17FE17FFFE3FE63FFFFFFFFFFC7FC03E100E100E08FF803FFFFFFFF
      C01FF003EF07DF07803FF003E7FF9FFF001FE00303070307001FC003E7FF9FFF
      001F8003EF00DF00001F0003FFFFFFFF001F0003E100E100803F01E3FFFFFFFF
      C07F83E3FEFFFEFFE0FFC7E3FFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFC7FFC7F
      FFFFFFFFFC7FFC7FFFFFFFFFD837FC7FFFFFFFFFE00FFC7FC1F3E7FFE00FFC7F
      C3FBCF83C007F83FC7FBDFC3C007F01FCBFBDFE30001F01FDCF3DFD3C007F01F
      FF07CF3BC007F83FFFFFE0FFE00FFC7FFFFFFFFFE00FFFFFFFFFFFFFD837FFFF
      FFFFFFFFFEFFFFFFFFFFFFFFFEFFFFFF003FFFFFFFFFFFFF0007FFFFF3FFFFFF
      0007FC01ED9FFC000007FC01ED6F80000007FC01ED6F0000003F0001F16F0000
      00070001FD1F000000070001FC7F000100030001FEFF000300010003FC7F0003
      00010007FD7F00030001000FF93F0003F80100FFFBBF0FC3FC0101FFFBBF0003
      FE0303FFFBBF8007FF07FFFFFFFFF87FFFFFFFFFFFFFFFFFF83FFFFFFFFFF801
      E00FFFFFFFFFF001CC47E007FFFFE0018463C007C00FC001A073C00780078001
      31F9C0078003000138F9C007800100013C79C007800100033C39C007800F0007
      3C19C00F800F000F9C0BE07F801F001F8C43E07FC0FF003FC467FFFFC0FF81FF
      E00FFFFFFFFF81FFF83FFFFFFFFFFFFFFF7EE00FFFFFFFFF9001E00F1808FFFF
      C003E00F1808F9FFE003E00F1808F0FFE003E00F0808F0FFE003E00F0808E07F
      E003E00F8808C07F0001A00B8008843F8000C00780081E3FE007E00FC008FE1F
      E00FE00FC008FF1FE00FC007C008FF8FE027C007F80FFFC7C073C007FF8FFFE3
      9E79F83FFF8FFFF87EFEF83FFF8FFFFFFFFF847FFF00FFFFFFC800EFFF00801F
      FFB831BFFF000000CFBF39FFFF000000CFBC993F00000000FFBCCA1F00000000
      DFBFF40F00000000CF7C9C0700000000E6FC960300230000F37FCB0100018000
      33BCFF800000800033BCF7C00023FC0087BFFFE00063FC01FFB8EFF000C3FC03
      FFC8FFF80107FC07FFFFFFFC03FFFFFF00000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TMainMenu
    Images = frmLEImages.leimgsm
    Left = 48
    Top = 160
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Action = aFileNew
      end
      object NewTemplate1: TMenuItem
        Action = aopentemplate
      end
      object NewWindow1: TMenuItem
        Action = anewwindow
      end
      object Open1: TMenuItem
        Action = aopen
      end
      object OpeninEditMode1: TMenuItem
        Action = aopenedit
      end
      object OpenBinary1: TMenuItem
        Action = aOpenHex
      end
      object OpenProject2: TMenuItem
        Action = aopenproject
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object mitemReopen: TMenuItem
        Caption = '&Recent Files'
      end
      object mrecentprojs: TMenuItem
        Caption = 'Recent Projects'
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object ASave1: TMenuItem
        Action = ASave
      end
      object SaveAs1: TMenuItem
        Action = aSaveAs
      end
      object SaveAsTemplate1: TMenuItem
        Action = asavetemplate
      end
      object SaveAll1: TMenuItem
        Action = asaveall
      end
      object SaveCurrent1: TMenuItem
        Action = aSaveCur
      end
      object SaveClose1: TMenuItem
        Action = aSaveClose
      end
      object Close1: TMenuItem
        Action = aclosefile
      end
      object CloseAll1: TMenuItem
        Action = acloseall
      end
      object N20: TMenuItem
        Caption = '-'
      end
      object SwitchtoHexMode1: TMenuItem
        Action = aHexMode
        Visible = False
      end
      object N10: TMenuItem
        Caption = '-'
        Visible = False
      end
      object FTPOpen1: TMenuItem
        Action = aftpOpen
      end
      object FTPSave1: TMenuItem
        Action = aFTPSave
      end
      object FTPSaveAs1: TMenuItem
        Action = aFtpSaveAs
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object SendTo1: TMenuItem
        Caption = 'Send &To'
        object Email1: TMenuItem
          Caption = 'E&mail recipient'
          object EmailasText1: TMenuItem
            Action = aEmailTxt
          end
          object EmailasAttachment1: TMenuItem
            Action = aEmailAttach
          end
        end
        object HTML1: TMenuItem
          Action = aExpHTML
        end
        object RTF1: TMenuItem
          Action = aExpRTF
        end
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object PrinterSetup1: TMenuItem
        Action = aPrinterSetup
      end
      object PrintPreview1: TMenuItem
        Action = aPrintPreview
      end
      object Print1: TMenuItem
        Action = aPrint
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Properties2: TMenuItem
        Action = afileproperties
      end
      object N39: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Action = aexit
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object Undo1: TMenuItem
        Action = aEditUndo
      end
      object Redo1: TMenuItem
        Action = aEditRedo
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Action = aEditCut
      end
      object Copy1: TMenuItem
        Action = aEditCopy
      end
      object Paste1: TMenuItem
        Action = aEditPaste
      end
      object Delete1: TMenuItem
        Action = aEditDelete
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object WordWrap1: TMenuItem
        Action = awordwrap
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Indent1: TMenuItem
        Action = aIndent
      end
      object UnIndent1: TMenuItem
        Action = aUnIndent
      end
      object N36: TMenuItem
        Caption = '-'
      end
      object oggleBookmark1: TMenuItem
        Caption = 'Toggle Bookmark'
        object Bookmark01: TMenuItem
          Action = aSetBookmark
        end
        object Bookmark11: TMenuItem
          Action = aSetBookmark1
        end
        object Bookmark21: TMenuItem
          Action = aSetBookmark2
        end
        object Bookmark31: TMenuItem
          Action = aSetBookmark3
        end
        object Bookmark41: TMenuItem
          Action = aSetBookmark4
        end
        object Bookmark51: TMenuItem
          Action = aSetBookmark5
        end
        object Bookmark61: TMenuItem
          Action = aSetBookmark6
        end
        object Bookmark71: TMenuItem
          Action = aSetBookmark7
        end
        object Bookmark81: TMenuItem
          Action = aSetBookmark8
        end
        object Bookmark91: TMenuItem
          Action = aSetBookmark9
        end
      end
      object GotoBookmark1: TMenuItem
        Caption = 'Goto Bookmark'
        object Bookmark02: TMenuItem
          Action = aGotoBookmark
        end
        object Bookmark12: TMenuItem
          Action = aGotoBookmark1
        end
        object Bookmark22: TMenuItem
          Action = aGotoBookmark2
        end
        object Bookmark32: TMenuItem
          Action = aGotoBookmark3
        end
        object Bookmark42: TMenuItem
          Action = aGotoBookmark4
        end
        object Bookmark52: TMenuItem
          Action = aGotoBookmark5
        end
        object Bookmark62: TMenuItem
          Action = aGotoBookmark6
        end
        object Bookmark72: TMenuItem
          Action = aGotoBookmark7
        end
        object Bookmark82: TMenuItem
          Action = aGotoBookmark8
        end
        object Bookmark92: TMenuItem
          Action = aGotoBookmark9
        end
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object Insert1: TMenuItem
        Caption = 'Insert'
        object AsciiCode1: TMenuItem
          Action = aAsciiCode
        end
        object NumCount1: TMenuItem
          Action = aNumCount
        end
      end
      object ConvertCase1: TMenuItem
        Caption = 'Convert Case'
        object Uppercase1: TMenuItem
          Action = auppercase
        end
        object Lowercase1: TMenuItem
          Action = alowercase
        end
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object SelectAll1: TMenuItem
        Action = aEditSelectAll
      end
      object BlockSelect1: TMenuItem
        Action = aSelectMode
      end
      object N15: TMenuItem
        Caption = '-'
      end
    end
    object Search1: TMenuItem
      Caption = '&Search'
      object Find1: TMenuItem
        Action = aFind
      end
      object FindNext1: TMenuItem
        Action = aFindNext
      end
      object Replace1: TMenuItem
        Action = aReplace
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object ExtendedFileReplace1: TMenuItem
        Action = aextendfr
      end
      object GotoLine1: TMenuItem
        Action = aGotoLine
      end
      object LineRange1: TMenuItem
        Action = aLineRange
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Search2: TMenuItem
        Action = aLongLn
      end
      object NextLongLine1: TMenuItem
        Action = aNextLong
      end
      object N40: TMenuItem
        Caption = '-'
      end
      object MatchBracket1: TMenuItem
        Action = amatchbracket
      end
    end
    object View1: TMenuItem
      Caption = '&View'
      object Prior1: TMenuItem
        Action = aprior
      end
      object Next1: TMenuItem
        Action = anext
      end
      object N23: TMenuItem
        Caption = '-'
      end
      object HighlighterOn1: TMenuItem
        Action = alighton
      end
      object ClickLinks1: TMenuItem
        Action = aclicklinks
      end
      object N31: TMenuItem
        Caption = '-'
      end
      object aprojectwin1: TMenuItem
        Action = aprojectwin
      end
      object ExplorerWindow1: TMenuItem
        Action = aexplorewin
      end
      object WebPreview1: TMenuItem
        Action = aWebPreview
      end
      object ViewasGrid1: TMenuItem
        Action = aViewAsGrid
      end
      object HexView1: TMenuItem
        Action = ashowhex
      end
      object N33: TMenuItem
        Caption = '-'
      end
      object ShowTools1: TMenuItem
        Action = aShowTools
      end
      object ShowToolbar1: TMenuItem
        Caption = 'Toolbars'
        object ShowRuler1: TMenuItem
          Action = aShowRuler
        end
        object MacroToolbar1: TMenuItem
          Action = aShowMacro
        end
        object UserToolbar1: TMenuItem
          Action = aUserTBar
        end
        object CustomizeUserToolbar1: TMenuItem
          Action = aCustomUserBar
        end
      end
    end
    object Project1: TMenuItem
      Caption = '&Project'
      object NewProjectGroup1: TMenuItem
        Action = anewprojgroup
      end
      object N26: TMenuItem
        Caption = '-'
      end
      object AddProject1: TMenuItem
        Action = aaddproject
      end
      object AddFolder1: TMenuItem
        Action = aaddfolder
      end
      object AddFile1: TMenuItem
        Action = aaddfile
      end
      object N38: TMenuItem
        Caption = '-'
      end
      object AddCurrentFile1: TMenuItem
        Action = addcurrent
      end
      object AddOpenFiles1: TMenuItem
        Action = addfilegroup
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object DeleteItem1: TMenuItem
        Action = adeleteprojitem
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object AddFolderFiles1: TMenuItem
        Action = ascanfiles
      end
    end
    object Action1: TMenuItem
      Caption = '&Action'
      object RunFile2: TMenuItem
        Action = arunfile
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object DeleteField2: TMenuItem
        Action = adelfield
      end
      object SortAscending1: TMenuItem
        Action = aSortAsc
      end
      object SortDescending1: TMenuItem
        Action = aSortDesc
      end
      object DeleteDuplicates1: TMenuItem
        Caption = 'Sort && Remove Duplicates'
        object Ascending1: TMenuItem
          Action = aSortAscRmDup
        end
        object Descending1: TMenuItem
          Action = aSortDescRmDup
        end
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object XPathSearch1: TMenuItem
        Action = aXpath
      end
      object XSLT1: TMenuItem
        Caption = 'XSLT'
        ImageIndex = 70
        object XSLTTransform1: TMenuItem
          Action = axslttrans
        end
        object XSLTTransformXNODE1: TMenuItem
          Action = atransxnode
        end
        object XSLTRefresh1: TMenuItem
          Action = axsltrefresh
        end
      end
      object N29: TMenuItem
        Caption = '-'
        Visible = False
      end
      object Base64Encode1: TMenuItem
        Action = abaseencode
        Visible = False
      end
    end
    object Tools1: TMenuItem
      Caption = '&Tools'
      object SpellCheck1: TMenuItem
        Action = aSpellCheck
      end
      object N32: TMenuItem
        Caption = '-'
      end
      object Marco1: TMenuItem
        Caption = 'Keystroke &Marcos'
        ImageIndex = 67
        object PlaybackKeystrokes1: TMenuItem
          Action = aKMPlay
        end
        object RecordKeystrokes1: TMenuItem
          Action = aKMRec
        end
        object StopRecording1: TMenuItem
          Action = AKMStop
        end
        object Playperline1: TMenuItem
          Action = aKMPlayPerLine
        end
        object OpenKeystrokes1: TMenuItem
          Action = aKMOpen
        end
        object SaveKeystrokes1: TMenuItem
          Action = aKMSave
        end
      end
      object WindowMacros1: TMenuItem
        Caption = 'Window Macros'
        ImageIndex = 68
        object Record1: TMenuItem
          Action = aRecMac
        end
        object Play1: TMenuItem
          Action = aPlayMac
        end
        object Stop1: TMenuItem
          Action = aStopMac
        end
        object Open2: TMenuItem
          Action = aOpenMac
        end
        object Save1: TMenuItem
          Action = aSaveMac
        end
      end
      object ScriptMacros1: TMenuItem
        Caption = 'Script Macros'
        ImageIndex = 66
        object Create1: TMenuItem
          Action = aSMCreate
        end
        object Edit2: TMenuItem
          Action = aSMPlay
        end
        object Edit3: TMenuItem
          Action = aSMEdit
        end
        object N37: TMenuItem
          Caption = '-'
        end
        object PlayMultiples1: TMenuItem
          Action = aSMPlayMany
        end
        object PlayLast1: TMenuItem
          Action = aSMPlayFunc
        end
        object aSMPlayLast1: TMenuItem
          Action = aSMPlayLast
        end
      end
      object Repository1: TMenuItem
        Action = aReposit
      end
      object MacroRepository1: TMenuItem
        Action = aMacRepos
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object ASCIICodes1: TMenuItem
        Caption = 'ASCII Codes'
        object ViewASCIICodes1: TMenuItem
          Action = aViewASCIICodes
        end
        object ViewSymbolNames1: TMenuItem
          Action = aSymName
        end
        object N17: TMenuItem
          Caption = '-'
        end
        object GetASCIIvalue1: TMenuItem
          Action = aASCIIvalue
        end
        object GetCharactor1: TMenuItem
          Action = aGetCharforCode
        end
      end
      object HTMLCodes1: TMenuItem
        Caption = 'HTML Codes'
        object ViewHTMLcodes1: TMenuItem
          Action = aviewHTMLcodes
        end
      end
      object HTMLColors1: TMenuItem
        Action = aHtmlColors
      end
      object Calendar1: TMenuItem
        Action = aCalendar
      end
      object N18: TMenuItem
        Caption = '-'
      end
      object SelectHighLighter1: TMenuItem
        Action = aSelHighLight
      end
      object Options1: TMenuItem
        Action = aOptions
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object ContextHelp1: TMenuItem
        Action = ahelp
      end
      object HelpTopics1: TMenuItem
        Action = ahelpTopics
      end
      object OnlineHelp1: TMenuItem
        Action = aonlinehelp
      end
      object utorials1: TMenuItem
        Action = atutorials
      end
      object maddhelp: TMenuItem
        Caption = 'Additional Help'
      end
      object LEScriptingHelp1: TMenuItem
        Action = ascripthelp
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object NetLeggerHomePage1: TMenuItem
        Action = anethome
      end
      object NetLeggerSupportPage1: TMenuItem
        Action = anetsupport
      end
      object EnterSerialNumber1: TMenuItem
        Action = aenterserial
      end
      object ManualActivate1: TMenuItem
        Action = amanualactivate
      end
      object BuyLargeEdit1: TMenuItem
        Action = abuyLE
      end
      object CheckforUpdates1: TMenuItem
        Action = aupdates
      end
      object N12: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Action = aAbout
      end
    end
  end
  object sdMac: TSaveDialog
    DefaultExt = 'emc'
    Filter = 'Marco (*.emc)|*.emc|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save Macro'
    Left = 8
    Top = 200
  end
  object odMac: TOpenDialog
    DefaultExt = 'emc'
    Filter = 'Marco (*.emc)|*.emc|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open Macro'
    Left = 48
    Top = 200
  end
  object symac: TSynMacroRecorder
    Editor = memo1
    RecordShortCut = 24658
    PlaybackShortCut = 24656
    Left = 88
    Top = 200
  end
  object synprint: TSynEditPrint
    Copies = 1
    Header.DefaultFont.Charset = DEFAULT_CHARSET
    Header.DefaultFont.Color = clBlack
    Header.DefaultFont.Height = -13
    Header.DefaultFont.Name = 'Arial'
    Header.DefaultFont.Style = []
    Footer.DefaultFont.Charset = DEFAULT_CHARSET
    Footer.DefaultFont.Color = clBlack
    Footer.DefaultFont.Height = -13
    Footer.DefaultFont.Name = 'Arial'
    Footer.DefaultFont.Style = []
    Margins.Left = 25
    Margins.Right = 15
    Margins.Top = 25
    Margins.Bottom = 25
    Margins.Header = 15
    Margins.Footer = 15
    Margins.LeftHFTextIndent = 2
    Margins.RightHFTextIndent = 2
    Margins.HFInternalMargin = 0.5
    Margins.MirrorMargins = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabWidth = 8
    Color = clWhite
    Left = 45
    Top = 240
  end
  object PrintSetupdlg: TPrinterSetupDialog
    Left = 80
    Top = 240
  end
  object HeaderFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Left = 8
    Top = 240
  end
  object printdlg: TPrintDialog
    Options = [poPageNums, poSelection]
    Left = 117
    Top = 240
  end
  object SynExportHTML: TSynExporterHTML
    Color = clWindow
    DefaultFilter = 'HTML Document (*.htm,*.html)|*.htm;*.html'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Untitled'
    UseBackground = False
    Left = 128
    Top = 200
  end
  object SynExportRTF: TSynExporterRTF
    Color = clWindow
    DefaultFilter = 'Rich Text Format (*.rtf)|*.rtf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    Title = 'Untitled'
    UseBackground = False
    Left = 168
    Top = 200
  end
  object sdexp: TSaveDialog
    Filter = 'All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 208
    Top = 200
  end
  object SynAutoComplete: TSynAutoComplete
    EndOfTokenChr = '()[].'
    Editor = memo1
    ShortCut = 24608
    Options = []
    Left = 248
    Top = 200
  end
  object ActionManager: TActionManager
    ActionBars.SessionCount = 3
    ActionBars = <
      item
        Items.CaptionOptions = coNone
        Items = <
          item
            Action = aFileNew
            ImageIndex = 21
            ShortCut = 16462
          end
          item
            Action = aopen
            ImageIndex = 30
            ShortCut = 16463
          end
          item
            Action = aopenedit
            ImageIndex = 49
          end
          item
            Action = ASave
            ImageIndex = 22
            ShortCut = 16467
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = asaveall
            Caption = 'Sa&ve All'
            ImageIndex = 98
            LastSession = 3
            ShortCut = 24659
          end
          item
            Action = aopenproject
            Caption = 'Open Pro&ject Group'
            ImageIndex = 81
            LastSession = 3
          end
          item
            Caption = '-'
          end
          item
            Action = aEditCut
            Caption = '&Cut'
            ImageIndex = 25
          end
          item
            Action = aEditCopy
            Caption = 'Cop&y'
            ImageIndex = 24
          end
          item
            Action = aEditPaste
            Caption = 'P&aste'
            ImageIndex = 23
          end
          item
            Caption = '-'
          end
          item
            Action = aPrintPreview
            ImageIndex = 27
          end
          item
            Action = aPrint
            ImageIndex = 26
            ShortCut = 16464
          end
          item
            Caption = '-'
          end
          item
            Action = aprior
            Caption = 'Pr&ior'
            ImageIndex = 33
            LastSession = 3
            ShortCut = 24644
          end
          item
            Action = anext
            Caption = 'Nex&t'
            ImageIndex = 34
            ShortCut = 16452
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = aFind
            ImageIndex = 92
            LastSession = 3
            ShortCut = 16454
          end
          item
            Action = aReplace
            Caption = 'Replace...'
            ImageIndex = 104
            LastSession = 3
            ShortCut = 16466
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = arunfile
            Caption = 'R&un File'
            ImageIndex = 61
            LastSession = 3
            ShortCut = 120
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = aSpellCheck
            Caption = 'Spe&ll Check'
            ImageIndex = 84
            LastSession = 3
            ShortCut = 118
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = aSelHighLight
            ImageIndex = 82
          end
          item
            Action = alighton
            Caption = 'Hi&ghlighter On'
            ImageIndex = 48
            LastSession = 3
          end>
        ActionBar = ATBMain
        AutoSize = False
      end
      item
        Items.CaptionOptions = coNone
        Items = <
          item
            Action = aEditUndo
            ImageIndex = 99
            ShortCut = 16474
          end
          item
            Action = aEditRedo
            ImageIndex = 100
            ShortCut = 24666
          end
          item
            Caption = '-'
          end
          item
            Action = aIndent
            Caption = '&Indent'
            ImageIndex = 28
          end
          item
            Action = aUnIndent
            Caption = 'U&nIndent'
            ImageIndex = 29
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = awordwrap
            Caption = 'Wor&d Wrap'
            ImageIndex = 83
            LastSession = 3
          end
          item
            Caption = '-'
          end
          item
            Action = auppercase
            Caption = 'U&pper'
            ImageIndex = 11
            LastSession = 3
          end
          item
            Action = alowercase
            Caption = '&Lower'
            ImageIndex = 10
            LastSession = 3
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = aEmailTxt
            ImageIndex = 39
          end
          item
            Action = aEmailAttach
            ImageIndex = 40
          end
          item
            Caption = '-'
          end
          item
            Action = aExpHTML
            ImageIndex = 77
          end
          item
            Action = aExpRTF
            Caption = 'RT&F...'
            ImageIndex = 76
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = aprojectwin
            Caption = 'Pro&ject Window'
            ImageIndex = 78
            LastSession = 3
          end
          item
            Action = aexplorewin
            Caption = 'E&xplorer Window'
            ImageIndex = 80
            LastSession = 3
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = aWebPreview
            Caption = '&Web Preview'
            ImageIndex = 37
            LastSession = 3
          end
          item
            Action = aViewAsGrid
            ImageIndex = 62
          end
          item
            Action = aReposit
            Caption = '&Code Repository'
            ImageIndex = 36
            LastSession = 3
          end
          item
            Caption = '-'
            LastSession = 3
          end
          item
            Action = aGotoLine
            Caption = 'G&oto Line'
            ImageIndex = 103
            LastSession = 3
            ShortCut = 16455
          end
          item
            Action = aextendfr
            Caption = '&Extended File && Replace'
            ImageIndex = 60
          end>
        ActionBar = ATBEdit
        AutoSize = False
      end
      item
        Items.CaptionOptions = coNone
        Items = <
          item
            Action = aKMPlay
            ImageIndex = 85
            ShortCut = 123
          end
          item
            Action = aKMRec
            ImageIndex = 86
            ShortCut = 121
          end
          item
            Action = AKMStop
            ImageIndex = 87
            ShortCut = 122
          end
          item
            Caption = '-'
          end
          item
            Action = aKMSave
            ImageIndex = 89
          end
          item
            Action = aKMOpen
            ImageIndex = 90
          end
          item
            Caption = '-'
          end
          item
            Action = aKMPlayPerLine
            Caption = 'P&lay per line'
            ImageIndex = 88
          end>
        ActionBar = ATBMacro
        AutoSize = False
      end>
    LinkedActionLists = <
      item
        ActionList = MainActions
        Caption = 'MainActions'
      end
      item
        ActionList = alCustomActs
        Caption = 'CustomActions'
      end>
    Images = ImageList1
    Left = 8
    Top = 304
  end
  object CustomDlg: TCustomizeDlg
    ActionManager = ActionManager
    StayOnTop = True
    Left = 48
    Top = 304
  end
  object odwinmac: TOpenDialog
    DefaultExt = 'wmc'
    Filter = 'Win Marco (*.wmc)|*.wmc|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open Win Macro'
    Left = 208
    Top = 240
  end
  object sdwinmac: TSaveDialog
    DefaultExt = 'wmc'
    Filter = 'Win Marco (*.wmc)|*.wmc|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save Win Macro'
    Left = 168
    Top = 240
  end
  object PopupMenu1: TPopupMenu
    Images = frmLEImages.leimgsm
    Left = 8
    Top = 344
    object Cut2: TMenuItem
      Action = aEditCut
    end
    object Copy2: TMenuItem
      Action = aEditCopy
    end
    object Paste2: TMenuItem
      Action = aEditPaste
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Indent2: TMenuItem
      Action = aIndent
    end
    object UnIndent2: TMenuItem
      Action = aUnIndent
    end
    object N24: TMenuItem
      Caption = '-'
    end
    object SelectHighLighter2: TMenuItem
      Action = aEditSelectAll
    end
    object ASCIICode2: TMenuItem
      Action = aSelectMode
    end
    object N25: TMenuItem
      Caption = '-'
    end
    object Case1: TMenuItem
      Caption = 'Case'
      object Lower1: TMenuItem
        Action = alowercase
      end
      object Upper1: TMenuItem
        Action = auppercase
      end
    end
  end
  object PopupMenu2: TPopupMenu
    Images = frmLEImages.leimgsm
    Left = 8
    Top = 384
    object CustomizeToolbar1: TMenuItem
      Action = aCustomUserBar
      Caption = 'Customize'
    end
  end
  object sdout: TSaveDialog
    Filter = 'All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Title = 'Save File'
    Left = 256
    Top = 240
  end
  object poptabs: TPopupMenu
    Images = frmLEImages.leimgsm
    OnPopup = poptabsPopup
    Left = 48
    Top = 344
    object Close2: TMenuItem
      Action = aclosefile
    end
    object N34: TMenuItem
      Caption = '-'
    end
    object Save2: TMenuItem
      Action = ASave
    end
    object SaveAsTemplate2: TMenuItem
      Action = asavetemplate
    end
    object Export1: TMenuItem
      Caption = 'Export'
      object HTML2: TMenuItem
        Action = aExpHTML
      end
      object RTF2: TMenuItem
        Action = aExpRTF
      end
    end
    object Properties1: TMenuItem
      Action = afileproperties
    end
    object N35: TMenuItem
      Caption = '-'
    end
    object RunFile1: TMenuItem
      Action = arunfile
    end
  end
  object odlgscript: TOpenDialog
    DefaultExt = 'js'
    Filter = 'Script Files (*.js, *.vbs)|*.js; *.vbs|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Open File'
    Left = 520
    Top = 168
  end
  object odlgproj: TOpenDialog
    DefaultExt = 'nsp'
    Filter = 'Project Files (*.nsp)|*.nsp|All Files (*.*)|*.*'
    Left = 288
    Top = 160
  end
  object odlgxslt: TOpenDialog
    Filter = 'XSLT Files (*.xslt, *.xsl)|*.xslt; *.xsl|All Files (*.*)|*.*'
    Title = 'Select XSLT File'
    Left = 296
    Top = 240
  end
  object imglisttabs: TImageList
    Left = 656
    Top = 120
  end
  object SynCodeProposal: TSynCompletionProposal
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
    OnExecute = SynCodeProposalExecute
    OnPaintItem = SynCodeProposalPaintItem
    ShortCut = 16416
    Editor = memo1
    OnAfterCodeCompletion = SynCodeProposalAfterCodeCompletion
    OnCodeCompletion = SynCodeProposalCodeCompletion
    Left = 296
    Top = 200
  end
  object SynSearch: TSynEditSearch
    Left = 216
    Top = 352
  end
  object SynRegexSearch: TSynEditRegexSearch
    Left = 248
    Top = 352
  end
  object alCustomActs: TActionList
    Images = imgCustomList
    Left = 408
    Top = 240
  end
  object imgCustomList: TImageList
    Left = 440
    Top = 240
  end
  object imglistBookmarks: TImageList
    Left = 160
    Top = 336
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B392900000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B39290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800FFFFF700FFFFF700FFFFF700CE630000CE63
      0000CE630000CE6B00008442210000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800FFFFF700FFFFF700FFFFF700CE630000CE63
      0000CE630000CE6B000084422100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD521000C6630000D6731000D67B
      1800D6731000CE630000FFFFF700CE630000CE630000CE630000FFFFF700CE63
      0000CE630000CE6B0000B55A10006B392900AD521000C6630000D6731000D67B
      1800D6731000CE630000FFFFF700CE630000CE630000CE630000FFFFF700CE63
      0000CE630000CE6B0000B55A10006B3929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100FFFFF700D67B2100D67B2100CE630000FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100D67B2100D67B2100D67B2100CE630000FFFFF700CE63
      0000CE630000CE6B0000C66300006B3929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100FFFFF700D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE6300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100D67B2100FFFFF700FFFFF700FFFFF700FFFFF700CE63
      0000CE6B0800CE630000CE6300006B3929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300EFA56300FFFFF700FFFFF700FFFFF700D67B2100CE63
      0000CE6B0800CE630000CE63000073392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300FFFFF700D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE630000733929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400FFFFF700EFA56300D67B2100D67B2100FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400FFFFF700EFA56300D67B2100D67B2100FFFFF700CE63
      0000CE630000CE6B0000C66300006B3929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00FFFFF700EFA56300D67B2100D67B2100FFFFF700CE6B
      0800CE630000CE6B0000B55A10006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00FFFFF700EFA56300D67B2100D67B2100FFFFF700CE6B
      0800CE630000CE6B0000B55A10006B3929000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400FFFFF700FFFFF700FFFFF700DE842900D673
      1000CE6B0000CE6B00007B4221000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400FFFFF700FFFFF700FFFFF700DE842900D673
      1000CE6B0000CE6B00007B422100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A5521000733929000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A552100073392900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B392900000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B3929000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B39290000000000000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B392900000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B392900000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B392900000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B39290000000000000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B39290000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800CE6B0000CE6B0800FFFFF700CE630000CE63
      0000CE630000CE6B00008442210000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800FFFFF700FFFFF700FFFFF700CE630000CE63
      0000CE630000CE6B00008442210000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800FFFFF700FFFFF700FFFFF700CE630000CE63
      0000CE630000CE6B00008442210000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800FFFFF700CE6B0800CE630000CE630000CE63
      0000CE630000CE6B00008442210000000000AD521000C6630000D6731000D67B
      1800D6731000CE630000CE630000CE630000CE630000FFFFF700CE630000CE63
      0000CE630000CE6B0000B55A10006B392900AD521000C6630000D6731000D67B
      1800D6731000CE630000FFFFF700CE630000CE630000CE630000FFFFF700CE63
      0000CE630000CE6B0000B55A10006B392900AD521000C6630000D6731000D67B
      1800D6731000CE630000FFFFF700CE630000CE630000CE630000FFFFF700CE63
      0000CE630000CE6B0000B55A10006B392900AD521000C6630000D6731000D67B
      1800D6731000CE630000CE630000FFFFF700CE630000CE630000CE630000CE63
      0000CE630000CE6B0000B55A10006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100D67B2100D67B2100D67B2100CE630000FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100FFFFF700D67B2100D67B2100CE630000FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100D67B2100FFFFF700D67B2100CE630000CE630000CE63
      0000CE630000CE6B0000C66300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100FFFFF700D67B2100D67B2100FFFFF700CE630000CE63
      0000CE6B0800CE630000CE6300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100D67B2100D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE6300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100FFFFF700D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE6300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100D67B2100D67B2100FFFFF700D67B2100CE630000CE63
      0000CE6B0800CE630000CE6300006B392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300EFA56300FFFFF700D67B2100FFFFF700D67B2100CE63
      0000CE6B0800CE630000CE63000073392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300FFFFF700FFFFF700FFFFF700FFFFF700D67B2100CE63
      0000CE6B0800CE630000CE63000073392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300FFFFF700FFFFF700FFFFF700FFFFF700D67B2100CE63
      0000CE6B0800CE630000CE63000073392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300EFA56300D67B2100FFFFF700D67B2100D67B2100CE63
      0000CE6B0800CE630000CE63000073392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400EFA56300FFFFF700D67B2100FFFFF700D67B2100CE63
      0000CE630000CE6B0000C66300006B392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400FFFFF700EFA56300D67B2100D67B2100D67B2100CE63
      0000CE630000CE6B0000C66300006B392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400FFFFF700EFA56300D67B2100D67B2100D67B2100CE63
      0000CE630000CE6B0000C66300006B392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400EFA56300EFA56300D67B2100FFFFF700D67B2100CE63
      0000CE630000CE6B0000C66300006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00F7BD8400EFA56300FFFFF700FFFFF700CE630000CE6B
      0800CE630000CE6B0000B55A10006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00F7BD8400FFFFF700D67B2100D67B2100CE630000CE6B
      0800CE630000CE6B0000B55A10006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00FFFFF700EFA56300D67B2100D67B2100FFFFF700CE6B
      0800CE630000CE6B0000B55A10006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00F7BD8400EFA56300D67B2100FFFFF700CE630000CE6B
      0800CE630000CE6B0000B55A10006B39290000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400EFBD8400EFA56300FFFFF700DE842900D673
      1000CE6B0000CE6B00007B4221000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400FFFFF700FFFFF700FFFFF700FFFFF700D673
      1000CE6B0000CE6B00007B4221000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400FFFFF700FFFFF700FFFFF700DE842900D673
      1000CE6B0000CE6B00007B4221000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700D673
      1000CE6B0000CE6B00007B4221000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A5521000733929000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A5521000733929000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A5521000733929000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A552100073392900000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B3929000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B392900000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B392900000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B392900000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B3929000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B3929006B39290084422100844221006B3929006B3929000000
      0000000000000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B3929000000000000000000000000000000000000000000000000007339
      290084422100AD5A1000C6630000CE630000CE630000C6630000B55A10008442
      21006B39290000000000000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B392900000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B392900000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B392900000000000000000000000000000000007B392900AD52
      1000CE6B0000CE6B0000CE6B0000CE630000CE630000CE630000CE6B0000CE6B
      0000AD5210006B39290000000000000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B392900000000000000000084422100AD5A1000CE6B
      0000CE630000CE6B0800CE6B0800CE630000CE630000CE630000CE630000CE63
      0000CE6B0000AD5210006B39290000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800FFFFF700FFFFF700FFFFF700CE630000CE63
      0000CE630000CE6B00008442210000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800CE6B0000FFFFFF00CE630000CE630000CE63
      0000CE630000CE6B00008442210000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000FFFFF700FFFFF700FFFFF700FFFFF700FFFFF700CE63
      0000CE630000CE6B00008442210000000000000000009C4A1800CE6B0000CE6B
      0000CE630000CE6B0000CE6B0800FFFFF700FFFFF700FFFFF700CE630000CE63
      0000CE630000CE6B00008442210000000000AD521000C6630000D6731000D67B
      1800D6731000CE630000FFFFF700CE630000CE630000CE630000FFFFF700CE63
      0000CE630000CE6B0000B55A10006B392900AD521000C6630000D6731000D67B
      1800D6731000CE630000CE630000CE630000FFFFFF00CE630000CE630000CE63
      0000CE630000CE6B0000B55A10006B392900AD521000C6630000D6731000D67B
      1800D6731000CE630000CE630000FFFFF700CE630000CE630000CE630000CE63
      0000CE630000CE6B0000B55A10006B392900AD521000C6630000D6731000D67B
      1800D6731000CE630000FFFFF700CE630000CE630000CE630000FFFFF700CE63
      0000CE630000CE6B0000B55A10006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100FFFFF700D67B2100D67B2100CE630000FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100D67B2100D67B2100FFFFFF00CE630000CE630000CE63
      0000CE630000CE6B0000C66300006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100D67B2100D67B2100FFFFF700CE630000CE630000CE63
      0000CE630000CE6B0000C66300006B392900AD5A1000D67B1800DE842900DE8C
      3100DE842900D67B2100D67B2100D67B2100D67B2100CE630000FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100FFFFF700D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE6300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100D67B2100D67B2100FFFFFF00D67B2100CE630000CE63
      0000CE6B0800CE630000CE6300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100D67B2100D67B2100D67B2100FFFFF700CE630000CE63
      0000CE6B0800CE630000CE6300006B392900B55A1000DE944200E79C5200E79C
      5200E7944200D67B2100D67B2100D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE6300006B392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300FFFFF700D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE63000073392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300EFA56300D67B2100FFFFFF00D67B2100D67B2100CE63
      0000CE6B0800CE630000CE63000073392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300EFA56300D67B2100D67B2100D67B2100FFFFF700CE63
      0000CE6B0800CE630000CE63000073392900B55A0800EFA56300EFB57B00EFAD
      6B00EFA56300EFA56300EFA56300D67B2100FFFFF700FFFFF700D67B2100CE63
      0000CE6B0800CE630000CE63000073392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400FFFFF700EFA56300D67B2100D67B2100FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400FFFFFF00EFA56300FFFFFF00D67B2100D67B2100CE63
      0000CE630000CE6B0000C66300006B392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400EFA56300EFA56300D67B2100D67B2100FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900B55A1000EFAD6B00F7CE9C00EFB5
      7B00EFB57300F7BD8400EFA56300EFA56300D67B2100D67B2100FFFFF700CE63
      0000CE630000CE6B0000C66300006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00FFFFF700EFA56300D67B2100D67B2100FFFFF700CE6B
      0800CE630000CE6B0000B55A10006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00F7BD8400FFFFFF00FFFFFF00D67B2100CE630000CE6B
      0800CE630000CE6B0000B55A10006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00FFFFF700EFA56300D67B2100D67B2100FFFFF700CE6B
      0800CE630000CE6B0000B55A10006B392900B55A1000E7944A00F7D6AD00F7CE
      9C00F7BD8400F7BD8C00FFFFF700EFA56300D67B2100D67B2100FFFFF700CE6B
      0800CE630000CE6B0000B55A10006B39290000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400FFFFF700FFFFF700FFFFF700DE842900D673
      1000CE6B0000CE6B00007B4221000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400EFBD8400FFFFFF00E7944200DE842900D673
      1000CE6B0000CE6B00007B4221000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400FFFFF700FFFFF700FFFFF700DE842900D673
      1000CE6B0000CE6B00007B4221000000000000000000CE6B0800F7CEA500FFE7
      E700F7CE9C00F7BD8C00F7C69400FFFFF700FFFFF700FFFFF700DE842900D673
      1000CE6B0000CE6B00007B4221000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A5521000733929000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A5521000733929000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A5521000733929000000000000000000BD5A0800E7944200FFE7
      E700FFE7E700F7CEA500F7CEA500EFB57B00E7A55A00E7944A00DE842900D673
      1000CE6B0000A552100073392900000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B39290000000000000000000000000000000000B55A1000E794
      4200F7D6AD00FFEFE700F7D6AD00F7CE9C00F7BD8400EFB57300E79C5200D67B
      2100AD5210007B3929000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B392900000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B392900000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B392900000000000000000000000000000000000000000000000000BD5A
      0800CE6B1000EFA56300EFBD9400F7CEA500EFC69400EFAD6B00D67B21009C4A
      18007B3929000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AD5A1000B55A1000B55A1000AD5A1000AD5A1000A55210000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FF81F00000000E007E00700000000
      C003C00300000000800180010000000080018001000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080018001000000008001800100000000C003C00300000000
      E007E00700000000F81FF81F00000000F81FF81FF81FF81FE007E007E007E007
      C003C003C003C003800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080018001800180018001800180018001C003C003C003C003
      E007E007E007E007F81FF81FF81FF81FF81FF81FF81FF81FE007E007E007E007
      C003C003C003C003800180018001800180018001800180010000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000080018001800180018001800180018001C003C003C003C003
      E007E007E007E007F81FF81FF81FF81F00000000000000000000000000000000
      000000000000}
  end
  object alRecent: TActionList
    Left = 56
    Top = 432
  end
  object synLinks: TSynURIOpener
    CtrlActivatesLinks = False
    Editor = memo1
    URIHighlighter = URISyntax
    Left = 280
    Top = 352
  end
  object URISyntax: TSynURISyn
    Left = 312
    Top = 352
  end
end
