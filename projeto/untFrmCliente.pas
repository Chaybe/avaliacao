unit untFrmCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.TabNotBk,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCliente = class(TForm)
    DBGridScreen: TDBGrid;
    pnlScreenTop: TPanel;
    DBCliente: TDBEdit;
    DBCelular: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBEmail: TDBEdit;
    Tab: TTabbedNotebook;
    pnlPrincipal: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    FDCliente: TFDStoredProc;
    edtLocaliza: TEdit;
    btnLocaliza: TButton;
    srcCliente: TDataSource;
    lblLocaliza: TLabel;
    FDClienteidCliente: TFDAutoIncField;
    FDClientenomeCliente: TStringField;
    FDClientedataNascimento: TSQLTimeStampField;
    FDClientetelefoneCelular: TStringField;
    FDClientenomeLogradouro: TStringField;
    FDClientenumeroEndereco: TStringField;
    FDClientenomeComplemento: TStringField;
    FDClientenomeBairro: TStringField;
    FDClientenomeLocalidade: TStringField;
    FDClientenomeUF: TStringField;
    FDClientenumeroCep: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    FDUpdate: TFDUpdateSQL;
    dtpNascimento: TDateTimePicker;
    mkCelular: TMaskEdit;
    mkCpfCnpj: TMaskEdit;
    chkCNPJ: TCheckBox;
    FDClienteemail: TStringField;
    FDClientenumeroCPFCNPJ: TStringField;
    FDClienteVendasConsultar: TFDStoredProc;
    srcClienteVendas: TDataSource;
    btnExportCSV: TButton;
    FDClienteVendasConsultarnomeCliente: TStringField;
    FDClienteVendasConsultarnomeProduto: TStringField;
    FDClienteVendasConsultarvalorProduto: TCurrencyField;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure chkCNPJClick(Sender: TObject);
    procedure srcClienteDataChange(Sender: TObject; Field: TField);
    procedure btnExportCSVClick(Sender: TObject);
    procedure btnLocalizaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmCliente: TfrmCliente;

implementation

uses untDMPrincipal;

{$R *.dfm}

procedure TfrmCliente.btnCancelarClick(Sender: TObject);
var
  contador: Integer;
begin
  TFDStoredProc(srcCliente.DataSet).Close;
  for contador := 0 to TFDStoredProc(srcCliente.DataSet).Params.Count-1 do
    TFDStoredProc(srcCliente.DataSet).Params[contador].Clear;
  TFDStoredProc(srcCliente.DataSet).Open;

  Tab.PageIndex := 0;
end;

procedure TfrmCliente.btnEditarClick(Sender: TObject);
var
  contador: Integer;
begin
  {TFDStoredProc(srcCliente.DataSet).Close;
  for contador := 0 to TFDStoredProc(srcCliente.DataSet).Params.Count-1 do
    TFDStoredProc(srcCliente.DataSet).Params[contador].Clear;
  TFDStoredProc(srcCliente.DataSet).Open;}

  TFDStoredProc(srcCliente.DataSet).Edit;
  Tab.PageIndex := 1;
end;

procedure TfrmCliente.btnExportCSVClick(Sender: TObject);
var
  arq: TextFile;
  contador: Integer;
  stringList: TStringList;
  open: TSaveDialog;
begin
  try
    TFDStoredProc(srcClienteVendas.DataSet).Close;
    TFDStoredProc(srcClienteVendas.DataSet).Params.ParamByName('@idCliente').AsInteger := TFDStoredProc(srcCliente.DataSet).FieldByName('idCliente').AsInteger;
    TFDStoredProc(srcClienteVendas.DataSet).Open;
    //
    if(TFDStoredProc(srcClienteVendas.DataSet).RecordCount>0) then
    begin
      open := TSaveDialog.Create(Self);
      open.FileName := 'ClienteVenda.csv';
      //
      if open.Execute then
      begin
          stringList := TStringList.Create;
          AssignFile(arq, open.FileName);
          Rewrite(arq);
          TFDStoredProc(srcClienteVendas.DataSet).First;
          //
          for contador:=0 to TFDStoredProc(srcClienteVendas.DataSet).RecordCount-1 do
          begin
            stringList.Clear;
            //
            stringList.Add(TFDStoredProc(srcClienteVendas.DataSet).FieldByName('nomeCliente').AsString + ';' + TFDStoredProc(srcClienteVendas.DataSet).FieldByName('nomeProduto').AsString + '; R$ ' + TFDStoredProc(srcClienteVendas.DataSet).FieldByName('valorProduto').AsString + ';');
            //
            Writeln(arq, StringReplace(stringList.Text, #13#10, '', [rfReplaceAll]));
            TFDStoredProc(srcClienteVendas.DataSet).Next;
          end;
      end;
    end
    else
      ShowMessage('N?o h? vendas para este cliente');
  finally
    CloseFile(arq);
    ShowMessage('Arquivo exportado para ' + open.FileName);
  end;
end;

procedure TfrmCliente.btnLocalizaClick(Sender: TObject);
var
  contador: Integer;
begin
  TFDStoredProc(srcCliente.DataSet).Close;
  for contador := 0 to TFDStoredProc(srcCliente.DataSet).Params.Count-1 do
    TFDStoredProc(srcCliente.DataSet).Params[contador].Clear;
  TFDStoredProc(srcCliente.DataSet).Params.ParamByName('@nomeCliente').AsString := edtLocaliza.Text;
  TFDStoredProc(srcCliente.DataSet).Open;
end;

procedure TfrmCliente.btnNovoClick(Sender: TObject);
var
  contador: Integer;
begin
  TFDStoredProc(srcCliente.DataSet).Close;
  for contador := 0 to TFDStoredProc(srcCliente.DataSet).Params.Count-1 do
    TFDStoredProc(srcCliente.DataSet).Params[contador].Clear;
  TFDStoredProc(srcCliente.DataSet).Open;

  TFDStoredProc(srcCliente.DataSet).Insert;
  Tab.PageIndex := 1;
end;

procedure TfrmCliente.btnSalvarClick(Sender: TObject);
begin
  TFDStoredProc(srcCliente.DataSet).FieldByName('dataNascimento').AsDateTime := dtpNascimento.DateTime;
  TFDStoredProc(srcCliente.DataSet).FieldByName('telefoneCelular').AsString := mkCelular.Text;
  TFDStoredProc(srcCliente.DataSet).FieldByName('numeroCPFCNPJ').AsString := mkCpfCnpj.Text;

  TFDStoredProc(srcCliente.DataSet).ApplyUpdates;
  TFDStoredProc(srcCliente.DataSet).CommitUpdates;
  TFDStoredProc(srcCliente.DataSet).Refresh;

  Tab.PageIndex := 0;
end;

procedure TfrmCliente.chkCNPJClick(Sender: TObject);
begin
  if(chkCNPJ.Checked) then
    mkCpfCnpj.EditMask := '00\.000\.000\-0000\-00;1;_'
  else
    mkCpfCnpj.EditMask := '000\.000\.000\-00;1;_'
end;

procedure TfrmCliente.FormShow(Sender: TObject);
begin
  Tab.PageIndex := 0;
end;

procedure TfrmCliente.srcClienteDataChange(Sender: TObject; Field: TField);
begin
  if(TFDStoredProc(srcCliente.DataSet).State in [dsInsert, dsEdit]) then
  begin
    btnSalvar.Enabled := true;
    btnCancelar.Enabled := true;
  end
  else
  begin
    btnSalvar.Enabled := false;
    btnCancelar.Enabled := false;
  end;
end;

end.
