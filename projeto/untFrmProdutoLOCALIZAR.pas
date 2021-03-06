unit untFrmProdutoLOCALIZAR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TfrmProdutoLOCALIZAR = class(TForm)
    edtProduto: TEdit;
    btnLocalizar: TButton;
    Label1: TLabel;
    DBGridProduto: TDBGrid;
    FDProduto: TFDStoredProc;
    srcProduto: TDataSource;
    FDProdutoidProduto: TFDAutoIncField;
    FDProdutonomeProduto: TStringField;
    FDProdutovalorProduto: TCurrencyField;
    btnSelecionar: TButton;
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridProdutoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutoLOCALIZAR: TfrmProdutoLOCALIZAR;

implementation
uses
  untDMPrincipal;

{$R *.dfm}

procedure TfrmProdutoLOCALIZAR.btnLocalizarClick(Sender: TObject);
begin
  TFDStoredProc(srcProduto.DataSet).Params.ParamByName('@nomeProduto').AsString := edtProduto.Text;
  DMPrincipal.openSource(srcProduto, false);
end;

procedure TfrmProdutoLOCALIZAR.btnSelecionarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProdutoLOCALIZAR.DBGridProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
    btnSelecionar.Click;
end;

procedure TfrmProdutoLOCALIZAR.edtProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
    btnLocalizar.Click;
end;

end.
