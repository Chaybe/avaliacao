unit untFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlInfo: TPanel;
    lblNomeUsuario: TLabel;
    Panel1: TPanel;
    pnlDataHora: TPanel;
    dataHoraCount: TTimer;
    Menu: TMainMenu;
    btnCliente: TButton;
    btnUsuario: TButton;
    FDStoredProc1: TFDStoredProc;
    btnProduto: TButton;
    btnVenda: TButton;
    btnNovo: TButton;
    btnParcelas: TButton;
    procedure dataHoraCountTimer(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnParcelasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idUsuario: Integer;
    username: String;
    procedure setVendaButton(venda:boolean; novo:boolean; editar:boolean);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation
uses
  untDMPrincipal,
  untFrmCliente, untFrmUsuario, untFrmProduto, untFrmVenda, untFrmVendaParcela;

{$R *.dfm}

procedure TfrmPrincipal.btnClienteClick(Sender: TObject);
begin
  setVendaButton(true, false, false);
  frmCliente := TFrmCliente.Create(Self);
  DMPrincipal.openSource(frmCliente.srcCliente, true);
  frmCliente.ShowModal;
end;

procedure TfrmPrincipal.btnParcelasClick(Sender: TObject);
begin
  frmVendaParcela := TFrmVendaParcela.Create(Self);
  frmVendaParcela.ShowModal;
end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
begin
  setVendaButton(true, false, false);

  frmVenda := TfrmVenda.Create(Self);
  //
  frmVenda.idUsuario := idUsuario;
  frmVenda.username := username;
  frmVenda.quantidade := 1;
  frmVenda.lblValorTotal.Caption := 'R$ 0';
  //
  frmVenda.Show;
  //
  DMPrincipal.openSource(frmVenda.srcVenda, true);
  TFDStoredProc(frmVenda.srcVenda.DataSet).Insert;
  //
  frmVenda.btnLocalizarCliente.Click;
end;

procedure TfrmPrincipal.btnProdutoClick(Sender: TObject);
begin
  setVendaButton(true, false, false);
  frmProduto := TfrmProduto.Create(Self);
  DMPrincipal.openSource(frmProduto.srcProduto, true);
  frmProduto.ShowModal;
end;

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin
  setVendaButton(true, false, false);
  frmUsuario := TFrmUsuario.Create(Self);
  DMPrincipal.openSource(frmUsuario.srcUsuario, true);
  TFDStoredProc(frmUsuario.srcUsuario.DataSet).Open;
  //
  frmUsuario.ShowModal;
end;

procedure TfrmPrincipal.btnVendaClick(Sender: TObject);
begin
  setVendaButton(false, true, true);
end;

procedure TfrmPrincipal.dataHoraCountTimer(Sender: TObject);
begin
  pnlDataHora.Caption := FormatDateTime('dd.mm.yyyy hh:MM:ss', Now);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  setVendaButton(true, false, false);
end;

procedure TfrmPrincipal.setVendaButton(venda, novo, editar: boolean);
begin
  btnVenda.Visible := venda;
  btnNovo.Visible := novo;
  btnParcelas.Visible := editar;
end;

end.
