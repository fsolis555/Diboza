unit uDL_TB_PRODUCTOS;

interface
uses udmObjects, FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes, udmConnection;

type
  TDatasetMem = TFDMemTable;

  TDL_TB_PRODUCTOS = class
    Dataset: TDatasetMem;
    _ListaCampos: TStringList;
  const
    Tabla = 'tb_productos';
    ClaseNombre = 'TDL_TB_PRODUCTOS';
  public
    {$REGION 'Metodos'}
    constructor Create;
    destructor Destroy;
    procedure Consultar(var pResultado: Integer; var pErrorM: string;
      pWhere: string =''; pOrderBy: string ='';
      pGroupBy: string =''; pHaving: string =''; pSelect: string ='';
      pds1: TDatasetMem = nil; FTypeConection: TTypeConection = udmConnection.Main);
    procedure Insertar(var pResultado: Integer; var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main);
    procedure Modificar(pWhere: string; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main);
    procedure Eliminar(pWhere: string; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main);
    procedure Limpiar_Tag;
    function Existe_Id(pWhere: string; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main): Boolean;
    function Obtener_Id(pWhere: string; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main): Integer;
    function Existe_Campo(pWhere: string;
      pCampo: string; pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main): Boolean;
    function Obtener_Valor(pWhere: string;
      pCampo: string; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main): Variant;
    procedure Actualizar_Campo(pWhere: string;
      pCampo: string; pValor: Variant; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main);
    function Obtener_ImpuestoPorcentaje(
      pWhere: string;
      var pResultado: Integer; var pErrorM: string;
      FTypeConection: TTypeConection = udmConnection.Main): Double;
    function Obtener_Existencia(
      pWhere: string; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string;
      FTypeConection: TTypeConection = udmConnection.Main): Double;
    procedure Actualizar_Existencia(
      pWhere: string; pExistencia: Double; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string;
      FTypeConection: TTypeConection = udmConnection.Main);
    function Obtener_PrecioMayorista(
      pWhere: string;
      var pResultado: Integer; var pErrorM: string;
      FTypeConection: TTypeConection = udmConnection.Main): Double;
    function Obtener_Nombre(
      pWhere: string;
      var pResultado: Integer; var pErrorM: string;
      FTypeConection: TTypeConection = udmConnection.Main): string;
    {$ENDREGION}
  end;


implementation

{ TDL_TB_PRODUCTOS}

{$REGION 'Metodos'}
constructor TDL_TB_PRODUCTOS.Create;
begin
  Dataset := TDatasetMem.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_productos';
    FieldDefs.Clear;
    FieldDefs.Add('ID', ftInteger, 0);
    FieldDefs.Add('CODIGO', ftString, 100);
    FieldDefs.Add('NOMBRE', ftString, 100);
    FieldDefs.Add('CODIGOTIPOBARRAS', ftInteger, 0);
    FieldDefs.Add('DESCRIPCION', ftString, 200);
    FieldDefs.Add('CODIGOFAMILIA', ftInteger, 0);
    FieldDefs.Add('CODIGOUNIDADMEDIDA', ftInteger, 0);
    FieldDefs.Add('EXISTENCIA', ftFloat, 0);
    FieldDefs.Add('EXISTENCIAMINIMA', ftFloat, 0);
    FieldDefs.Add('APLICAREXISTENCIAMINIMA', ftInteger, 0);
    FieldDefs.Add('APLICARIVA', ftInteger, 0);
    FieldDefs.Add('CODIGOUBICACION', ftInteger, 0);
    FieldDefs.Add('COMPROMETIDOS', ftFloat, 0);
    FieldDefs.Add('FECHAALTA', ftDate, 0);
    FieldDefs.Add('PRECIOCOSTO', ftFloat, 0);
    FieldDefs.Add('PRECIOVENTA', ftFloat, 0);
    FieldDefs.Add('IMAGEN1', ftBlob, 0);
    FieldDefs.Add('NOMBREARCHIVO', ftString, 255);
    FieldDefs.Add('LISTAVENTAS', ftInteger, 0);
    FieldDefs.Add('LISTACOMPRAS', ftInteger, 0);
    FieldDefs.Add('ESCOMPUESTO', ftInteger, 0);
    FieldDefs.Add('CODIGOESTADO', ftInteger, 0);
    FieldDefs.Add('UTILIDAD', ftFloat, 0);
    FieldDefs.Add('LISTAMENUS', ftInteger, 0);
    FieldDefs.Add('CODIGOIMPUESTO', ftInteger, 0);
    FieldDefs.Add('IMPRIMECOMANDA', ftInteger, 0);
    FieldDefs.Add('CODIGOCOMANDA', ftInteger, 0);
    FieldDefs.Add('RECETA', ftMemo, 0);
    FieldDefs.Add('CODIGOBARRAS', ftString, 100);
    FieldDefs.Add('PRECIOVENTASIMPLE', ftFloat, 0);
    FieldDefs.Add('PRECIOMAYORISTA', ftFloat, 0);
    FieldDefs.Add('CODIGOPROVEEDOR', ftString, 100);
    FieldDefs.Add('IDProveedor', ftInteger, 0);
    FieldDefs.Add('IdTipo', ftInteger, 0);
    FieldDefs.Add('FechaVencimiento', ftDate, 0);
    FieldDefs.Add('Peso', ftFloat, 0);
    FieldDefs.Add('MINIMOLUNES', ftFloat, 0);
    FieldDefs.Add('MINIMOMARTES', ftFloat, 0);
    FieldDefs.Add('MINIMOMIERCOLES', ftFloat, 0);
    FieldDefs.Add('MINIMOJUEVES', ftFloat, 0);
    FieldDefs.Add('MINIMOVIERNES', ftFloat, 0);
    FieldDefs.Add('MINIMOSABADO', ftFloat, 0);
    FieldDefs.Add('MINIMODOMINGO', ftFloat, 0);
    FieldDefs.Add('PERMITIRDESCUENTOS', ftInteger, 0);
    FieldDefs.Add('PORCENTAJEIVA', ftFloat, 0);
    FieldDefs.Add('FamliaNombre', ftString, 100);
    FieldDefs.Add('ProveedorNombre', ftString, 160);
    CreateDataSet;
    Open;
  end;

  _ListaCampos := TStringList.Create;
