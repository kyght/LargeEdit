inherited dViewGrid: TdViewGrid
  Caption = 'View Grid'
  ClientHeight = 150
  ClientWidth = 280
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 107
    Width = 280
    inherited Button1: TButton
      Left = 195
    end
    inherited Button2: TButton
      Left = 110
    end
  end
  inherited Panel2: TPanel
    Width = 280
    Height = 107
    object Label1: TLabel
      Left = 11
      Top = 18
      Width = 69
      Height = 13
      Caption = 'Data Delimiter:'
    end
    object eDel: TEdit
      Left = 86
      Top = 40
      Width = 44
      Height = 21
      TabOrder = 1
    end
    object cbColumns: TCheckBox
      Left = 9
      Top = 72
      Width = 185
      Height = 17
      Alignment = taLeftJustify
      Caption = 'First Line contains columns name:'
      TabOrder = 2
    end
    object cbDel: TComboBox
      Left = 86
      Top = 15
      Width = 187
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbDelChange
      Items.Strings = (
        'Comma'
        'Tab'
        'Pipe'
        'Tilde'
        'Custom')
    end
  end
end
