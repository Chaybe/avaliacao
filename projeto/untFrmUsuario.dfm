object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Usu'#225'rio'
  ClientHeight = 445
  ClientWidth = 665
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
    Width = 665
    Height = 445
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
      Caption = 'Registros do Usu'#225'rio'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 657
        Height = 153
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 12
          Width = 27
          Height = 13
          Caption = 'Nome'
        end
        object Label2: TLabel
          Left = 376
          Top = 12
          Width = 36
          Height = 13
          Caption = 'Usuario'
        end
        object Label4: TLabel
          Left = 16
          Top = 103
          Width = 89
          Height = 13
          Caption = 'Localizar por nome'
        end
        object btnNovo: TButton
          Left = 472
          Top = 122
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnEditar: TButton
          Left = 561
          Top = 122
          Width = 75
          Height = 25
          Cursor = crHandPoint
          Caption = 'Editar'
          TabOrder = 1
          OnClick = btnEditarClick
        end
        object DBCliente: TDBEdit
          Left = 16
          Top = 27
          Width = 249
          Height = 21
          Color = clBtnFace
          DataField = 'nome'
          DataSource = srcUsuario
          ReadOnly = True
          TabOrder = 2
        end
        object DBCelular: TDBEdit
          Left = 376
          Top = 27
          Width = 121
          Height = 21
          Color = clBtnFace
          DataField = 'username'
          DataSource = srcUsuario
          ReadOnly = True
          TabOrder = 3
        end
        object edtLocalizar: TEdit
          Left = 16
          Top = 122
          Width = 265
          Height = 21
          TabOrder = 4
        end
        object btnLocalizar: TButton
          Left = 287
          Top = 122
          Width = 26
          Height = 25
          Cursor = crHandPoint
          TabOrder = 5
          OnClick = btnLocalizarClick
        end
      end
      object DBGridScreen: TDBGrid
        Left = 0
        Top = 153
        Width = 657
        Height = 264
        Cursor = crHandPoint
        Align = alClient
        DataSource = srcUsuario
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
            FieldName = 'idUsuario'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'username'
            Title.Caption = 'Usu'#225'rio'
            Visible = True
          end>
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Dados do Usu'#225'rio'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 657
        Height = 417
        Align = alClient
        TabOrder = 0
        object Panel3: TPanel
          Left = 1
          Top = 368
          Width = 655
          Height = 48
          Align = alBottom
          TabOrder = 0
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
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 655
          Height = 367
          Align = alClient
          TabOrder = 1
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
            Left = 390
            Top = 13
            Width = 36
            Height = 13
            Caption = 'Usu'#225'rio'
          end
          object Label7: TLabel
            Left = 17
            Top = 59
            Width = 30
            Height = 13
            Caption = 'Senha'
          end
          object DBEdit1: TDBEdit
            Left = 17
            Top = 26
            Width = 56
            Height = 21
            TabStop = False
            Color = clBtnFace
            DataField = 'idUsuario'
            DataSource = srcUsuario
            ReadOnly = True
            TabOrder = 0
          end
          object DBEdit2: TDBEdit
            Left = 79
            Top = 26
            Width = 305
            Height = 21
            CharCase = ecUpperCase
            DataField = 'nome'
            DataSource = srcUsuario
            TabOrder = 1
          end
          object DBEdit5: TDBEdit
            Left = 390
            Top = 26
            Width = 187
            Height = 21
            CharCase = ecUpperCase
            DataField = 'username'
            DataSource = srcUsuario
            TabOrder = 2
          end
          object DBSenha: TDBEdit
            Left = 17
            Top = 74
            Width = 146
            Height = 21
            DataField = 'senha'
            DataSource = srcUsuario
            PasswordChar = '*'
            TabOrder = 3
          end
          object chkVerSenha: TCheckBox
            Left = 167
            Top = 76
            Width = 42
            Height = 17
            TabOrder = 4
            OnClick = chkVerSenhaClick
          end
          object DBckAtivo: TDBCheckBox
            Left = 390
            Top = 68
            Width = 97
            Height = 17
            Caption = 'Ativo'
            DataField = 'ativo'
            DataSource = srcUsuario
            TabOrder = 5
          end
        end
      end
    end
  end
  object FDUsuario: TFDStoredProc
    CachedUpdates = True
    Connection = DMPrincipal.FDConnection
    UpdateObject = FDUpdate
    StoredProcName = 'master.dbo.sp_Usuario_Selecionar'
    Left = 309
    Top = 241
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
        Name = '@idUsuario'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = '@nome'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end
      item
        Position = 4
        Name = '@username'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
    object FDUsuarioidUsuario: TFDAutoIncField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDUsuarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object FDUsuariousername: TStringField
      FieldName = 'username'
      Origin = 'username'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDUsuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object FDUsuarioativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
      ProviderFlags = [pfInUpdate]
    end
  end
  object srcUsuario: TDataSource
    DataSet = FDUsuario
    Left = 397
    Top = 241
  end
  object FDUpdate: TFDUpdateSQL
    Connection = DMPrincipal.FDConnection
    InsertSQL.Strings = (
      'INSERT INTO MASTER.dbo.Usuario'
      '(nome, username, senha, ativo)'
      'VALUES (:NEW_nome, :NEW_username, :NEW_senha, :NEW_ativo);'
      'SELECT SCOPE_IDENTITY() AS idUsuario')
    ModifySQL.Strings = (
      'UPDATE MASTER.dbo.Usuario'
      
        'SET nome = :NEW_nome, username = :NEW_username, senha = :NEW_sen' +
        'ha, '
      '  ativo = :NEW_ativo'
      'WHERE idUsuario = :OLD_idUsuario;'
      'SELECT idUsuario'
      'FROM MASTER.dbo.Usuario'
      'WHERE idUsuario = :NEW_idUsuario')
    DeleteSQL.Strings = (
      'DELETE FROM MASTER.dbo.Usuario'
      'WHERE idUsuario = :OLD_idUsuario')
    FetchRowSQL.Strings = (
      'SELECT idUsuario, nome, username, senha, ativo'
      'FROM ('
      'select * from master.dbo.Usuario'
      ') '
      'WHERE idUsuario = :OLD_idUsuario')
    Left = 477
    Top = 241
  end
end
