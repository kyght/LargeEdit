inherited doleplugin: Tdoleplugin
  Left = 337
  Top = 216
  Width = 401
  Height = 326
  BorderStyle = bsSizeable
  Caption = 'OLE Plugin'
  OldCreateOrder = True
  Position = poDesigned
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 249
    Width = 393
    inherited Button1: TButton
      Left = 308
    end
    inherited Button2: TButton
      Left = 223
    end
  end
  inherited Panel2: TPanel
    Width = 393
    Height = 249
    object papphost: TpsvAppletHost
      Left = 0
      Top = 0
      Width = 361
      Height = 233
      InActiveColor = clBlack
      AutoExtractGUID = False
      ServerOptions.TransferType = ttFileServer
      ServerOptions.ConnectType = ctDirect
      FileOptions.DefaultExt = 'ocx'
      FileOptions.Folder = 'C:\'
      AutoRegister = False
    end
  end
end
