inherited dMonCal: TdMonCal
  Left = 292
  Top = 232
  Caption = 'Calendar'
  ClientHeight = 212
  ClientWidth = 221
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 169
    Width = 221
    inherited Button1: TButton
      Left = 136
    end
    inherited Button2: TButton
      Left = 51
    end
  end
  inherited Panel2: TPanel
    Width = 221
    Height = 169
    object mcal: TMonthCalendar
      Left = 0
      Top = 0
      Width = 221
      Height = 169
      Align = alClient
      Date = 37979.6716044329
      TabOrder = 0
    end
  end
end
