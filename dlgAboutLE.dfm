object dlgAbout: TdlgAbout
  Left = 281
  Top = 220
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 236
  ClientWidth = 420
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 164
    Top = 0
    Width = 6
    Height = 241
    Shape = bsRightLine
  end
  object lbTitle: TLabel
    Left = 183
    Top = 21
    Width = 131
    Height = 38
    Caption = 'AppTitle'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object lbCompanyTitle: TLabel
    Left = 178
    Top = 8
    Width = 118
    Height = 19
    Caption = 'CompanyName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbVersion: TLabel
    Left = 178
    Top = 74
    Width = 43
    Height = 13
    Caption = 'lbVersion'
  end
  object lbCompany: TLabel
    Left = 178
    Top = 116
    Width = 52
    Height = 13
    Caption = 'lbCompany'
  end
  object lbCopyright: TLabel
    Left = 178
    Top = 95
    Width = 52
    Height = 13
    Caption = 'lbCopyright'
  end
  object lbUrl: TLabel
    Left = 178
    Top = 137
    Width = 21
    Height = 13
    Cursor = crHandPoint
    Caption = 'lbUrl'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = lbUrlClick
    OnMouseEnter = lbUrlMouseEnter
    OnMouseLeave = lbUrlMouseLeave
  end
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 167
    Height = 236
    Align = alLeft
    Center = True
    Transparent = True
  end
  object lbsupport: TLabel
    Left = 178
    Top = 159
    Width = 43
    Height = 13
    Cursor = crHandPoint
    Caption = 'lbsupport'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    OnClick = lbsupportClick
    OnMouseEnter = lbUrlMouseEnter
    OnMouseLeave = lbUrlMouseLeave
  end
  object btnOK: TButton
    Left = 328
    Top = 200
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
end
