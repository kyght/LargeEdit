inherited dtempwin: Tdtempwin
  Left = 278
  Top = 173
  BorderIcons = [biSystemMenu]
  Caption = 'New File from Template'
  ClientHeight = 318
  ClientWidth = 494
  OldCreateOrder = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 275
    Width = 494
    object lfilename: TLabel [0]
      Left = 12
      Top = 15
      Width = 45
      Height = 13
      Caption = 'Filename:'
    end
    inherited Button1: TButton
      Left = 408
    end
    inherited Button2: TButton
      Left = 323
      OnClick = btnOKClick
    end
    object edtFilename: TEdit
      Left = 65
      Top = 12
      Width = 241
      Height = 21
      TabOrder = 2
      OnKeyDown = edtFilenameKeyDown
    end
  end
  inherited Panel2: TPanel
    Width = 494
    Height = 275
    object Splitter1: TSplitter
      Left = 169
      Top = 0
      Width = 2
      Height = 275
      Cursor = crHSplit
    end
    object tvfolders: TTreeView
      Left = 0
      Top = 0
      Width = 169
      Height = 275
      Align = alLeft
      Indent = 19
      PopupMenu = popFolder
      TabOrder = 0
      OnChange = tvfoldersChange
    end
    object lvfiles: TListView
      Left = 171
      Top = 0
      Width = 323
      Height = 275
      Align = alClient
      Columns = <>
      LargeImages = imglist
      SmallImages = imglist
      TabOrder = 1
      ViewStyle = vsSmallIcon
      OnClick = lvfilesClick
      OnDblClick = btnOKClick
    end
  end
  object imglist: TImageList
    Left = 192
    Top = 16
  end
  object popFolder: TPopupMenu
    Left = 192
    Top = 48
    object NewFolder1: TMenuItem
      Caption = 'New Folder...'
      OnClick = NewFolder1Click
    end
    object RenameFolder1: TMenuItem
      Caption = 'Rename Folder...'
      Visible = False
      OnClick = RenameFolder1Click
    end
    object DeleteFolder1: TMenuItem
      Caption = 'Delete Folder'
      OnClick = DeleteFolder1Click
    end
  end
end
