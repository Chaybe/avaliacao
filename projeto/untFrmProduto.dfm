object frmProduto: TfrmProduto
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Registro do Produto'
  ClientHeight = 444
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridScreen: TDBGrid
    Left = 0
    Top = 57
    Width = 664
    Height = 387
    Align = alClient
    DataSource = srcProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idProduto'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nomeProduto'
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valorProduto'
        Title.Caption = 'Valor (R$)'
        Visible = True
      end>
  end
  object pnlTopProduto: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 57
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 654
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 41
      Height = 13
      Caption = 'Localizar'
    end
    object edtLocaliza: TEdit
      Left = 8
      Top = 30
      Width = 377
      Height = 21
      TabOrder = 0
    end
    object btnLocaliza: TButton
      Left = 388
      Top = 30
      Width = 26
      Height = 21
      Cursor = crHandPoint
      TabOrder = 1
      OnClick = btnLocalizaClick
    end
    object btnNovo: TButton
      Left = 472
      Top = 26
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Novo'
      TabOrder = 2
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 560
      Top = 26
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Editar'
      TabOrder = 3
      OnClick = btnEditarClick
    end
  end
  object FDProduto: TFDStoredProc
    CachedUpdates = True
    Connection = DMPrincipal.FDConnection
    StoredProcName = 'master.dbo.sp_Produto_Selecionar'
    Left = 224
    Top = 312
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end
      item
        Position = 2
        Name = '@idProduto'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@nomeProduto'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end>
    object FDProdutoidProduto: TFDAutoIncField
      FieldName = 'idProduto'
      Origin = 'idProduto'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDProdutonomeProduto: TStringField
      FieldName = 'nomeProduto'
      Origin = 'nomeProduto'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 40
    end
    object FDProdutovalorProduto: TCurrencyField
      FieldName = 'valorProduto'
      Origin = 'valorProduto'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object srcProduto: TDataSource
    DataSet = FDProduto
    Left = 288
    Top = 312
  end
end
