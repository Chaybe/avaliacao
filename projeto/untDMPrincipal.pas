unit untDMPrincipal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TDMPrincipal = class(TDataModule)
    FDConnection: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure openSource(source:TDataSource; limpaParametro:boolean);
    //function buscaCEP(cep:String; resultado:String):String;
  end;

var
  DMPrincipal: TDMPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMPrincipal }
     {
function TDMPrincipal.buscaCEP(cep, resultado: String): String;
var
  ds: ClientDataSet;
begin
  ds := TDataSet.Create;
  ds.ReadXML('https://viacep.com.br/ws/' + cep + '/xml/');

end;
    }
procedure TDMPrincipal.openSource(source: TDataSource; limpaParametro:boolean);
var
  contador: Integer;
begin
  TFDStoredProc(source.DataSet).Close;

  if limpaParametro then
  begin
    for contador := 0 to TFDStoredProc(source.DataSet).Params.Count-1 do
      TFDStoredProc(source.DataSet).Params[contador].Clear
  end;

  TFDStoredProc(source.DataSet).Open;
end;

end.
