inherited dTextGrid: TdTextGrid
  Left = 218
  Top = 259
  Caption = 'Text Grid'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object sgrid: TStringGrid
    Left = 0
    Top = 0
    Width = 570
    Height = 168
    Align = alClient
    ColCount = 2
    DefaultRowHeight = 20
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing, goThumbTracking]
    ParentFont = False
    PopupMenu = gridmenu
    TabOrder = 0
    OnDblClick = sgridDblClick
    OnGetEditText = sgridGetEditText
    OnSetEditText = sgridSetEditText
    ColWidths = (
      64
      64)
  end
  object gridmenu: TPopupMenu
    Left = 40
    Top = 120
    object Refresh1: TMenuItem
      Caption = '&Refresh'
      ShortCut = 116
      OnClick = Refresh1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Copy1: TMenuItem
      Caption = '&Copy'
      OnClick = Copy1Click
    end
    object CopywithHeaders1: TMenuItem
      Caption = 'Copy with &Headers'
      OnClick = CopywithHeaders1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Select1: TMenuItem
      Caption = 'Select'
      object Data1: TMenuItem
        Caption = 'Data'
        OnClick = Data1Click
      end
      object Column1: TMenuItem
        Caption = 'Column'
        OnClick = Column1Click
      end
      object Row1: TMenuItem
        Caption = 'Row'
        OnClick = Row1Click
      end
    end
    object SelectwithHeaders1: TMenuItem
      Caption = 'Select with Headers'
      object Data2: TMenuItem
        Caption = 'Data'
        OnClick = Data2Click
      end
      object Column2: TMenuItem
        Caption = 'Column'
        OnClick = Column2Click
      end
      object Row2: TMenuItem
        Caption = 'Row'
        OnClick = Row2Click
      end
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Export1: TMenuItem
      Caption = 'Export'
      object FixedLength1: TMenuItem
        Caption = '&Fixed Length'
        object NoDelimiter1: TMenuItem
          Caption = 'Normal'
          OnClick = NoDelimiter1Click
        end
        object Delimiter1: TMenuItem
          Caption = 'Delimiter'
          OnClick = Delimiter1Click
        end
      end
      object Delimited1: TMenuItem
        Caption = 'Delimited'
        OnClick = Delimited1Click
      end
    end
  end
end
