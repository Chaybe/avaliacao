unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, IniFiles;

type
  TfrmLogin = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    btnLogin: TButton;
    srcLogin: TDataSource;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    btnAutoPreencher: TButton;
    FDLogin: TFDStoredProc;
    FDLoginidUsuario: TFDAutoIncField;
    FDLoginnome: TStringField;
    FDLoginusername: TStringField;
    FDLoginativo: TBooleanField;
    procedure btnLoginClick(Sender: TObject);
    procedure edtUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btnAutoPreencherClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses untDMPrincipal, untFrmPrincipal;

{$R *.dfm}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  TFDStoredProc(srcLogin.DataSet).Close;
  TFDSToredProc(srcLogin.DataSet).Params.ParamByName('@username').AsString := edtUsuario.Text;
  TFDSToredProc(srcLogin.DataSet).Params.ParamByName('@senha').AsString := edtSenha.Text;
  TFDStoredProc(srcLogin.DataSet).Open;

  if((edtUsuario.Text<>'') or (edtSenha.Text<>'')) then // se usuario ou senha n?o estiver em branco
  begin
    if(TFDStoredProc(srcLogin.DataSet).RecordCount >0) then // se houver registro com os dados informados
    begin
      if(TFDStoredProc(srcLogin.DataSet).FieldByName('ativo').AsBoolean) then // se estiver ativo no banco
      begin
        frmPrincipal := TfrmPrincipal.Create(Self);
        frmPrincipal.lblNomeUsuario.Caption := 'Usu?rio: ' + TFDStoredProc(srcLogin.DataSet).FieldByName('nome').AsString;
        frmPrincipal.idUsuario := TFDStoredProc(srcLogin.DataSet).FieldByName('idUsuario').AsInteger;
        frmPrincipal.username := TFDStoredProc(srcLogin.DataSet).FieldByName('nome').AsString;
        frmPrincipal.ShowModal;
      end
      else
        ShowMessage('Usuario n?o est? ativo');
    end
    else
      ShowMessage('Usu?rio ou senha inv?lidos!');
  end
  else
    ShowMessage('N?o deixe os campos em branco');
end;

procedure TfrmLogin.btnAutoPreencherClick(Sender: TObject);
begin
  // pra n?o ficar digitando usuario e senha constantemente
  edtUsuario.Text := 'CHAYBE';
  edtSenha.Text := '123';
  btnLogin.Click;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    btnLogin.Click;
end;

procedure TfrmLogin.edtUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
    edtSenha.SetFocus;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var
  arquivo: TIniFile;
begin
  try
    arquivo := TIniFile.Create('C:\Users\anaco\Documents\CHAYBE\zoe\projeto\config.ini');
    //
    //DMPrincipal.FDConnection.Connected := false;
    //
    //DMPrincipal.FDConnection.Params.Values['DriverID']  := arquivo.ReadString('BANCO', 'driver',    EmptyStr) ;
    //DMPrincipal.FDConnection.DriverName                 := arquivo.ReadString('BANCO', 'driver',    EmptyStr) ;
    DMPrincipal.FDConnection.Params.Values['Database']  := arquivo.ReadString('BANCO', 'database',  EmptyStr) ;
    DMPrincipal.FDConnection.Params.Values['Server']    := arquivo.ReadString('BANCO', 'server',    EmptyStr) ;
    DMPrincipal.FDConnection.Params.Values['UserName']  := arquivo.ReadString('BANCO', 'username',  EmptyStr) ;
    DMPrincipal.FDConnection.Params.Values['Password']  := arquivo.ReadString('BANCO', 'password',  EmptyStr) ;
    //
    DMPrincipal.FDConnection.Connected := true;
    //
  except on e:Exception do
    FreeAndNil(arquivo);
  end;
end;

end.
