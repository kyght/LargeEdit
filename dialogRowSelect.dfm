inherited dlgRowSelect: TdlgRowSelect
  Left = 208
  Top = 207
  Caption = 'Select'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 373
      Height = 57
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 22
        Top = 21
        Width = 72
        Height = 13
        Caption = 'Search Criteria:'
      end
      object txtSearchCriteria: TEdit
        Left = 103
        Top = 17
        Width = 143
        Height = 21
        TabOrder = 0
        OnChange = txtSearchCriteriaChange
      end
      object dsilbxGo: TButton
        Left = 256
        Top = 16
        Width = 33
        Height = 25
        Caption = 'Go'
        TabOrder = 1
        OnClick = dsilbxGoClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 57
      Width = 373
      Height = 151
      Align = alClient
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object ds: TDataSource
    Left = 16
    Top = 208
  end
end
