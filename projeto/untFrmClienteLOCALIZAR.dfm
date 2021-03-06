object frmClienteLOCALIZAR: TfrmClienteLOCALIZAR
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Localizar Cliente'
  ClientHeight = 408
  ClientWidth = 557
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
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object edtCliente: TEdit
    Left = 8
    Top = 24
    Width = 481
    Height = 21
    TabOrder = 0
  end
  object btnLocalizar: TButton
    Left = 495
    Top = 22
    Width = 44
    Height = 25
    TabOrder = 1
    OnClick = btnLocalizarClick
  end
  object DBGridCliente: TDBGrid
    Left = 8
    Top = 51
    Width = 531
    Height = 310
    DataSource = srcCliente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyPress = DBGridClienteKeyPress
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
      end
      item
        Expanded = False
        FieldName = 'numeroCPFCNPJ'
        Title.Caption = 'CPF / CNPJ'
        Visible = True
      end>
  end
  object btnSelecionar: TButton
    Left = 416
    Top = 367
    Width = 123
    Height = 33
    Caption = 'Selecionar'
    TabOrder = 3
    OnClick = btnSelecionarClick
  end
  object FDCliente: TFDStoredProc
    Connection = DMPrincipal.FDConnection
    StoredProcName = 'master.dbo.sp_Cliente_Selecionar'
    Left = 240
    Top = 224
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
      ReadOnly = True
    end
    object FDClientenomeCliente: TStringField
      FieldName = 'nomeCliente'
      Origin = 'nomeCliente'
      Size = 50
    end
    object FDClientenumeroCPFCNPJ: TStringField
      FieldName = 'numeroCPFCNPJ'
      Origin = 'numeroCPFCNPJ'
    end
  end
  object srcCliente: TDataSource
    DataSet = FDCliente
    Left = 336
    Top = 224
  end
end
