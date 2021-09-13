unit untFrmUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TfrmUsuario = class(TForm)
    Tab: TTabbedNotebook;
    Panel1: TPanel;
    DBGridScreen: TDBGrid;
    btnNovo: TButton;
    btnEditar: TButton;
    DBCliente: TDBEdit;
    Label1: TLabel;
    DBCelular: TDBEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Panel4: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    DBSenha: TDBEdit;
    chkVerSenha: TCheckBox;
    DBckAtivo: TDBCheckBox;
    FDUsuario: TFDStoredProc;
    srcUsuario: TDataSource;
    FDUpdate: TFDUpdateSQL;
    FDUsuarioidUsuario: TFDAutoIncField;
    FDUsuarionome: TStringField;
    FDUsuariousername: TStringField;
    FDUsuariosenha: TStringField;
    FDUsuarioativo: TBooleanField;
    edtLocalizar: TEdit;
    Label4: TLabel;
    btnLocalizar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure chkVerSenhaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses
  untDMPrincipal;
{$R *.dfm}

procedure TfrmUsuario.btnCancelarClick(Sender: TObject);
begin
  DMPrincipal.openSource(srcUsuario, true);

  Tab.PageIndex := 0;
end;

procedure TfrmUsuario.btnEditarClick(Sender: TObject);
begin
  TFDStoredProc(srcUsuario.DataSet).Edit;
  Tab.PageIndex := 1;
end;

procedure TfrmUsuario.btnLocalizarClick(Sender: TObject);
var
  contador: Integer;
begin
  TFDStoredProc(srcUsuario.DataSet).Close;
  for contador := 0 to TFDStoredProc(srcUsuario.DataSet).Params.Count-1 do
    TFDStoredProc(srcUsuario.DataSet).Params[contador].Clear;
  TFDStoredProc(srcUsuario.DataSet).Params.ParamByName('@nome').AsString := edtLocalizar.Text;
  TFDStoredProc(srcUsuario.DataSet).Open;
end;

procedure TfrmUsuario.btnNovoClick(Sender: TObject);
begin
  DMPrincipal.openSource(srcUsuario, true);
  TFDStoredProc(srcUsuario.DataSet).Insert;
  DBckAtivo.Checked := true;
  TFDStoredProc(srcUsuario.DataSet).FieldByName('ativo').Value := true;
  Tab.PageIndex := 1;
end;

procedure TfrmUsuario.btnSalvarClick(Sender: TObject);
begin
  TFDStoredProc(srcUsuario.DataSet).ApplyUpdates;
  TFDStoredProc(srcUsuario.DataSet).CommitUpdates;
  TFDStoredProc(srcUsuario.DataSet).Refresh;

  DMPrincipal.openSource(srcUsuario, false);

  Tab.PageIndex := 0;
end;

procedure TfrmUsuario.chkVerSenhaClick(Sender: TObject);
begin
  if(chkVerSenha.Checked) then
    DBSenha.PasswordChar := #0
  else
    DBSenha.PasswordChar := '*';
end;

procedure TfrmUsuario.FormShow(Sender: TObject);
begin
  Tab.PageIndex := 0;
end;

end.
