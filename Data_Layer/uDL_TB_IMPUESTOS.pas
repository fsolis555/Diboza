unit uDL_TB_IMPUESTOS;

interface
uses udmObjects, FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes, udmConnection;

type
  TDatasetMem = TFDMemTable;

  TDL_TB_IMPUESTOS = class
    Dataset: TDatasetMem;
    _ListaCampos: TStringList;
  const
    Tabla = 'tb_impuestos';
    ClaseNombre = 'TDL_TB_IMPUESTOS';
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
    function Obtener_Porcentaje(pWhere: string; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main): Double;
    function Obtener_PorcentajeValor(pWhere: string; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main): Double;
    procedure Set_AutoInc(
      pValor: Integer; pTipo: Integer; var pResultado: Integer;
      var pErrorM: string; FTypeConection: TTypeConection = udmConnection.Main);
    {$ENDREGION}
  end;


implementation

{ TDL_TB_IMPUESTOS}

{$REGION 'Metodos'}
constructor TDL_TB_IMPUESTOS.Create;
begin
  Dataset := TDatasetMem.Create(nil);
  with Dataset do
  begin
    FileName := 'tb_impuestos';
    FieldDefs.Clear;
    FieldDefs.Add('ID', ftInteger, 0);
    FieldDefs.Add('NOMBRE', ftString, 100);
    FieldDefs.Add('PORCENTAJE', ftFloat, 0);
    CreateDataSet;
    Open;
  end;

  _ListaCampos := TStringList.Create;
end;

destructor TDL_TB_IMPUESTOS.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
  _ListaCampos.Free;
end;

procedure TDL_TB_IMPUESTOS.Consultar(var pResultado: Integer;
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
    dmObjects.DB_TB_IMPUESTOS_Consultar(dmObjects.FDQuery1, Dataset,
      mWhere, mOrderBy, mGroupBy, mHaving, Tabla, ClaseNombre,pResultado, pErrorM)
  else
    dmObjects.DB_Consultar_Generico(dmObjects.FDQuery1, pds1,
      pWhere, pOrderBy, pGroupBy, pHaving, pSelect, _ListaCampos,
      pResultado, pErrorM);
end;

procedure TDL_TB_IMPUESTOS.Insertar(var pResultado: Integer; var pErrorM: string; FTypeConection: TTypeConection);
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  dmObjects.DB_TB_IMPUESTOS_Insertar(dmObjects.FDQuery1, Dataset, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_TB_IMPUESTOS.Modificar(pWhere: string; var pResultado: Integer;
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
  dmObjects.DB_TB_IMPUESTOS_Modificar(dmObjects.FDQuery1, Dataset, mWhere,
    ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_IMPUESTOS.Eliminar(pWhere: string; var pResultado: Integer;
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
  dmObjects.DB_TB_IMPUESTOS_Eliminar(dmObjects.FDQuery1, mWhere, Tabla, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_TB_IMPUESTOS.Limpiar_Tag;
begin
  dmObjects.DB_Limpiar_Tag(Dataset);
end;

function TDL_TB_IMPUESTOS.Existe_Id(pWhere: string; var pResultado: Integer;
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
    dmObjects.DB_TB_IMPUESTOS_Existe_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_IMPUESTOS.Obtener_Id(pWhere: string; var pResultado: Integer;
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
    dmObjects.DB_TB_IMPUESTOS_Obtener_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_IMPUESTOS.Existe_Campo(pWhere, pCampo: string; pResultado: Integer;
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
    dmObjects.DB_TB_IMPUESTOS_Existe_Campo(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_IMPUESTOS.Obtener_Valor(pWhere, pCampo: string;
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
    dmObjects.DB_TB_IMPUESTOS_Obtener_Valor(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_IMPUESTOS.Actualizar_Campo(pWhere, pCampo: string; pValor: Variant;
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
  dmObjects.DB_TB_IMPUESTOS_Actualizar_Campo(dmObjects.FDQuery1, mWhere, Tabla,
    pCampo, pValor, ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_IMPUESTOS.Obtener_Porcentaje(pWhere: string;
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
    dmObjects.DB_TB_IMPUESTOS_Obtener_Porcentaje(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_IMPUESTOS.Obtener_PorcentajeValor(pWhere: string;
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
    dmObjects.DB_TB_IMPUESTOS_Obtener_PorcentajeValor(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_IMPUESTOS.Set_AutoInc(pValor: Integer; pTipo: Integer;
  var pResultado: Integer;
  var pErrorM: string; FTypeConection: TTypeConection);
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  dmObjects.DB_TB_IMPUESTOS_Set_AutoInc(dmObjects.FDQuery1,
    Tabla, pValor, pTipo, ClaseNombre, pResultado, pErrorM);
end;
{$ENDREGION}

end.

