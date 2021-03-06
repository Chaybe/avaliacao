unit untFrmClienteLOCALIZAR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmClienteLOCALIZAR = class(TForm)
    edtCliente: TEdit;
    btnLocalizar: TButton;
    DBGridCliente: TDBGrid;
    btnSelecionar: TButton;
    Label1: TLabel;
    FDCliente: TFDStoredProc;
    srcCliente: TDataSource;
    FDClienteidCliente: TFDAutoIncField;
    FDClientenomeCliente: TStringField;
    FDClientenumeroCPFCNPJ: TStringField;
    procedure btnLocalizarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure DBGridClienteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteLOCALIZAR: TfrmClienteLOCALIZAR;

implementation

uses
  untDMPrincipal;

{$R *.dfm}

procedure TfrmClienteLOCALIZAR.btnLocalizarClick(Sender: TObject);
begin
  TFDStoredProc(srcCliente.DataSet).Params.ParamByName('@nomeCliente').AsString := edtCliente.Text;
  DMPrincipal.openSource(srcCliente, false);
end;

procedure TfrmClienteLOCALIZAR.btnSelecionarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmClienteLOCALIZAR.DBGridClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key=#13 then
    btnSelecionar.Click;
end;

end.
