object frmVendaFinalizar: TfrmVendaFinalizar
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Finalizar Venda'
  ClientHeight = 386
  ClientWidth = 392
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
  object Label1: TLabel
    Left = 16
    Top = 13
    Width = 69
    Height = 13
    Caption = '1'#186' Vencimento'
  end
  object Label2: TLabel
    Left = 152
    Top = 13
    Width = 61
    Height = 13
    Caption = 'Qtd Parcelas'
  end
  object Label3: TLabel
    Left = 297
    Top = 13
    Width = 48
    Height = 13
    Caption = 'Total (R$)'
  end
  object lblTotal: TLabel
    Left = 299
    Top = 32
    Width = 46
    Height = 16
    Alignment = taRightJustify
    Caption = 'lblTotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtVencimento: TDateTimePicker
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    Date = 44449.000000000000000000
    Time = 0.633568715275032400
    TabOrder = 0
  end
  object spParcelas: TSpinEdit
    Left = 152
    Top = 31
    Width = 81
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 1
    Value = 0
    OnChange = spParcelasChange
  end
  object btnConfirmar: TButton
    Left = 274
    Top = 345
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 104
    Width = 363
    Height = 235
    Caption = 'Parcelas'
    TabOrder = 3
    object lbParcelas: TListBox
      Left = 3
      Top = 16
      Width = 358
      Height = 204
      BorderStyle = bsNone
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object FDQueryINSERT: TFDQuery
    Connection = DMPrincipal.FDConnection
    SQL.Strings = (
      
        'INSERT INTO VendaParcela(numeroParcela, dataVencimento, valorPar' +
        'cela, valorDesconto, dataPagamento, valorPagamento, idVenda)'
      
        'VALUES(:numeroParcela, :dataVencimento, :valorParcela, :valorDes' +
        'conto, '#39#39', 0, :idVenda)')
    Left = 216
    Top = 232
    ParamData = <
      item
        Name = 'NUMEROPARCELA'
        ParamType = ptInput
      end
      item
        Name = 'DATAVENCIMENTO'
        ParamType = ptInput
      end
      item
        Name = 'VALORPARCELA'
        ParamType = ptInput
      end
      item
        Name = 'VALORDESCONTO'
        ParamType = ptInput
      end
      item
        Name = 'IDVENDA'
        ParamType = ptInput
      end>
  end
end
