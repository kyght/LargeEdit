object fexplorer: Tfexplorer
  Left = 237
  Top = 145
  Width = 218
  Height = 485
  Caption = 'Explorer'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 174
    Width = 210
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  object shltree: TShellTreeView
    Left = 0
    Top = 29
    Width = 210
    Height = 145
    ObjectTypes = [otFolders]
    Root = 'rfDesktop'
    ShellListView = shllist
    UseShellImages = True
    Align = alTop
    AutoRefresh = False
    HideSelection = False
    Indent = 19
    ParentColor = False
    RightClickSelect = True
    ShowRoot = False
    TabOrder = 0
    OnEnter = shltreeEnter
    OnEdited = shltreeEdited
  end
  object shllist: TShellListView
    Left = 0
    Top = 179
    Width = 210
    Height = 272
    ObjectTypes = [otNonFolders]
    Root = 'rfDesktop'
    ShellTreeView = shltree
    Sorted = True
    Align = alClient
    DragMode = dmAutomatic
    ReadOnly = False
    HideSelection = False
    OnEnter = shllistEnter
    TabOrder = 1
    ViewStyle = vsSmallIcon
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 210
    Height = 29
    Caption = 'ToolBar1'
    Images = frmLEImages.leimgsm
    TabOrder = 2
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 8
      Top = 2
      Caption = 'ToolButton1'
      ImageIndex = 21
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 31
      Top = 2
      Caption = 'ToolButton3'
      ImageIndex = 30
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 54
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 31
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 62
      Top = 2
      Caption = 'ToolButton6'
      ImageIndex = 56
      OnClick = ToolButton6Click
    end
    object ToolButton9: TToolButton
      Left = 85
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 47
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 93
      Top = 2
      Caption = 'ToolButton8'
      ImageIndex = 53
      OnClick = ToolButton8Click
    end
    object ToolButton7: TToolButton
      Left = 116
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 47
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 124
      Top = 2
      Caption = 'ToolButton5'
      ImageIndex = 46
      OnClick = ToolButton5Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 128
    Top = 128
  end
end
