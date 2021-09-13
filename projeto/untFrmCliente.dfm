object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cliente'
  ClientHeight = 444
  ClientWidth = 663
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
  object Tab: TTabbedNotebook
    Left = 0
    Top = 0
    Width = 663
    Height = 444
    Align = alClient
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Registro de Clientes'
      object pnlPrincipal: TPanel
        Left = 0
        Top = 0
        Width = 655
        Height = 416
        Align = alClient
        TabOrder = 0
        object pnlScreenTop: TPanel
          Left = 1
          Top = 1
          Width = 653
          Height = 153
          Align = alTop
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 12
            Width = 33
            Height = 13
            Caption = 'Cliente'
          end
          object Label2: TLabel
            Left = 376
            Top = 12
            Width = 33
            Height = 13
            Caption = 'Celular'
          end
          object Label4: TLabel
            Left = 16
            Top = 54
            Width = 28
            Height = 13
            Caption = 'E-mail'
          end
          object lblLocaliza: TLabel
            Left = 16
            Top = 111
            Width = 85
            Height = 13
            Caption = 'Localiza por nome'
          end
          object DBCliente: TDBEdit
            Left = 16
            Top = 27
            Width = 345
            Height = 21
            Color = clBtnFace
            DataField = 'nomeCliente'
            DataSource = srcCliente
            ReadOnly = True
            TabOrder = 0
          end
          object DBCelular: TDBEdit
            Left = 376
            Top = 27
            Width = 121
            Height = 21
            Color = clBtnFace
            DataField = 'telefoneCelular'
            DataSource = srcCliente
            ReadOnly = True
            TabOrder = 1
          end
          object DBEmail: TDBEdit
            Left = 16
            Top = 70
            Width = 481
            Height = 21
            Color = clBtnFace
            DataField = 'email'
            DataSource = srcCliente
            ReadOnly = True
            TabOrder = 2
          end
          object btnNovo: TButton
            Left = 396
            Top = 122
            Width = 75
            Height = 25
            Cursor = crHandPoint
            Caption = 'Novo'
            TabOrder = 3
            OnClick = btnNovoClick
          end
          object btnEditar: TButton
            Left = 477
            Top = 122
            Width = 75
            Height = 25
            Cursor = crHandPoint
            Caption = 'Editar'
            TabOrder = 4
            OnClick = btnEditarClick
          end
          object edtLocaliza: TEdit
            Left = 16
            Top = 126
            Width = 255
            Height = 21
            TabOrder = 5
          end
          object btnLocaliza: TButton
            Left = 277
            Top = 126
            Width = 26
            Height = 21
            Cursor = crHandPoint
            TabOrder = 6
            OnClick = btnLocalizaClick
          end
          object btnExportCSV: TButton
            Left = 573
            Top = 122
            Width = 60
            Height = 25
            Cursor = crHandPoint
            Hint = 'Exporta dados do cliente selecionado'
            Caption = 'Vendas'
            TabOrder = 7
            OnClick = btnExportCSVClick
          end
        end
        object DBGridScreen: TDBGrid
          Left = 1
          Top = 154
          Width = 653
          Height = 261
          Align = alClient
          Color = clBtnFace
          DataSource = srcCliente
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'idCliente'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nomeCliente'
              Title.Caption = 'Cliente'
              Visible = True
            end>
        end
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Dados do Cliente'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 655
        Height = 368
        Align = alClient
        TabOrder = 0
        object Label3: TLabel
          Left = 17
          Top = 13
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
        end
        object Label5: TLabel
          Left = 79
          Top = 13
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label6: TLabel
          Left = 478
          Top = 13
          Width = 55
          Height = 13
          Caption = 'Nascimento'
        end
        object Label7: TLabel
          Left = 17
          Top = 59
          Width = 54
          Height = 13
          Caption = 'Tel. Celular'
        end
        object Label8: TLabel
          Left = 135
          Top = 59
          Width = 28
          Height = 13
          Caption = 'E-mail'
        end
        object Label9: TLabel
          Left = 113
          Top = 112
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object Label10: TLabel
          Left = 17
          Top = 171
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label11: TLabel
          Left = 316
          Top = 171
          Width = 65
          Height = 13
          Caption = 'Complemento'
        end
        object Label12: TLabel
          Left = 416
          Top = 112
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object Label13: TLabel
          Left = 150
          Top = 171
          Width = 50
          Height = 13
          Caption = 'Localidade'
        end
        object Label14: TLabel
          Left = 79
          Top = 171
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object Label15: TLabel
          Left = 17
          Top = 112
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object Label16: TLabel
          Left = 17
          Top = 229
          Width = 19
          Height = 13
          Caption = 'CPF'
        end
        object DBEdit1: TDBEdit
          Left = 17
          Top = 28
          Width = 56
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'idCliente'
          DataSource = srcCliente
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 79
          Top = 28
          Width = 393
          Height = 21
          CharCase = ecUpperCase
          DataField = 'nomeCliente'
          DataSource = srcCliente
          TabOrder = 1
        end
        object DBEdit5: TDBEdit
          Left = 135
          Top = 74
          Width = 275
          Height = 21
          DataField = 'email'
          DataSource = srcCliente
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 113
          Top = 127
          Width = 297
          Height = 21
          DataField = 'nomeLogradouro'
          DataSource = srcCliente
          TabOrder = 6
        end
        object DBEdit7: TDBEdit
          Left = 17
          Top = 190
          Width = 56
          Height = 21
          DataField = 'numeroEndereco'
          DataSource = srcCliente
          TabOrder = 8
        end
        object DBEdit8: TDBEdit
          Left = 316
          Top = 190
          Width = 252
          Height = 21
          DataField = 'nomeComplemento'
          DataSource = srcCliente
          TabOrder = 11
        end
        object DBEdit9: TDBEdit
          Left = 416
          Top = 127
          Width = 152
          Height = 21
          DataField = 'nomeBairro'
          DataSource = srcCliente
          TabOrder = 7
        end
        object DBEdit10: TDBEdit
          Left = 150
          Top = 190
          Width = 160
          Height = 21
          DataField = 'nomeLocalidade'
          DataSource = srcCliente
          TabOrder = 10
        end
        object DBEdit11: TDBEdit
          Left = 79
          Top = 190
          Width = 65
          Height = 21
          CharCase = ecUpperCase
          DataField = 'nomeUF'
          DataSource = srcCliente
          TabOrder = 9
        end
        object DBEdit12: TDBEdit
          Left = 17
          Top = 127
          Width = 90
          Height = 21
          DataField = 'numeroCep'
          DataSource = srcCliente
          TabOrder = 5
        end
        object dtpNascimento: TDateTimePicker
          Left = 478
          Top = 28
          Width = 90
          Height = 21
          Date = 44448.000000000000000000
          Time = 0.595885474540409600
          TabOrder = 2
        end
        object mkCelular: TMaskEdit
          Left = 17
          Top = 74
          Width = 112
          Height = 21
          EditMask = '!\(99\)00000-0000;1;_'
          MaxLength = 14
          TabOrder = 3
          Text = '(  )     -    '
        end
        object mkCpfCnpj: TMaskEdit
          Left = 17
          Top = 248
          Width = 152
          Height = 21
          EditMask = '000\.000\.000\-00;1;_'
          MaxLength = 14
          TabOrder = 12
          Text = '   .   .   -  '
        end
        object chkCNPJ: TCheckBox
          Left = 175
          Top = 250
          Width = 97
          Height = 17
          Caption = 'CNPJ'
          TabOrder = 13
          OnClick = chkCNPJClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 368
        Width = 655
        Height = 48
        Align = alBottom
        TabOrder = 1
        object btnSalvar: TButton
          Left = 17
          Top = 6
          Width = 112
          Height = 35
          Caption = 'Salvar'
          TabOrder = 0
          OnClick = btnSalvarClick
        end
        object btnCancelar: TButton
          Left = 145
          Top = 6
          Width = 112
          Height = 35
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object FDCliente: TFDStoredProc
    CachedUpdates = True
    Connection = DMPrincipal.FDConnection
    UpdateObject = FDUpdate
    StoredProcName = 'master.dbo.sp_Cliente_Selecionar'
    Left = 316
    Top = 320
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
        Name = '@nomeCliente'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
    object FDClienteidCliente: TFDAutoIncField
      FieldName = 'idCliente'
      Origin = 'idCliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDClientenomeCliente: TStringField
      FieldName = 'nomeCliente'
      Origin = 'nomeCliente'
      Required = True
      Size = 50
    end
    object FDClientedataNascimento: TSQLTimeStampField
      FieldName = 'dataNascimento'
      Origin = 'dataNascimento'
      ProviderFlags = [pfInUpdate]
    end
    object FDClientetelefoneCelular: TStringField
      FieldName = 'telefoneCelular'
      Origin = 'telefoneCelular'
      ProviderFlags = [pfInUpdate]
      Size = 14
    end
    object FDClientenomeLogradouro: TStringField
      FieldName = 'nomeLogradouro'
      Origin = 'nomeLogradouro'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object FDClientenumeroEndereco: TStringField
      FieldName = 'numeroEndereco'
      Origin = 'numeroEndereco'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object FDClientenomeComplemento: TStringField
      FieldName = 'nomeComplemento'
      Origin = 'nomeComplemento'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object FDClientenomeBairro: TStringField
      FieldName = 'nomeBairro'
      Origin = 'nomeBairro'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object FDClientenomeLocalidade: TStringField
      FieldName = 'nomeLocalidade'
      Origin = 'nomeLocalidade'
      ProviderFlags = [pfInUpdate]
    end
    object FDClientenomeUF: TStringField
      FieldName = 'nomeUF'
      Origin = 'nomeUF'
      ProviderFlags = [pfInUpdate]
      Size = 2
    end
    object FDClientenumeroCep: TStringField
      FieldName = 'numeroCep'
      Origin = 'numeroCep'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object FDClienteemail: TStringField
      FieldName = 'email'
      Origin = 'email'
      ProviderFlags = [pfInUpdate]
    end
    object FDClientenumeroCPFCNPJ: TStringField
      FieldName = 'numeroCPFCNPJ'
      Origin = 'numeroCPFCNPJ'
    end
  end
  object srcCliente: TDataSource
    DataSet = FDCliente
    OnDataChange = srcClienteDataChange
    Left = 380
    Top = 320
  end
  object FDUpdate: TFDUpdateSQL
    Connection = DMPrincipal.FDConnection
    InsertSQL.Strings = (
      'INSERT INTO MASTER.dbo.Cliente'
      '(nomeCliente, dataNascimento, telefoneCelular, '
      '  email, nomeLogradouro, numeroEndereco, nomeComplemento, '
      '  nomeBairro, nomeLocalidade, nomeUF, numeroCep, '
      '  numeroCPFCNPJ)'
      
        'VALUES (:NEW_nomeCliente, :NEW_dataNascimento, :NEW_telefoneCelu' +
        'lar, '
      
        '  :NEW_email, :NEW_nomeLogradouro, :NEW_numeroEndereco, :NEW_nom' +
        'eComplemento, '
      
        '  :NEW_nomeBairro, :NEW_nomeLocalidade, :NEW_nomeUF, :NEW_numero' +
        'Cep, '
      '  :NEW_numeroCPFCNPJ);'
      'SELECT SCOPE_IDENTITY() AS idCliente')
    ModifySQL.Strings = (
      'UPDATE MASTER.dbo.Cliente'
      
        'SET nomeCliente = :NEW_nomeCliente, dataNascimento = :NEW_dataNa' +
        'scimento, '
      '  telefoneCelular = :NEW_telefoneCelular, email = :NEW_email, '
      
        '  nomeLogradouro = :NEW_nomeLogradouro, numeroEndereco = :NEW_nu' +
        'meroEndereco, '
      
        '  nomeComplemento = :NEW_nomeComplemento, nomeBairro = :NEW_nome' +
        'Bairro, '
      '  nomeLocalidade = :NEW_nomeLocalidade, nomeUF = :NEW_nomeUF, '
      '  numeroCep = :NEW_numeroCep, numeroCPFCNPJ = :NEW_numeroCPFCNPJ'
      'WHERE idCliente = :OLD_idCliente;'
      'SELECT idCliente'
      'FROM MASTER.dbo.Cliente'
      'WHERE idCliente = :NEW_idCliente')
    DeleteSQL.Strings = (
      'DELETE FROM MASTER.dbo.Cliente'
      'WHERE idCliente = :OLD_idCliente')
    FetchRowSQL.Strings = (
      
        'SELECT idCliente, nomeCliente, dataNascimento, telefoneCelular, ' +
        'email, '
      '  nomeLogradouro, numeroEndereco, nomeComplemento, nomeBairro, '
      '  nomeLocalidade, nomeUF, numeroCep, numeroCPFCNPJ'
      'FROM ('
      'select * from master.dbo.Cliente'
      ') '
      'WHERE idCliente = :OLD_idCliente')
    Left = 436
    Top = 320
  end
  object FDClienteVendasConsultar: TFDStoredProc
    Connection = DMPrincipal.FDConnection
    StoredProcName = 'master.dbo.sp_ClienteVendas_Consultar'
    Left = 316
    Top = 240
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
        Name = '@idCliente'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDClienteVendasConsultarnomeCliente: TStringField
      FieldName = 'nomeCliente'
      Origin = 'nomeCliente'
      Size = 50
    end
    object FDClienteVendasConsultarnomeProduto: TStringField
      FieldName = 'nomeProduto'
      Origin = 'nomeProduto'
      Size = 40
    end
    object FDClienteVendasConsultarvalorProduto: TCurrencyField
      FieldName = 'valorProduto'
      Origin = 'valorProduto'
    end
  end
  object srcClienteVendas: TDataSource
    DataSet = FDClienteVendasConsultar
    Left = 348
    Top = 240
  end
end
