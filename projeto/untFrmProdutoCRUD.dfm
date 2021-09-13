object frmProdutoCRUD: TfrmProdutoCRUD
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Dados do Produto'
  ClientHeight = 211
  ClientWidth = 457
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
    Width = 457
    Height = 170
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 73
      Width = 48
      Height = 13
      Caption = 'Valor (R$)'
    end
    object Label2: TLabel
      Left = 16
      Top = 13
      Width = 38
      Height = 13
      Caption = 'Produto'
    end
    object edtNomeProduto: TEdit
      Left = 16
      Top = 32
      Width = 401
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object edtValorProduto: TEdit
      Left = 16
      Top = 92
      Width = 145
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 170
    Width = 457
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnSalvar: TButton
      Left = 16
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TButton
      Left = 112
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object FDQueryINSERT: TFDQuery
    Connection = DMPrincipal.FDConnection
    SQL.Strings = (
      
        'INSERT INTO Produto(nomeProduto, valorProduto) VALUES(:nomeProdu' +
        'to, :valorProduto)')
    Left = 192
    Top = 104
    ParamData = <
      item
        Name = 'NOMEPRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'VALORPRODUTO'
        ParamType = ptInput
      end>
  end
  object FDQueryEDIT: TFDQuery
    Connection = DMPrincipal.FDConnection
    SQL.Strings = (
      
        'UPDATE Produto SET nomeProduto=:nomeProduto, valorProduto=:valor' +
        'Produto'
      'WHERE idProduto=:idProduto')
    Left = 280
    Top = 104
    ParamData = <
      item
        Name = 'NOMEPRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'VALORPRODUTO'
        ParamType = ptInput
      end
      item
        Name = 'IDPRODUTO'
        ParamType = ptInput
      end>
  end
end
