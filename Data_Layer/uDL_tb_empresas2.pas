unit uDL_tb_empresas2;

interface
uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes;

type
  TDL_tb_empresas2 = class
    Dataset: TFDMemTable;
  private
    {$REGION 'Propiedades'}
    FTabla: string;
    FClaseNombre: string;
    F_IdNombre: string;
    {$ENDREGION}
  public
    {$REGION 'Propiedades'}
    property Tabla: string read FTabla write FTabla;
    property ClaseNombre: string read FClaseNombre write FClaseNombre;
    property _IdNombre: string read F_IdNombre write F_IdNombre;
    {$ENDREGION}

    {$REGION 'Metodos'}
    constructor Create;
    destructor Destroy;
    {$ENDREGION}
  end;

implementation

{ TDL_tb_empresas }

{$REGION 'Metodos'}
constructor TDL_tb_empresas2.Create;
begin
  Tabla := 'tb_empresas';
  ClaseNombre := 'TDL_tb_empresas';
  _IdNombre := 'Id';

  Dataset := TFDMemTable.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_empresas';
    FieldDefs.Clear;
    FieldDefs.Add('Id', ftInteger, 0);
    FieldDefs.Add('Cuenta', ftString, 100);
    FieldDefs.Add('EsActivo', ftInteger, 0);
    FieldDefs.Add('Identificacion', ftString, 30);
    FieldDefs.Add('IdTipoIdentificacion', ftInteger, 0);
    FieldDefs.Add('Nombre', ftString, 200);
    FieldDefs.Add('IdProvincia', ftInteger, 0);
    FieldDefs.Add('IdCanton', ftInteger, 0);
    FieldDefs.Add('IdDistrito', ftInteger, 0);
    FieldDefs.Add('IdBarrio', ftInteger, 0);
    FieldDefs.Add('Direccion', ftString, 200);
    FieldDefs.Add('Telefono', ftString, 30);
    FieldDefs.Add('Fax', ftString, 30);
    FieldDefs.Add('Email', ftString, 200);
    FieldDefs.Add('Logo', ftBlob, 0);
    FieldDefs.Add('ExtensiobLogo', ftString, 10);
    FieldDefs.Add('MaxDocumentos', ftInteger, 0);
    FieldDefs.Add('IdPlan', ftInteger, 0);
    FieldDefs.Add('FechaAlta', ftDate, 0);
    FieldDefs.Add('FechaInicioOperaciones', ftDate, 0);
    FieldDefs.Add('HoraInicioOperaciones', ftString, 30);
    FieldDefs.Add('IdPlantilla', ftInteger, 0);
    FieldDefs.Add('CertificadoArchivo', ftBlob, 0);
    FieldDefs.Add('CertificadoArchivoExtension', ftString, 10);
    FieldDefs.Add('CertificadoClave', ftMemo, 0);
    FieldDefs.Add('TokenUsuario', ftMemo, 0);
    FieldDefs.Add('TokenClave', ftMemo, 0);
    FieldDefs.Add('tiposidentificacion', ftString, 5);
    FieldDefs.Add('provincia', ftString, 5);
    FieldDefs.Add('canton', ftString, 5);
    FieldDefs.Add('distrito', ftString, 5);
    FieldDefs.Add('barrio', ftString, 5);
    CreateDataSet;
    Open;
  end;
end;

destructor TDL_tb_empresas2.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
end;
{$ENDREGION}

end.