end;

destructor TDL_TB_PRODUCTOS.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
  _ListaCampos.Free;
end;

procedure TDL_TB_PRODUCTOS.Consultar(var pResultado: Integer;
  var pErrorM: string; pWhere, pOrderBy, pGroupBy, pHaving,
  pSelect: string; pds1: TDatasetMem; FTypeConection: TTypeConection);
var
  mWhere, mOrderBy, mGroupBy, mHaving, mSelect: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere :='Where '+ pWhere;
  if Trim(pOrderBy) <> '' then
    mOrderBy :='Order By  '+ pOrderBy;
  if Trim(pGroupBy) <> '' then
    mGroupBy :='Group By  '+ pGroupBy;
  if Trim(pHaving) <> '' then
    mHaving :='Having  '+ pHaving;
  if Trim(pSelect) <> '' then
    mSelect :='Select  '+ pSelect;
  if Trim(pSelect) = '' then
    dmObjects.DB_TB_PRODUCTOS_Consultar(dmObjects.FDQuery1, Dataset,
      mWhere, mOrderBy, mGroupBy, mHaving, Tabla, ClaseNombre,pResultado, pErrorM)
  else
    dmObjects.DB_Consultar_Generico(dmObjects.FDQuery1, pds1,
      pWhere, pOrderBy, pGroupBy, pHaving, pSelect, _ListaCampos,
      pResultado, pErrorM);
end;

procedure TDL_TB_PRODUCTOS.Insertar(var pResultado: Integer; var pErrorM: string; FTypeConection: TTypeConection);
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  dmObjects.DB_TB_PRODUCTOS_Insertar(dmObjects.FDQuery1, Dataset, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_TB_PRODUCTOS.Modificar(pWhere: string; var pResultado: Integer;
  var pErrorM: string; FTypeConection: TTypeConection);
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  dmObjects.DB_TB_PRODUCTOS_Modificar(dmObjects.FDQuery1, Dataset, mWhere,
    ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_PRODUCTOS.Eliminar(pWhere: string; var pResultado: Integer;
  var pErrorM: string; FTypeConection: TTypeConection);
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  dmObjects.DB_TB_PRODUCTOS_Eliminar(dmObjects.FDQuery1, mWhere, Tabla, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_TB_PRODUCTOS.Limpiar_Tag;
begin
  dmObjects.DB_Limpiar_Tag(Dataset);
end;

function TDL_TB_PRODUCTOS.Existe_Id(pWhere: string; var pResultado: Integer;
  var pErrorM: string; FTypeConection: TTypeConection): Boolean;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Existe_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_PRODUCTOS.Obtener_Id(pWhere: string; var pResultado: Integer;
  var pErrorM: string; FTypeConection: TTypeConection): Integer;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Obtener_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_PRODUCTOS.Existe_Campo(pWhere, pCampo: string; pResultado: Integer;
  var pErrorM: string; FTypeConection: TTypeConection): Boolean;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Existe_Campo(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_PRODUCTOS.Obtener_Valor(pWhere, pCampo: string;
  var pResultado: Integer; var pErrorM: string; FTypeConection: TTypeConection): Variant;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Obtener_Valor(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_PRODUCTOS.Actualizar_Campo(pWhere, pCampo: string; pValor: Variant;
  var pResultado: Integer; var pErrorM: string; FTypeConection: TTypeConection);
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  dmObjects.DB_TB_PRODUCTOS_Actualizar_Campo(dmObjects.FDQuery1, mWhere, Tabla,
    pCampo, pValor, ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_PRODUCTOS.Obtener_ImpuestoPorcentaje(pWhere: string;
  var pResultado: Integer; var pErrorM: string; FTypeConection: TTypeConection): Double;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Obtener_ImpuestoPorcentaje(dmObjects.FDQuery1, mWhere,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_PRODUCTOS.Obtener_Existencia(pWhere, pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string;
  FTypeConection: TTypeConection): Double;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Obtener_Existencia(dmObjects.FDQuery1, mWhere,
      pClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_PRODUCTOS.Actualizar_Existencia(pWhere: string;
  pExistencia: Double; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string; FTypeConection: TTypeConection);
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  dmObjects.DB_TB_PRODUCTOS_Actualizar_Existencia(dmObjects.FDQuery1, mWhere,
    pExistencia, pClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_PRODUCTOS.Obtener_PrecioMayorista(pWhere: string;
  var pResultado: Integer; var pErrorM: string;
  FTypeConection: TTypeConection): Double;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Obtener_PrecioMayorista(dmObjects.FDQuery1, mWhere,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_PRODUCTOS.Obtener_Nombre(pWhere: string;
  var pResultado: Integer; var pErrorM: string;
  FTypeConection: TTypeConection): string;
var
  mWhere: string;
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  if Trim(pWhere) <> '' then
    mWhere := 'Where '+ pWhere;
  Result :=
    dmObjects.DB_TB_PRODUCTOS_Obtener_Nombre(dmObjects.FDQuery1, mWhere,
      ClaseNombre, pResultado, pErrorM);
end;
{$ENDREGION}

end.

