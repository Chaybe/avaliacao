object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'Principal'
  ClientHeight = 453
  ClientWidth = 668
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlInfo: TPanel
    Left = 0
    Top = 412
    Width = 668
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 376
      Height = 39
      Align = alLeft
      TabOrder = 0
      object lblNomeUsuario: TLabel
        Left = 16
        Top = 14
        Width = 36
        Height = 13
        Caption = 'Usu'#225'rio'
      end
    end
    object pnlDataHora: TPanel
      Left = 377
      Top = 1
      Width = 290
      Height = 39
      Align = alClient
      Caption = 'pnlDataHora'
      TabOrder = 1
    end
  end
  object btnCliente: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 33
    Cursor = crHandPoint
    Caption = 'Cliente'
    TabOrder = 1
    OnClick = btnClienteClick
  end
  object btnUsuario: TButton
    Left = 167
    Top = 8
    Width = 146
    Height = 33
    Cursor = crHandPoint
    Caption = 'Usu'#225'rio'
    TabOrder = 2
    OnClick = btnUsuarioClick
  end
  object btnProduto: TButton
    Left = 326
    Top = 8
    Width = 145
    Height = 33
    Cursor = crHandPoint
    Caption = 'Produto'
    TabOrder = 3
    OnClick = btnProdutoClick
  end
  object btnVenda: TButton
    Left = 486
    Top = 8
    Width = 146
    Height = 33
    Cursor = crHandPoint
    Caption = 'Venda'
    TabOrder = 4
    OnClick = btnVendaClick
  end
  object btnNovo: TButton
    Left = 486
    Top = 8
    Width = 67
    Height = 33
    Cursor = crHandPoint
    Caption = 'NOVO'
    TabOrder = 5
    OnClick = btnNovoClick
  end
  object btnParcelas: TButton
    Left = 559
    Top = 8
    Width = 71
    Height = 33
    Cursor = crHandPoint
    Caption = 'PARCELAS'
    TabOrder = 6
    OnClick = btnParcelasClick
  end
  object dataHoraCount: TTimer
    Interval = 500
    OnTimer = dataHoraCountTimer
    Left = 32
    Top = 312
  end
  object Menu: TMainMenu
    Left = 72
    Top = 312
  end
  object FDStoredProc1: TFDStoredProc
    Left = 152
    Top = 312
  end
end
