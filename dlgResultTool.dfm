inherited dResultTool: TdResultTool
  Caption = 'Results'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object mrs: TMemo
    Left = 0
    Top = 0
    Width = 570
    Height = 168
    Align = alClient
    HideSelection = False
    PopupMenu = pmemo
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object pmemo: TPopupMenu
    Left = 112
    Top = 88
    object clear1: TMenuItem
      Caption = '&Clear'
      OnClick = clear1Click
    end
    object Copy1: TMenuItem
      Caption = 'Copy'
      OnClick = Copy1Click
    end
    object CopyAll1: TMenuItem
      Caption = 'Copy All'
      OnClick = CopyAll1Click
    end
  end
end
