unit uDL_TB_RECIBOSCLIENTESENCABEZADO;

interface
uses udmObjects, FireDAC.Comp.Client, System.SysUtils, Data.DB,
  System.Classes, udmConnection;

type
  TDatasetMem = TFDMemTable;

  TDL_TB_RECIBOSCLIENTESENCABEZADO = class
    Dataset: TDatasetMem;
    _ListaCampos: TStringList;
  const
    Tabla = 'TB_RECIBOSCLIENTESENCABEZADO';
    ClaseNombre = 'TDL_TB_RECIBOSCLIENTESENCABEZADO';
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
    procedure Actualizar_Estado(pWhere: string;
      pvalor: Integer;
      var pResultado: Integer; var pErrorM: string;
      FTypeConection: TTypeConection = udmConnection.Main);
    procedure Obtener_TotalesPago(pWhere: string;
      var pEfectivo: Double; var pTarjeta: Double;
      var pCheque: Double; var pTransferencia: Double;
      var pResultado: Integer; var pErrorM: string;
      FTypeConection: TTypeConection = udmConnection.Main);
    {$ENDREGION}
  end;


implementation

{ TDL_TB_RECIBOSCLIENTESENCABEZADO}

{$REGION 'Metodos'}
constructor TDL_TB_RECIBOSCLIENTESENCABEZADO.Create;
begin
  Dataset := TDatasetMem.Create(nil);
  with Dataset do
  begin
    FileName := 'TB_RECIBOSCLIENTESENCABEZADO';
    FieldDefs.Clear;
    FieldDefs.Add('ID', ftInteger, 0);
    FieldDefs.Add('NUMERO', ftInteger, 0);
    FieldDefs.Add('NUMEROS', ftString, 50);
    FieldDefs.Add('FECHA', ftDate, 0);
    FieldDefs.Add('HORA', ftString, 30);
    FieldDefs.Add('MONTOLETRAS', ftMemo, 0);
    FieldDefs.Add('SALDOANTERIOR', ftFloat, 0);
    FieldDefs.Add('MONTONUMERO', ftFloat, 0);
    FieldDefs.Add('SALDOACTUAL', ftFloat, 0);
    FieldDefs.Add('CODIGOCLIENTE', ftString, 100);
    FieldDefs.Add('NOMBRECLIENTE', ftString, 160);
    FieldDefs.Add('INTERESESP', ftFloat, 0);
    FieldDefs.Add('INTERESESM', ftFloat, 0);
    FieldDefs.Add('TOTALFINAL', ftFloat, 0);
    FieldDefs.Add('CODIGOESTADO', ftInteger, 0);
    FieldDefs.Add('CODIGOFORMAPAGO', ftInteger, 0);
    FieldDefs.Add('CODIGOMONEDA', ftInteger, 0);
    FieldDefs.Add('TIPOCAMBIO', ftFloat, 0);
    FieldDefs.Add('SERIE', ftString, 5);
    FieldDefs.Add('CODIGOIMPRESA', ftInteger, 0);
    FieldDefs.Add('NUMERODOC', ftString, 100);
    FieldDefs.Add('FECHAVENCIMIENTO', ftDate, 0);
    FieldDefs.Add('CODIGOTIPO', ftInteger, 0);
    FieldDefs.Add('CARCREDITO', ftString, 5);
    FieldDefs.Add('CARCONTADO', ftString, 5);
    FieldDefs.Add('CODIGOVENDEDOR', ftString, 100);
    FieldDefs.Add('NOMBREVENDEDOR', ftString, 160);
    FieldDefs.Add('IdCliente', ftInteger, 0);
    FieldDefs.Add('IdVendedor', ftInteger, 0);
    FieldDefs.Add('EFECTIVO', ftFloat, 0);
    FieldDefs.Add('TARJETA', ftFloat, 0);
    FieldDefs.Add('TRANSFERENCIA', ftFloat, 0);
    FieldDefs.Add('CHEQUE', ftFloat, 0);
    FieldDefs.Add('EstadoNombre', ftString, 100);
    CreateDataSet;
    Open;
  end;

  _ListaCampos := TStringList.Create;
end;

destructor TDL_TB_RECIBOSCLIENTESENCABEZADO.Destroy;
begin
  Dataset.Close;
  Dataset.Free;
  _ListaCampos.Free;
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Consultar(var pResultado: Integer;
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
    dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Consultar(dmObjects.FDQuery1, Dataset,
      mWhere, mOrderBy, mGroupBy, mHaving, Tabla, ClaseNombre,pResultado, pErrorM)
  else
    dmObjects.DB_Consultar_Generico(dmObjects.FDQuery1, pds1,
      pWhere, pOrderBy, pGroupBy, pHaving, pSelect, _ListaCampos,
      pResultado, pErrorM);
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Insertar(var pResultado: Integer; var pErrorM: string; FTypeConection: TTypeConection);
begin
  if FTypeConection = TTypeConection.Main then
    dmObjects.FDQuery1.Connection := dmConnection.FDMainConnection;
  if FTypeConection = TTypeConection.Local then
    dmObjects.FDQuery1.Connection := dmConnection.FDLocalConnection;
  if FTypeConection = TTypeConection.Type3 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType3Connection;
  if FTypeConection = TTypeConection.Type4 then
    dmObjects.FDQuery1.Connection := dmConnection.FDType4Connection;

  dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Insertar(dmObjects.FDQuery1, Dataset, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Modificar(pWhere: string; var pResultado: Integer;
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
  dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Modificar(dmObjects.FDQuery1, Dataset, mWhere,
    ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Eliminar(pWhere: string; var pResultado: Integer;
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
  dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Eliminar(dmObjects.FDQuery1, mWhere, Tabla, ClaseNombre,
    pResultado, pErrorM);
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Limpiar_Tag;
begin
  dmObjects.DB_Limpiar_Tag(Dataset);
end;

function TDL_TB_RECIBOSCLIENTESENCABEZADO.Existe_Id(pWhere: string; var pResultado: Integer;
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
    dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Existe_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_RECIBOSCLIENTESENCABEZADO.Obtener_Id(pWhere: string; var pResultado: Integer;
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
    dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_Id(dmObjects.FDQuery1, mWhere, Tabla,
      ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_RECIBOSCLIENTESENCABEZADO.Existe_Campo(pWhere, pCampo: string; pResultado: Integer;
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
    dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Existe_Campo(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

function TDL_TB_RECIBOSCLIENTESENCABEZADO.Obtener_Valor(pWhere, pCampo: string;
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
    dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_Valor(dmObjects.FDQuery1, mWhere, Tabla,
      pCampo, ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Actualizar_Campo(pWhere, pCampo: string; pValor: Variant;
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
  dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Actualizar_Campo(dmObjects.FDQuery1, mWhere, Tabla,
    pCampo, pValor, ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Actualizar_Estado(pWhere: string;
  pvalor: Integer; var pResultado: Integer; var pErrorM: string;
  FTypeConection: TTypeConection);
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
  dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Actualizar_Estado(dmObjects.FDQuery1, mWhere, Tabla,
    pValor, ClaseNombre, pResultado, pErrorM);
end;

procedure TDL_TB_RECIBOSCLIENTESENCABEZADO.Obtener_TotalesPago(pWhere: string;
  var pEfectivo, pTarjeta, pCheque, pTransferencia: Double;
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
  dmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_TotalesPago(dmObjects.FDQuery1, mWhere, Tabla,
    ClaseNombre, pEfectivo, pTarjeta, pCheque, pTransferencia,
    pResultado, pErrorM);
end;
{$ENDREGION}

end.

