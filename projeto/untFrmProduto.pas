unit untFrmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmProduto = class(TForm)
    DBGridScreen: TDBGrid;
    pnlTopProduto: TPanel;
    edtLocaliza: TEdit;
    btnLocaliza: TButton;
    btnNovo: TButton;
    btnEditar: TButton;
    FDProduto: TFDStoredProc;
    srcProduto: TDataSource;
    FDProdutoidProduto: TFDAutoIncField;
    FDProdutonomeProduto: TStringField;
    FDProdutovalorProduto: TCurrencyField;
    Label1: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
  private
    { Private declarations }
    procedure openCRUD(status:Integer);
  public
    { Public declarations }
    idProduto: Integer;
    nomeProduto: String;
    valorProduto: double;
  end;

var
  frmProduto: TfrmProduto;

implementation
uses
  untDMPrincipal, untFrmProdutoCRUD;

{$R *.dfm}

procedure TfrmProduto.btnLocalizaClick(Sender: TObject);
var
  contador: Integer;
begin
  TFDStoredProc(srcProduto.DataSet).Close;
  for contador := 0 to TFDStoredProc(srcProduto.DataSet).Params.Count-1 do
    TFDStoredProc(srcProduto.DataSet).Params[contador].Clear;
  TFDStoredProc(srcProduto.DataSet).Params.ParamByName('@nomeProduto').AsString := edtLocaliza.Text;
  TFDStoredProc(srcProduto.DataSet).Open;
end;

procedure TfrmProduto.btnNovoClick(Sender: TObject);
begin
  openCRUD(1);
end;

procedure TfrmProduto.btnEditarClick(Sender: TObject);
begin
  openCRUD(2);
end;

procedure TfrmProduto.openCRUD(status: Integer);
begin
  frmProdutoCRUD := TfrmProdutoCRUD.Create(Self);
  if(status=1) then // se for INSERT, abre source
    DMPrincipal.openSource(srcProduto, true);
  frmProdutoCRUD.status := status; // 1-insert ; 2-edit

  frmProdutoCRUD.idProduto := TFDStoredProc(srcProduto.DataSet).FieldByName('idProduto').AsInteger;
  frmProdutoCRUD.nomeProduto := TFDStoredProc(srcProduto.DataSet).FieldByName('nomeProduto').AsString;
  frmProdutoCRUD.valorProduto := TFDStoredProc(srcProduto.DataSet).FieldByName('valorProduto').AsFloat;

  frmProdutoCRUD.ShowModal;
end;

end.
