unit untFrmVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, StrUtils,
  FireDAC.Comp.Client;

type
  TfrmVenda = class(TForm)
    Panel1: TPanel;
    edtValorUnidade: TEdit;
    lbProdutos: TListBox;
    Label3: TLabel;
    lblValorTotal: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtProduto: TEdit;
    Label1: TLabel;
    btnLocalizaProduto: TButton;
    GroupBox2: TGroupBox;
    edtUsuario: TEdit;
    Usu?rio: TLabel;
    edtCliente: TEdit;
    btnLocalizarCliente: TButton;
    Label4: TLabel;
    FDVenda: TFDStoredProc;
    srcVenda: TDataSource;
    btnFinalizar: TButton;
    edtValorTotal: TEdit;
    Label5: TLabel;
    edtQuantidade: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    FDVendaidVenda: TFDAutoIncField;
    FDVendanumeroQuantidade: TIntegerField;
    FDVendavalorDesconto: TCurrencyField;
    FDVendaidUsuario: TIntegerField;
    FDVendaidCliente: TIntegerField;
    FDVendanomeCliente: TStringField;
    FDVendanomeProduto: TStringField;
    FDVendausername: TStringField;
    srcVendaRegistro: TDataSource;
    FDUltimoRegistro: TFDStoredProc;
    FDUltimoRegistroidVendaRegistro: TFDAutoIncField;
    FDUpdate: TFDUpdateSQL;
    edtDesconto: TEdit;
    Label7: TLabel;
    FDQueryVendaProdutoINSERT: TFDQuery;
    srcProdutoINSERT: TDataSource;
    edtCodigoProduto: TEdit;
    Label8: TLabel;
    btnAdicionarProduto: TButton;
    btnRemoverItem: TButton;
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnLocalizaProdutoClick(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
    procedure btnAdicionarProdutoClick(Sender: TObject);
    procedure btnRemoverItemClick(Sender: TObject);
  private
    { Private declarations }
    procedure calculaTotal(valorDesconto:double);
  public
    { Public declarations }
    valorAtual: double;
    // PRODUTO
    quantidade: Integer;
    idProduto:Integer;
    nomeProduto:String;
    valorProdutoUnidade:double;
    valorProdutoTotal:double;
    // USUARIO
    idUsuario: Integer;
    username: String;
    soma: double;
    // CLIENTE
    idCliente: Integer;
    nomeCliente: String;
    // VENDA
    idVendaRegistro: Integer;
    function idUltimaVenda:Integer;
    procedure enterKeyPress;
  end;

var
  frmVenda: TfrmVenda;

implementation
uses
  untDMPrincipal, untFrmProdutoLOCALIZAR, untFrmClienteLOCALIZAR,
  untFrmVendaFinalizar;

{$R *.dfm}

procedure TfrmVenda.btnLocalizaProdutoClick(Sender: TObject);
begin
  try
    frmProdutoLOCALIZAR := TFrmProdutoLOCALIZAR.Create(Self);
    DMPrincipal.openSource(frmProdutoLOCALIZAR.srcProduto, true);
    frmProdutoLOCALIZAR.ShowModal;
  finally
    idProduto := TFDStoredProc(frmProdutoLOCALIZAR.srcProduto.DataSet).FieldByName('idProduto').AsInteger;
    nomeProduto := TFDStoredProc(frmProdutoLOCALIZAR.srcProduto.DataSet).FieldByName('nomeProduto').AsString;
    valorProdutoTotal := quantidade*TFDStoredProc(frmProdutoLOCALIZAR.srcProduto.DataSet).FieldByName('valorProduto').AsFloat;
    valorProdutoUnidade := TFDStoredProc(frmProdutoLOCALIZAR.srcProduto.DataSet).FieldByName('valorProduto').AsFloat;
    //
    edtProduto.Text := nomeProduto;
    edtValorUnidade.Text := FloatToStr(valorProdutoUnidade);
    edtValorTotal.Text := FloatToStr(valorProdutoTotal);
    edtQuantidade.Text := IntToStr(quantidade);
    edtCodigoProduto.Text := IntToStr(idProduto);
    //
    edtProduto.SetFocus;
  end;
end;

procedure TfrmVenda.btnLocalizarClienteClick(Sender: TObject);
begin
  try
    frmClienteLOCALIZAR := TFrmClienteLOCALIZAR.Create(Self);
    DMPrincipal.openSource(frmClienteLOCALIZAR.srcCliente, true);
    frmClienteLOCALIZAR.ShowModal;
  finally
    idCliente := TFDStoredProc(frmClienteLOCALIZAR.srcCliente.DataSet).FieldByName('idCliente').AsInteger;
    nomeCliente := TFDStoredProc(frmClienteLOCALIZAR.srcCliente.DataSet).FieldByName('nomeCliente').AsString;
    //
    edtCliente.Text := nomeCliente;
    //
    edtProduto.SetFocus;
  end;
end;

procedure TfrmVenda.btnRemoverItemClick(Sender: TObject);
begin
  lbProdutos.Items.Delete(lbProdutos.ItemIndex);
  //

end;

procedure TfrmVenda.btnAdicionarProdutoClick(Sender: TObject);
begin
  enterKeyPress;
end;

procedure TfrmVenda.btnFinalizarClick(Sender: TObject);
var
  contador:Integer;
  i: Integer; // contador tamb?m
  idVenda: Integer;
begin
  if(lbProdutos.Items.Count>0) then
  begin
    try
      // gravar registro no banco
      //ShowMessage(IntToStr(lbProdutos.Items.Count));
      TFDStoredProc(srcVenda.DataSet).FieldByName('numeroQuantidade').AsInteger := quantidade;
      TFDStoredProc(srcVenda.DataSet).FieldByName('valorDesconto').AsInteger := StrToInt(IfThen(edtDesconto.Text<>'', edtDesconto.Text, '0'));
      TFDStoredProc(srcVenda.DataSet).FieldByName('idUsuario').AsInteger := idUsuario;
      TFDStoredProc(srcVenda.DataSet).FieldByName('idCliente').AsInteger := idCliente;
      //
      TFDStoredProc(srcVenda.DataSet).ApplyUpdates;
      TFDStoredProc(srcVenda.DataSet).CommitUpdates;
      TFDStoredProc(srcVenda.DataSet).Refresh;
      //
      TFDStoredProc(srcVenda.DataSet).Close;      // termina de inserir a venda no banco
    finally
      // salva produtos na tabela VendaProduto
      idVenda := idUltimaVenda;
      //
      for contador := 0 to lbProdutos.Items.Count-1 do
      begin
        FDQueryVendaProdutoINSERT.Params.ParamByName('IDVENDA').AsInteger := idVenda;// idUltimaVenda;
        FDQueryVendaProdutoINSERT.Params.ParamByName('IDPRODUTO').AsInteger := // pega o codigo do item no come?o do registro da ListBox
                                             StrToInt(Copy(lbProdutos.Items[contador],0, Pos('[', lbProdutos.Items[contador])-2));
        FDQueryVendaProdutoINSERT.ExecSQL;
      end;
      // vai para VendaFinalizar
      try
        frmVendaFinalizar := TfrmVendaFinalizar.Create(Self);
        //
        frmVendaFinalizar.idVenda := idUltimaVenda;
        frmVendaFinalizar.valorTotal := valorAtual;
        frmVendaFinalizar.valorDesconto := StrToInt(IfThen(edtDesconto.Text<>'', edtDesconto.Text, '0'));
        //
        frmVendaFinalizar.ShowModal;
      finally
        Close;
      end;
    end;
  end
  else
    ShowMessage('Inclua no m?nimo um produto na venda');
end;

procedure TfrmVenda.calculaTotal(valorDesconto:double);
begin
  valorAtual := StrToFloat(Copy(lblValorTotal.Caption, 4, Length(lblValorTotal.Caption)));
  valorAtual := valorAtual+valorProdutoTotal;
  lblValorTotal.Caption := 'R$ ' + FloatToStr(valorAtual);
end;

procedure TfrmVenda.edtProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key='*' then
  begin
    quantidade := StrToInt(Copy(edtProduto.Text, 0, Length(edtProduto.Text)));
    // abrir busca produto
    btnLocalizaProduto.Click;
  end;
  //
  if Key=#13 then
  begin
    enterKeyPress;
  end;
end;

procedure TfrmVenda.enterKeyPress;
begin
  // adicionar produto na lista e somar valor ao total
  if(edtProduto.Text<>'') then
  begin
    if(edtDesconto.Text<>'') then
      lbProdutos.Items.Add(edtCodigoProduto.Text + ' [ ' + edtQuantidade.Text + ' ] ' + nomeProduto + ' - R$ ' + FloatToStr(StrToFloat(edtValorTotal.Text)-StrToFloat(edtDesconto.Text)))
    else
      lbProdutos.Items.Add(edtCodigoProduto.Text + ' [ ' + edtQuantidade.Text + ' ] ' + nomeProduto + ' - R$ ' + edtValorTotal.Text);
    calculaTotal(StrToFloat(edtDesconto.Text));
    //
    edtProduto.Text := '';
    edtValorUnidade.Text := '';
    edtQuantidade.Text := '';
    edtValorTotal.Text := '';
    edtCodigoProduto.Text := '';
    edtDesconto.Text := '0';
    quantidade := 1;
    //
    edtProduto.SetFocus;
  end
  else
    btnLocalizaProduto.Click;
end;

procedure TfrmVenda.FormShow(Sender: TObject);
begin
  edtUsuario.Text := username;
  edtProduto.SetFocus;
  //
  edtDesconto.Text := '0';
  //
  btnRemoverItem.Visible := false;
end;

function TfrmVenda.idUltimaVenda: Integer;
begin
  DMPrincipal.openSource(srcVendaRegistro, true);
  Result := TFDStoredProc(srcVendaRegistro.DataSet).FieldByName('idVendaRegistro').AsInteger;
  //ShowMessage('id: ' + IntToStr(idVendaRegistro));
end;

procedure TfrmVenda.Memo1Click(Sender: TObject);
begin
  edtProduto.SetFocus;
end;

end.
