unit untFrmProdutoCRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmProdutoCRUD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtNomeProduto: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtValorProduto: TEdit;
    FDQueryINSERT: TFDQuery;
    FDQueryEDIT: TFDQuery;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    status: Integer;
    idProduto: Integer;
    nomeProduto: String;
    valorProduto: double;
  end;

var
  frmProdutoCRUD: TfrmProdutoCRUD;

implementation

uses
  untDMPrincipal, untFrmProduto;

{$R *.dfm}

procedure TfrmProdutoCRUD.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProdutoCRUD.btnSalvarClick(Sender: TObject);
begin
  if(status=1) then        // INSERT
  begin
    FDQueryINSERT.Params.ParamByName('NOMEPRODUTO').AsString := edtNomeProduto.Text;
    FDQueryINSERT.Params.ParamByName('VALORPRODUTO').Value := StrToFloat(edtValorProduto.Text);
    FDQueryINSERT.ExecSQL;
    //
    ShowMessage('Produto ' + edtNomeProduto.Text + ' registrado');
    TFDStoredProc(frmProduto.srcProduto.DataSet).Refresh;
    Close;
  end
  else if(status=2) then  // EDIT
  begin
    FDQueryEDIT.Params.ParamByName('IDPRODUTO').AsInteger := idProduto;
    FDQueryEDIT.Params.ParamByName('NOMEPRODUTO').AsString := edtNomeProduto.Text;
    FDQueryEDIT.Params.ParamByName('VALORPRODUTO').Value := StrToFloat(edtValorProduto.Text);
    FDQueryEDIT.ExecSQL;
    //
    ShowMessage('Produto ' + edtNomeProduto.Text + ' alterado');
    TFDStoredProc(frmProduto.srcProduto.DataSet).Refresh;
    Close;
  end;
end;

procedure TfrmProdutoCRUD.FormShow(Sender: TObject);
begin
  if(status=2) then
  begin
    edtNomeProduto.Text := nomeProduto;
    edtValorProduto.Text := FloatToStr(valorProduto);
  end;
end;

end.
