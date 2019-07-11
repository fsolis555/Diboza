unit uDL_tb_docunentosimpuestos;

interface
uses
  FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes;

type
  TDL_tb_docunentosimpuestos = class
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

{ TDL_tb_docunentosimpuestos }

{$REGION 'Metodos'}
constructor TDL_tb_docunentosimpuestos.Create;
begin
  Tabla := 'tb_docunentosimpuestos';
  ClaseNombre := 'TDL_tb_docunentosimpuestos';
  _IdNombre := 'Id';

  Dataset := TFDMemTable.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_docunentosimpuestos';
    FieldDefs.Clear;
    FieldDefs.Add('Id', ftInteger, 0);
    FieldDefs.Add('IdEncabezado', ftInteger, 0);
    FieldDefs.Add('NumeroLinea', ftInteger, 0);
    FieldDefs.Add('ImpuestoCodigo', ftString, 2);
    FieldDefs.Add('ImpuestoTarifa', ftFloat, 0);
    FieldDefs.Add('ImpuestoMonto', ftFloat, 0);
    FieldDefs.Add('CodigoTarifa', ftString, 2);
    FieldDefs.Add('FactorIVA', ftFloat, 0);
    FieldDefs.Add('PorcentajeExoneracion', ftFloat, 0);
    FieldDefs.Add('MontoExoneracion', ftFloat, 0);
    FieldDefs.Add('IdProducto', ftInteger, 0);
    FieldDefs.Add('IdImpuesto', ftInteger, 0);
    FieldDefs.Add('MontoExportacion', ftFloat, 0);
    FieldDefs.Add('Tipodocumento', ftString, 2);
    FieldDefs.Add('NumeroDocumento', ftString, 40);
    FieldDefs.Add('NombreInstitucion', ftString, 160);
    FieldDefs.Add('FechaEmision', ftString, 30);
    CreateDataSet;
    Open;
  end;
end;

destructor TDL_tb_docunentosimpuestos.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
end;
{$ENDREGION}

end.
