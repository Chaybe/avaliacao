object frmProdutoLOCALIZAR: TfrmProdutoLOCALIZAR
  Left = 0
  Top = 0
  Caption = 'Localizar Produto'
  ClientHeight = 398
  ClientWidth = 547
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Produto'
  end
  object edtProduto: TEdit
    Left = 8
    Top = 24
    Width = 481
    Height = 21
    TabOrder = 0
    OnKeyPress = edtProdutoKeyPress
  end
  object btnLocalizar: TButton
    Left = 495
    Top = 22
    Width = 44
    Height = 25
    TabOrder = 1
    OnClick = btnLocalizarClick
  end
  object DBGridProduto: TDBGrid
    Left = 8
    Top = 51
    Width = 531
    Height = 310
    DataSource = srcProduto
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DBGridProdutoKeyPress
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
  object btnSelecionar: TButton
    Left = 416
    Top = 367
    Width = 123
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 3
    OnClick = btnSelecionarClick
  end
  object FDProduto: TFDStoredProc
    Connection = DMPrincipal.FDConnection
    StoredProcName = 'master.dbo.sp_Produto_Selecionar'
    Left = 264
    Top = 192
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
      ReadOnly = True
    end
    object FDProdutonomeProduto: TStringField
      FieldName = 'nomeProduto'
      Origin = 'nomeProduto'
      Size = 40
    end
    object FDProdutovalorProduto: TCurrencyField
      FieldName = 'valorProduto'
      Origin = 'valorProduto'
    end
  end
  object srcProduto: TDataSource
    DataSet = FDProduto
    Left = 368
    Top = 192
  end
end
