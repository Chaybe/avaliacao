object frmVenda: TfrmVenda
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Venda'
  ClientHeight = 447
  ClientWidth = 809
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 447
    Align = alLeft
    TabOrder = 0
    object Label3: TLabel
      Left = 481
      Top = 7
      Width = 128
      Height = 21
      Caption = 'Lista de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblValorTotal: TLabel
      Left = 496
      Top = 407
      Width = 113
      Height = 24
      Alignment = taRightJustify
      Caption = 'lblValorTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Memo1Click
    end
    object lbProdutos: TListBox
      Left = 384
      Top = 34
      Width = 225
      Height = 367
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 0
      OnClick = Memo1Click
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 167
      Width = 331
      Height = 194
      Caption = 'Dados do Produto'
      TabOrder = 1
      object Label2: TLabel
        Left = 10
        Top = 135
        Width = 66
        Height = 13
        Caption = 'Valor Unidade'
      end
      object Label1: TLabel
        Left = 10
        Top = 27
        Width = 38
        Height = 13
        Caption = 'Produto'
      end
      object Label5: TLabel
        Left = 197
        Top = 135
        Width = 49
        Height = 13
        Caption = 'Valor total'
      end
      object Label6: TLabel
        Left = 111
        Top = 135
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label7: TLabel
        Left = 171
        Top = 81
        Width = 69
        Height = 13
        Caption = 'Desconto (R$)'
      end
      object Label8: TLabel
        Left = 10
        Top = 81
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object edtValorUnidade: TEdit
        Left = 10
        Top = 154
        Width = 95
        Height = 24
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtProduto: TEdit
        Left = 10
        Top = 46
        Width = 282
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyPress = edtProdutoKeyPress
      end
      object btnLocalizaProduto: TButton
        Left = 298
        Top = 46
        Width = 26
        Height = 25
        Cursor = crHandPoint
        TabOrder = 3
        OnClick = btnLocalizaProdutoClick
      end
      object edtValorTotal: TEdit
        Left = 197
        Top = 154
        Width = 95
        Height = 24
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object edtQuantidade: TEdit
        Left = 111
        Top = 154
        Width = 80
        Height = 24
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edtDesconto: TEdit
        Left = 171
        Top = 100
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object edtCodigoProduto: TEdit
        Left = 10
        Top = 100
        Width = 143
        Height = 21
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 26
      Width = 331
      Height = 135
      Caption = 'Dados da Compra'
      TabOrder = 2
      object Usuário: TLabel
        Left = 10
        Top = 21
        Width = 54
        Height = 19
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 10
        Top = 69
        Width = 48
        Height = 19
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtUsuario: TEdit
        Left = 10
        Top = 40
        Width = 127
        Height = 21
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 0
        OnClick = Memo1Click
      end
      object edtCliente: TEdit
        Left = 10
        Top = 88
        Width = 282
        Height = 21
        Color = clBtnFace
        Enabled = False
        ReadOnly = True
        TabOrder = 1
        OnClick = Memo1Click
      end
      object btnLocalizarCliente: TButton
        Left = 298
        Top = 86
        Width = 25
        Height = 25
        Cursor = crHandPoint
        TabOrder = 2
        OnClick = btnLocalizarClienteClick
      end
    end
    object btnFinalizar: TButton
      Left = 15
      Top = 367
      Width = 331
      Height = 34
      Cursor = crHandPoint
      Caption = 'FINALIZAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnFinalizarClick
    end
    object btnAdicionarProduto: TButton
      Left = 352
      Top = 213
      Width = 26
      Height = 75
      Cursor = crHandPoint
      Caption = '>>'
      TabOrder = 4
      OnClick = btnAdicionarProdutoClick
    end
    object btnRemoverItem: TButton
      Left = 352
      Top = 132
      Width = 26
      Height = 75
      Cursor = crHandPoint
      Caption = '<<'
      TabOrder = 5
      OnClick = btnRemoverItemClick
    end
  end
  object Memo1: TMemo
    Left = 625
    Top = 0
    Width = 184
    Height = 447
    Align = alClient
    Color = clBtnFace
    Lines.Strings = (
      'INFORMA'#199#213'ES'
      ''
      'ENTER ou BOT'#195'O'
      'Localiza Produto'
      ''
      'PRODUTO + ENTER  '
      'Adiciona item '#224' lista'
      ''
      'NUMERO + *  '
      'Localiza produto e multiplica pela '
      'quantidade informada')
    ReadOnly = True
    TabOrder = 1
    OnClick = Memo1Click
  end
  object FDVenda: TFDStoredProc
    CachedUpdates = True
    Connection = DMPrincipal.FDConnection
    UpdateObject = FDUpdate
    StoredProcName = 'master.dbo.sp_Venda_Selecionar'
    Left = 407
    Top = 168
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
        Name = '@idVenda'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@username'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 4
        Name = '@nomeCliente'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 5
        Name = '@nomeProduto'
        DataType = ftString
        ParamType = ptInput
        Size = 40
      end>
    object FDVendaidVenda: TFDAutoIncField
      FieldName = 'idVenda'
      Origin = 'idVenda'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDVendanumeroQuantidade: TIntegerField
      FieldName = 'numeroQuantidade'
      Origin = 'numeroQuantidade'
      ProviderFlags = [pfInUpdate]
    end
    object FDVendavalorDesconto: TCurrencyField
      FieldName = 'valorDesconto'
      Origin = 'valorDesconto'
      ProviderFlags = [pfInUpdate]
    end
    object FDVendaidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      ProviderFlags = [pfInUpdate]
    end
    object FDVendaidCliente: TIntegerField
      FieldName = 'idCliente'
      Origin = 'idCliente'
      ProviderFlags = [pfInUpdate]
    end
    object FDVendanomeCliente: TStringField
      FieldName = 'nomeCliente'
      Origin = 'nomeCliente'
      ProviderFlags = []
      Size = 50
    end
    object FDVendanomeProduto: TStringField
      FieldName = 'nomeProduto'
      Origin = 'nomeProduto'
      ProviderFlags = []
      Size = 40
    end
    object FDVendausername: TStringField
      FieldName = 'username'
      Origin = 'username'
      ProviderFlags = []
    end
  end
  object srcVenda: TDataSource
    DataSet = FDVenda
    Left = 471
    Top = 168
  end
  object srcVendaRegistro: TDataSource
    DataSet = FDUltimoRegistro
    Left = 536
    Top = 330
  end
  object FDUltimoRegistro: TFDStoredProc
    CachedUpdates = True
    Connection = DMPrincipal.FDConnection
    StoredProcName = 'master.dbo.sp_UltimoRegistro_Selecionar'
    Left = 408
    Top = 328
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
        Value = 0
      end>
    object FDUltimoRegistroidVendaRegistro: TFDAutoIncField
      FieldName = 'idVendaRegistro'
      Origin = 'idVendaRegistro'
      ReadOnly = True
    end
  end
  object FDUpdate: TFDUpdateSQL
    Connection = DMPrincipal.FDConnection
    InsertSQL.Strings = (
      'INSERT INTO MASTER.dbo.Venda'
      '(numeroQuantidade, valorDesconto, idUsuario, idCliente)'
      
        'VALUES (:NEW_numeroQuantidade, :NEW_valorDesconto, :NEW_idUsuari' +
        'o, :NEW_idCliente);'
      'SELECT SCOPE_IDENTITY() AS idVenda')
    ModifySQL.Strings = (
      'UPDATE MASTER.dbo.Venda'
      
        'SET numeroQuantidade = :NEW_numeroQuantidade, valorDesconto = :N' +
        'EW_valorDesconto, '
      '  idUsuario = :NEW_idUsuario, idCliente = :NEW_idCliente'
      'WHERE idVenda = :OLD_idVenda;'
      'SELECT idVenda'
      'FROM MASTER.dbo.Venda'
      'WHERE idVenda = :NEW_idVenda')
    DeleteSQL.Strings = (
      'DELETE FROM MASTER.dbo.Venda'
      'WHERE idVenda = :OLD_idVenda')
    FetchRowSQL.Strings = (
      
        'SELECT idVenda, numeroQuantidade, valorDesconto, idUsuario, idCl' +
        'iente'
      'FROM ('
      'select * from master.dbo.Venda'
      ') '
      'WHERE idVenda = :OLD_idVenda')
    Left = 536
    Top = 168
  end
  object FDQueryVendaProdutoINSERT: TFDQuery
    Connection = DMPrincipal.FDConnection
    SQL.Strings = (
      
        'INSERT INTO VendaProduto(idVenda, idProduto) VALUES(:idVenda, :i' +
        'dProduto)')
    Left = 408
    Top = 64
    ParamData = <
      item
        Name = 'IDVENDA'
        ParamType = ptInput
      end
      item
        Name = 'IDPRODUTO'
        ParamType = ptInput
      end>
  end
  object srcProdutoINSERT: TDataSource
    DataSet = FDQueryVendaProdutoINSERT
    Left = 528
    Top = 64
  end
end
