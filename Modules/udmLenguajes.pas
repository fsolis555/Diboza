unit udmLenguajes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,  Vcl.Dialogs,
  FireDAC.Stan.StorageXML;

type
  TdmLenguajes = class(TDataModule)
    FDMemIdioma: TFDMemTable;
  private
  public
    _dic: TStringList;
    procedure CargarArchivo;
    function GetValue(pKey: string): string;
  end;

var
  dmLenguajes: TdmLenguajes;

implementation
uses
  uSistema;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmLenguajes }

procedure TdmLenguajes.CargarArchivo;
var
  mArchivo: string;
  mCount: Integer;
  mNombre: string;
  mKey, mValue: string;
begin
  _dic := TStringList.Create;
  mArchivo := Global.PathLanguages + '\' + Global.Idioma;
  if (FileExists(mArchivo) = True) and (Trim(mArchivo) <> '') then
    _dic.LoadFromFile(mArchivo);
end;

function TdmLenguajes.GetValue(pKey: string): string;
var
  mId: Integer;
  mResultado: string;
begin
  mResultado := '';
  mId := _dic.IndexOfName(pKey);
  mResultado := dmLenguajes._dic.ValueFromIndex[mId];

  Result := mResultado;
end;

end.
