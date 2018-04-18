inherited dManageList: TdManageList
  Caption = 'Manage List'
  ClientWidth = 391
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 391
    inherited Button1: TButton
      Left = 306
    end
    inherited Button2: TButton
      Left = 221
    end
  end
  inherited Panel2: TPanel
    Width = 391
    inherited listb: TListBox
      Top = 42
      Width = 391
      Height = 166
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 391
      Height = 42
      ButtonHeight = 36
      ButtonWidth = 70
      Caption = 'ToolBar1'
      Images = frmLEImages.leimgsm
      ShowCaptions = True
      TabOrder = 1
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
        Action = aAddItem
      end
      object ToolButton3: TToolButton
        Left = 78
        Top = 2
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 86
        Top = 2
        Action = aRemoveItem
      end
    end
  end
  object actlist: TActionList
    Images = frmLEImages.leimgsm
    Left = 16
    Top = 216
    object aAddItem: TAction
      Caption = 'Add Item'
      ImageIndex = 96
      OnExecute = aAddItemExecute
    end
    object aRemoveItem: TAction
      Caption = 'Remove Item'
      ImageIndex = 46
      OnExecute = aRemoveItemExecute
    end
  end
end
