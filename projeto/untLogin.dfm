object frmLogin: TfrmLogin
  Left = 470
  Top = 207
  BorderStyle = bsDialog
  Caption = 'Login'
  ClientHeight = 270
  ClientWidth = 271
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
  object lblUsuario: TLabel
    Left = 48
    Top = 32
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object lblSenha: TLabel
    Left = 48
    Top = 88
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object edtUsuario: TEdit
    Left = 48
    Top = 51
    Width = 177
    Height = 24
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = 'Usu'#225'rio'
    OnKeyPress = edtUsuarioKeyPress
  end
  object edtSenha: TEdit
    Left = 48
    Top = 107
    Width = 177
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    TextHint = 'Senha'
    OnKeyPress = edtSenhaKeyPress
  end
  object btnLogin: TButton
    Left = 48
    Top = 155
    Width = 177
    Height = 46
    Cursor = crHandPoint
    Caption = 'Acessar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object btnAutoPreencher: TButton
    Left = 128
    Top = 207
    Width = 97
    Height = 25
    Cursor = crHandPoint
    Caption = 'Auto Preencher'
    TabOrder = 3
    OnClick = btnAutoPreencherClick
  end
  object srcLogin: TDataSource
    DataSet = FDLogin
    Left = 80
    Top = 200
  end
  object FDLogin: TFDStoredProc
    CachedUpdates = True
    Connection = DMPrincipal.FDConnection
    StoredProcName = 'master.dbo.sp_Login'
    Left = 24
    Top = 200
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
        Name = '@username'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Position = 3
        Name = '@senha'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
    object FDLoginidUsuario: TFDAutoIncField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      ReadOnly = True
    end
    object FDLoginnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object FDLoginusername: TStringField
      FieldName = 'username'
      Origin = 'username'
      Required = True
    end
    object FDLoginativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
  end
end
