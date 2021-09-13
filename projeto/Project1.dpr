program Project1;

uses
  Vcl.Forms,
  untLogin in 'untLogin.pas' {frmLogin},
  untDMPrincipal in 'untDMPrincipal.pas' {DMPrincipal: TDataModule},
  untFrmPrincipal in 'untFrmPrincipal.pas' {frmPrincipal},
  untFrmCliente in 'untFrmCliente.pas' {frmCliente},
  untFrmUsuario in 'untFrmUsuario.pas' {frmUsuario},
  untFrmProduto in 'untFrmProduto.pas' {frmProduto},
  untFrmVenda in 'untFrmVenda.pas' {frmVenda},
  untFrmProdutoCRUD in 'untFrmProdutoCRUD.pas' {frmProdutoCRUD},
  untFrmProdutoLOCALIZAR in 'untFrmProdutoLOCALIZAR.pas' {frmProdutoLOCALIZAR},
  untFrmVendaFinalizar in 'untFrmVendaFinalizar.pas' {frmVendaFinalizar},
  untFrmClienteLOCALIZAR in 'untFrmClienteLOCALIZAR.pas' {frmClienteLOCALIZAR},
  untFrmVendaParcela in 'untFrmVendaParcela.pas' {frmVendaParcela};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TDMPrincipal, DMPrincipal);
  Application.Run;
end.
