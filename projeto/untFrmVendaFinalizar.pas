unit untFrmVendaFinalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmVendaFinalizar = class(TForm)
    dtVencimento: TDateTimePicker;
    spParcelas: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnConfirmar: TButton;
    FDQueryINSERT: TFDQuery;
    GroupBox1: TGroupBox;
    lbParcelas: TListBox;
    Label3: TLabel;
    lblTotal: TLabel;
    procedure spParcelasChange(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function calculaParcela(valorTotal:double; valorDesconto:double; quantidadeParcelas:Integer):double;
  public
    { Public declarations }
    idVenda:Integer;
    valorTotal: double;
    valorDesconto: double;
  end;

var
  frmVendaFinalizar: TfrmVendaFinalizar;

implementation

uses
  untDMPrincipal;

{$R *.dfm}

procedure TfrmVendaFinalizar.btnConfirmarClick(Sender: TObject);
var
  contador: Integer;
begin
  // INSERT a cada parcela gerada com os dados de VendaFinalizar (mudando o valor da parcela)
  // mas colocando os valores atualizados (incluindo o id da venda)
  for contador := 0 to lbParcelas.Items.Count-1 do
  begin
    // INSERT
    FDQueryINSERT.Params.ParamByName('NUMEROPARCELA').AsInteger := contador+1;
    FDQueryINSERT.Params.ParamByName('DATAVENCIMENTO').AsDateTime := dtVencimento.DateTime;
    FDQueryINSERT.Params.ParamByName('VALORPARCELA').AsFloat := valorTotal-valorDesconto;
    FDQueryINSERT.Params.ParamByName('VALORDESCONTO').AsFloat := valorDesconto;
    //FDQueryINSERT.Params.ParamByName('VALORPAGAMENTO').AsFloat := 0.00;
    //FDQueryINSERT.Params.ParamByName('DATAPAGAMENTO').AsDateTime := 0.00;
    FDQueryINSERT.Params.ParamByName('IDVENDA').AsInteger := idVenda;
    //
    FDQueryINSERT.ExecSQL;
    //
    dtVencimento.DateTime := dtVencimento.DateTime+30;
  end;
  //
  Close;
end;

function TfrmVendaFinalizar.calculaParcela(valorTotal:double; valorDesconto:double; quantidadeParcelas:Integer): double;
begin
  // calcular valor das parcelas
  Result := (valorTotal-valorDesconto)/quantidadeParcelas;
end;

procedure TfrmVendaFinalizar.FormShow(Sender: TObject);
begin
  lblTotal.Caption := FloatToStr(valorTotal);
end;

procedure TfrmVendaFinalizar.spParcelasChange(Sender: TObject);
var
  contador:Integer;
begin
  lbParcelas.Items.Clear;
  //
  for contador := 0 to lbParcelas.Items.Count-1 do
    lbParcelas.Items[contador].Empty;
  //
  if(spParcelas.Value > 1 ) then
  begin
    for contador :=0 to spParcelas.Value-1 do
      lbParcelas.Items.Add(' [ ' + IntToStr(contador+1) + ' ]  R$ ' + FloatToStr(calculaParcela(valorTotal, valorDesconto, spParcelas.Value)));
  end;
end;

end.
