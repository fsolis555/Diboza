unit udmObjects;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.DateUtils,
  Vcl.Dialogs, Vcl.ComCtrls, FireDAC.UI.Intf, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Comp.Script, System.Variants;

type
  TdmObjects = class(TDataModule)
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDQuery4: TFDQuery;
    FDQuery5: TFDQuery;
    FDQuery6: TFDQuery;
    FDQuery7: TFDQuery;
    FDQuery8: TFDQuery;
    FDStoredProc1: TFDStoredProc;
    FDStoredProc2: TFDStoredProc;
    FDStoredProc3: TFDStoredProc;
    FDStoredProc4: TFDStoredProc;
    FDStoredProc5: TFDStoredProc;
    FDStoredProc6: TFDStoredProc;
    FDScript1: TFDScript;
    FDScript2: TFDScript;
    FDScript3: TFDScript;
    FDScript4: TFDScript;
    FDScript5: TFDScript;
    FDScript6: TFDScript;
    FDQuery1Servidor: TFDQuery;
  private
    { Private declarations }
  public
    {$REGION 'General'}
    procedure DB_Asignar_Id(qry: TFDQuery; pTabla: string; ds: TFDMemTable;
      var pResultado: Integer; var pErrorM: string);
    function DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
      var pResultado: Integer; var pErrorM: string): Integer; overload;
    function DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
      pCampo: string; pWhere: string; var pResultado: Integer;
      var pErrorM: string): Integer; overload;
    procedure DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
      var pResultado: Integer; var pErrorM: string); overload;
    procedure DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
      var pCamposNombre: TStringList;
      var pResultado: Integer; var pErrorM: string); overload;
    procedure DB_StructToDB(qry: TFDQuery; ds1: TFDMemTable;
      pCampos: TStringList; var pResultado: Integer; var pErrorM: string);
    function DB_Obtener_ListaCampos(ds1: TFDMemTable): TStringList;
    function DB_Crear_SQL_Insert(pTabla: string; pCampos: string): string;
    function DB_Crear_SQL_Update(pTabla: string; pCampos: string): string;
    function DB_Obtener_SQL_ParametrosLista(
      pCampos: TStringList): string;
    procedure DB_Limpiar_Tag(ds1: TFDMemTable);
    procedure DB_Insert_Generico(qry1: TFDQuery; ds1: TFDMemTable;
      var pResultado: Integer; var pErrorM: string);
    procedure DB_Update_Generico(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; var pResultado: Integer; var pErrorM: string);
    procedure DB_Delete_Generico(qry1: TFDQuery; pTabla: string;
      pWhere: string; var pResultado: Integer; var pErrorM: string);
    procedure DB_Copiar_Estructura(dsOrigen: TFDMemTable;
      dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
    procedure DB_Copiar_Datos(dsOrigen: TFDMemTable;
      dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
    procedure DB_Consultar_Generico(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
      pSelect: string; var pCamposNombre: TStringList;
      var pResultado: Integer; var pErrorM: string);
    function GetNombreTab(pNombreFull: string; pNombreSimple: string): string;
    {$ENDREGION}

    {$REGION 'Skeleton'}
    procedure DB_Skeleton_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string);
    procedure DB_Skeleton_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
      pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
    procedure DB_Skeleton_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
      pWhere: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string);
    procedure DB_Skeleton_Eliminar(qry1: TFDQuery; pWhere: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string);
    function DB_Skeleton_Existe_Id(qry1: TFDQuery; pWhere: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string): Boolean;
    function DB_Skeleton_Obtener_Id(qry1: TFDQuery; pWhere: string;
      pTabla: string; pClaseNombre: string; var pResultado: Integer;
      var pErrorM: string): Integer;
    function DB_Skeleton_Existe_Campo(qry1: TFDQuery; pWhere: string;
      pTabla: string; pCampo: string; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string): Boolean;
    function DB_Skeleton_Obtener_Valor(qry1: TFDQuery; pWhere: string;
      pTabla: string; pCampo: string; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string): Variant;
    procedure DB_Skeleton_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
      pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
      var pResultado: Integer; var pErrorM: string);
    {$ENDREGION}

    //Declaracion Metodos
  {$REGION 'TB_APARTADOSDETALLE'}
  procedure DB_TB_APARTADOSDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_APARTADOSDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_APARTADOSDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_APARTADOSDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_APARTADOSDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_APARTADOSDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_APARTADOSDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_APARTADOSDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_APARTADOSDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_APARTADOSENCABEZADO'}
  procedure DB_TB_APARTADOSENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_APARTADOSENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_APARTADOSENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_APARTADOSENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_APARTADOSENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_APARTADOSENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_APARTADOSENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_APARTADOSENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_APARTADOSENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_APARTADOSENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_CIERRESCAJAENCABEZADO'}
  procedure DB_TB_CIERRESCAJAENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_CIERRESCAJAENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_CIERRESCAJAENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_CIERRESCAJAENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_CIERRESCAJAENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_CIERRESCAJAENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_CIERRESCAJAENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_CIERRESCAJAENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_CIERRESCAJAENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_CLIENTES'}
  procedure DB_TB_CLIENTES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_CLIENTES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_CLIENTES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_CLIENTES_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_CLIENTES_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_CLIENTES_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_CLIENTES_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_CLIENTES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_CLIENTES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_CLIENTES_Sumar_Saldo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pValor: Double; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_CLIENTES_Restar_Saldo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pValor: Double; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_CONSECUTIVOS'}
  procedure DB_TB_CONSECUTIVOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_CONSECUTIVOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_CONSECUTIVOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_CONSECUTIVOS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_CONSECUTIVOS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_CONSECUTIVOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_CONSECUTIVOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_CONSECUTIVOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_CONSECUTIVOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_EMPRESAS'}
  procedure DB_TB_EMPRESAS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_EMPRESAS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_EMPRESAS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_EMPRESAS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_EMPRESAS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_EMPRESAS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_EMPRESAS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_EMPRESAS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_EMPRESAS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_EMPRESAS_Set_AutoInc(qry1: TFDQuery;
    pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_ENTRADASDETALLE'}
  procedure DB_TB_ENTRADASDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_ENTRADASDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_ENTRADASDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_ENTRADASDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_ENTRADASDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_ENTRADASDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_ENTRADASDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_ENTRADASDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_ENTRADASDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_ENTRADASDETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_ENTRADASDETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_ENTRADASENCABEZADO'}
  procedure DB_TB_ENTRADASENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_ENTRADASENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_ENTRADASENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_ENTRADASENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_ENTRADASENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_ENTRADASENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_ENTRADASENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_ENTRADASENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_ENTRADASENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_ENTRADASENCABEZADO_Sumar_Totales(qry1: TFDQuery; pWhere: string;
    pClaseNombre: string; var pSubTotal: Double;
    var pDescuento: Double; var pTotal: Double;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_ENTRADASENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_ESTADOS'}
  procedure DB_TB_ESTADOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_ESTADOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_ESTADOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_ESTADOS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_ESTADOS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_ESTADOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_ESTADOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_ESTADOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_ESTADOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_FACTURASCLIENTESDETALLE'}
  procedure DB_TB_FACTURASCLIENTESDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_FACTURASCLIENTESDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_FACTURASCLIENTESDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_FACTURASCLIENTESDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_FACTURASCLIENTESDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_FACTURASCLIENTESDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESDETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESDETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_Detalles(qry1: TFDQuery; pWhere: string;
    pWhere2: string;
    pTabla: string; pClaseNombre: string; ds1: TFDMemTable;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_FACTURASCLIENTESENCABEZADO'}
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_FACTURASCLIENTESENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_FACTURASCLIENTESENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Actualizar_Saldo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pValor: Double; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
    var pCheque: Double; var pTransferencia: Double;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Sumar_Totales(qry1: TFDQuery; pWhere: string;
    pClaseNombre: string; var pSubTotal: Double;
    var pDescuento: Double; var pServicio: Double;
    var pIVA: Double;var pTotal: Double;
    var pResultado: Integer; var pErrorM: string);
  function DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_SaldoFecha(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Double;
  procedure DB_TB_FACTURASCLIENTESENCABEZADO_Estadistico(qry1: TFDQuery; pWhere: string;
    ds1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  function DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_TotalDescuentos(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Double;
  function DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_TotalKilos(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Double;
  {$ENDREGION}

  {$REGION 'TB_FAMILIAS'}
  procedure DB_TB_FAMILIAS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FAMILIAS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FAMILIAS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FAMILIAS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_FAMILIAS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_FAMILIAS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_FAMILIAS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_FAMILIAS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_FAMILIAS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_Familias_Set_AutoInc(qry1: TFDQuery;
    pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_FORMASPAGO'}
  procedure DB_TB_FORMASPAGO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FORMASPAGO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_FORMASPAGO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_FORMASPAGO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_FORMASPAGO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_FORMASPAGO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_FORMASPAGO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_FORMASPAGO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_FORMASPAGO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_IMPUESTOS'}
  procedure DB_TB_IMPUESTOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_IMPUESTOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_IMPUESTOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_IMPUESTOS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_IMPUESTOS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_IMPUESTOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_IMPUESTOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_IMPUESTOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_IMPUESTOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  function DB_TB_IMPUESTOS_Obtener_Porcentaje(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Double;
  function DB_TB_IMPUESTOS_Obtener_PorcentajeValor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Double;
  procedure DB_TB_IMPUESTOS_Set_AutoInc(qry1: TFDQuery;
    pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_NOTASCREDITOENCABEZADO'}
  procedure DB_TB_NOTASCREDITOENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASCREDITOENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASCREDITOENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASCREDITOENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_NOTASCREDITOENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_NOTASCREDITOENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_NOTASCREDITOENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_NOTASCREDITOENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_NOTASCREDITOENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASCREDITOENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASCREDITOENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
    var pCheque: Double; var pTransferencia: Double;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_NOTASDEBITOENCABEZADO'}
  procedure DB_TB_NOTASDEBITOENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASDEBITOENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASDEBITOENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASDEBITOENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_NOTASDEBITOENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_NOTASDEBITOENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_NOTASDEBITOENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_NOTASDEBITOENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_NOTASDEBITOENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_PLANTILLAS'}
  procedure DB_TB_PLANTILLAS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PLANTILLAS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PLANTILLAS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PLANTILLAS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_PLANTILLAS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_PLANTILLAS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_PLANTILLAS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_PLANTILLAS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_PLANTILLAS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  function DB_TB_PLANTILLAS_Obtener_Plantilla(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): string;
  {$ENDREGION}

  {$REGION 'TB_PRODUCTOS'}
  procedure DB_TB_PRODUCTOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PRODUCTOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PRODUCTOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PRODUCTOS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_PRODUCTOS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_PRODUCTOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_PRODUCTOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_PRODUCTOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_PRODUCTOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  function DB_TB_PRODUCTOS_Obtener_ImpuestoPorcentaje(qry1: TFDQuery;
    pWhere: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Double;
  function DB_TB_PRODUCTOS_Obtener_Existencia(qry1: TFDQuery;
    pWhere: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Double;
  procedure DB_TB_PRODUCTOS_Actualizar_Existencia(qry1: TFDQuery;
    pWhere: string; pExistencia: Double; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  function DB_TB_PRODUCTOS_Obtener_PrecioMayorista(qry1: TFDQuery;
    pWhere: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Double;
  function DB_TB_PRODUCTOS_Obtener_Nombre(qry1: TFDQuery;
    pWhere: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): string;
  function DB_TB_PRODUCTOS_EsFisico(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  {$ENDREGION}

  {$REGION 'TB_PROFORMASDETALLE'}
  procedure DB_TB_PROFORMASDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PROFORMASDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PROFORMASDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PROFORMASDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_PROFORMASDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_PROFORMASDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_PROFORMASDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_PROFORMASDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_PROFORMASDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_PROFORMASENCABEZADO'}
  procedure DB_TB_PROFORMASENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PROFORMASENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PROFORMASENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PROFORMASENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_PROFORMASENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_PROFORMASENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_PROFORMASENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_PROFORMASENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_PROFORMASENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PROFORMASENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_PROVEEDORES'}
  procedure DB_TB_PROVEEDORES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PROVEEDORES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PROVEEDORES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_PROVEEDORES_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_PROVEEDORES_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_PROVEEDORES_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_PROVEEDORES_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_PROVEEDORES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_PROVEEDORES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PROVEEDORES_Sumar_Saldo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pValor: Double; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PROVEEDORES_Restar_Saldo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pValor: Double; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_PROVEEDORES_Set_AutoInc(qry1: TFDQuery;
    pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_RECIBOSAPARTADOSDETALLE'}
  procedure DB_TB_RECIBOSAPARTADOSDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_RECIBOSAPARTADOSDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_RECIBOSAPARTADOSDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_RECIBOSAPARTADOSDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_RECIBOSAPARTADOSDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_RECIBOSAPARTADOSDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_RECIBOSAPARTADOSENCABEZADO'}
  procedure DB_TB_RECIBOSAPARTADOSENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_RECIBOSAPARTADOSENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_RECIBOSAPARTADOSENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_RECIBOSAPARTADOSENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_RECIBOSAPARTADOSENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_RECIBOSAPARTADOSENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
    var pCheque: Double; var pTransferencia: Double;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSAPARTADOSENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_RECIBOSCLIENTESDETALLE'}
  procedure DB_TB_RECIBOSCLIENTESDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_RECIBOSCLIENTESDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_RECIBOSCLIENTESDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_RECIBOSCLIENTESDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_RECIBOSCLIENTESDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_RECIBOSCLIENTESDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_RECIBOSCLIENTESENCABEZADO'}
  procedure DB_TB_RECIBOSCLIENTESENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_RECIBOSCLIENTESENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_RECIBOSCLIENTESENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_RECIBOSCLIENTESENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
    var pCheque: Double; var pTransferencia: Double;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_RECIBOSPROVEEDORESDETALLE'}
  procedure DB_TB_RECIBOSPROVEEDORESDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSPROVEEDORESDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSPROVEEDORESDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSPROVEEDORESDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_RECIBOSPROVEEDORESDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_RECIBOSPROVEEDORESDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_RECIBOSPROVEEDORESDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_RECIBOSPROVEEDORESDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_RECIBOSPROVEEDORESDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_RECIBOSPROVEEDORESENCABEZADO'}
  procedure DB_TB_RECIBOSPROVEEDORESENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSPROVEEDORESENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSPROVEEDORESENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_RECIBOSPROVEEDORESENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_RECIBOSPROVEEDORESENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_RECIBOSPROVEEDORESENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_RECIBOSPROVEEDORESENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_RECIBOSPROVEEDORESENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_RECIBOSPROVEEDORESENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_RECIBOSPROVEEDORESENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
    pTabla: string; pvalor: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_SISTEMA'}
  procedure DB_TB_SISTEMA_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_SISTEMA_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_SISTEMA_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_SISTEMA_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_SISTEMA_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_SISTEMA_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_SISTEMA_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_SISTEMA_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_SISTEMA_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_TIPOS'}
  procedure DB_TB_TIPOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_TIPOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_TIPOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_TIPOS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_TIPOS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_TIPOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_TIPOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_TIPOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_TIPOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_UNIDADESMEDIDA'}
  procedure DB_TB_UNIDADESMEDIDA_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_UNIDADESMEDIDA_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_UNIDADESMEDIDA_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_UNIDADESMEDIDA_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_UNIDADESMEDIDA_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_UNIDADESMEDIDA_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_UNIDADESMEDIDA_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_UNIDADESMEDIDA_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_UNIDADESMEDIDA_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_USUARIOS'}
  procedure DB_TB_USUARIOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_USUARIOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_USUARIOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_USUARIOS_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_USUARIOS_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_USUARIOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_USUARIOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_USUARIOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_USUARIOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_USUARIOS_Set_AutoInc(qry1: TFDQuery;
    pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_VENDEDORES'}
  procedure DB_TB_VENDEDORES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_VENDEDORES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_VENDEDORES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_VENDEDORES_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_VENDEDORES_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_VENDEDORES_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_VENDEDORES_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_VENDEDORES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_VENDEDORES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_grupos_encabezado'}
  procedure DB_TB_GruposEncabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_GruposEncabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_GruposEncabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_GruposEncabezado_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_GruposEncabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_GruposEncabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_GruposEncabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_GruposEncabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_GruposEncabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'tb_grupos_detalle'}
  procedure DB_TB_GruposDetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_GruposDetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_GruposDetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_GruposDetalle_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_GruposDetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_GruposDetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_GruposDetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_GruposDetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_GruposDetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'Ordenes Encabezado'}
  procedure DB_TB_OrdenesEncabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_OrdenesEncabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_OrdenesEncabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_OrdenesEncabezado_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_OrdenesEncabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_OrdenesEncabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_OrdenesEncabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_OrdenesEncabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_OrdenesEncabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'Ordenes Detalle'}
  procedure DB_TB_OrdenesDetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_OrdenesDetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_OrdenesDetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_OrdenesDetalle_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_OrdenesDetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_OrdenesDetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_OrdenesDetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_OrdenesDetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_OrdenesDetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_Licencias'}
  procedure DB_TB_Licencias_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_Licencias_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_Licencias_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_Licencias_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_Licencias_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_Licencias_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_Licencias_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_Licencias_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_Licencias_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_Cuentas'}
  procedure DB_TB_Cuentas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_Cuentas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_Cuentas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_Cuentas_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_Cuentas_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_Cuentas_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_Cuentas_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_Cuentas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_Cuentas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_AsientosEncabezado'}
  procedure DB_TB_AsientosEncabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_AsientosEncabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_AsientosEncabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_AsientosEncabezado_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_AsientosEncabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_AsientosEncabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_AsientosEncabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_AsientosEncabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_AsientosEncabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_AsientosDetalle'}
  procedure DB_TB_AsientosDetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_AsientosDetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_AsientosDetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_AsientosDetalle_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_AsientosDetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_AsientosDetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_AsientosDetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_AsientosDetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_AsientosDetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_Niveles Usuarios'}
  procedure DB_TB_NivelesUsuarios_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NivelesUsuarios_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NivelesUsuarios_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NivelesUsuarios_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_NivelesUsuarios_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_NivelesUsuarios_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_NivelesUsuarios_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_NivelesUsuarios_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_NivelesUsuarios_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_Movimientos Inventario'}
  procedure DB_TB_MovimientoInventario_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_MovimientoInventario_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_MovimientoInventario_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_MovimientoInventario_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_MovimientoInventario_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_MovimientoInventario_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_MovimientoInventario_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_MovimientoInventario_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_MovimientoInventario_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_NOTASCREDITODETALLE'}
  procedure DB_TB_NOTASCREDITODETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASCREDITODETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASCREDITODETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASCREDITODETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_NOTASCREDITODETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_NOTASCREDITODETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_NOTASCREDITODETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_NOTASCREDITODETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_NOTASCREDITODETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASCREDITODETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASCREDITODETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_VENDEDORESCLIENTES'}
  procedure DB_TB_VENDEDORESCLIENTES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_VENDEDORESCLIENTES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_VENDEDORESCLIENTES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_VENDEDORESCLIENTES_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_VENDEDORESCLIENTES_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_VENDEDORESCLIENTES_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_VENDEDORESCLIENTES_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_VENDEDORESCLIENTES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_VENDEDORESCLIENTES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_Conexiones'}
  procedure DB_TB_Conexiones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_Conexiones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_Conexiones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_Conexiones_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_Conexiones_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_Conexiones_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_Conexiones_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_Conexiones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_Conexiones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_NOTASDEBITODETALLE'}
  procedure DB_TB_NOTASDEBITODETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASDEBITODETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASDEBITODETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_NOTASDEBITODETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_NOTASDEBITODETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_NOTASDEBITODETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_NOTASDEBITODETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_NOTASDEBITODETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_NOTASDEBITODETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASDEBITODETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_NOTASDEBITODETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
    pTabla: string; d1: TFDMemTable; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  {$REGION 'TB_DOCUMENTOSHACIENDA'}
  procedure DB_TB_DOCUMENTOSHACIENDA_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_DOCUMENTOSHACIENDA_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
    pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_DOCUMENTOSHACIENDA_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
    pWhere: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  procedure DB_TB_DOCUMENTOSHACIENDA_Eliminar(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string);
  function DB_TB_DOCUMENTOSHACIENDA_Existe_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Boolean;
  function DB_TB_DOCUMENTOSHACIENDA_Obtener_Id(qry1: TFDQuery; pWhere: string;
    pTabla: string; pClaseNombre: string; var pResultado: Integer;
    var pErrorM: string): Integer;
  function DB_TB_DOCUMENTOSHACIENDA_Existe_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Boolean;
  function DB_TB_DOCUMENTOSHACIENDA_Obtener_Valor(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string): Variant;
  procedure DB_TB_DOCUMENTOSHACIENDA_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
    pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  procedure DB_TB_DOCUMENTOSHACIENDA_Set_AutoInc(qry1: TFDQuery;
    pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
    var pResultado: Integer; var pErrorM: string);
  {$ENDREGION}

  // Hacienda
  {$REGION 'DB_HaciendaEmpresas_Consultar'}
  procedure DB_HaciendaEmpresas_Consultar(pCon: TFDConnection;
    ds1: TFDMemTable;
    pWhere: string; pIdEmpresa: Integer;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_TotalesDocumentos'}
  procedure DB_Hacienda_TotalesDocumentos(
    pCon: TFDConnection; ds1: TFDMemTable; qry1: TFDQuery;
    var pServiciosExentos: Double; var pServiciosGravados: Double;
    var pMercanciasExentos: Double; var pMercanciasGravados: Double;
    var pTotalGravado: Double; var pTotalExcento: Double;
    var pTotalVenta: Double; var pTotalVentaNeta: Double; var pTotalDescuentos: Double;
    var pTotalImpuesto: Double; var pTotalComprobante: Double;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_DocumentosEncabezado_Insertar'}
  procedure DB_Hacienda_DocumentosEncabezado_Insertar(
    pCon: TFDConnection; ds1: TFDMemTable;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_VariosObtener_Ultimo'}
  function DB_VariosObtener_Ultimo(pCon: TFDConnection;
    pTabla: string; pCampo, pWhere: string;
    pIdEmpresa: Integer; var pResultado: Integer; var pError: string): Integer;
  {$ENDREGION}

  {$REGION 'DB_Hacienda_DocumentosDetalle_Insertar'}
  procedure DB_Hacienda_DocumentosDetalle_Insertar(
    pCon: TFDConnection; ds1: TFDMemTable;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda__DocumentosDescuentos_Insertar'}
  procedure DB_Hacienda__DocumentosDescuentos_Insertar(
    pCon: TFDConnection; ds1: TFDMemTable;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_DocumentosImpuestos_Insertar'}
  procedure DB_Hacienda_DocumentosImpuestos_Insertar(
    pCon: TFDConnection; ds1: TFDMemTable;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_DocumentosOtrosCargos_Insertar'}
  procedure DB_Hacienda_DocumentosOtrosCargos_Insertar(
    pCon: TFDConnection; ds1: TFDMemTable;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_ActualizaXMLSinFirma'}
  procedure DB_Hacienda_ActualizaXMLSinFirma(
    pCon: TFDConnection; pXML: string; pWhere: string;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_ActualizaXMLConFirma'}
  procedure DB_Hacienda_ActualizaXMLConFirma(
    pCon: TFDConnection; pXML: string; pWhere: string;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_ActualizaXMLConFirma'}
  procedure DB_Hacienda_ActualizaPDF(
    pCon: TFDConnection; ds1: TFDMemTable; pWhere: string;
    pIdEmpresa: Integer; pTabla: string;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_ConsecutivosDocumentos_GetConsecutivo'}
  function DB_Hacienda_ConsecutivosDocumentos_GetConsecutivo(
   pCon: TFDConnection; pWhere: string; pIdEmpresa: Integer;
   var pResultado: Integer; var pError: string): Integer;
  {$ENDREGION}

  {$REGION 'DB_Hacienda_ConsecutivosDocumentos_ActualizarConsecutivo'}
  procedure DB_Hacienda_ConsecutivosDocumentos_ActualizarConsecutivo(pConsecutivo: Integer;
    pCon: TFDConnection; pWhere: string; pIdEmpresa: Integer;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_ActualizarCloud'}
  procedure DB_Hacienda_ActualizarCloud(pValor: Integer;
    pCon: TFDConnection; pWhere: string; pTabla: string;
    pIdEmpresa: Integer;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  {$REGION 'DB_Hacienda_Insertar'}
  procedure DB_Hacienda_Insertar(
    pCon: TFDConnection;
    pCondicionVenta: string; pPlazoCredito: string; pMedioPago: string;
    ds1: TFDMemTable; qry1: TFDQuery;
    pSucursal: Integer; pTerminal, pNumero: Integer;
    dsCliente: TFDMemTable; dsDetalle: TFDMemTable;
    pPathTemp: string; pPathAplicacion: string;
    pTipoDocNombre: string; pIdEmpresa: Integer;
    var pResultado: Integer; var pError: string);
  {$ENDREGION}

  end;

var
  dmObjects: TdmObjects;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses udmConnection, udmReports,
  uDL_tb_empresas2, uHacienda, uDL_tb_docunentosencabezado,
  uDL_tb_docunentosdetalle, uDL_tb_documentosdescuentos,
  uDL_tb_docunentosimpuestos, uDL_tb_documentosotroscargos;

const
  SaveLog = 1;

{$R *.dfm}

{$REGION 'Funciones General'}
procedure TdmObjects.DB_Asignar_Id(qry: TFDQuery; pTabla: string;
  ds: TFDMemTable; var pResultado: Integer; var pErrorM: string);
var
  mId: Integer;
begin
  try
    pResultado := 1;

    mId := dmObjects.DB_Obtener_Ultimo(qry, pTabla, pResultado, pErrorM);
    Inc(mId);
    with ds do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('Id').AsInteger := mId;
        Post;
        Inc(mId);
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

function TdmObjects.DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
  var pResultado: Integer; var pErrorM: string): Integer;
var
  mUltimo: Integer;
begin
  try
    pResultado := 1;

    mUltimo := 0;
    with qry do
    begin
      SQL.Clear;
      SQL.Add('Select Max(Id)');
      SQL.Add('From ' + pTabla);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mUltimo := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;

  Result := mUltimo;
end;

function TdmObjects.DB_Obtener_Ultimo(qry: TFDQuery; pTabla: string;
  pCampo: string; pWhere: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mUltimo: Integer;
begin
  try
    pResultado := 1;

    mUltimo := 0;
    with qry do
    begin
      SQL.Clear;
      SQL.Add('Select Max(' + pCampo + ')');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mUltimo := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;

  Result := mUltimo;
end;

procedure TdmObjects.DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
var
  mCantFields: Integer;
  mCols: Integer;
  CampoNombre: string;
begin
  try
    pResultado := 1;

    mCantFields := 0;
    with qry do
    begin
      Open();
      mCantFields := FieldCount;
      while not Eof do
      begin
        ds1.Append;
        for mCols := 0 to mCantFields - 1 do
        begin
          CampoNombre := FieldDefs[mCols].Name;
          ds1.FieldByName(CampoNombre).Value :=
            FieldByName(CampoNombre).Value;
        end;
        ds1.Post;

        Next;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
       pErrorM := E.Message;
       pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_DBToStruct(qry: TFDQuery; ds1: TFDMemTable;
  var pCamposNombre: TStringList; var pResultado: Integer; var pErrorM: string);
var
  mCantFields: Integer;
  mCols: Integer;
  CampoNombre: string;
begin
  try
    pResultado := 1;

    pCamposNombre.Clear;

    ds1.EmptyDataSet;
    ds1.Close;
    ds1.FieldDefs.Clear;

    mCantFields := 0;
    with qry do
    begin
      Open();
      mCantFields := FieldCount;
      for mCols := 0 to mCantFields - 1 do
      begin
        ds1.FieldDefs.Add(FieldDefs[mCols].Name,
          FieldDefs[mCols].DataType, FieldDefs[mCols].Size);
        pCamposNombre.Add(FieldDefs[mCols].Name);
      end;
      ds1.CreateDataSet;
      ds1.Open;

      while not Eof do
      begin
        ds1.Append;
        for mCols := 0 to mCantFields - 1 do
        begin
          CampoNombre := FieldDefs[mCols].Name;
          ds1.FieldByName(CampoNombre).Value :=
            FieldByName(CampoNombre).Value;
        end;
        ds1.Post;

        Next;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
       pErrorM := E.Message;
       pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_StructToDB(qry: TFDQuery; ds1: TFDMemTable;
  pCampos: TStringList; var pResultado: Integer; var pErrorM: string);
var
  mCantFields: Integer;
  mCols, mFila: Integer;
  CampoNombre: string;
begin
  try
    pResultado := 1;

    for mCols := 0 to pCampos.Count - 1 do
    begin
      with qry do
      begin
        Params.Items[mCols].Value :=
          ds1.Fields[mCols].Value;
      end;
    end;
    qry.ExecSQL;

    pResultado := 1;
  except
    on E: Exception do
    begin
       pErrorM := E.Message;
       pResultado := -1;
    end;
  end;
end;

function TdmObjects.DB_Obtener_ListaCampos(ds1: TFDMemTable): TStringList;
var
  mCampos: TStringList;
  mCols: Integer;
begin
  mCampos := TStringList.Create;

  mCampos.Clear;
  mCampos.Delimiter :=',';
  with ds1 do
  begin
    for mCols := 0 to FieldCount - 1 do
    begin
      if Fields[mCols].Tag = 1  then
        mCampos.Add(FieldDefs[mCols].Name);
    end;
  end;

  Result := mCampos;
end;

function TdmObjects.DB_Crear_SQL_Insert(pTabla: string; pCampos: string): string;
var
  mResultado: string;
begin
  mResultado := '';

  mResultado := 'Insert Into ' + pTabla;
  mResultado := mResultado + '(';
  mResultado := mResultado + pCampos;
  mResultado := mResultado + ')';

  Result := mResultado;
end;

function TdmObjects.DB_Crear_SQL_Update(pTabla: string;
  pCampos: string): string;
var
  mResultado: string;
begin
  mResultado := '';

  mResultado := 'Update  ' + pTabla + ' Set ';
  mResultado := mResultado + pCampos;

  Result := mResultado;
end;

function TdmObjects.DB_Obtener_SQL_ParametrosLista(
  pCampos: TStringList): string;
var
  mCountParams: Integer;
  Aux01: Integer;
  mParams: TStringList;
  mSQL: string;
begin
  mSQL := '';

  mCountParams := pCampos.Count - 1;
  mParams := TStringList.Create;
  mParams.Clear;
  mParams.Delimiter := ',';
  for Aux01 := 0 to mCountParams do
    mParams.Add(':' + pCampos.Strings[Aux01]);
  mSQL := 'Values(' + mParams.DelimitedText + ')';
  mParams.Free;

  Result := mSQL;
end;

procedure TdmObjects.DB_Limpiar_Tag(ds1: TFDMemTable);
var
  mCols: Integer;
begin
  with ds1 do
  begin
    for mCols := 0 to FieldCount - 1 do
      Fields[mCols].Tag := 0;
  end;
end;

procedure TdmObjects.DB_Insert_Generico(qry1: TFDQuery; ds1: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
var
  mCampos: TStringList;
  mSQL, mSQL1, mSQL2: string;
  mCols: Integer;
begin
  try
    pResultado := 1;

    mSQL1 := '';
    mSQL2 := '';

    mCampos := TStringList.Create;

    mCampos :=
      DB_Obtener_ListaCampos(ds1);

    mSQL1 :=
      DB_Crear_SQL_Insert(ds1.FileName, mCampos.DelimitedText);

    mSQL2 :=
      DB_Obtener_SQL_ParametrosLista(mCampos);

    qry1.SQL.Clear;
    mSQL := mSQL1 + ' ' + mSQL2;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        qry1.SQL.Clear;
        qry1.SQL.Add(mSQL);

        for mCols := 0 to mCampos.Count - 1 do
          qry1.ParamByName(mCampos.Strings[mCols]).Value :=
          FieldByName(mCampos.Strings[mCols]).Value;

        qry1.ExecSQL;

        Next;
      end;
    end;
    mCampos.Free;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Update_Generico(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; var pResultado: Integer; var pErrorM: string);
var
  mCampos, mCamposParams: TStringList;
  mSQL, mSQL1, mSQL2: string;
  mCols: Integer;
  Aux01: Integer;
begin
  try
    pResultado := 1;

    mSQL1 := '';
    mSQL2 := '';

    mCampos := TStringList.Create;
    mCamposParams := TStringList.Create;

    mCampos :=
      DB_Obtener_ListaCampos(ds1);

    for Aux01 := 0 to mCampos.Count - 1 do
    begin
      if Aux01 < (mCampos.Count - 1) then
        mCamposParams.Add(mCampos.Strings[Aux01] + ' = :' +
          mCampos.Strings[Aux01] + ',')
      else
        mCamposParams.Add(mCampos.Strings[Aux01] + ' = :' +
          mCampos.Strings[Aux01]);
    end;
    mCampos.Delimiter := ',';
    mCamposParams.Delimiter := ',';

    mSQL1 :=
      DB_Crear_SQL_Update(ds1.FileName, mCamposParams.Text);

    qry1.SQL.Clear;
    mSQL := mSQL1 + ' ' + pWhere;
    qry1.SQL.Add(mSQL);

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        qry1.SQL.Clear;
        qry1.SQL.Add(mSQL);

        for mCols := 0 to mCampos.Count - 1 do
          qry1.ParamByName(mCampos.Strings[mCols]).Value :=
          FieldByName(mCampos.Strings[mCols]).Value;

        qry1.ExecSQL;

        Next;
      end;
    end;
    mCampos.Free;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Delete_Generico(qry1: TFDQuery; pTabla: string;
  pWhere: string; var pResultado: Integer; var pErrorM: string);
var
  mSQL: string;
begin
  try
    pResultado := 1;

    mSQL:= 'Delete From ' + pTabla + ' ' + pWhere;

    qry1.SQL.Clear;
    qry1.SQL.Add(mSQL);
    qry1.ExecSQL;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Copiar_Estructura(dsOrigen: TFDMemTable;
  dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
var
  Aux01: Integer;
begin
  try
    pResultado := 1;

    dsDestino.FileName := dsOrigen.FileName;
    dsDestino.FieldDefs.Clear;
    with dsOrigen do
    begin
      First;
      for Aux01 := 0 to FieldCount - 1 do
      begin
        dsDestino.FieldDefs.Add(FieldDefs[Aux01].Name,
          FieldDefs[Aux01].DataType, FieldDefs[Aux01].Size);
      end;
    end;
    dsDestino.CreateDataSet;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Copiar_Datos(dsOrigen: TFDMemTable;
  dsDestino: TFDMemTable; var pResultado: Integer; var pErrorM: string);
var
  Aux01: Integer;
begin
  try
    pResultado := 1;

    dsDestino.FileName := dsOrigen.FileName;
    dsDestino.EmptyDataSet;
    with dsOrigen do
    begin
      First;
      while not Eof do
      begin
        dsDestino.Append;
        for Aux01 := 0 to FieldCount - 1 do
        begin
          dsDestino.Fields[Aux01].Value :=
            Fields[Aux01].Value;
        end;
        dsDestino.Post;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

procedure TdmObjects.DB_Consultar_Generico(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pSelect: string; var pCamposNombre: TStringList;
  var pResultado: Integer; var pErrorM: string);
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add(pSelect);
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);

      DB_DBToStruct(qry1, ds1, pCamposNombre, pResultado, pErrorM);

      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
    end;
  end;
end;

function TdmObjects.GetNombreTab(pNombreFull: string; pNombreSimple: string): string;
var
  mResultado: string;
  mNombreFull: string;
  mLista: TStringList;
  mCount: Integer;
begin
  mResultado := '';
  mNombreFull := pNombreFull;

  ExtractStrings([':'], [':'], PChar(mNombreFull), mLista);
  mCount := mLista.Count;
  mCount := mCount * 2;
  mResultado := StringOfChar(' ', mCount) + pNombreSimple;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'Skeleton'}
procedure TdmObjects.DB_Skeleton_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.*');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;

      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');

      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_Skeleton_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Insertar.sql');
      mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_Skeleton_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Modificar.sql');
      mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_Skeleton_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
      mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Eliminar.sql');
      mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_Skeleton_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_Skeleton_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_Skeleton_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ' + pCampo);
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_Skeleton_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ' + pCampo);
      SQL.Add('From  ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_Skeleton_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + ' = ' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre + '_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

//Implementacion Metodos
{$REGION 'TB_APARTADOSDETALLE'}
procedure TdmObjects.DB_TB_APARTADOSDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CANTIDAD,');
      SQL.Add('A.CODIGOUNIDADMEDIDA,');
      SQL.Add('A.NOMBREUNIDADMEDIDA,');
      SQL.Add('A.PRECIOUNITARIO,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.PRECIOUNITARIOFINAL,');
      SQL.Add('A.PRECIOFINAL,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOIMPUESTO,');
      SQL.Add('A.NOMBREIMPUESTO,');
      SQL.Add('A.PRECIOMAYORISTAAPLICADO,');
      SQL.Add('A.IdProducto');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_APARTADOSDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_APARTADOSDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_APARTADOSDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_APARTADOSDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_APARTADOSDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_APARTADOSDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_APARTADOSDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_APARTADOSDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_APARTADOSENCABEZADO'}
procedure TdmObjects.DB_TB_APARTADOSENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROS,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.CODIGOMESA,');
      SQL.Add('A.NUMEROMESA,');
      SQL.Add('A.CODIGOSALONERO,');
      SQL.Add('A.USUARIOSALONERO,');
      SQL.Add('A.NOMBRESALONERO,');
      SQL.Add('A.CODIGOCLIENTE,');
      SQL.Add('A.NOMBRECLIENTE,');
      SQL.Add('A.SUBTOTAL,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.ISP,');
      SQL.Add('A.ISM,');
      SQL.Add('A.TRANSPORTE,');
      SQL.Add('A.TOTAL,');
      SQL.Add('A.TOTALGRAVADO,');
      SQL.Add('A.TOTALEXCENTO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.CODIGOMONEDA,');
      SQL.Add('A.TIPOCAMBIO,');
      SQL.Add('A.SERIE,');
      SQL.Add('A.CODIGOIMPRESA,');
      SQL.Add('A.NUMERODOC,');
      SQL.Add('A.FECHAVENCIMIENTO,');
      SQL.Add('A.CODIGOTIPO,');
      SQL.Add('A.SALDO,');
      SQL.Add('A.CARCREDITO,');
      SQL.Add('A.CARCONTADO,');
      SQL.Add('A.CODIGOVENDEDOR,');
      SQL.Add('A.NOMBREVENDEDOR,');
      SQL.Add('A.NUMEROFACTURA,');
      SQL.Add('A.NUMEROSFACTURA,');
      SQL.Add('A.PAGOCON,');
      SQL.Add('A.CAMBIO,');
      SQL.Add('A.IdCliente,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_APARTADOSENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_APARTADOSENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_APARTADOSENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_APARTADOSENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_APARTADOSENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_APARTADOSENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_APARTADOSENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_APARTADOSENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_APARTADOSENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_CIERRESCAJAENCABEZADO'}
procedure TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.IDMAQUINA,');
      SQL.Add('A.FECHADE,');
      SQL.Add('A.FECHAHASTA,');
      SQL.Add('A.HORADE,');
      SQL.Add('A.HORAHASTA,');
      SQL.Add('A.MONTOINICIAL,');
      SQL.Add('A.MONTOFINAL,');
      SQL.Add('A.TOTALCANTIDADENTRADAS,');
      SQL.Add('A.TOTALCANTIDADSALIDAS,');
      SQL.Add('A.TOTALMONTOENTRADAS,');
      SQL.Add('A.TOTALMONTOSALIDAS,');
      SQL.Add('A.TOTALCANTIDADEFECTIVO,');
      SQL.Add('A.TOTALCANTIDADTARJETA,');
      SQL.Add('A.TOTALCANTIDADTRANSFERENCIA,');
      SQL.Add('A.TOTALCANTIDADCHEQUE,');
      SQL.Add('A.TOTALCANTIDADCREDITO,');
      SQL.Add('A.TOTALMONTOEFECTIVO,');
      SQL.Add('A.TOTALMONTOTARJETA,');
      SQL.Add('A.TOTALMONTOTRANSFERENCIA,');
      SQL.Add('A.TOTALMONTOCHEQUE,');
      SQL.Add('A.TOTALMONTOCREDITO,');
      SQL.Add('A.COMENTARIOS,');
      SQL.Add('A.TOTALNOTASCREDITO,');
      SQL.Add('A.TOTALDESCUENTOS,');
      SQL.Add('A.TOTALKILOS');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_CIERRESCAJAENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_CLIENTES'}
procedure TdmObjects.DB_TB_CLIENTES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.FECHAALTA,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.APELLIDO1,');
      SQL.Add('A.APELLIDO2,');
      SQL.Add('A.NOMBRECOMPLETO,');
      SQL.Add('A.CODIGOPOSTAL,');
      SQL.Add('A.DIRECCION,');
      SQL.Add('A.EMAIL,');
      SQL.Add('A.TELEFONO1,');
      SQL.Add('A.TELEFONO2,');
      SQL.Add('A.WEB,');
      SQL.Add('A.NOMBREIMPRIMIR,');
      SQL.Add('A.CEDULA,');
      SQL.Add('A.IMAGEN1,');
      SQL.Add('A.NOMBREARCHIVO,');
      SQL.Add('A.FECHANACIMIENTO,');
      SQL.Add('A.SALDO,');
      SQL.Add('A.LIMITECREDITO,');
      SQL.Add('A.APLICARLIMITECREDITO,');
      SQL.Add('A.TIPO,');
      SQL.Add('A.PRECIOVENTAPORCENTAJE,');
      SQL.Add('A.CONTACTONOMBRE,');
      SQL.Add('A.TIPOPAGO,');
      SQL.Add('A.PLAZO,');
      SQL.Add('A.APLICARIMPUESTO,');
      SQL.Add('A.DescuentoPor,');
      SQL.Add('A.CodigoEstado,');
      SQL.Add('A.Temp');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CLIENTES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CLIENTES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CLIENTES_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_CLIENTES_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CLIENTES_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CLIENTES_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CLIENTES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_CLIENTES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CLIENTES_Sumar_Saldo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pValor: Double; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mSaldo: Double;
begin
  try
    pResultado := 1;

    mSaldo := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select SALDO');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mSaldo := Fields[0].AsFloat;
      end;
      Close;
    end;

    mSaldo := mSaldo + pValor;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('SALDO =' + FloatToStr(mSaldo));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CLIENTES_Restar_Saldo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pValor: Double; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mSaldo: Double;
begin
  try
    pResultado := 1;

    mSaldo := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select SALDO');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mSaldo := Fields[0].AsFloat;
      end;
      Close;
    end;

    mSaldo := mSaldo - pValor;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('SALDO =' + FloatToStr(mSaldo));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_CONSECUTIVOS'}
procedure TdmObjects.DB_TB_CONSECUTIVOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.FACTURASCLIENTES,');
      SQL.Add('A.ENTRADAS,');
      SQL.Add('A.SALIDAS,');
      SQL.Add('A.PROFORMAS,');
      SQL.Add('A.RECIBOSABONOSCLIENTES,');
      SQL.Add('A.APARTADOS,');
      SQL.Add('A.RECIBOSABONOSAPARTADOS,');
      SQL.Add('A.NOTASCREDITO,');
      SQL.Add('A.NOTASDEBITO,');
      SQL.Add('A.RECIBOSABONOSPROVEEDORES,');
      SQL.Add('A.CLIENTES,');
      SQL.Add('A.PRODUCTOS,');
      SQL.Add('A.VENDEDORES');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CONSECUTIVOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CONSECUTIVOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_CONSECUTIVOS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_CONSECUTIVOS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CONSECUTIVOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CONSECUTIVOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_CONSECUTIVOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_CONSECUTIVOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_EMPRESAS'}
procedure TdmObjects.DB_TB_EMPRESAS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CEDULA,');
      SQL.Add('A.DIRECCION,');
      SQL.Add('A.TELEFONO1,');
      SQL.Add('A.TELEFONO2,');
      SQL.Add('A.FAX,');
      SQL.Add('A.EMAIL,');
      SQL.Add('A.WEB,');
      SQL.Add('A.NOMBREJURIDICO,');
      SQL.Add('A.REDSOCIAL,');
      SQL.Add('A.INICIOPERIODOFISCAL');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_EMPRESAS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_EMPRESAS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_EMPRESAS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_EMPRESAS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_EMPRESAS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_EMPRESAS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_EMPRESAS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_EMPRESAS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_EMPRESAS_Set_AutoInc(qry1: TFDQuery;
  pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      if pTipo = 1 then
        SQL.Add('SET GENERATOR gen_' + pTabla + ' TO ' + IntToStr(pValor));
      if pTipo = 2 then
        SQL.Add('ALTER TABLE ' + pTabla + ' AUTO_INCREMENT = ' + IntToStr(pValor));
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_SetAutoInc.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_ENTRADASDETALLE'}
procedure TdmObjects.DB_TB_ENTRADASDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CANTIDAD,');
      SQL.Add('A.CODIGOUNIDADMEDIDA,');
      SQL.Add('A.NOMBREUNIDADMEDIDA,');
      SQL.Add('A.PRECIOUNITARIO,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.PRECIOUNITARIOFINAL,');
      SQL.Add('A.PRECIOFINAL,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOIMPUESTO,');
      SQL.Add('A.NOMBREIMPUESTO,');
      SQL.Add('A.IdProducto');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_ENTRADASDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ENTRADASDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ENTRADASDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ENTRADASDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_ENTRADASDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASDETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto: Integer;
  mExistencia: Double;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        if mIdProducto > 0 then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia +
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');
        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASDETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto: Integer;
  mExistencia: Double;
  mWhere: TStringList;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        if mIdProducto > 0 then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia -
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');
        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_ENTRADASENCABEZADO'}
procedure TdmObjects.DB_TB_ENTRADASENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROS,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.CODIGOMESA,');
      SQL.Add('A.NUMEROMESA,');
      SQL.Add('A.CODIGOSALONERO,');
      SQL.Add('A.USUARIOSALONERO,');
      SQL.Add('A.NOMBRESALONERO,');
      SQL.Add('A.CODIGOPROVEEDOR,');
      SQL.Add('A.NOMBREPROVEEDOR,');
      SQL.Add('A.SUBTOTAL,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.ISP,');
      SQL.Add('A.ISM,');
      SQL.Add('A.TRANSPORTE,');
      SQL.Add('A.TOTAL,');
      SQL.Add('A.TOTALGRAVADO,');
      SQL.Add('A.TOTALEXCENTO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.CODIGOMONEDA,');
      SQL.Add('A.TIPOCAMBIO,');
      SQL.Add('A.SERIE,');
      SQL.Add('A.CODIGOIMPRESA,');
      SQL.Add('A.NUMERODOC,');
      SQL.Add('A.FECHAVENCIMIENTO,');
      SQL.Add('A.CODIGOTIPO,');
      SQL.Add('A.SALDO,');
      SQL.Add('A.CARCREDITO,');
      SQL.Add('A.CARCONTADO,');
      SQL.Add('A.CODIGOVENDEDOR,');
      SQL.Add('A.NOMBREVENDEDOR,');
      SQL.Add('A.NUMEROPROFORMA,');
      SQL.Add('A.NUMEROSPROFORMA,');
      SQL.Add('A.PAGOCON,');
      SQL.Add('A.CAMBIO,');
      SQL.Add('A.IdProveedor,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_ENTRADASENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ENTRADASENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ENTRADASENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ENTRADASENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_ENTRADASENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASENCABEZADO_Sumar_Totales(qry1: TFDQuery; pWhere: string;
  pClaseNombre: string; var pSubTotal: Double;
  var pDescuento: Double; var pTotal: Double;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pSubTotal := 0;
    pDescuento := 0;
    pTotal := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('SELECT SUM(SUBTOTAL),SUM(DESCUENTOM),SUM(TOTAL)');
      SQL.Add('FROM');
      SQL.Add('(');
      SQL.Add('Select Sum(A.SUBTOTAL) As SUBTOTAL,Sum(A.DESCUENTOM) As DESCUENTOM,Sum(A.TOTAL) As TOTAL');
      SQL.Add('From tb_entradasencabezado A');
      SQL.Add(pWhere);
      SQL.Add('Union');
      SQL.Add('SELECT SUM(A.TOTALFINAL) As SUBTOTAL,Sum(0) As DESCUENTOM,SUM(A.TOTALFINAL) As TOTAL');
      SQL.Add('FROM tb_recibosproveedoresencabezado A');
      SQL.Add(pWhere);
      SQL.Add(') totales');
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          pSubTotal := Fields[0].AsFloat;
        if Fields[1].IsNull = False then
          pDescuento := Fields[1].AsFloat;
        if Fields[2].IsNull = False then
          pTotal := Fields[2].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ENTRADASENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_ESTADOS'}
procedure TdmObjects.DB_TB_ESTADOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ESTADOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ESTADOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_ESTADOS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_ESTADOS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ESTADOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ESTADOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_ESTADOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_ESTADOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_FACTURASCLIENTESDETALLE'}
procedure TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CANTIDAD,');
      SQL.Add('A.CODIGOUNIDADMEDIDA,');
      SQL.Add('A.NOMBREUNIDADMEDIDA,');
      SQL.Add('A.PRECIOUNITARIO,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.PRECIOUNITARIOFINAL,');
      SQL.Add('A.PRECIOFINAL,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOIMPUESTO,');
      SQL.Add('A.NOMBREIMPUESTO,');
      SQL.Add('A.PRECIOMAYORISTAAPLICADO,');
      SQL.Add('A.ISP,');
      SQL.Add('A.ISM,');
      SQL.Add('A.PRECIOUNITARIOBASE,');
      SQL.Add('A.PRECIOFINALBASE,');
      SQL.Add('A.DESCRIPCION1,');
      SQL.Add('A.DESCRIPCION2,');
      SQL.Add('A.IdProducto,');
      SQL.Add('A.TOTALKILOS,');
      SQL.Add('B.CODIGOCOMANDA As IdComanda');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join tb_productos B On A.IdProducto = B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto, EsCompuesto, mGrupoId, mIdProducto2: Integer;
  mExistencia: Double;
  mWhere: TStringList;
  d2: TFDMemTable;
  mTipo: Integer;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        mWhere := TStringList.Create;
        mWhere.Add('Where Id=' + IntToStr(mIdProducto));
        mTipo :=
          DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
          'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
        mWhere.Free;
        if pResultado = -1 then
          raise Exception.Create('');

        if (mIdProducto > 0) and (mTipo = 1) then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          EsCompuesto := DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
            'tb_Productos', 'ESCOMPUESTO', pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia +
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          if EsCompuesto = 1 then
          begin
            mWhere := TStringList.Create;
            mWhere.Add('Where IdProducto=' + IntToStr(mIdProducto));
            mGrupoId := DB_TB_GruposEncabezado_Obtener_Id(qry1, mWhere.Text, 'tb_grupos_encabezado', pClaseNombre, pResultado, pErrorM);
            mWhere.Free;

            mWhere := TStringList.Create;
            d2 := TFDMemTable.Create(nil);
            d2.FieldDefs.Clear;
            d2.FieldDefs.Add('ID', ftInteger, 0);
            d2.FieldDefs.Add('IdEncabezado', ftInteger, 0);
            d2.FieldDefs.Add('IdProducto', ftInteger, 0);
            d2.FieldDefs.Add('Cantidad', ftFloat, 0);
            d2.FieldDefs.Add('PrecioFinal', ftFloat, 0);
            d2.FieldDefs.Add('ProductoNombre', ftString, 100);
            d2.CreateDataSet;
            d2.Open;
            mWhere.Add('Where A.IdEncabezado=' + IntToStr(mGrupoId));
            DB_TB_GruposDetalle_Consultar(qry1, d2, mWhere.Text, '', '', '', 'tb_grupos_detalle', '', pResultado, pErrorM);
            mWhere.Free;
            d2.First;
            while not d2.Eof do
            begin
              mIdProducto2 := d2.FieldByName('IdProducto').AsInteger;
              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mExistencia :=
                DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
                pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');
              mExistencia := mExistencia + d2.FieldByName('CANTIDAD').AsFloat;

              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mTipo :=
                DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
                'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');

              if mTipo = 1 then
              begin
                mWhere := TStringList.Create;
                mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
                DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
                  mExistencia, pClaseNombre, pResultado, pErrorM);
                mWhere.Free;
                if pResultado = -1 then
                  raise Exception.Create('');
              end;

              d2.Next;
            end;
          end;

        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESDETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto, EsCompuesto, mGrupoId, mIdProducto2: Integer;
  mExistencia: Double;
  mWhere: TStringList;
  d2: TFDMemTable;
  mTipo: Integer;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        mWhere := TStringList.Create;
        mWhere.Add('Where Id=' + IntToStr(mIdProducto));
        mTipo :=
          DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
          'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
        mWhere.Free;
        if pResultado = -1 then
          raise Exception.Create('');

        if (mIdProducto > 0) and (mTipo = 1) then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          EsCompuesto := DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
            'tb_Productos', 'ESCOMPUESTO', pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia -
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          if EsCompuesto = 1 then
          begin
            mWhere := TStringList.Create;
            mWhere.Add('Where IdProducto=' + IntToStr(mIdProducto));
            mGrupoId := DB_TB_GruposEncabezado_Obtener_Id(qry1, mWhere.Text, 'tb_grupos_encabezado', pClaseNombre, pResultado, pErrorM);
            mWhere.Free;

            mWhere := TStringList.Create;
            d2 := TFDMemTable.Create(nil);
            d2.FieldDefs.Clear;
            d2.FieldDefs.Add('ID', ftInteger, 0);
            d2.FieldDefs.Add('IdEncabezado', ftInteger, 0);
            d2.FieldDefs.Add('IdProducto', ftInteger, 0);
            d2.FieldDefs.Add('Cantidad', ftFloat, 0);
            d2.FieldDefs.Add('PrecioFinal', ftFloat, 0);
            d2.FieldDefs.Add('ProductoNombre', ftString, 100);
            d2.CreateDataSet;
            d2.Open;
            mWhere.Add('Where A.IdEncabezado=' + IntToStr(mGrupoId));
            DB_TB_GruposDetalle_Consultar(qry1, d2, mWhere.Text, '', '', '', 'tb_grupos_detalle', '', pResultado, pErrorM);
            mWhere.Free;
            d2.First;
            while not d2.Eof do
            begin
              mIdProducto2 := d2.FieldByName('IdProducto').AsInteger;
              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mExistencia :=
                DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
                pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');
              mExistencia := mExistencia - d2.FieldByName('CANTIDAD').AsFloat;

              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mTipo :=
                DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
                'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');

              if mTipo = 1 then
              begin
                mWhere := TStringList.Create;
                mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
                DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
                  mExistencia, pClaseNombre, pResultado, pErrorM);
                mWhere.Free;
                if pResultado = -1 then
                  raise Exception.Create('');
              end;

              d2.Next;
            end;
          end;

        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_Detalles(qry1: TFDQuery; pWhere: string;
  pWhere2: string;
  pTabla: string; pClaseNombre: string; ds1: TFDMemTable;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto: Integer;
  mExistencia: Double;
  mWhere: TStringList;
  mNombre: string;
begin
  try
    pResultado := 1;

    mNombre := QuotedStr('Abono');
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select B.NOMBRE As Detalle,B.CANTIDAD As CANTIDAD,A.TOTAL As Total,A.Fecha,A.Numero,1 As Tipo,A.Hora');
      SQL.Add('From TB_FACTURASCLIENTESENCABEZADO A');
      SQL.Add('Left Join TB_FACTURASCLIENTESDETALLE B On A.Numero=B.Numero');
      SQL.Add(pWhere2);
      SQL.Add('Union');
      SQL.Add('Select ' + mNombre + ' As Detalle,0 As CANTIDAD,A.TOTALFINAL As Total,A.Fecha,A.Numero,2 As Tipo,A.Hora');
      SQL.Add('From TB_RECIBOSCLIENTESENCABEZADO A');
      SQL.Add('Left Join TB_RECIBOSCLIENTESDETALLE B On A.Numero=B.Numero');
      SQL.Add(pWhere);
      SQL.Add('Order By 3');
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_FACTURASCLIENTESENCABEZADO'}
procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROS,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.CODIGOMESA,');
      SQL.Add('A.NUMEROMESA,');
      SQL.Add('A.CODIGOSALONERO,');
      SQL.Add('A.USUARIOSALONERO,');
      SQL.Add('A.NOMBRESALONERO,');
      SQL.Add('A.CODIGOCLIENTE,');
      SQL.Add('A.NOMBRECLIENTE,');
      SQL.Add('A.SUBTOTAL,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.ISP,');
      SQL.Add('A.ISM,');
      SQL.Add('A.TRANSPORTE,');
      SQL.Add('A.TOTAL,');
      SQL.Add('A.TOTALGRAVADO,');
      SQL.Add('A.TOTALEXCENTO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.CODIGOMONEDA,');
      SQL.Add('A.TIPOCAMBIO,');
      SQL.Add('A.SERIE,');
      SQL.Add('A.CODIGOIMPRESA,');
      SQL.Add('A.NUMERODOC,');
      SQL.Add('A.FECHAVENCIMIENTO,');
      SQL.Add('A.CODIGOTIPO,');
      SQL.Add('A.SALDO,');
      SQL.Add('A.CARCREDITO,');
      SQL.Add('A.CARCONTADO,');
      SQL.Add('A.CODIGOVENDEDOR,');
      SQL.Add('A.NOMBREVENDEDOR,');
      SQL.Add('A.NUMEROPROFORMA,');
      SQL.Add('A.NUMEROSPROFORMA,');
      SQL.Add('A.PAGOCON,');
      SQL.Add('A.CAMBIO,');
      SQL.Add('A.EFECTIVO,');
      SQL.Add('A.TARJETA,');
      SQL.Add('A.TRANSFERENCIA,');
      SQL.Add('A.CHEQUE,');
      SQL.Add('A.IdCliente,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('A.NUMERONotaCredito,');
      SQL.Add('A.Kilos,');
      SQL.Add('B.Nombre As EstadoNombre,');
      SQL.Add('C.DIRECCION As ClienteDireccion,');
      SQL.Add('C.TELEFONO1 As ClienteTelefono1,');
      SQL.Add('C.CONTACTONOMBRE As ClienteContactoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add('Left Join TB_Clientes C on A.IdCliente=C.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Actualizar_Saldo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pValor: Double; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('SALDO = ' + FloatToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
  var pCheque: Double; var pTransferencia: Double;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pEfectivo := 0;
    pTarjeta := 0;
    pCheque := 0;
    pTransferencia := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('Sum(EFECTIVO),');
      SQL.Add('Sum(TARJETA),');
      SQL.Add('Sum(TRANSFERENCIA),');
      SQL.Add('Sum(CHEQUE)');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          pEfectivo := Fields[0].AsFloat;
        if Fields[1].IsNull = False then
          pTarjeta := Fields[1].AsFloat;
        if Fields[2].IsNull = False then
          pTransferencia := Fields[2].AsFloat;
        if Fields[3].IsNull = False then
          pCheque := Fields[3].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Sumar_Totales(qry1: TFDQuery; pWhere: string;
  pClaseNombre: string; var pSubTotal: Double;
  var pDescuento: Double; var pServicio: Double; var pIVA: Double;var pTotal: Double;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pSubTotal := 0;
    pDescuento := 0;
    pServicio := 0;
    pIVA := 0;
    pTotal := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('select Sum(SUBTOTAL),Sum(DESCUENTOM),Sum(ISM),Sum(IVAM),Sum(TOTAL)');
      SQL.Add('FROM');
      SQL.Add('(');
      SQL.Add('select Sum(A.SUBTOTAL) As SUBTOTAL,Sum(A.DESCUENTOM) As DESCUENTOM,Sum(A.ISM) As ISM,Sum(A.IVAM) As IVAM,Sum(A.TOTAL) As TOTAL');
      SQL.Add('From TB_FACTURASCLIENTESENCABEZADO A');
      SQL.Add(pWhere);
      SQL.Add('Union all');
      SQL.Add('SELECT SUM(A.TOTALFINAL) As SUBTOTAL,Sum(0) As DESCUENTOM,Sum(0) As ISM, Sum(0) As IVAM,SUM(A.TOTALFINAL) As TOTAL');
      SQL.Add('FROM TB_RECIBOSCLIENTESENCABEZADO A');
      SQL.Add(pWhere);
      SQL.Add('Union all');
      SQL.Add('SELECT SUM(A.TOTALFINAL) As SUBTOTAL,Sum(0) As DESCUENTOM,Sum(0) As ISM, Sum(0) As IVAM,SUM(A.TOTALFINAL) As TOTAL');
      SQL.Add('FROM TB_RECIBOSAPARTADOSENCABEZADO A');
      SQL.Add(pWhere);
      SQL.Add(') totales');
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          pSubTotal := Fields[0].AsFloat;
        if Fields[1].IsNull = False then
          pDescuento := Fields[1].AsFloat;
        if Fields[2].IsNull = False then
          pServicio := Fields[2].AsFloat;
        if Fields[3].IsNull = False then
          pIVA := Fields[3].AsFloat;
        if Fields[4].IsNull = False then
          pTotal := Fields[4].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_SaldoFecha(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Double;
var
  mResultado: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Sum(Total)');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Estadistico(qry1: TFDQuery; pWhere: string;
  ds1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('first 10 ');
      SQL.Add('B.IDPRODUCTO,');
      SQL.Add('B.Cantidad,');
      SQL.Add('C.Nombre As ProductoNombre,');
      SQL.Add('C.Codigo As ProductoCodigo');
      SQL.Add('from TB_FACTURASCLIENTESENCABEZADO A');
      SQL.Add('Left Join TB_FACTURASCLIENTESDETALLE B On A.Numero=B.NUMERO');
      SQL.Add('Left Join TB_Productos C On B.IDPRODUCTO=C.Id');
      SQL.Add('Where A.CODIGOESTADO = 2');
      SQL.Add('Order By B.Cantidad');
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_TotalDescuentos(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Double;
var
  mResultado: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Sum(DESCUENTOM)');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FACTURASCLIENTESENCABEZADO_Obtener_TotalKilos(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Double;
var
  mResultado: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Sum(Kilos)');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'TB_FAMILIAS'}
procedure TdmObjects.DB_TB_FAMILIAS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FAMILIAS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FAMILIAS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FAMILIAS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_FAMILIAS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FAMILIAS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FAMILIAS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FAMILIAS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_FAMILIAS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Familias_Set_AutoInc(qry1: TFDQuery;
  pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      if pTipo = 1 then
        SQL.Add('SET GENERATOR gen_' + pTabla + ' TO ' + IntToStr(pValor));
      if pTipo = 2 then
        SQL.Add('ALTER TABLE ' + pTabla + ' AUTO_INCREMENT = ' + IntToStr(pValor));
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_SetAutoInc.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_FORMASPAGO'}
procedure TdmObjects.DB_TB_FORMASPAGO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FORMASPAGO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FORMASPAGO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_FORMASPAGO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_FORMASPAGO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FORMASPAGO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FORMASPAGO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_FORMASPAGO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_FORMASPAGO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_IMPUESTOS'}
procedure TdmObjects.DB_TB_IMPUESTOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.PORCENTAJE');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_IMPUESTOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_IMPUESTOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_IMPUESTOS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_IMPUESTOS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_IMPUESTOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_IMPUESTOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_IMPUESTOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_IMPUESTOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

function TdmObjects.DB_TB_IMPUESTOS_Obtener_Porcentaje(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Double;
var
  mResultado: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select PORCENTAJE');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_IMPUESTOS_Obtener_PorcentajeValor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Double;
var
  mResultado, mPorcentaje: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    mPorcentaje := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select PORCENTAJE');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mPorcentaje := Fields[0].AsInteger;
      end;
      Close;
    end;

    if mPorcentaje > 0 then
      mResultado := mPorcentaje / 100;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_IMPUESTOS_Set_AutoInc(qry1: TFDQuery;
  pTabla: string; pValor: Integer; pTipo: Integer;
  pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      if pTipo = 1 then
        SQL.Add('SET GENERATOR gen_' + pTabla + ' TO ' + IntToStr(pValor));
      if pTipo = 2 then
        SQL.Add('ALTER TABLE ' + pTabla + ' AUTO_INCREMENT = ' + IntToStr(pValor));
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_SetAutoInc.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_NOTASCREDITOENCABEZADO'}
procedure TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.Numero,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.NOMBRECLIENTE,');
      SQL.Add('A.IdCliente,');
      SQL.Add('A.NumeroDocumento,');
      SQL.Add('A.Total,');
      SQL.Add('A.Comentarios,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.EFECTIVO,');
      SQL.Add('A.TARJETA,');
      SQL.Add('A.TRANSFERENCIA,');
      SQL.Add('A.CHEQUE,');
      SQL.Add('A.Kilos,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITOENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
  var pCheque: Double; var pTransferencia: Double;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pEfectivo := 0;
    pTarjeta := 0;
    pCheque := 0;
    pTransferencia := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('Sum(EFECTIVO),');
      SQL.Add('Sum(TARJETA),');
      SQL.Add('Sum(TRANSFERENCIA),');
      SQL.Add('Sum(CHEQUE)');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          pEfectivo := Fields[0].AsFloat;
        if Fields[1].IsNull = False then
          pTarjeta := Fields[1].AsFloat;
        if Fields[2].IsNull = False then
          pTransferencia := Fields[2].AsFloat;
        if Fields[3].IsNull = False then
          pCheque := Fields[3].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_NOTASDEBITOENCABEZADO'}
procedure TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.Numero,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.NOMBRECLIENTE,');
      SQL.Add('A.IdCliente,');
      SQL.Add('A.NumeroDocumento,');
      SQL.Add('A.Total,');
      SQL.Add('A.Comentarios,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.EFECTIVO,');
      SQL.Add('A.TARJETA,');
      SQL.Add('A.TRANSFERENCIA,');
      SQL.Add('A.CHEQUE,');
      SQL.Add('A.Kilos,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_NOTASDEBITOENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_PLANTILLAS'}
procedure TdmObjects.DB_TB_PLANTILLAS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.DESCRIPCION,');
      SQL.Add('A.PLANTILLA');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PLANTILLAS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PLANTILLAS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PLANTILLAS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_PLANTILLAS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PLANTILLAS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PLANTILLAS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PLANTILLAS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_PLANTILLAS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

function TdmObjects.DB_TB_PLANTILLAS_Obtener_Plantilla(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): string;
var
  mResultado: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := '';
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select PLANTILLA');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsString;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'TB_PRODUCTOS'}
procedure TdmObjects.DB_TB_PRODUCTOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CODIGOTIPOBARRAS,');
      SQL.Add('A.DESCRIPCION,');
      SQL.Add('A.CODIGOFAMILIA,');
      SQL.Add('A.CODIGOUNIDADMEDIDA,');
      SQL.Add('A.EXISTENCIA,');
      SQL.Add('A.EXISTENCIAMINIMA,');
      SQL.Add('A.APLICAREXISTENCIAMINIMA,');
      SQL.Add('A.APLICARIVA,');
      SQL.Add('A.CODIGOUBICACION,');
      SQL.Add('A.COMPROMETIDOS,');
      SQL.Add('A.FECHAALTA,');
      SQL.Add('A.PRECIOCOSTO,');
      SQL.Add('A.PRECIOVENTA,');
      SQL.Add('A.IMAGEN1,');
      SQL.Add('A.NOMBREARCHIVO,');
      SQL.Add('A.LISTAVENTAS,');
      SQL.Add('A.LISTACOMPRAS,');
      SQL.Add('A.ESCOMPUESTO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.UTILIDAD,');
      SQL.Add('A.LISTAMENUS,');
      SQL.Add('A.CODIGOIMPUESTO,');
      SQL.Add('A.IMPRIMECOMANDA,');
      SQL.Add('A.CODIGOCOMANDA,');
      SQL.Add('A.RECETA,');
      SQL.Add('A.CODIGOBARRAS,');
      SQL.Add('A.PRECIOVENTASIMPLE,');
      SQL.Add('A.PRECIOMAYORISTA,');
      SQL.Add('A.CODIGOPROVEEDOR,');
      SQL.Add('A.IDProveedor,');
      SQL.Add('A.IdTipo,');
      SQL.Add('A.FechaVencimiento,');
      SQL.Add('A.Peso,');
      SQL.Add('A.MINIMOLUNES,');
      SQL.Add('A.MINIMOMARTES,');
      SQL.Add('A.MINIMOMIERCOLES,');
      SQL.Add('A.MINIMOJUEVES,');
      SQL.Add('A.MINIMOVIERNES,');
      SQL.Add('A.MINIMOSABADO,');
      SQL.Add('A.MINIMODOMINGO,');
      SQL.Add('A.PERMITIRDESCUENTOS,');
      SQL.Add('B.PORCENTAJE As PORCENTAJEIVA,');
      SQL.Add('C.NOMBRE As FamliaNombre,');
      SQL.Add('D.NOMBRECOMPLETO As ProveedorNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_IMPUESTOS B On A.CODIGOIMPUESTO=B.ID');
      SQL.Add('Left Join TB_FAMILIAS C On A.CODIGOFAMILIA=C.ID');
      SQL.Add('Left Join TB_PROVEEDORES D On A.IDProveedor=D.ID');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PRODUCTOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PRODUCTOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PRODUCTOS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_PRODUCTOS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PRODUCTOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PRODUCTOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PRODUCTOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_PRODUCTOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

function TdmObjects.DB_TB_PRODUCTOS_Obtener_ImpuestoPorcentaje(qry1: TFDQuery;
  pWhere: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Double;
var
  mResultado: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    mResultado := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select B.PORCENTAJE As PORCENTAJEIVA');
      SQL.Add('From TB_PRODUCTOS A');
      SQL.Add('Left Join TB_IMPUESTOS B On A.CODIGOIMPUESTO=B.ID');
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PRODUCTOS_Obtener_Existencia(qry1: TFDQuery;
  pWhere: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Double;
var
  mResultado: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select EXISTENCIA');
      SQL.Add('From TB_PRODUCTOS');
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_PRODUCTOS_Actualizar_Existencia(qry1: TFDQuery;
  pWhere: string; pExistencia: Double; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update TB_PRODUCTOS');
      SQL.Add('Set');
      SQL.Add('EXISTENCIA = ' + FloatToStr(pExistencia));
      SQL.Add(pWhere);
      ExecSQL;
    end;

  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

function TdmObjects.DB_TB_PRODUCTOS_Obtener_PrecioMayorista(qry1: TFDQuery;
  pWhere: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Double;
var
  mResultado: Double;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select PRECIOMAYORISTA');
      SQL.Add('From TB_PRODUCTOS');
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PRODUCTOS_Obtener_Nombre(qry1: TFDQuery;
  pWhere: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): string;
var
  mResultado: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := '';
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Nombre');
      SQL.Add('From TB_PRODUCTOS');
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsString;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PRODUCTOS_EsFisico(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    if Trim(pWhere) <> '' then
      pWhere := pWhere + ' And ';
    pWhere := pWhere + 'IDTIPO = 1';
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'TB_PROFORMASDETALLE'}
procedure TdmObjects.DB_TB_PROFORMASDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CANTIDAD,');
      SQL.Add('A.CODIGOUNIDADMEDIDA,');
      SQL.Add('A.NOMBREUNIDADMEDIDA,');
      SQL.Add('A.PRECIOUNITARIO,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.PRECIOUNITARIOFINAL,');
      SQL.Add('A.PRECIOFINAL,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOIMPUESTO,');
      SQL.Add('A.NOMBREIMPUESTO,');
      SQL.Add('A.PRECIOMAYORISTAAPLICADO,');
      SQL.Add('A.IdProducto,');
      SQL.Add('A.TOTALKILOS');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROFORMASDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROFORMASDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROFORMASDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_PROFORMASDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROFORMASDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROFORMASDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROFORMASDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_PROFORMASDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_PROFORMASENCABEZADO'}
procedure TdmObjects.DB_TB_PROFORMASENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.CODIGOMESA,');
      SQL.Add('A.NUMEROMESA,');
      SQL.Add('A.CODIGOSALONERO,');
      SQL.Add('A.USUARIOSALONERO,');
      SQL.Add('A.NOMBRESALONERO,');
      SQL.Add('A.CODIGOCLIENTE,');
      SQL.Add('A.NOMBRECLIENTE,');
      SQL.Add('A.SUBTOTAL,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.ISP,');
      SQL.Add('A.ISM,');
      SQL.Add('A.TRANSPORTE,');
      SQL.Add('A.TOTAL,');
      SQL.Add('A.TOTALGRAVADO,');
      SQL.Add('A.TOTALEXCENTO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.CODIGOMONEDA,');
      SQL.Add('A.TIPOCAMBIO,');
      SQL.Add('A.SERIE,');
      SQL.Add('A.CODIGOIMPRESA,');
      SQL.Add('A.NUMERODOC,');
      SQL.Add('A.FECHAVENCIMIENTO,');
      SQL.Add('A.CODIGOTIPO,');
      SQL.Add('A.SALDO,');
      SQL.Add('A.CARCREDITO,');
      SQL.Add('A.CARCONTADO,');
      SQL.Add('A.CODIGOVENDEDOR,');
      SQL.Add('A.NOMBREVENDEDOR,');
      SQL.Add('A.NUMEROFACTURA,');
      SQL.Add('A.NUMEROSFACTURA,');
      SQL.Add('A.PAGOCON,');
      SQL.Add('A.CAMBIO,');
      SQL.Add('A.IdCliente,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('A.Kilos,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROFORMASENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROFORMASENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROFORMASENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_PROFORMASENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROFORMASENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROFORMASENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROFORMASENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_PROFORMASENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROFORMASENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_PROVEEDORES'}
procedure TdmObjects.DB_TB_PROVEEDORES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.FECHAALTA,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.APELLIDO1,');
      SQL.Add('A.APELLIDO2,');
      SQL.Add('A.NOMBRECOMPLETO,');
      SQL.Add('A.CODIGOPOSTAL,');
      SQL.Add('A.DIRECCION,');
      SQL.Add('A.EMAIL,');
      SQL.Add('A.TELEFONO1,');
      SQL.Add('A.TELEFONO2,');
      SQL.Add('A.WEB,');
      SQL.Add('A.NOMBREIMPRIMIR,');
      SQL.Add('A.CEDULA,');
      SQL.Add('A.IMAGEN1,');
      SQL.Add('A.NOMBREARCHIVO,');
      SQL.Add('A.FECHANACIMIENTO,');
      SQL.Add('A.SALDO');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROVEEDORES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROVEEDORES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROVEEDORES_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_PROVEEDORES_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROVEEDORES_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROVEEDORES_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_PROVEEDORES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_PROVEEDORES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROVEEDORES_Sumar_Saldo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pValor: Double; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mSaldo: Double;
begin
  try
    pResultado := 1;

    mSaldo := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select SALDO');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mSaldo := Fields[0].AsFloat;
      end;
      Close;
    end;

    mSaldo := mSaldo + pValor;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('SALDO =' + FloatToStr(mSaldo));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROVEEDORES_Restar_Saldo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pValor: Double; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mSaldo: Double;
begin
  try
    pResultado := 1;

    mSaldo := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select SALDO');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mSaldo := Fields[0].AsFloat;
      end;
      Close;
    end;

    mSaldo := mSaldo - pValor;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('SALDO =' + FloatToStr(mSaldo));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_PROVEEDORES_Set_AutoInc(qry1: TFDQuery;
  pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      if pTipo = 1 then
        SQL.Add('SET GENERATOR gen_' + pTabla + ' TO ' + IntToStr(pValor));
      if pTipo = 2 then
        SQL.Add('ALTER TABLE ' + pTabla + ' AUTO_INCREMENT = ' + IntToStr(pValor));
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_SetAutoInc.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_RECIBOSAPARTADOSDETALLE'}
procedure TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROFACTURA,');
      SQL.Add('A.NUMEROSFACTURA,');
      SQL.Add('A.MONTOABONO,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_RECIBOSAPARTADOSENCABEZADO'}
procedure TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROS,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.MONTOLETRAS,');
      SQL.Add('A.SALDOANTERIOR,');
      SQL.Add('A.MONTONUMERO,');
      SQL.Add('A.SALDOACTUAL,');
      SQL.Add('A.CODIGOCLIENTE,');
      SQL.Add('A.NOMBRECLIENTE,');
      SQL.Add('A.INTERESESP,');
      SQL.Add('A.INTERESESM,');
      SQL.Add('A.TOTALFINAL,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.CODIGOMONEDA,');
      SQL.Add('A.TIPOCAMBIO,');
      SQL.Add('A.SERIE,');
      SQL.Add('A.CODIGOIMPRESA,');
      SQL.Add('A.NUMERODOC,');
      SQL.Add('A.FECHAVENCIMIENTO,');
      SQL.Add('A.CODIGOTIPO,');
      SQL.Add('A.CARCREDITO,');
      SQL.Add('A.CARCONTADO,');
      SQL.Add('A.CODIGOVENDEDOR,');
      SQL.Add('A.NOMBREVENDEDOR,');
      SQL.Add('A.IdCliente,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('A.EFECTIVO,');
      SQL.Add('A.TARJETA,');
      SQL.Add('A.TRANSFERENCIA,');
      SQL.Add('A.CHEQUE,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
  var pCheque: Double; var pTransferencia: Double;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pEfectivo := 0;
    pTarjeta := 0;
    pCheque := 0;
    pTransferencia := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('Sum(EFECTIVO),');
      SQL.Add('Sum(TARJETA),');
      SQL.Add('Sum(TRANSFERENCIA),');
      SQL.Add('Sum(CHEQUE)');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          pEfectivo := Fields[0].AsFloat;
        if Fields[1].IsNull = False then
          pTarjeta := Fields[1].AsFloat;
        if Fields[2].IsNull = False then
          pTransferencia := Fields[2].AsFloat;
        if Fields[3].IsNull = False then
          pCheque := Fields[3].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSAPARTADOSENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_RECIBOSCLIENTESDETALLE'}
procedure TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROFACTURA,');
      SQL.Add('A.NUMEROSFACTURA,');
      SQL.Add('A.MONTOABONO,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_RECIBOSCLIENTESENCABEZADO'}
procedure TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROS,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.MONTOLETRAS,');
      SQL.Add('A.SALDOANTERIOR,');
      SQL.Add('A.MONTONUMERO,');
      SQL.Add('A.SALDOACTUAL,');
      SQL.Add('A.CODIGOCLIENTE,');
      SQL.Add('A.NOMBRECLIENTE,');
      SQL.Add('A.INTERESESP,');
      SQL.Add('A.INTERESESM,');
      SQL.Add('A.TOTALFINAL,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.CODIGOMONEDA,');
      SQL.Add('A.TIPOCAMBIO,');
      SQL.Add('A.SERIE,');
      SQL.Add('A.CODIGOIMPRESA,');
      SQL.Add('A.NUMERODOC,');
      SQL.Add('A.FECHAVENCIMIENTO,');
      SQL.Add('A.CODIGOTIPO,');
      SQL.Add('A.CARCREDITO,');
      SQL.Add('A.CARCONTADO,');
      SQL.Add('A.CODIGOVENDEDOR,');
      SQL.Add('A.NOMBREVENDEDOR,');
      SQL.Add('A.IdCliente,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('A.EFECTIVO,');
      SQL.Add('A.TARJETA,');
      SQL.Add('A.TRANSFERENCIA,');
      SQL.Add('A.CHEQUE,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSCLIENTESENCABEZADO_Obtener_TotalesPago(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pEfectivo: Double; var pTarjeta: Double;
  var pCheque: Double; var pTransferencia: Double;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    pEfectivo := 0;
    pTarjeta := 0;
    pCheque := 0;
    pTransferencia := 0;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('Sum(EFECTIVO),');
      SQL.Add('Sum(TARJETA),');
      SQL.Add('Sum(TRANSFERENCIA),');
      SQL.Add('Sum(CHEQUE)');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          pEfectivo := Fields[0].AsFloat;
        if Fields[1].IsNull = False then
          pTarjeta := Fields[1].AsFloat;
        if Fields[2].IsNull = False then
          pTransferencia := Fields[2].AsFloat;
        if Fields[3].IsNull = False then
          pCheque := Fields[3].AsFloat;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_RECIBOSPROVEEDORESDETALLE'}
procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROFACTURA,');
      SQL.Add('A.NUMEROSFACTURA,');
      SQL.Add('A.MONTOABONO,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESDETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_RECIBOSPROVEEDORESENCABEZADO'}
procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.NUMEROS,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.MONTOLETRAS,');
      SQL.Add('A.SALDOANTERIOR,');
      SQL.Add('A.MONTONUMERO,');
      SQL.Add('A.SALDOACTUAL,');
      SQL.Add('A.CODIGOPROVEEDOR,');
      SQL.Add('A.NOMBREPROVEEDOR,');
      SQL.Add('A.INTERESESP,');
      SQL.Add('A.INTERESESM,');
      SQL.Add('A.TOTALFINAL,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOFORMAPAGO,');
      SQL.Add('A.CODIGOMONEDA,');
      SQL.Add('A.TIPOCAMBIO,');
      SQL.Add('A.SERIE,');
      SQL.Add('A.CODIGOIMPRESA,');
      SQL.Add('A.NUMERODOC,');
      SQL.Add('A.FECHAVENCIMIENTO,');
      SQL.Add('A.CODIGOTIPO,');
      SQL.Add('A.CARCREDITO,');
      SQL.Add('A.CARCONTADO,');
      SQL.Add('A.CODIGOVENDEDOR,');
      SQL.Add('A.NOMBREVENDEDOR,');
      SQL.Add('A.IdProveedor,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B on A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_RECIBOSPROVEEDORESENCABEZADO_Actualizar_Estado(qry1: TFDQuery; pWhere: string;
  pTabla: string; pvalor: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add('CODIGOESTADO = ' + IntToStr(pvalor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_SISTEMA'}
procedure TdmObjects.DB_TB_SISTEMA_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.VERSIONS,');
      SQL.Add('A.IMAGENFONDO,');
      SQL.Add('A.NOMBREIMAGEN,');
      SQL.Add('A.IVADEFAULT,');
      SQL.Add('A.ISERVICIO,');
      SQL.Add('A.MONEDADEFAULT,');
      SQL.Add('A.FAMILIADEFAULT,');
      SQL.Add('A.UNIDADMEDIDADEFAULT,');
      SQL.Add('A.MINIMODEFAULT,');
      SQL.Add('A.APLICARMINIMODEFAULT,');
      SQL.Add('A.APLICARREDONDEO,');
      SQL.Add('A.APLICARREDONDEO5,');
      SQL.Add('A.Clave,');
      SQL.Add('A.MontoInicial,');
      SQL.Add('A.PRODUCTOIMPUESTOINCLUIDO,');
      SQL.Add('A.USARSEGURIDAD,');
      SQL.Add('A.USARCONTABILIDAD,');
      SQL.Add('A.TIPOMAQUINA,');
      SQL.Add('A.IdVendedor,');
      SQL.Add('A.AplicarBajarInventarioNC');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_SISTEMA_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_SISTEMA_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_SISTEMA_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_SISTEMA_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_SISTEMA_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_SISTEMA_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_SISTEMA_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_SISTEMA_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_TIPOS'}
procedure TdmObjects.DB_TB_TIPOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_TIPOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_TIPOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_TIPOS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_TIPOS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_TIPOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_TIPOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_TIPOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_TIPOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_UNIDADESMEDIDA'}
procedure TdmObjects.DB_TB_UNIDADESMEDIDA_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.ABREVIATURA');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_UNIDADESMEDIDA_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_UNIDADESMEDIDA_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_UNIDADESMEDIDA_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_UNIDADESMEDIDA_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_UNIDADESMEDIDA_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_UNIDADESMEDIDA_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_UNIDADESMEDIDA_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_UNIDADESMEDIDA_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_USUARIOS'}
procedure TdmObjects.DB_TB_USUARIOS_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.USUARIO,');
      SQL.Add('A.CLAVE,');
      SQL.Add('A.FECHAALTA,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.APELLIDO1,');
      SQL.Add('A.APELLIDO2,');
      SQL.Add('A.NOMBRECOMPLETO,');
      SQL.Add('A.CODIGOPOSTAL,');
      SQL.Add('A.DIRECCION,');
      SQL.Add('A.EMAIL,');
      SQL.Add('A.TELEFONO1,');
      SQL.Add('A.TELEFONO2,');
      SQL.Add('A.CODIGONIVEL,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CEDULA,');
      SQL.Add('A.ESVISIBLE,');
      SQL.Add('A.FECHANACIMIENTO');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_USUARIOS_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_USUARIOS_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_USUARIOS_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_USUARIOS_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_USUARIOS_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_USUARIOS_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_USUARIOS_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_USUARIOS_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_USUARIOS_Set_AutoInc(qry1: TFDQuery;
  pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      if pTipo = 1 then
        SQL.Add('SET GENERATOR gen_' + pTabla + ' TO ' + IntToStr(pValor));
      if pTipo = 2 then
        SQL.Add('ALTER TABLE ' + pTabla + ' AUTO_INCREMENT = ' + IntToStr(pValor));
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_SetAutoInc.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_VENDEDORES'}
procedure TdmObjects.DB_TB_VENDEDORES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.FECHAALTA,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.APELLIDO1,');
      SQL.Add('A.APELLIDO2,');
      SQL.Add('A.NOMBRECOMPLETO,');
      SQL.Add('A.CODIGOPOSTAL,');
      SQL.Add('A.DIRECCION,');
      SQL.Add('A.EMAIL,');
      SQL.Add('A.TELEFONO1,');
      SQL.Add('A.TELEFONO2,');
      SQL.Add('A.WEB,');
      SQL.Add('A.NOMBREIMPRIMIR,');
      SQL.Add('A.CEDULA,');
      SQL.Add('A.IMAGEN1,');
      SQL.Add('A.NOMBREARCHIVO');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_VENDEDORES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_VENDEDORES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_VENDEDORES_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_VENDEDORES_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_VENDEDORES_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_VENDEDORES_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_VENDEDORES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_VENDEDORES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_grupos_encabezado'}
procedure TdmObjects.DB_TB_GruposEncabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.TotalVenta,');
      SQL.Add('A.TotalCompra,');
      SQL.Add('A.IdProducto');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_GruposEncabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_GruposEncabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_GruposEncabezado_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_GruposEncabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_GruposEncabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_GruposEncabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_GruposEncabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_GruposEncabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'tb_grupos_detalle'}
procedure TdmObjects.DB_TB_GruposDetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.IdEncabezado,');
      SQL.Add('A.IdProducto,');
      SQL.Add('A.Cantidad');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_GruposDetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_GruposDetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_GruposDetalle_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_GruposDetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_GruposDetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_GruposDetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_GruposDetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_GruposDetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Ordenes Encabezado'}
procedure TdmObjects.DB_TB_OrdenesEncabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.ETIQUETA,');
      SQL.Add('A.VENTA,');
      SQL.Add('A.COMENTARIOS,');
      SQL.Add('A.IDCLIENTE,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.HORA,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('B.NOMBRE As EstadoNombre,');
      SQL.Add('C.NOMBRECOMPLETO As ClienteNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOSORDENES B On A.CODIGOESTADO=B.Id');
      SQL.Add('Left Join TB_CLIENTES C On A.IDCLIENTE=C.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_OrdenesEncabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_OrdenesEncabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_OrdenesEncabezado_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_OrdenesEncabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_OrdenesEncabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_OrdenesEncabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_OrdenesEncabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_OrdenesEncabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'Ordenes Detalle'}
procedure TdmObjects.DB_TB_OrdenesDetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.IdEncabezado,');
      SQL.Add('A.IdProducto,');
      SQL.Add('A.Cantidad,');
      SQL.Add('A.idImpresora,');
      SQL.Add('A.Venta,');
      SQL.Add('B.Nombre As ProductoNombre,');
      SQL.Add('B.Codigo As ProductoCodigo,');
      SQL.Add('B.PRECIOVENTA As PrecioUnitario');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join tb_Productos B On A.IdProducto=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_OrdenesDetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_OrdenesDetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_OrdenesDetalle_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_OrdenesDetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_OrdenesDetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_OrdenesDetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_OrdenesDetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_OrdenesDetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_Licencias'}
procedure TdmObjects.DB_TB_Licencias_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.IdSistema,');
      SQL.Add('A.Sistema,');
      SQL.Add('A.Licencia,');
      SQL.Add('A.CodigoEstado,');
      SQL.Add('A.CodigoVenta');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Licencias_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Licencias_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Licencias_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_Licencias_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Licencias_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Licencias_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Licencias_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_Licencias_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_Cuentas'}
procedure TdmObjects.DB_TB_Cuentas_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.IDTIPO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOPADREID,');
      SQL.Add('A.NIVEL,');
      SQL.Add('A.CODIGOPADRENOMBRE,');
      SQL.Add('A.TEMP,');
      SQL.Add('A.SALDO,');
      SQL.Add('A.Editable,');
      SQL.Add('A.MOSTRALISTA,');
      SQL.Add('B.Nombre As EstadoNombre,');
      SQL.Add('C.Nombre As TipoNombre,');
      SQL.Add('D.Nombre As CuentaPadreNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B On A.CODIGOESTADO=B.Id');
      SQL.Add('Left Join TB_TIPOSCUENTAS C On A.IDTIPO=C.Id');
      SQL.Add('Left Join TB_Cuentas D On A.CODIGOPADREID=D.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Cuentas_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Cuentas_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Cuentas_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_Cuentas_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Cuentas_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Cuentas_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Cuentas_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_Cuentas_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_AsientosEncabezado'}
procedure TdmObjects.DB_TB_AsientosEncabezado_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.FECHACREACION,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOCIERRE,');
      SQL.Add('A.TOTAL,');
      SQL.Add('A.NOTAS,');
      SQL.Add('A.IDTIPOORIGEN,');
      SQL.Add('A.IDORIGEN,');
      SQL.Add('B.Nombre As EstadoNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_ESTADOS B On A.CODIGOESTADO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_AsientosEncabezado_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_AsientosEncabezado_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_AsientosEncabezado_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_AsientosEncabezado_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_AsientosEncabezado_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_AsientosEncabezado_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_AsientosEncabezado_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_AsientosEncabezado_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_AsientosDetalle'}
procedure TdmObjects.DB_TB_AsientosDetalle_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.IDENCABEZADO,');
      SQL.Add('A.IDMOVIMIENTO,');
      SQL.Add('A.IDCUENTA,');
      SQL.Add('A.DESCRIPCION,');
      SQL.Add('A.REFERENCIA,');
      SQL.Add('A.MONTO,');
      SQL.Add('A.DEBE,');
      SQL.Add('A.HABER,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOTAS,');
      SQL.Add('A.IDTIPOORIGEN,');
      SQL.Add('A.IDORIGEN,');
      SQL.Add('B.Nombre As CuentaNombre');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join TB_Cuentas B On A.IDCUENTA=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_AsientosDetalle_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_AsientosDetalle_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_AsientosDetalle_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_AsientosDetalle_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_AsientosDetalle_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_AsientosDetalle_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_AsientosDetalle_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_AsientosDetalle_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_Niveles Usuarios'}
procedure TdmObjects.DB_TB_NivelesUsuarios_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NOMBRE');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NivelesUsuarios_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NivelesUsuarios_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NivelesUsuarios_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_NivelesUsuarios_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NivelesUsuarios_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NivelesUsuarios_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NivelesUsuarios_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_NivelesUsuarios_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_Movimientos Inventario'}
procedure TdmObjects.DB_TB_MovimientoInventario_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.FECHA,');
      SQL.Add('A.IDPRODUCTO,');
      SQL.Add('A.CANTIDAD,');
      SQL.Add('A.TIPO,');
      SQL.Add('A.MOTIVO,');
      SQL.Add('B.NOMBRE As ProductoNOMBRE,');
      SQL.Add('B.CODIGO As ProductoCODIGO,');
      SQL.Add('B.EXISTENCIA As ProductoEXISTENCIA');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join tb_Productos B On A.IDPRODUCTO=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_MovimientoInventario_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_MovimientoInventario_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_MovimientoInventario_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_MovimientoInventario_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_MovimientoInventario_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_MovimientoInventario_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_MovimientoInventario_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_MovimientoInventario_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_NOTASCREDITODETALLE'}
procedure TdmObjects.DB_TB_NOTASCREDITODETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CANTIDAD,');
      SQL.Add('A.CODIGOUNIDADMEDIDA,');
      SQL.Add('A.NOMBREUNIDADMEDIDA,');
      SQL.Add('A.PRECIOUNITARIO,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.PRECIOUNITARIOFINAL,');
      SQL.Add('A.PRECIOFINAL,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOIMPUESTO,');
      SQL.Add('A.NOMBREIMPUESTO,');
      SQL.Add('A.PRECIOMAYORISTAAPLICADO,');
      SQL.Add('A.ISP,');
      SQL.Add('A.ISM,');
      SQL.Add('A.PRECIOUNITARIOBASE,');
      SQL.Add('A.PRECIOFINALBASE,');
      SQL.Add('A.DESCRIPCION1,');
      SQL.Add('A.DESCRIPCION2,');
      SQL.Add('A.IdProducto,');
      SQL.Add('A.TOTALKILOS');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITODETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITODETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITODETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_NOTASCREDITODETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASCREDITODETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASCREDITODETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASCREDITODETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_NOTASCREDITODETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITODETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto, EsCompuesto, mGrupoId, mIdProducto2: Integer;
  mExistencia: Double;
  mWhere: TStringList;
  d2: TFDMemTable;
  mTipo: Integer;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        mWhere := TStringList.Create;
        mWhere.Add('Where Id=' + IntToStr(mIdProducto));
        mTipo :=
          DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
          'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
        mWhere.Free;
        if pResultado = -1 then
          raise Exception.Create('');

        if (mIdProducto > 0) and (mTipo = 1) then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          EsCompuesto := DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
            'tb_Productos', 'ESCOMPUESTO', pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia +
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          if EsCompuesto = 1 then
          begin
            mWhere := TStringList.Create;
            mWhere.Add('Where IdProducto=' + IntToStr(mIdProducto));
            mGrupoId := DB_TB_GruposEncabezado_Obtener_Id(qry1, mWhere.Text, 'tb_grupos_encabezado', pClaseNombre, pResultado, pErrorM);
            mWhere.Free;

            mWhere := TStringList.Create;
            d2 := TFDMemTable.Create(nil);
            d2.FieldDefs.Clear;
            d2.FieldDefs.Add('ID', ftInteger, 0);
            d2.FieldDefs.Add('IdEncabezado', ftInteger, 0);
            d2.FieldDefs.Add('IdProducto', ftInteger, 0);
            d2.FieldDefs.Add('Cantidad', ftFloat, 0);
            d2.FieldDefs.Add('PrecioFinal', ftFloat, 0);
            d2.FieldDefs.Add('ProductoNombre', ftString, 100);
            d2.CreateDataSet;
            d2.Open;
            mWhere.Add('Where A.IdEncabezado=' + IntToStr(mGrupoId));
            DB_TB_GruposDetalle_Consultar(qry1, d2, mWhere.Text, '', '', '', 'tb_grupos_detalle', '', pResultado, pErrorM);
            mWhere.Free;
            d2.First;
            while not d2.Eof do
            begin
              mIdProducto2 := d2.FieldByName('IdProducto').AsInteger;
              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mExistencia :=
                DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
                pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');
              mExistencia := mExistencia + d2.FieldByName('CANTIDAD').AsFloat;

              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mTipo :=
                DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
                'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');

              if mTipo = 1 then
              begin
                mWhere := TStringList.Create;
                mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
                DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
                  mExistencia, pClaseNombre, pResultado, pErrorM);
                mWhere.Free;
                if pResultado = -1 then
                  raise Exception.Create('');
              end;

              d2.Next;
            end;
          end;

        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASCREDITODETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto, EsCompuesto, mGrupoId, mIdProducto2: Integer;
  mExistencia: Double;
  mWhere: TStringList;
  d2: TFDMemTable;
  mTipo: Integer;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        mWhere := TStringList.Create;
        mWhere.Add('Where Id=' + IntToStr(mIdProducto));
        mTipo :=
          DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
          'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
        mWhere.Free;
        if pResultado = -1 then
          raise Exception.Create('');

        if (mIdProducto > 0) and (mTipo = 1) then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          EsCompuesto := DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
            'tb_Productos', 'ESCOMPUESTO', pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia -
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          if EsCompuesto = 1 then
          begin
            mWhere := TStringList.Create;
            mWhere.Add('Where IdProducto=' + IntToStr(mIdProducto));
            mGrupoId := DB_TB_GruposEncabezado_Obtener_Id(qry1, mWhere.Text, 'tb_grupos_encabezado', pClaseNombre, pResultado, pErrorM);
            mWhere.Free;

            mWhere := TStringList.Create;
            d2 := TFDMemTable.Create(nil);
            d2.FieldDefs.Clear;
            d2.FieldDefs.Add('ID', ftInteger, 0);
            d2.FieldDefs.Add('IdEncabezado', ftInteger, 0);
            d2.FieldDefs.Add('IdProducto', ftInteger, 0);
            d2.FieldDefs.Add('Cantidad', ftFloat, 0);
            d2.FieldDefs.Add('PrecioFinal', ftFloat, 0);
            d2.FieldDefs.Add('ProductoNombre', ftString, 100);
            d2.CreateDataSet;
            d2.Open;
            mWhere.Add('Where A.IdEncabezado=' + IntToStr(mGrupoId));
            DB_TB_GruposDetalle_Consultar(qry1, d2, mWhere.Text, '', '', '', 'tb_grupos_detalle', '', pResultado, pErrorM);
            mWhere.Free;
            d2.First;
            while not d2.Eof do
            begin
              mIdProducto2 := d2.FieldByName('IdProducto').AsInteger;
              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mExistencia :=
                DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
                pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');
              mExistencia := mExistencia - d2.FieldByName('CANTIDAD').AsFloat;

              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mTipo :=
                DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
                'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');

              if mTipo = 1 then
              begin
                mWhere := TStringList.Create;
                mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
                DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
                  mExistencia, pClaseNombre, pResultado, pErrorM);
                mWhere.Free;
                if pResultado = -1 then
                  raise Exception.Create('');
              end;

              d2.Next;
            end;
          end;

        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_VENDEDORESCLIENTES'}
procedure TdmObjects.DB_TB_VENDEDORESCLIENTES_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.IDVENDEDOR,');
      SQL.Add('A.IDCLIENTE,');
      SQL.Add('B.Codigo As ClienteCODIGO,');
      SQL.Add('B.NOMBRECOMPLETO As ClienteNOMBRECOMPLETO');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add('Left Join tb_Clientes B On A.IDCLIENTE=B.Id');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_VENDEDORESCLIENTES_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_VENDEDORESCLIENTES_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_VENDEDORESCLIENTES_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_VENDEDORESCLIENTES_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_VENDEDORESCLIENTES_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_VENDEDORESCLIENTES_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_VENDEDORESCLIENTES_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_VENDEDORESCLIENTES_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_Conexiones'}
procedure TdmObjects.DB_TB_Conexiones_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.IP,');
      SQL.Add('A.COMENTARIOS,');
      SQL.Add('A.Driver,');
      SQL.Add('A.BaseDatos,');
      SQL.Add('A.Usuario,');
      SQL.Add('A.Clave,');
      SQL.Add('A.Puerto,');
      SQL.Add('A.Varios');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Conexiones_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Conexiones_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_Conexiones_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_Conexiones_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Conexiones_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Conexiones_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_Conexiones_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_Conexiones_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_NOTASDEBITODETALLE'}
procedure TdmObjects.DB_TB_NOTASDEBITODETALLE_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.NUMERO,');
      SQL.Add('A.CODIGO,');
      SQL.Add('A.NOMBRE,');
      SQL.Add('A.CANTIDAD,');
      SQL.Add('A.CODIGOUNIDADMEDIDA,');
      SQL.Add('A.NOMBREUNIDADMEDIDA,');
      SQL.Add('A.PRECIOUNITARIO,');
      SQL.Add('A.DESCUENTOP,');
      SQL.Add('A.DESCUENTOM,');
      SQL.Add('A.IVAP,');
      SQL.Add('A.IVAM,');
      SQL.Add('A.PRECIOUNITARIOFINAL,');
      SQL.Add('A.PRECIOFINAL,');
      SQL.Add('A.LINEA,');
      SQL.Add('A.NOMBREESTADO,');
      SQL.Add('A.CODIGOESTADO,');
      SQL.Add('A.CODIGOIMPUESTO,');
      SQL.Add('A.NOMBREIMPUESTO,');
      SQL.Add('A.PRECIOMAYORISTAAPLICADO,');
      SQL.Add('A.ISP,');
      SQL.Add('A.ISM,');
      SQL.Add('A.PRECIOUNITARIOBASE,');
      SQL.Add('A.PRECIOFINALBASE,');
      SQL.Add('A.DESCRIPCION1,');
      SQL.Add('A.DESCRIPCION2,');
      SQL.Add('A.IdProducto,');
      SQL.Add('A.TOTALKILOS');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITODETALLE_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITODETALLE_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITODETALLE_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_NOTASDEBITODETALLE_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASDEBITODETALLE_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASDEBITODETALLE_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_NOTASDEBITODETALLE_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_NOTASDEBITODETALLE_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITODETALLE_Sumar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto, EsCompuesto, mGrupoId, mIdProducto2: Integer;
  mExistencia: Double;
  mWhere: TStringList;
  d2: TFDMemTable;
  mTipo: Integer;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        mWhere := TStringList.Create;
        mWhere.Add('Where Id=' + IntToStr(mIdProducto));
        mTipo :=
          DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
          'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
        mWhere.Free;
        if pResultado = -1 then
          raise Exception.Create('');

        if (mIdProducto > 0) and (mTipo = 1) then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          EsCompuesto := DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
            'tb_Productos', 'ESCOMPUESTO', pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia +
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          if EsCompuesto = 1 then
          begin
            mWhere := TStringList.Create;
            mWhere.Add('Where IdProducto=' + IntToStr(mIdProducto));
            mGrupoId := DB_TB_GruposEncabezado_Obtener_Id(qry1, mWhere.Text, 'tb_grupos_encabezado', pClaseNombre, pResultado, pErrorM);
            mWhere.Free;

            mWhere := TStringList.Create;
            d2 := TFDMemTable.Create(nil);
            d2.FieldDefs.Clear;
            d2.FieldDefs.Add('ID', ftInteger, 0);
            d2.FieldDefs.Add('IdEncabezado', ftInteger, 0);
            d2.FieldDefs.Add('IdProducto', ftInteger, 0);
            d2.FieldDefs.Add('Cantidad', ftFloat, 0);
            d2.FieldDefs.Add('PrecioFinal', ftFloat, 0);
            d2.FieldDefs.Add('ProductoNombre', ftString, 100);
            d2.CreateDataSet;
            d2.Open;
            mWhere.Add('Where A.IdEncabezado=' + IntToStr(mGrupoId));
            DB_TB_GruposDetalle_Consultar(qry1, d2, mWhere.Text, '', '', '', 'tb_grupos_detalle', '', pResultado, pErrorM);
            mWhere.Free;
            d2.First;
            while not d2.Eof do
            begin
              mIdProducto2 := d2.FieldByName('IdProducto').AsInteger;
              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mExistencia :=
                DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
                pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');
              mExistencia := mExistencia + d2.FieldByName('CANTIDAD').AsFloat;

              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mTipo :=
                DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
                'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');

              if mTipo = 1 then
              begin
                mWhere := TStringList.Create;
                mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
                DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
                  mExistencia, pClaseNombre, pResultado, pErrorM);
                mWhere.Free;
                if pResultado = -1 then
                  raise Exception.Create('');
              end;

              d2.Next;
            end;
          end;

        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_NOTASDEBITODETALLE_Restar_Existencias(qry1: TFDQuery; pWhere: string;
  pTabla: string; d1: TFDMemTable; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
  mIdProducto, EsCompuesto, mGrupoId, mIdProducto2: Integer;
  mExistencia: Double;
  mWhere: TStringList;
  d2: TFDMemTable;
  mTipo: Integer;
begin
  try
    pResultado := 1;

    with d1 do
    begin
      First;
      while not Eof do
      begin
        mIdProducto :=
          FieldByName('IdProducto').AsInteger;

        mWhere := TStringList.Create;
        mWhere.Add('Where Id=' + IntToStr(mIdProducto));
        mTipo :=
          DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
          'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
        mWhere.Free;
        if pResultado = -1 then
          raise Exception.Create('');

        if (mIdProducto > 0) and (mTipo = 1) then
        begin
          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          mExistencia :=
            DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
            pClaseNombre, pResultado, pErrorM);
          EsCompuesto := DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
            'tb_Productos', 'ESCOMPUESTO', pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          mExistencia := mExistencia -
            FieldByName('CANTIDAD').AsFloat;

          mWhere := TStringList.Create;
          mWhere.Add('Where Id=' + IntToStr(mIdProducto));
          DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
            mExistencia, pClaseNombre, pResultado, pErrorM);
          mWhere.Free;
          if pResultado = -1 then
            raise Exception.Create('');

          if EsCompuesto = 1 then
          begin
            mWhere := TStringList.Create;
            mWhere.Add('Where IdProducto=' + IntToStr(mIdProducto));
            mGrupoId := DB_TB_GruposEncabezado_Obtener_Id(qry1, mWhere.Text, 'tb_grupos_encabezado', pClaseNombre, pResultado, pErrorM);
            mWhere.Free;

            mWhere := TStringList.Create;
            d2 := TFDMemTable.Create(nil);
            d2.FieldDefs.Clear;
            d2.FieldDefs.Add('ID', ftInteger, 0);
            d2.FieldDefs.Add('IdEncabezado', ftInteger, 0);
            d2.FieldDefs.Add('IdProducto', ftInteger, 0);
            d2.FieldDefs.Add('Cantidad', ftFloat, 0);
            d2.FieldDefs.Add('PrecioFinal', ftFloat, 0);
            d2.FieldDefs.Add('ProductoNombre', ftString, 100);
            d2.CreateDataSet;
            d2.Open;
            mWhere.Add('Where A.IdEncabezado=' + IntToStr(mGrupoId));
            DB_TB_GruposDetalle_Consultar(qry1, d2, mWhere.Text, '', '', '', 'tb_grupos_detalle', '', pResultado, pErrorM);
            mWhere.Free;
            d2.First;
            while not d2.Eof do
            begin
              mIdProducto2 := d2.FieldByName('IdProducto').AsInteger;
              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mExistencia :=
                DB_TB_PRODUCTOS_Obtener_Existencia(qry1, mWhere.Text,
                pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');
              mExistencia := mExistencia - d2.FieldByName('CANTIDAD').AsFloat;

              mWhere := TStringList.Create;
              mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
              mTipo :=
                DB_TB_PRODUCTOS_Obtener_Valor(qry1, mWhere.Text,
                'TB_PRODUCTOS', 'IdTipo', pClaseNombre, pResultado, pErrorM);
              mWhere.Free;
              if pResultado = -1 then
                raise Exception.Create('');

              if mTipo = 1 then
              begin
                mWhere := TStringList.Create;
                mWhere.Add('Where Id=' + IntToStr(mIdProducto2));
                DB_TB_PRODUCTOS_Actualizar_Existencia(qry1, mWhere.Text,
                  mExistencia, pClaseNombre, pResultado, pErrorM);
                mWhere.Free;
                if pResultado = -1 then
                  raise Exception.Create('');
              end;

              d2.Next;
            end;
          end;

        end;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'TB_DOCUMENTOSHACIENDA'}
procedure TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Consultar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pOrderBy: string; pGroupBy: string; pHaving: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mSQL: string;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    ds1.EmptyDataSet;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.ID,');
      SQL.Add('A.IDENCABEZADO,');
      SQL.Add('A.SUCURSAL,');
      SQL.Add('A.TERMINAL,');
      SQL.Add('A.TIPO,');
      SQL.Add('A.NUMERACION,');
      SQL.Add('A.CONSECUTIVO,');
      SQL.Add('A.PAIS,');
      SQL.Add('A.DIA,');
      SQL.Add('A.MES,');
      SQL.Add('A.MYEAR,');
      SQL.Add('A.IDENTIFICACION,');
      SQL.Add('A.SITUACION,');
      SQL.Add('A.SEGURIDAD,');
      SQL.Add('A.CLAVE,');
      SQL.Add('A.MQR');
      SQL.Add('From ' + pTabla + ' A');
      SQL.Add(pWhere);
      SQL.Add(pGroupBy);
      SQL.Add(pHaving);
      SQL.Add(pOrderBy);
      mSQL := SQL.Text;
      DB_DBToStruct(qry1, ds1, pResultado, pErrorM);
      if pResultado = -1 then
        raise Exception.Create('');
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(mSQL);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Consultar.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Insertar(qry1: TFDQuery; ds1: TFDMemTable;
  pClaseNombre: string; var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;
    DB_Insert_Generico(qry1, ds1, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Insertar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Modificar(qry1: TFDQuery; ds1: TFDMemTable;
  pWhere: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Update_Generico(qry1, ds1, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Modificar.sql');
        mArchivo.Free;
    end;
  end;
end;

procedure TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Eliminar(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    DB_Delete_Generico(qry1, pTabla, pWhere, pResultado, pErrorM);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    pResultado := -1;
    if SaveLog = 1 then
    begin
      mArchivo := TStringList.Create;
      mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Eliminar.sql');
        mArchivo.Free;
    end;
  end;
end;

function TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Existe_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From ' + pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Obtener_Id(qry1: TFDQuery; pWhere: string;
  pTabla: string; pClaseNombre: string; var pResultado: Integer;
  var pErrorM: string): Integer;
var
  mResultado: Integer;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select Id');
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Id.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Existe_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Boolean;
var
  mResultado: Boolean;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    mResultado := False;
    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := True;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Existe_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

function TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Obtener_Valor(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string): Variant;
var
  mResultado: Variant;
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Select '+ pCampo);
      SQL.Add('From '+ pTabla);
      SQL.Add(pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsVariant;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Obtener_Valor.sql');
        mArchivo.Free;
      end;
    end;
  end;

  Result := mResultado;
end;

procedure TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Actualizar_Campo(qry1: TFDQuery; pWhere: string;
  pTabla: string; pCampo: string; pValor: Variant; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set');
      SQL.Add(pCampo + '=' + VarToStr(pValor));
      SQL.Add(pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_Actualizar_Campo.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;

procedure TdmObjects.DB_TB_DOCUMENTOSHACIENDA_Set_AutoInc(qry1: TFDQuery;
  pTabla: string; pValor: Integer; pTipo: Integer; pClaseNombre: string;
  var pResultado: Integer; var pErrorM: string);
var
  mArchivo: TStringList;
begin
  try
    pResultado := 1;

    with qry1 do
    begin
      SQL.Clear;
      if pTipo = 1 then
        SQL.Add('SET GENERATOR gen_' + pTabla + ' TO ' + IntToStr(pValor));
      if pTipo = 2 then
        SQL.Add('ALTER TABLE ' + pTabla + ' AUTO_INCREMENT = ' + IntToStr(pValor));
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pErrorM := E.Message;
      pResultado := -1;
      if SaveLog = 1 then
      begin
        mArchivo := TStringList.Create;
        mArchivo.Add(qry1.SQL.Text);
        mArchivo.SaveToFile('SQL_' + pClaseNombre +'_SetAutoInc.sql');
        mArchivo.Free;
      end;
    end;
  end;
end;
{$ENDREGION}

  // Hacienda
{$REGION 'DB_HaciendaEmpresas_Consultar'}
procedure TdmObjects.DB_HaciendaEmpresas_Consultar(
  pCon: TFDConnection; ds1: TFDMemTable;
  pWhere: string; pIdEmpresa: Integer;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with FDQuery1 do
    begin
      Connection := pCon;
      SQL.Clear;
      SQL.Add('Select ');
      SQL.Add('A.Id,');
      SQL.Add('A.Cuenta,');
      SQL.Add('A.EsActivo,');
      SQL.Add('A.Identificacion,');
      SQL.Add('A.IdTipoIdentificacion,');
      SQL.Add('A.Nombre,');
      SQL.Add('A.IdProvincia,');
      SQL.Add('A.IdCanton,');
      SQL.Add('A.IdDistrito,');
      SQL.Add('A.IdBarrio,');
      SQL.Add('A.Direccion,');
      SQL.Add('A.Telefono,');
      SQL.Add('A.Fax,');
      SQL.Add('A.Email,');
      SQL.Add('A.Logo,');
      SQL.Add('A.ExtensiobLogo,');
      SQL.Add('A.MaxDocumentos,');
      SQL.Add('A.IdPlan,');
      SQL.Add('A.FechaAlta,');
      SQL.Add('A.FechaInicioOperaciones,');
      SQL.Add('A.HoraInicioOperaciones,');
      SQL.Add('A.IdPlantilla,');
      SQL.Add('A.CertificadoArchivo,');
      SQL.Add('A.CertificadoArchivoExtension,');
      SQL.Add('A.CertificadoClave,');
      SQL.Add('A.TokenUsuario,');
      SQL.Add('A.TokenClave,');
      SQL.Add('B.Codigo AS tiposidentificacion,');
      SQL.Add('C.Codigo AS provincia,');
      SQL.Add('D.Codigo AS canton,');
      SQL.Add('E.Codigo AS distrito,');
      SQL.Add('F.Codigo AS barrio');
      SQL.Add('From tb_empresas A');
      SQL.Add('LEFT JOIN tb_tiposidentificacion B ON A.Identificacion=B.Id');
      SQL.Add('LEFT JOIN tb_provincias C ON A.IdProvincia=C.Id');
      SQL.Add('LEFT JOIN tb_cantones D ON A.IdCanton=D.Id');
      SQL.Add('LEFT JOIN tb_distritos E ON A.IdDistrito=E.Id');
      SQL.Add('LEFT JOIN tb_barrios F ON A.IdBarrio=F.Id');
      if pWhere <> '' then
        SQL.Add('Where ' + pWhere);
      Open();
      if IsEmpty = False then
      begin
        ds1.Close;
        ds1.Data := Data;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_TotalesDocumentos'}
procedure TdmObjects.DB_Hacienda_TotalesDocumentos(
  pCon: TFDConnection; ds1: TFDMemTable; qry1: TFDQuery;
  var pServiciosExentos: Double; var pServiciosGravados: Double;
  var pMercanciasExentos: Double; var pMercanciasGravados: Double;
  var pTotalGravado: Double; var pTotalExcento: Double;
  var pTotalVenta: Double; var pTotalVentaNeta: Double; var pTotalDescuentos: Double;
  var pTotalImpuesto: Double; var pTotalComprobante: Double;
  var pResultado: Integer; var pError: string);
var
  mPrecioUnitario: Double;
  mCantidad: Double;
  mTotal: Double;
  mIDPRODUCTO: Integer;
begin
  try
    pResultado := 1;

    pServiciosExentos := 0;
    pServiciosGravados := 0;
    pMercanciasExentos := 0;
    pMercanciasGravados := 0;
    pTotalGravado := 0;
    pTotalExcento := 0;
    pTotalVenta := 0;
    pTotalVentaNeta := 0;
    pTotalDescuentos := 0;
    pTotalImpuesto := 0;
    pTotalComprobante := 0;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        mIDPRODUCTO :=
          FieldByName('IDPRODUCTO').AsInteger;

        mPrecioUnitario :=
          FieldByName('PRECIOUNITARIO').AsFloat;
        mCantidad :=
          FieldByName('CANTIDAD').AsFloat;
        qry1.Connection := pCon;
        if DB_TB_PRODUCTOS_EsFisico(qry1, 'ID=' + IntToStr(mIDPRODUCTO),
          'TB_PRODUCTOS', '', pResultado, pError) = False then
        begin
          // ServiciosExentos
          if FieldByName('IVAM').AsFloat = 0 then
          begin
            mTotal := mPrecioUnitario + mCantidad;
            pServiciosExentos := pServiciosExentos + mTotal;
          end;
          // ServiciosGravados
          if FieldByName('IVAM').AsFloat > 0 then
          begin
            mTotal := mPrecioUnitario + mCantidad;
            pServiciosGravados := pServiciosGravados + mTotal;
          end;
        end
        else begin
          // MercanciasExentos
          if FieldByName('IVAM').AsFloat = 0 then
          begin
            mTotal := mPrecioUnitario + mCantidad;
            pMercanciasExentos := pMercanciasExentos + mTotal;
          end;
          // MercanciasGravados
          if FieldByName('IVAM').AsFloat > 0 then
          begin
            mTotal := mPrecioUnitario + mCantidad;
            pMercanciasGravados := pMercanciasGravados + mTotal;
          end;
        end;
        pTotalDescuentos := pTotalDescuentos +
          FieldByName('DESCUENTOM').AsFloat;
        pTotalImpuesto := pTotalImpuesto +
          FieldByName('IVAM').AsFloat;

        Next;
      end;
    end;

    pTotalGravado := pServiciosGravados + pMercanciasGravados;
    pTotalExcento := pServiciosExentos + pMercanciasExentos;
    pTotalVenta := pTotalGravado + pTotalExcento;
    pTotalVentaNeta := pTotalVenta - pTotalDescuentos;
    pTotalComprobante := pTotalVentaNeta + pTotalImpuesto;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_DocumentosEncabezado_Insertar'}
procedure TdmObjects.DB_Hacienda_DocumentosEncabezado_Insertar(
  pCon: TFDConnection; ds1: TFDMemTable;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
var
  mArchivo: TMemoryStream;
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.Connection := pCon;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('TipoDoc,');
        FDQuery1.SQL.Add('Clave,');
        FDQuery1.SQL.Add('NumeroConsecutivo,');
        FDQuery1.SQL.Add('FechaEmision,');
        FDQuery1.SQL.Add('EmisorTipo,');
        FDQuery1.SQL.Add('EmisorNumero,');
        FDQuery1.SQL.Add('EmisorNombre,');
        FDQuery1.SQL.Add('EmisorNombreComercial,');
        FDQuery1.SQL.Add('EmisorProvincia,');
        FDQuery1.SQL.Add('EmisorCanton,');
        FDQuery1.SQL.Add('EmisorDistrito,');
        FDQuery1.SQL.Add('EmisorBarrio,');
        FDQuery1.SQL.Add('EmisorOtrasSenas,');
        FDQuery1.SQL.Add('EmisorCodigoPaisTel,');
        FDQuery1.SQL.Add('EmisorNumTelefonoTel,');
        FDQuery1.SQL.Add('EmisorCodigoPaisFax,');
        FDQuery1.SQL.Add('EmisorNumTelefonoFax,');
        FDQuery1.SQL.Add('EmisorCorreoElectronico,');
        FDQuery1.SQL.Add('ReceptorNombre,');
        FDQuery1.SQL.Add('ReceptorTipo,');
        FDQuery1.SQL.Add('ReceptorNumero,');
        FDQuery1.SQL.Add('ReceptorExtranjero,');
        FDQuery1.SQL.Add('ReceptorNombreComercial,');
        FDQuery1.SQL.Add('ReceptorProvincia,');
        FDQuery1.SQL.Add('ReceptorCanton,');
        FDQuery1.SQL.Add('ReceptorDistrito,');
        FDQuery1.SQL.Add('ReceptorBarrio,');
        FDQuery1.SQL.Add('ReceptorOtrasSenas,');
        FDQuery1.SQL.Add('ReceptorCodigoPaisTel,');
        FDQuery1.SQL.Add('ReceptorNumTelefonoTel,');
        FDQuery1.SQL.Add('ReceptorCodigoPaisFax,');
        FDQuery1.SQL.Add('ReceptorNumTelefonoFax,');
        FDQuery1.SQL.Add('ReceptorCorreoElectronico,');
        FDQuery1.SQL.Add('CondicionVenta,');
        FDQuery1.SQL.Add('PlazoCredito,');
        FDQuery1.SQL.Add('MedioPago,');
        FDQuery1.SQL.Add('CodigoMoneda,');
        FDQuery1.SQL.Add('TipoCambio,');
        FDQuery1.SQL.Add('TotalServGravados,');
        FDQuery1.SQL.Add('TotalServExentos,');
        FDQuery1.SQL.Add('TotalMercanciasGravadas,');
        FDQuery1.SQL.Add('TotalMercanciasExentas,');
        FDQuery1.SQL.Add('TotalGravado,');
        FDQuery1.SQL.Add('TotalExento,');
        FDQuery1.SQL.Add('TotalVenta,');
        FDQuery1.SQL.Add('TotalDescuentos,');
        FDQuery1.SQL.Add('TotalVentaNeta,');
        FDQuery1.SQL.Add('TotalImpuesto,');
        FDQuery1.SQL.Add('TotalComprobante,');
        FDQuery1.SQL.Add('ReferenciaNumero,');
        FDQuery1.SQL.Add('ReferenciaFechaEmision,');
        FDQuery1.SQL.Add('ReferenciaCodigo,');
        FDQuery1.SQL.Add('ReferenciaRazon,');
        FDQuery1.SQL.Add('NumeroResolucion,');
        FDQuery1.SQL.Add('FechaResolucion,');
        FDQuery1.SQL.Add('OtroTexto,');
        FDQuery1.SQL.Add('OtroContenido,');
        FDQuery1.SQL.Add('Signature,');
        FDQuery1.SQL.Add('IdSucursal,');
        FDQuery1.SQL.Add('IdTerminal,');
        FDQuery1.SQL.Add('Numero,');
        FDQuery1.SQL.Add('IdEstadoHacienda,');
        FDQuery1.SQL.Add('FechaEmisionD,');
        FDQuery1.SQL.Add('HoraEmision,');
        FDQuery1.SQL.Add('ReferenciaFechaEmisionD,');
        FDQuery1.SQL.Add('ReferenciaHoraEmision,');
        FDQuery1.SQL.Add('XMLSinFirma,');
        FDQuery1.SQL.Add('XMLConFirma,');
        FDQuery1.SQL.Add('Mensaje,');
        FDQuery1.SQL.Add('CodigoActividad,');
        FDQuery1.SQL.Add('TotalServExonerado,');
        FDQuery1.SQL.Add('TotalMercExonerada,');
        FDQuery1.SQL.Add('TotalExonerado,');
        FDQuery1.SQL.Add('TotalIVADevuelto,');
        FDQuery1.SQL.Add('TotalOtrosCargos,');
        FDQuery1.SQL.Add('ReceptorOtrasSenasExtranjero,');
        FDQuery1.SQL.Add('NumeroCuenta,');
        FDQuery1.SQL.Add('DocReferencia,');
        FDQuery1.SQL.Add('ReceptorCorreos,');
        FDQuery1.SQL.Add('IdSituacion,');
        FDQuery1.SQL.Add('IdPlantilla,');
        FDQuery1.SQL.Add('Adjuntos,');
        FDQuery1.SQL.Add('ExtensionAdjuntos,');
        FDQuery1.SQL.Add('ReferenciaTipo,');
        FDQuery1.SQL.Add('IdEmpresa,');
        FDQuery1.SQL.Add('DetalleHacienda,');
        FDQuery1.SQL.Add('CodigoEmail,');
        FDQuery1.SQL.Add('PDFHacienda');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6,');
        FDQuery1.SQL.Add(':Param7,');
        FDQuery1.SQL.Add(':Param8,');
        FDQuery1.SQL.Add(':Param9,');
        FDQuery1.SQL.Add(':Param10,');
        FDQuery1.SQL.Add(':Param11,');
        FDQuery1.SQL.Add(':Param12,');
        FDQuery1.SQL.Add(':Param13,');
        FDQuery1.SQL.Add(':Param14,');
        FDQuery1.SQL.Add(':Param15,');
        FDQuery1.SQL.Add(':Param16,');
        FDQuery1.SQL.Add(':Param17,');
        FDQuery1.SQL.Add(':Param18,');
        FDQuery1.SQL.Add(':Param19,');
        FDQuery1.SQL.Add(':Param20,');
        FDQuery1.SQL.Add(':Param21,');
        FDQuery1.SQL.Add(':Param22,');
        FDQuery1.SQL.Add(':Param23,');
        FDQuery1.SQL.Add(':Param24,');
        FDQuery1.SQL.Add(':Param25,');
        FDQuery1.SQL.Add(':Param26,');
        FDQuery1.SQL.Add(':Param27,');
        FDQuery1.SQL.Add(':Param28,');
        FDQuery1.SQL.Add(':Param29,');
        FDQuery1.SQL.Add(':Param30,');
        FDQuery1.SQL.Add(':Param31,');
        FDQuery1.SQL.Add(':Param32,');
        FDQuery1.SQL.Add(':Param33,');
        FDQuery1.SQL.Add(':Param34,');
        FDQuery1.SQL.Add(':Param35,');
        FDQuery1.SQL.Add(':Param36,');
        FDQuery1.SQL.Add(':Param37,');
        FDQuery1.SQL.Add(':Param38,');
        FDQuery1.SQL.Add(':Param39,');
        FDQuery1.SQL.Add(':Param40,');
        FDQuery1.SQL.Add(':Param41,');
        FDQuery1.SQL.Add(':Param42,');
        FDQuery1.SQL.Add(':Param43,');
        FDQuery1.SQL.Add(':Param44,');
        FDQuery1.SQL.Add(':Param45,');
        FDQuery1.SQL.Add(':Param46,');
        FDQuery1.SQL.Add(':Param47,');
        FDQuery1.SQL.Add(':Param48,');
        FDQuery1.SQL.Add(':Param49,');
        FDQuery1.SQL.Add(':Param50,');
        FDQuery1.SQL.Add(':Param51,');
        FDQuery1.SQL.Add(':Param52,');
        FDQuery1.SQL.Add(':Param53,');
        FDQuery1.SQL.Add(':Param54,');
        FDQuery1.SQL.Add(':Param55,');
        FDQuery1.SQL.Add(':Param56,');
        FDQuery1.SQL.Add(':Param57,');
        FDQuery1.SQL.Add(':Param58,');
        FDQuery1.SQL.Add(':Param59,');
        FDQuery1.SQL.Add(':Param60,');
        FDQuery1.SQL.Add(':Param61,');
        FDQuery1.SQL.Add(':Param62,');
        FDQuery1.SQL.Add(':Param63,');
        FDQuery1.SQL.Add(':Param64,');
        FDQuery1.SQL.Add(':Param65,');
        FDQuery1.SQL.Add(':Param66,');
        FDQuery1.SQL.Add(':Param67,');
        FDQuery1.SQL.Add(':Param68,');
        FDQuery1.SQL.Add(':Param69,');
        FDQuery1.SQL.Add(':Param70,');
        FDQuery1.SQL.Add(':Param71,');
        FDQuery1.SQL.Add(':Param72,');
        FDQuery1.SQL.Add(':Param73,');
        FDQuery1.SQL.Add(':Param74,');
        FDQuery1.SQL.Add(':Param75,');
        FDQuery1.SQL.Add(':Param76,');
        FDQuery1.SQL.Add(':Param77,');
        FDQuery1.SQL.Add(':Param78,');
        FDQuery1.SQL.Add(':Param79,');
        FDQuery1.SQL.Add(':Param80,');
        FDQuery1.SQL.Add(':Param81,');
        FDQuery1.SQL.Add(':Param82,');
        FDQuery1.SQL.Add(':Param83,');
        FDQuery1.SQL.Add(':Param84,');
        FDQuery1.SQL.Add(':Param85,');
        FDQuery1.SQL.Add(':Param86,');
        FDQuery1.SQL.Add(':Param87');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsString :=
          FieldByName('TipoDoc').AsString;
        FDQuery1.Params.Items[1].AsString :=
          FieldByName('Clave').AsString;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('NumeroConsecutivo').AsString;
        FDQuery1.Params.Items[3].AsString :=
          FieldByName('FechaEmision').AsString;
        FDQuery1.Params.Items[4].AsString :=
          FieldByName('EmisorTipo').AsString;
        FDQuery1.Params.Items[5].AsString :=
          FieldByName('EmisorNumero').AsString;
        FDQuery1.Params.Items[6].AsString :=
          FieldByName('EmisorNombre').AsString;
        FDQuery1.Params.Items[7].AsString :=
          FieldByName('EmisorNombreComercial').AsString;
        FDQuery1.Params.Items[8].AsString :=
          FieldByName('EmisorProvincia').AsString;
        FDQuery1.Params.Items[9].AsString :=
          FieldByName('EmisorCanton').AsString;
        FDQuery1.Params.Items[10].AsString :=
          FieldByName('EmisorDistrito').AsString;
        FDQuery1.Params.Items[11].AsString :=
          FieldByName('EmisorBarrio').AsString;
        FDQuery1.Params.Items[12].AsString :=
          FieldByName('EmisorOtrasSenas').AsString;
        FDQuery1.Params.Items[13].AsInteger :=
          FieldByName('EmisorCodigoPaisTel').AsInteger;
        FDQuery1.Params.Items[14].AsInteger :=
          FieldByName('EmisorNumTelefonoTel').AsInteger;
        FDQuery1.Params.Items[15].AsInteger :=
          FieldByName('EmisorCodigoPaisFax').AsInteger;
        FDQuery1.Params.Items[16].AsInteger :=
          FieldByName('EmisorNumTelefonoFax').AsInteger;
        FDQuery1.Params.Items[17].AsString :=
          FieldByName('EmisorCorreoElectronico').AsString;
        FDQuery1.Params.Items[18].AsString :=
          FieldByName('ReceptorNombre').AsString;
        FDQuery1.Params.Items[19].AsString :=
          FieldByName('ReceptorTipo').AsString;
        FDQuery1.Params.Items[20].AsString :=
          FieldByName('ReceptorNumero').AsString;
        FDQuery1.Params.Items[21].AsString :=
          FieldByName('ReceptorExtranjero').AsString;
        FDQuery1.Params.Items[22].AsString :=
          FieldByName('ReceptorNombreComercial').AsString;
        FDQuery1.Params.Items[23].AsString :=
          FieldByName('ReceptorProvincia').AsString;
        FDQuery1.Params.Items[24].AsString :=
          FieldByName('ReceptorCanton').AsString;
        FDQuery1.Params.Items[25].AsString :=
          FieldByName('ReceptorDistrito').AsString;
        FDQuery1.Params.Items[26].AsString :=
          FieldByName('ReceptorBarrio').AsString;
        FDQuery1.Params.Items[27].AsString :=
          FieldByName('ReceptorOtrasSenas').AsString;
        FDQuery1.Params.Items[28].AsInteger :=
          FieldByName('ReceptorCodigoPaisTel').AsInteger;
        FDQuery1.Params.Items[29].AsInteger :=
          FieldByName('ReceptorNumTelefonoTel').AsInteger;
        FDQuery1.Params.Items[30].AsInteger :=
          FieldByName('ReceptorCodigoPaisFax').AsInteger;
        FDQuery1.Params.Items[31].AsInteger :=
          FieldByName('ReceptorNumTelefonoFax').AsInteger;
        FDQuery1.Params.Items[32].AsString :=
          FieldByName('ReceptorCorreoElectronico').AsString;
        FDQuery1.Params.Items[33].AsString :=
          FieldByName('CondicionVenta').AsString;
        FDQuery1.Params.Items[34].AsString :=
          FieldByName('PlazoCredito').AsString;
        FDQuery1.Params.Items[35].AsString :=
          FieldByName('MedioPago').AsString;
        FDQuery1.Params.Items[36].AsString :=
          FieldByName('CodigoMoneda').AsString;
        FDQuery1.Params.Items[37].AsFloat :=
          FieldByName('TipoCambio').AsFloat;
        FDQuery1.Params.Items[38].AsFloat :=
          FieldByName('TotalServGravados').AsFloat;
        FDQuery1.Params.Items[39].AsFloat :=
          FieldByName('TotalServExentos').AsFloat;
        FDQuery1.Params.Items[40].AsFloat :=
          FieldByName('TotalMercanciasGravadas').AsFloat;
        FDQuery1.Params.Items[41].AsFloat :=
          FieldByName('TotalMercanciasExentas').AsFloat;
        FDQuery1.Params.Items[42].AsFloat :=
          FieldByName('TotalGravado').AsFloat;
        FDQuery1.Params.Items[43].AsFloat :=
          FieldByName('TotalExento').AsFloat;
        FDQuery1.Params.Items[44].AsFloat :=
          FieldByName('TotalVenta').AsFloat;
        FDQuery1.Params.Items[45].AsFloat :=
          FieldByName('TotalDescuentos').AsFloat;
        FDQuery1.Params.Items[46].AsFloat :=
          FieldByName('TotalVentaNeta').AsFloat;
        FDQuery1.Params.Items[47].AsFloat :=
          FieldByName('TotalImpuesto').AsFloat;
        FDQuery1.Params.Items[48].AsFloat :=
          FieldByName('TotalComprobante').AsFloat;
        FDQuery1.Params.Items[49].AsString :=
          FieldByName('ReferenciaNumero').AsString;
        FDQuery1.Params.Items[50].AsString :=
          FieldByName('ReferenciaFechaEmision').AsString;
        FDQuery1.Params.Items[51].AsString :=
          FieldByName('ReferenciaCodigo').AsString;
        FDQuery1.Params.Items[52].AsString :=
          FieldByName('ReferenciaRazon').AsString;
        FDQuery1.Params.Items[53].AsString :=
          FieldByName('NumeroResolucion').AsString;
        FDQuery1.Params.Items[54].AsString :=
          FieldByName('FechaResolucion').AsString;
        FDQuery1.Params.Items[55].AsString :=
          FieldByName('OtroTexto').AsString;
        FDQuery1.Params.Items[56].AsString :=
          FieldByName('OtroContenido').AsString;
        FDQuery1.Params.Items[57].AsString :=
          FieldByName('Signature').AsString;
        FDQuery1.Params.Items[58].AsInteger :=
          FieldByName('IdSucursal').AsInteger;
        FDQuery1.Params.Items[59].AsInteger :=
          FieldByName('IdTerminal').AsInteger;
        FDQuery1.Params.Items[60].AsInteger :=
          FieldByName('Numero').AsInteger;
        FDQuery1.Params.Items[61].AsInteger :=
          FieldByName('IdEstadoHacienda').AsInteger;
        FDQuery1.Params.Items[62].AsString :=
          FormatDateTime('yyyy-MM-dd',
          FieldByName('FechaEmisionD').AsDateTime);
        FDQuery1.Params.Items[63].AsString :=
          FieldByName('HoraEmision').AsString;
        FDQuery1.Params.Items[64].AsString :=
          FormatDateTime('yyyy-MM-dd',
          FieldByName('ReferenciaFechaEmisionD').AsDateTime);
        FDQuery1.Params.Items[65].AsString :=
          FieldByName('ReferenciaHoraEmision').AsString;
        FDQuery1.Params.Items[66].AsString :=
          FieldByName('XMLSinFirma').AsString;
        FDQuery1.Params.Items[67].AsString :=
          FieldByName('XMLConFirma').AsString;
        FDQuery1.Params.Items[68].AsString :=
          FieldByName('Mensaje').AsString;
        FDQuery1.Params.Items[69].AsString :=
          FieldByName('CodigoActividad').AsString;
        FDQuery1.Params.Items[70].AsFloat :=
          FieldByName('TotalServExonerado').AsFloat;
        FDQuery1.Params.Items[71].AsFloat :=
          FieldByName('TotalMercExonerada').AsFloat;
        FDQuery1.Params.Items[72].AsFloat :=
          FieldByName('TotalExonerado').AsFloat;
        FDQuery1.Params.Items[73].AsFloat :=
          FieldByName('TotalIVADevuelto').AsFloat;
        FDQuery1.Params.Items[74].AsFloat :=
          FieldByName('TotalOtrosCargos').AsFloat;
        FDQuery1.Params.Items[75].AsString :=
          FieldByName('ReceptorOtrasSenasExtranjero').AsString;
        FDQuery1.Params.Items[76].AsString :=
          FieldByName('NumeroCuenta').AsString;
        FDQuery1.Params.Items[77].AsString :=
          FieldByName('DocReferencia').AsString;
        FDQuery1.Params.Items[78].AsString :=
          FieldByName('ReceptorCorreos').AsString;
        FDQuery1.Params.Items[79].AsInteger :=
          FieldByName('IdSituacion').AsInteger;
        FDQuery1.Params.Items[80].AsInteger :=
          FieldByName('IdPlantilla').AsInteger;
        if Trim(FieldByName('ExtensionAdjuntos').AsString) <> '' then
        begin
          try
            mArchivo := TMemoryStream.Create;
            (FieldByName('Adjuntos') as TBlobField).SaveToStream(mArchivo);
            mArchivo.Position := 0;
            FDQuery1.Params.Items[81].LoadFromStream(mArchivo, ftBlob);
          except

          end;
        end
        else
          FDQuery1.Params.Items[81].Value := 0;
        FDQuery1.Params.Items[82].AsString :=
          FieldByName('ExtensionAdjuntos').AsString;
        FDQuery1.Params.Items[83].AsString :=
          FieldByName('ReferenciaTipo').AsString;
        FDQuery1.Params.Items[84].AsInteger :=
          FieldByName('IdEmpresa').AsInteger;
        FDQuery1.Params.Items[85].AsString :=
          FieldByName('DetalleHacienda').AsString;
        FDQuery1.Params.Items[86].AsInteger :=
          FieldByName('CodigoEmail').AsInteger;
        FDQuery1.Params.Items[87].Value :=
          FieldByName('PDFHacienda').Value;
        FDQuery1.ExecSQL;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_VariosObtener_Ultimo'}
function TdmObjects.DB_VariosObtener_Ultimo(pCon: TFDConnection;
  pTabla: string; pCampo, pWhere: string;
  pIdEmpresa: Integer; var pResultado: Integer; var pError: string): Integer;
var
  mResultado: Integer;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with FDQuery1 do
    begin
      FDQuery1.Connection := pCon;
      SQL.Clear;
      SQL.Add('Select Max(' + pCampo + ')');
      SQL.Add('From ' + pTabla);
      if pWhere <> '' then
        SQL.Add('Where ' + pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_DocumentosDetalle_Insertar'}
procedure TdmObjects.DB_Hacienda_DocumentosDetalle_Insertar(
  pCon: TFDConnection; ds1: TFDMemTable;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.Connection := pCon;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('NumeroLinea,');
        FDQuery1.SQL.Add('Tipo,');
        FDQuery1.SQL.Add('Codigo,');
        FDQuery1.SQL.Add('Cantidad,');
        FDQuery1.SQL.Add('UnidadMedida,');
        FDQuery1.SQL.Add('UnidadMedidaComercial,');
        FDQuery1.SQL.Add('Detalle,');
        FDQuery1.SQL.Add('PrecioUnitario,');
        FDQuery1.SQL.Add('MontoTotal,');
        FDQuery1.SQL.Add('MontoDescuento,');
        FDQuery1.SQL.Add('NaturalezaDescuento,');
        FDQuery1.SQL.Add('SubTotal,');
        FDQuery1.SQL.Add('ImpuestoCodigo,');
        FDQuery1.SQL.Add('ImpuestoTarifa,');
        FDQuery1.SQL.Add('ImpuestoMonto,');
        FDQuery1.SQL.Add('TipoDocumento,');
        FDQuery1.SQL.Add('NumeroDocumento,');
        FDQuery1.SQL.Add('NombreInstitucion,');
        FDQuery1.SQL.Add('FechaEmision,');
        FDQuery1.SQL.Add('MontoImpuesto,');
        FDQuery1.SQL.Add('PorcentajeCompra,');
        FDQuery1.SQL.Add('MontoTotalLinea,');
        FDQuery1.SQL.Add('FechaEmisionD,');
        FDQuery1.SQL.Add('HoraEmision,');
        FDQuery1.SQL.Add('CodigoComercial,');
        FDQuery1.SQL.Add('BaseImponible,');
        FDQuery1.SQL.Add('ImpuestoNeto,');
        FDQuery1.SQL.Add('PartidaArancelaria,');
        FDQuery1.SQL.Add('CodigoComercialCodigo,');
        FDQuery1.SQL.Add('CodigoTarifa,');
        FDQuery1.SQL.Add('FactorIVA,');
        FDQuery1.SQL.Add('MontoExportacion,');
        FDQuery1.SQL.Add('PorcentajeExoneracion,');
        FDQuery1.SQL.Add('MontoExoneracion,');
        FDQuery1.SQL.Add('IdProducto');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6,');
        FDQuery1.SQL.Add(':Param7,');
        FDQuery1.SQL.Add(':Param8,');
        FDQuery1.SQL.Add(':Param9,');
        FDQuery1.SQL.Add(':Param10,');
        FDQuery1.SQL.Add(':Param11,');
        FDQuery1.SQL.Add(':Param12,');
        FDQuery1.SQL.Add(':Param13,');
        FDQuery1.SQL.Add(':Param14,');
        FDQuery1.SQL.Add(':Param15,');
        FDQuery1.SQL.Add(':Param16,');
        FDQuery1.SQL.Add(':Param17,');
        FDQuery1.SQL.Add(':Param18,');
        FDQuery1.SQL.Add(':Param19,');
        FDQuery1.SQL.Add(':Param20,');
        FDQuery1.SQL.Add(':Param21,');
        FDQuery1.SQL.Add(':Param22,');
        FDQuery1.SQL.Add(':Param23,');
        FDQuery1.SQL.Add(':Param24,');
        FDQuery1.SQL.Add(':Param25,');
        FDQuery1.SQL.Add(':Param26,');
        FDQuery1.SQL.Add(':Param27,');
        FDQuery1.SQL.Add(':Param28,');
        FDQuery1.SQL.Add(':Param29,');
        FDQuery1.SQL.Add(':Param30,');
        FDQuery1.SQL.Add(':Param31,');
        FDQuery1.SQL.Add(':Param32,');
        FDQuery1.SQL.Add(':Param33,');
        FDQuery1.SQL.Add(':Param34,');
        FDQuery1.SQL.Add(':Param35');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsInteger :=
          FieldByName('NumeroLinea').AsInteger;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('Tipo').AsString;
        FDQuery1.Params.Items[3].AsString :=
          FieldByName('Codigo').AsString;
        FDQuery1.Params.Items[4].AsFloat :=
          FieldByName('Cantidad').AsFloat;
        FDQuery1.Params.Items[5].AsString :=
          FieldByName('UnidadMedida').AsString;
        FDQuery1.Params.Items[6].AsString :=
          FieldByName('UnidadMedidaComercial').AsString;
        FDQuery1.Params.Items[7].AsString :=
          FieldByName('Detalle').AsString;
        FDQuery1.Params.Items[8].AsFloat :=
          FieldByName('PrecioUnitario').AsFloat;
        FDQuery1.Params.Items[9].AsFloat :=
          FieldByName('MontoTotal').AsFloat;
        FDQuery1.Params.Items[10].AsFloat :=
          FieldByName('MontoDescuento').AsFloat;
        FDQuery1.Params.Items[11].AsString :=
          FieldByName('NaturalezaDescuento').AsString;
        FDQuery1.Params.Items[12].AsFloat :=
          FieldByName('SubTotal').AsFloat;
        FDQuery1.Params.Items[13].AsString :=
          FieldByName('ImpuestoCodigo').AsString;
        FDQuery1.Params.Items[14].AsFloat :=
          FieldByName('ImpuestoTarifa').AsFloat;
        FDQuery1.Params.Items[15].AsFloat :=
          FieldByName('ImpuestoMonto').AsFloat;
        FDQuery1.Params.Items[16].AsString :=
          FieldByName('TipoDocumento').AsString;
        FDQuery1.Params.Items[17].AsString :=
          FieldByName('NumeroDocumento').AsString;
        FDQuery1.Params.Items[18].AsString :=
          FieldByName('NombreInstitucion').AsString;
        FDQuery1.Params.Items[19].AsString :=
          FieldByName('FechaEmision').AsString;
        FDQuery1.Params.Items[20].AsFloat :=
          FieldByName('MontoImpuesto').AsFloat;
        FDQuery1.Params.Items[21].AsInteger :=
          FieldByName('PorcentajeCompra').AsInteger;
        FDQuery1.Params.Items[22].AsFloat :=
          FieldByName('MontoTotalLinea').AsFloat;
        FDQuery1.Params.Items[23].AsString :=
          FormatDateTime('yyyy-MM-dd',
          FieldByName('FechaEmisionD').AsDateTime);
        FDQuery1.Params.Items[24].AsString :=
          FieldByName('HoraEmision').AsString;
        FDQuery1.Params.Items[25].AsString :=
          FieldByName('CodigoComercial').AsString;
        FDQuery1.Params.Items[26].AsFloat :=
          FieldByName('BaseImponible').AsFloat;
        FDQuery1.Params.Items[27].AsFloat :=
          FieldByName('ImpuestoNeto').AsFloat;
        FDQuery1.Params.Items[28].AsString :=
          FieldByName('PartidaArancelaria').AsString;
        FDQuery1.Params.Items[29].AsString :=
          FieldByName('CodigoComercialCodigo').AsString;
        FDQuery1.Params.Items[30].AsString :=
          FieldByName('CodigoTarifa').AsString;
        FDQuery1.Params.Items[31].AsFloat :=
          FieldByName('FactorIVA').AsFloat;
        FDQuery1.Params.Items[32].AsFloat :=
          FieldByName('MontoExportacion').AsFloat;
        FDQuery1.Params.Items[33].AsFloat :=
          FieldByName('PorcentajeExoneracion').AsFloat;
        FDQuery1.Params.Items[34].AsFloat :=
          FieldByName('MontoExoneracion').AsFloat;
        FDQuery1.Params.Items[35].AsInteger :=
          FieldByName('IdProducto').AsInteger;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda__DocumentosDescuentos_Insertar'}
procedure TdmObjects.DB_Hacienda__DocumentosDescuentos_Insertar(
  pCon: TFDConnection; ds1: TFDMemTable;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.Connection := pCon;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('MontoDescuento,');
        FDQuery1.SQL.Add('NaturalezaDescuento');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsFloat :=
          FieldByName('MontoDescuento').AsFloat;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('NaturalezaDescuento').AsString;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_DocumentosImpuestos_Insertar'}
procedure TdmObjects.DB_Hacienda_DocumentosImpuestos_Insertar(
  pCon: TFDConnection; ds1: TFDMemTable;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.Connection := pCon;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('NumeroLinea,');
        FDQuery1.SQL.Add('ImpuestoCodigo,');
        FDQuery1.SQL.Add('ImpuestoTarifa,');
        FDQuery1.SQL.Add('ImpuestoMonto,');
        FDQuery1.SQL.Add('CodigoTarifa,');
        FDQuery1.SQL.Add('FactorIVA,');
        FDQuery1.SQL.Add('PorcentajeExoneracion,');
        FDQuery1.SQL.Add('MontoExoneracion,');
        FDQuery1.SQL.Add('IdProducto,');
        FDQuery1.SQL.Add('IdImpuesto,');
        FDQuery1.SQL.Add('MontoExportacion,');
        FDQuery1.SQL.Add('Tipodocumento,');
        FDQuery1.SQL.Add('NumeroDocumento,');
        FDQuery1.SQL.Add('NombreInstitucion,');
        FDQuery1.SQL.Add('FechaEmision');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6,');
        FDQuery1.SQL.Add(':Param7,');
        FDQuery1.SQL.Add(':Param8,');
        FDQuery1.SQL.Add(':Param9,');
        FDQuery1.SQL.Add(':Param10,');
        FDQuery1.SQL.Add(':Param11,');
        FDQuery1.SQL.Add(':Param12,');
        FDQuery1.SQL.Add(':Param13,');
        FDQuery1.SQL.Add(':Param14,');
        FDQuery1.SQL.Add(':Param15');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsInteger :=
          FieldByName('NumeroLinea').AsInteger;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('ImpuestoCodigo').AsString;
        FDQuery1.Params.Items[3].AsFloat :=
          FieldByName('ImpuestoTarifa').AsFloat;
        FDQuery1.Params.Items[4].AsFloat :=
          FieldByName('ImpuestoMonto').AsFloat;
        FDQuery1.Params.Items[5].AsString :=
          FieldByName('CodigoTarifa').AsString;
        FDQuery1.Params.Items[6].AsFloat :=
          FieldByName('FactorIVA').AsFloat;
        FDQuery1.Params.Items[7].AsFloat :=
          FieldByName('PorcentajeExoneracion').AsFloat;
        FDQuery1.Params.Items[8].AsFloat :=
          FieldByName('MontoExoneracion').AsFloat;
        FDQuery1.Params.Items[9].AsInteger :=
          FieldByName('IdProducto').AsInteger;
        FDQuery1.Params.Items[10].AsInteger :=
          FieldByName('IdImpuesto').AsInteger;
        FDQuery1.Params.Items[11].AsFloat :=
          FieldByName('MontoExportacion').AsFloat;
        FDQuery1.Params.Items[12].AsString :=
          FieldByName('Tipodocumento').AsString;
        FDQuery1.Params.Items[13].AsString :=
          FieldByName('NumeroDocumento').AsString;
        FDQuery1.Params.Items[14].AsString :=
          FieldByName('NombreInstitucion').AsString;
        FDQuery1.Params.Items[15].AsString :=
          FieldByName('FechaEmision').AsString;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_DocumentosOtrosCargos_Insertar'}
procedure TdmObjects.DB_Hacienda_DocumentosOtrosCargos_Insertar(
  pCon: TFDConnection; ds1: TFDMemTable;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.Connection := pCon;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Insert Into ' + pTabla);
        FDQuery1.SQL.Add('(');
        FDQuery1.SQL.Add('IdEncabezado,');
        FDQuery1.SQL.Add('TipoDocumento,');
        FDQuery1.SQL.Add('NumeroIdentidadTercero,');
        FDQuery1.SQL.Add('NombreTercero,');
        FDQuery1.SQL.Add('Detalle,');
        FDQuery1.SQL.Add('Porcentaje,');
        FDQuery1.SQL.Add('MontoCargo');
        FDQuery1.SQL.Add(')');
        FDQuery1.SQL.Add('Values(');
        FDQuery1.SQL.Add(':Param0,');
        FDQuery1.SQL.Add(':Param1,');
        FDQuery1.SQL.Add(':Param2,');
        FDQuery1.SQL.Add(':Param3,');
        FDQuery1.SQL.Add(':Param4,');
        FDQuery1.SQL.Add(':Param5,');
        FDQuery1.SQL.Add(':Param6');
        FDQuery1.SQL.Add(')');
        FDQuery1.Params.Items[0].AsInteger :=
          FieldByName('IdEncabezado').AsInteger;
        FDQuery1.Params.Items[1].AsInteger :=
          FieldByName('TipoDocumento').AsInteger;
        FDQuery1.Params.Items[2].AsString :=
          FieldByName('NumeroIdentidadTercero').AsString;
        FDQuery1.Params.Items[3].AsString :=
          FieldByName('NombreTercero').AsString;
        FDQuery1.Params.Items[4].AsString :=
          FieldByName('Detalle').AsString;
        FDQuery1.Params.Items[5].AsFloat :=
          FieldByName('Porcentaje').AsFloat;
        FDQuery1.Params.Items[6].AsFloat :=
          FieldByName('MontoCargo').AsFloat;
        FDQuery1.ExecSQL;
        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_ActualizaXMLSinFirma'}
procedure TdmObjects.DB_Hacienda_ActualizaXMLSinFirma(
  pCon: TFDConnection; pXML: string; pWhere: string;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with FDQuery1 do
    begin
      Connection := pCon;
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set ');
      SQL.Add('XMLSinFirma = :Param0');
      Params.Items[0].AsString :=
        pXML;
      if pWhere <> '' then
        FDQuery1.SQL.Add('Where ' + pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_ConsecutivosDocumentos_GetConsecutivo'}
function TdmObjects.DB_Hacienda_ConsecutivosDocumentos_GetConsecutivo(
  pCon: TFDConnection; pWhere: string; pIdEmpresa: Integer;
  var pResultado: Integer; var pError: string): Integer;
var
  mResultado: Integer;
begin
  try
    pResultado := 1;

    mResultado := 0;
    with FDQuery1 do
    begin
      Connection := pCon;
      SQL.Clear;
      SQL.Add('Select Consecutivo ');
      SQL.Add('From tb_consecutivosdocumentos');
      if pWhere <> '' then
        SQL.Add('Where ' + pWhere);
      Open();
      if IsEmpty = False then
      begin
        if Fields[0].IsNull = False then
          mResultado := Fields[0].AsInteger;
      end;
      Close;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;

  Result := mResultado;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_ActualizaXMLConFirma'}
procedure TdmObjects.DB_Hacienda_ActualizaXMLConFirma(
  pCon: TFDConnection; pXML: string; pWhere: string;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with FDQuery1 do
    begin
      Connection := pCon;
      SQL.Clear;
      SQL.Add('Update ' + pTabla);
      SQL.Add('Set ');
      SQL.Add('XMLConFirma = :Param0');
      Params.Items[0].AsString :=
        pXML;
      if pWhere <> '' then
        FDQuery1.SQL.Add('Where ' + pWhere);
      ExecSQL;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_ActualizaPDF'}
procedure TdmObjects.DB_Hacienda_ActualizaPDF(
  pCon: TFDConnection; ds1: TFDMemTable; pWhere: string;
  pIdEmpresa: Integer; pTabla: string;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        FDQuery1.Connection := pCon;
        FDQuery1.SQL.Clear;
        FDQuery1.SQL.Add('Update ' + pTabla);
        FDQuery1.SQL.Add('Set ');
        FDQuery1.SQL.Add('PDFHacienda = :Param0');
        FDQuery1.Params.Items[0].Value :=
          FieldByName('PDFHacienda').Value;
        if pWhere <> '' then
          FDQuery1.SQL.Add('Where ' + pWhere);
        FDQuery1.ExecSQL;

        Next;
      end;
    end;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_ConsecutivosDocumentos_ActualizarConsecutivo'}
procedure TdmObjects.DB_Hacienda_ConsecutivosDocumentos_ActualizarConsecutivo(pConsecutivo: Integer;
  pCon: TFDConnection; pWhere: string; pIdEmpresa: Integer;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    FDQuery1.Connection := pCon;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('Update tb_consecutivosdocumentos');
    FDQuery1.SQL.Add('Set');
    FDQuery1.SQL.Add('Consecutivo = :Param0');
    FDQuery1.Params.Items[0].AsInteger :=
      pConsecutivo;
    if pWhere <> '' then
      FDQuery1.SQL.Add('Where ' + pWhere);
    FDQuery1.ExecSQL;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_ActualizarCloud'}
procedure TdmObjects.DB_Hacienda_ActualizarCloud(pValor: Integer;
  pCon: TFDConnection; pWhere: string; pTabla: string;
  pIdEmpresa: Integer;
  var pResultado: Integer; var pError: string);
begin
  try
    pResultado := 1;

    FDQuery1.Connection := pCon;
    FDQuery1.SQL.Clear;
    FDQuery1.SQL.Add('Update ' + pTabla);
    FDQuery1.SQL.Add('Set');
    FDQuery1.SQL.Add('CODIGOCLOUD = :Param0');
    FDQuery1.Params.Items[0].AsInteger :=
      pValor;
    if pWhere <> '' then
      FDQuery1.SQL.Add('Where ' + pWhere);
    FDQuery1.ExecSQL;

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

{$REGION 'DB_Hacienda_Insertar'}
procedure TdmObjects.DB_Hacienda_Insertar(
  pCon: TFDConnection;
  pCondicionVenta: string; pPlazoCredito: string; pMedioPago: string;
  ds1: TFDMemTable; qry1: TFDQuery;
  pSucursal: Integer; pTerminal, pNumero: Integer;
  dsCliente: TFDMemTable; dsDetalle: TFDMemTable;
  pPathTemp: string; pPathAplicacion: string;
  pTipoDocNombre: string; pIdEmpresa: Integer;
  var pResultado: Integer; var pError: string);
var
  mtb_empresasHacienda: TDL_tb_empresas2;
  mtb_docunentosencabezado: TDL_tb_docunentosencabezado;
  mtb_docunentosdetalle: TDL_tb_docunentosdetalle;
  mtb_documentosdescuentos: TDL_tb_documentosdescuentos;
  mtb_docunentosimpuestos: TDL_tb_docunentosimpuestos;
  mtb_documentosotroscargos: TDL_tb_documentosotroscargos;
  mFecha: TDateTime;
  mConsecutivo, mClave, mFechaEmision, mXMLSinFirma, mRespuestaHacienda: string;
  mIdSituacion, Aux01, mIdHacienda, mNumeroLinea: Integer;
  mServiciosGravados, mServiciosExentos, mMercanciasGravados: Double;
  mMercanciasExentos, mTotalGravado, mTotalExcento: Double;
  mTotalVenta, mTotalVentaNeta, mTotalDescuentos: Double;
  mTotalImpuesto, mTotalComprobante: Double;
  mConsecutivoDoc, mIdPlantilla: Integer;
  mDocumento: TMemoryStream;
  mLista1: TStringList;
begin
  try
    pResultado := 1;

    dmObjects.DB_Hacienda_TotalesDocumentos(
      dmConnection.FDMainConnection, ds1, dmObjects.FDQuery1,
      mServiciosExentos, mServiciosGravados, mMercanciasExentos, mMercanciasGravados,
      mTotalGravado, mTotalExcento, mTotalVenta, mTotalVentaNeta,
      mTotalDescuentos, mTotalImpuesto, mTotalComprobante,
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mtb_empresasHacienda := TDL_tb_empresas2.Create;
    dmObjects.DB_HaciendaEmpresas_Consultar(dmConnection.FDHaciendaConnection,
      mtb_empresasHacienda.Dataset, 'A.Id = ' + IntToStr(pIdEmpresa), pIdEmpresa,
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mConsecutivoDoc :=
      dmObjects.DB_Hacienda_ConsecutivosDocumentos_GetConsecutivo(
        dmConnection.FDHaciendaConnection,
        'IdEmpresa =  ' + IntToStr(pIdEmpresa) + ' And ' +
        'Sucursal = ' + IntToStr(pSucursal) + ' And ' +
        'Terminal = ' + IntToStr(pTerminal) + ' And ' +
        'TipoDoc = 1', 1,
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');
    mConsecutivoDoc := mConsecutivoDoc + 1;
    if mConsecutivoDoc > 99999999999 then
      mConsecutivoDoc := 1;

    dmObjects.DB_Hacienda_ConsecutivosDocumentos_ActualizarConsecutivo(
      mConsecutivoDoc, dmConnection.FDHaciendaConnection,
      'IdEmpresa =  ' + IntToStr(pIdEmpresa) + ' And ' +
      'Sucursal = ' + IntToStr(pSucursal) + ' And ' +
      'Terminal = ' + IntToStr(pTerminal) + ' And ' +
      'TipoDoc = 1', 1,
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mFecha := Date;
    mConsecutivo := Hacienda_GetConsecutivo(IntToStr(pSucursal), IntToStr(pTerminal), '01', mConsecutivoDoc);
    mClave := Hacienda_GetClave(mFecha, mConsecutivo, '1', mtb_empresasHacienda.Dataset.FieldByName('Identificacion').AsString, '99999999');
    mFechaEmision :=
      FormatDateTime('yyyy-MM-dd', Now) + 'T' +
      FormatDateTime('HH:mm:ss', Now);

    if Hacienda_TieneInternet = True then
      mIdSituacion := 1
    else
      mIdSituacion := 2;

    mtb_docunentosencabezado := TDL_tb_docunentosencabezado.Create;
    with mtb_docunentosencabezado.Dataset do
    begin
      mIdPlantilla :=
        mtb_empresasHacienda.Dataset.FieldByName('IdPlantilla').AsInteger;
      Append;
      FieldByName('TipoDoc').AsInteger := 1;
      FieldByName('Clave').AsString := mClave;
      FieldByName('NumeroConsecutivo').AsString := mConsecutivo;
      FieldByName('FechaEmision').AsString := mFechaEmision;
      FieldByName('EmisorTipo').AsString := '';
        mtb_empresasHacienda.Dataset.FieldByName('tiposidentificacion').AsString;
      FieldByName('EmisorNumero').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('Identificacion').AsString;
      FieldByName('EmisorNombre').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('Nombre').AsString;
      //FieldByName('EmisorNombreComercial').AsString :=
      FieldByName('EmisorProvincia').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('provincia').AsString;
      FieldByName('EmisorCanton').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('canton').AsString;
      FieldByName('EmisorDistrito').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('distrito').AsString;
      FieldByName('EmisorBarrio').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('barrio').AsString;
      FieldByName('EmisorOtrasSenas').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('Direccion').AsString;
      FieldByName('EmisorCodigoPaisTel').AsInteger := 506;
      try
        Aux01 := StrToInt(mtb_empresasHacienda.Dataset.FieldByName('Telefono').AsString);
      except
        Aux01 := 0;
      end;
      FieldByName('EmisorNumTelefonoTel').AsInteger :=
        Aux01;
      FieldByName('EmisorCodigoPaisFax').AsInteger := 506;
      try
        Aux01 := StrToInt(mtb_empresasHacienda.Dataset.FieldByName('Fax').AsString);
      except
        Aux01 := 0;
      end;
      FieldByName('EmisorNumTelefonoFax').AsInteger :=
        Aux01;
      FieldByName('EmisorCorreoElectronico').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('Email').AsString;
      FieldByName('ReceptorNombre').AsString :=
        dsCliente.FieldByName('NOMBRECOMPLETO').AsString;
  //    FieldByName('ReceptorTipo').AsString :=
      FieldByName('ReceptorNumero').AsString :=
        dsCliente.FieldByName('CEDULA').AsString;
  //    FieldByName('ReceptorExtranjero').AsString :=
  //    FieldByName('ReceptorNombreComercial').AsString :=
  //    FieldByName('ReceptorProvincia').AsString :=
  //    FieldByName('ReceptorCanton').AsString :=
  //    FieldByName('ReceptorDistrito').AsString :=
  //    FieldByName('ReceptorBarrio').AsString :=
      FieldByName('ReceptorOtrasSenas').AsString :=
        dsCliente.FieldByName('DIRECCION').AsString;
      FieldByName('ReceptorCodigoPaisTel').AsInteger := 506;
      try
        Aux01 := StrToInt(dsCliente.FieldByName('TELEFONO1').AsString);
      except
        Aux01 := 0;
      end;
      FieldByName('ReceptorNumTelefonoTel').AsInteger := Aux01;
      FieldByName('ReceptorCodigoPaisFax').AsInteger := 506;
  //    FieldByName('ReceptorNumTelefonoFax').AsInteger :=
      FieldByName('ReceptorCorreoElectronico').AsString :=
        dsCliente.FieldByName('EMAIL').AsString;
      FieldByName('CondicionVenta').AsString := pCondicionVenta;
      FieldByName('PlazoCredito').AsString := pPlazoCredito;
      FieldByName('MedioPago').AsString := pMedioPago;
      FieldByName('CodigoMoneda').AsString := 'CRC';
      FieldByName('TipoCambio').AsFloat := 1;
      FieldByName('TotalServGravados').AsFloat :=
        mServiciosGravados;
      FieldByName('TotalServExentos').AsFloat :=
        mServiciosExentos;
      FieldByName('TotalMercanciasGravadas').AsFloat :=
        mMercanciasGravados;
      FieldByName('TotalMercanciasExentas').AsFloat :=
        mMercanciasExentos;
      FieldByName('TotalGravado').AsFloat :=
        mTotalGravado;
      FieldByName('TotalExento').AsFloat :=
        mTotalExcento;
      FieldByName('TotalVenta').AsFloat :=
        mTotalVenta;
      FieldByName('TotalDescuentos').AsFloat :=
        mTotalDescuentos;
      FieldByName('TotalVentaNeta').AsFloat :=
        mTotalVentaNeta;
      FieldByName('TotalImpuesto').AsFloat :=
        mTotalImpuesto;
      FieldByName('TotalComprobante').AsFloat :=
        mTotalComprobante;
      if mIdSituacion > 1 then
      begin
        FieldByName('ReferenciaNumero').AsString := mClave;
        FieldByName('ReferenciaFechaEmision').AsString :=
          FormatDateTime('dd/MM/yyyy', Date);
        FieldByName('ReferenciaCodigo').AsString := '99';
        FieldByName('ReferenciaRazon').AsString := mClave;
        FieldByName('ReferenciaTipo').AsString := '01';
      end;
      FieldByName('NumeroResolucion').AsString := '';
      FieldByName('FechaResolucion').AsString :=
        FormatDateTime('yyyy-MM-dd', Date);
      FieldByName('OtroTexto').AsString := '';
      FieldByName('OtroContenido').AsString := '';
      FieldByName('Signature').AsString := '';
      FieldByName('IdSucursal').AsInteger :=
        pSucursal;
      FieldByName('IdTerminal').AsInteger :=
        pTerminal;
      FieldByName('Numero').AsInteger := pNumero;
      FieldByName('IdEstadoHacienda').AsInteger := 0;
      FieldByName('FechaEmisionD').AsString :=
        FormatDateTime('dd/MM/yyyy', mFecha);
      FieldByName('HoraEmision').AsString :=
        FormatDateTime('HH:mm:ss', Time);
      FieldByName('ReferenciaFechaEmisionD').AsString :=
        FormatDateTime('dd/MM/yyyy', Date);
      FieldByName('ReferenciaHoraEmision').AsString :=
        FormatDateTime('HH:mm:ss', Time);
      FieldByName('XMLSinFirma').AsString := '';
      FieldByName('XMLConFirma').AsString := '';
      FieldByName('Mensaje').AsString := 'Sin Enviar';
      FieldByName('CodigoActividad').AsString := '01';
//      FieldByName('TotalServExonerado').AsFloat :=
//      FieldByName('TotalMercExonerada').AsFloat :=
//      FieldByName('TotalExonerado').AsFloat :=
//      FieldByName('TotalIVADevuelto').AsFloat :=
//      FieldByName('TotalOtrosCargos').AsFloat :=
//      FieldByName('ReceptorOtrasSenasExtranjero').AsString :=
      FieldByName('NumeroCuenta').AsString :=
        mtb_empresasHacienda.Dataset.FieldByName('Cuenta').AsString;
      FieldByName('DocReferencia').AsString :=
        IntToStr(pNumero);
      FieldByName('ReceptorCorreos').AsString :=
        dsCliente.FieldByName('EMAIL').AsString;
      FieldByName('IdSituacion').AsInteger := mIdSituacion;
      FieldByName('ExtensionAdjuntos').AsString := '';
      FieldByName('IdEmpresa').AsInteger := pIdEmpresa;
      FieldByName('DetalleHacienda').AsString := '';
      FieldByName('CodigoEmail').AsInteger := 0;
      FieldByName('PDFHacienda').Value := 0;
      Post;
    end;
    dmObjects.DB_Hacienda_DocumentosEncabezado_Insertar(dmConnection.FDHaciendaConnection,
      mtb_docunentosencabezado.Dataset, pIdEmpresa, 'tb_dcumentosencabezado',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mtb_empresasHacienda.Destroy;
    dsCliente.Destroy;

    mIdHacienda :=
      dmObjects.DB_VariosObtener_Ultimo(dmConnection.FDHaciendaConnection,
        'tb_dcumentosencabezado', 'Id', '', pIdEmpresa,
        pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mtb_docunentosdetalle := TDL_tb_docunentosdetalle.Create;
    with dsDetalle do
    begin
      First;
      mNumeroLinea := 1;
      while not Eof do
      begin
        mtb_docunentosdetalle.Dataset.Append;
        mtb_docunentosdetalle.Dataset.FieldByName('IdEncabezado').AsInteger :=
          mIdHacienda;
        mtb_docunentosdetalle.Dataset.FieldByName('NumeroLinea').AsInteger :=
          mNumeroLinea;
        mtb_docunentosdetalle.Dataset.FieldByName('Tipo').AsString := '01';
        mtb_docunentosdetalle.Dataset.FieldByName('Codigo').AsString := '';
        mtb_docunentosdetalle.Dataset.FieldByName('Cantidad').AsFloat :=
          FieldByName('CANTIDAD').AsFloat;
        mtb_docunentosdetalle.Dataset.FieldByName('UnidadMedida').AsString := 'Unid';
        mtb_docunentosdetalle.Dataset.FieldByName('Detalle').AsString :=
          FieldByName('NOMBRE').AsString;
        mtb_docunentosdetalle.Dataset.FieldByName('PrecioUnitario').AsFloat :=
          FieldByName('PRECIOUNITARIO').AsFloat;
        mtb_docunentosdetalle.Dataset.FieldByName('MontoTotal').AsFloat :=
          FieldByName('CANTIDAD').AsFloat * FieldByName('PRECIOUNITARIO').AsFloat;
        mtb_docunentosdetalle.Dataset.FieldByName('SubTotal').AsFloat :=
          FieldByName('CANTIDAD').AsFloat * FieldByName('PRECIOUNITARIO').AsFloat;
        mtb_docunentosdetalle.Dataset.FieldByName('PorcentajeCompra').AsFloat := 0;
        mtb_docunentosdetalle.Dataset.FieldByName('MontoTotalLinea').AsFloat :=
          FieldByName('CANTIDAD').AsFloat * FieldByName('PRECIOUNITARIO').AsFloat;
        mtb_docunentosdetalle.Dataset.FieldByName('ImpuestoNeto').AsFloat := 0;
        mtb_docunentosdetalle.Dataset.FieldByName('IdProducto').AsInteger :=
          FieldByName('IDPRODUCTO').AsInteger;
        mtb_docunentosdetalle.Dataset.Post;
        Inc(mNumeroLinea);
        Next;
      end;
    end;
    dmObjects.DB_Hacienda_DocumentosDetalle_Insertar(dmConnection.FDHaciendaConnection,
      mtb_docunentosdetalle.Dataset, pIdEmpresa, 'tb_dcumentosdetalle',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mtb_documentosdescuentos := TDL_tb_documentosdescuentos.Create;
    with dsDetalle do
    begin
      First;
      mNumeroLinea := 1;
      while not Eof do
      begin
        if FieldByName('DESCUENTOM').AsFloat > 0 then
        begin
          mtb_documentosdescuentos.Dataset.Append;
          mtb_documentosdescuentos.Dataset.FieldByName('IdEncabezado').AsInteger :=
            mIdHacienda;
          mtb_documentosdescuentos.Dataset.FieldByName('MontoDescuento').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          mtb_documentosdescuentos.Dataset.FieldByName('NaturalezaDescuento').AsString :=
            'Descuento';
          mtb_documentosdescuentos.Dataset.Post;
        end;
        Inc(mNumeroLinea);
        Next;
      end;
    end;
    dmObjects.DB_Hacienda__DocumentosDescuentos_Insertar(dmConnection.FDHaciendaConnection,
      mtb_documentosdescuentos.Dataset, pIdEmpresa, 'tb_dcumentosdescuentos',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mtb_docunentosimpuestos := TDL_tb_docunentosimpuestos.Create;
    with dsDetalle do
    begin
      First;
      mNumeroLinea := 1;
      while not Eof do
      begin
        mtb_docunentosimpuestos.Dataset.Append;
        mtb_docunentosimpuestos.Dataset.FieldByName('IdEncabezado').AsInteger :=
          mIdHacienda;
        mtb_docunentosimpuestos.Dataset.FieldByName('NumeroLinea').AsInteger :=
          mNumeroLinea;
        mtb_docunentosimpuestos.Dataset.FieldByName('ImpuestoCodigo').AsString := '01';
        mtb_docunentosimpuestos.Dataset.FieldByName('ImpuestoTarifa').AsFloat := 0;
        mtb_docunentosimpuestos.Dataset.FieldByName('ImpuestoMonto').AsFloat :=
          FieldByName('IVAM').AsFloat;
        mtb_docunentosimpuestos.Dataset.FieldByName('CodigoTarifa').AsString := '';
        mtb_docunentosimpuestos.Dataset.FieldByName('FactorIVA').AsFloat := 0;
        mtb_docunentosimpuestos.Dataset.FieldByName('PorcentajeExoneracion').AsFloat := 0;
        mtb_docunentosimpuestos.Dataset.FieldByName('MontoExoneracion').AsFloat := 0;
        mtb_docunentosimpuestos.Dataset.FieldByName('IdProducto').AsInteger := 0;
        mtb_docunentosimpuestos.Dataset.FieldByName('IdImpuesto').AsInteger := 0;
        mtb_docunentosimpuestos.Dataset.FieldByName('MontoExportacion').AsFloat := 0;
        mtb_docunentosimpuestos.Dataset.FieldByName('Tipodocumento').AsString := '';
        mtb_docunentosimpuestos.Dataset.FieldByName('NumeroDocumento').AsString := '';
        mtb_docunentosimpuestos.Dataset.FieldByName('NombreInstitucion').AsString := '';
        mtb_docunentosimpuestos.Dataset.FieldByName('FechaEmision').AsString :=
          FormatDateTime('yyyy/MM/dd', Date);
        mtb_docunentosimpuestos.Dataset.Post;
        Inc(mNumeroLinea);
        Next;
      end;
    end;
    dmObjects.DB_Hacienda_DocumentosImpuestos_Insertar(dmConnection.FDHaciendaConnection,
      mtb_docunentosimpuestos.Dataset, pIdEmpresa, 'tb_dcumentosimpuestos',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mtb_documentosotroscargos := TDL_tb_documentosotroscargos.Create;
    with dsDetalle do
    begin
      First;
      mNumeroLinea := 1;
      while not Eof do
      begin
        if FieldByName('ISM').AsFloat > 0 then
        begin
          mtb_documentosotroscargos.Dataset.Append;
          mtb_documentosotroscargos.Dataset.FieldByName('IdEncabezado').AsInteger :=
            mIdHacienda;
          mtb_documentosotroscargos.Dataset.FieldByName('TipoDocumento').AsInteger := 6;
          mtb_documentosotroscargos.Dataset.FieldByName('NumeroIdentidadTercero').AsString := '';
          mtb_documentosotroscargos.Dataset.FieldByName('NombreTercero').AsString := '';
          mtb_documentosotroscargos.Dataset.FieldByName('Detalle').AsString := 'Impuesto Servicio';
          mtb_documentosotroscargos.Dataset.FieldByName('Porcentaje').AsFloat := 10;
          mtb_documentosotroscargos.Dataset.FieldByName('MontoCargo').AsFloat :=
            FieldByName('ISM').AsFloat;
          mtb_documentosotroscargos.Dataset.Post;
        end;
        Inc(mNumeroLinea);
        Next;
      end;
    end;
    dmObjects.DB_Hacienda_DocumentosOtrosCargos_Insertar(dmConnection.FDHaciendaConnection,
      mtb_documentosotroscargos.Dataset, pIdEmpresa, 'tb_dcumentosotroscargos',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    mXMLSinFirma :=
      Get_XML(mtb_docunentosencabezado.Dataset, mtb_docunentosdetalle.Dataset,
        mtb_documentosdescuentos.Dataset, mtb_docunentosimpuestos.Dataset,
        mtb_documentosotroscargos.Dataset, pPathTemp, 'FE' + mClave);

    dmObjects.DB_Hacienda_ActualizaXMLSinFirma(dmConnection.FDHaciendaConnection,
      mXMLSinFirma, 'Id = ' + IntToStr(mIdHacienda), pIdEmpresa, 'tb_dcumentosencabezado',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    Hacienda_Firmar(pPathAplicacion + '\Config_HaciendaLib.xml',
      pPathTemp + '\' + pTipoDocNombre + mClave + '.xml',
      pTipoDocNombre + mClave,
      pPathAplicacion + '\Hacienda.exe',
      pResultado, pError);

    dmObjects.DB_Hacienda_ActualizaXMLConFirma(dmConnection.FDHaciendaConnection,
      mXMLSinFirma, 'Id = ' + IntToStr(mIdHacienda), pIdEmpresa, 'tb_dcumentosencabezado',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

      {
    Hacienda_Enviar(pPathAplicacion + '\Config_HaciendaLib.xml',
      mClave, pPathTemp + '\FE' + mClave + '_Firmado.xml',
      pPathAplicacion + '\Hacienda.exe', mRespuestaHacienda,
      pResultado, pError);
       }
    mtb_docunentosencabezado.Destroy;
    mtb_docunentosdetalle.Destroy;
    mtb_documentosdescuentos.Destroy;
    mtb_docunentosimpuestos.Destroy;
    mtb_documentosotroscargos.Destroy;

    mLista1 := TStringList.Create;
    dmObjects.FDQuery1.SQL.Clear;
    dmObjects.FDQuery1.SQL.Add('Select Plantilla From tb_plantillas Where Id=' + IntToStr(mIdPlantilla));
    dmObjects.FDQuery1.Open();
    if dmObjects.FDQuery1.RecordCount > 0 then
    begin
      mLista1.Text :=
        dmObjects.FDQuery1.Fields[0].AsString;
      mLista1.SaveToFile('Plantilla.fr3');
    end;
    dmObjects.FDQuery1.Close;
    mLista1.Free;

    dmObjects.FDQuery1.SQL.Clear;
    dmObjects.FDQuery2.SQL.Clear;
    dmObjects.FDQuery3.SQL.Clear;
    dmObjects.FDQuery4.SQL.Clear;
    dmObjects.FDQuery5.SQL.Clear;
    dmObjects.FDQuery6.SQL.Clear;

    dmObjects.FDQuery1.SQL.Text :=
      'SELECT * FROM tb_empresas WHERE Id = ' + IntToStr(pIdEmpresa);
    dmObjects.FDQuery2.SQL.Text :=
 'SELECT ' +
  'A.Id,' +
  'A.TipoDoc,' +
  'A.Clave,' +
  'A.NumeroConsecutivo,' +
  'A.FechaEmision,' +
  'A.EmisorTipo,' +
  'A.EmisorNumero, ' +
  'A.EmisorNombre,' +
  'A.EmisorNombreComercial,' +
  'A.EmisorProvincia,' +
  'A.EmisorCanton,' +
  'A.EmisorDistrito, ' +
  'A.EmisorBarrio,' +
  'A.EmisorOtrasSenas,' +
  'A.EmisorCodigoPaisTel,' +
  'A.EmisorNumTelefonoTel,' +
  'A.EmisorCodigoPaisFax,' +
  'A.EmisorNumTelefonoFax,' +
  'A.EmisorCorreoElectronico,' +
  'A.ReceptorNombre,' +
  'A.ReceptorTipo, ' +
  'A.ReceptorNumero,' +
  'A.ReceptorExtranjero,' +
  'A.ReceptorNombreComercial,' +
  'A.ReceptorProvincia,' +
  'A.ReceptorCanton,' +
  'A.ReceptorDistrito,' +
  'A.ReceptorBarrio,' +
  'A.ReceptorOtrasSenas,' +
  'A.ReceptorCodigoPaisTel,' +
  'A.ReceptorNumTelefonoTel, ' +
  'A.ReceptorCodigoPaisFax,' +
  'A.ReceptorNumTelefonoFax,' +
  'A.ReceptorCorreoElectronico, ' +
  'A.CondicionVenta,' +
  'A.PlazoCredito,' +
  'A.MedioPago,' +
  'A.CodigoMoneda,' +
  'A.TipoCambio,' +
  'A.TotalServGravados,' +
  'A.TotalServExentos,' +
  'A.TotalMercanciasGravadas,' +
  'A.TotalMercanciasExentas, ' +
  'A.TotalGravado,' +
  'A.TotalExento,' +
  'A.TotalVenta,' +
  'A.TotalDescuentos,' +
  'A.TotalVentaNeta,' +
  'A.TotalImpuesto,' +
  'A.TotalComprobante,' +
  'A.ReferenciaNumero,' +
  'A.ReferenciaFechaEmision,' +
  'A.ReferenciaCodigo,' +
  'A.ReferenciaRazon,' +
  'A.NumeroResolucion,' +
  'A.FechaResolucion,' +
  'A.OtroTexto,' +
  'A.OtroContenido,' +
  'A.Signature,' +
  'A.IdSucursal,' +
  'A.IdTerminal,' +
  'A.Numero,' +
  'A.IdEstadoHacienda,' +
  'A.FechaEmisionD,' +
  'A.HoraEmision,' +
  'A.ReferenciaFechaEmisionD,' +
  'A.ReferenciaHoraEmision,' +
  'A.XMLSinFirma,' +
  'A.XMLConFirma,' +
  'A.Mensaje,' +
  'A.CodigoActividad,' +
  'A.TotalServExonerado,' +
  'A.TotalMercExonerada, ' +
  'A.TotalExonerado,' +
  'A.TotalIVADevuelto, ' +
  'A.TotalOtrosCargos,' +
  'A.ReceptorOtrasSenasExtranjero,' +
  'A.NumeroCuenta,' +
  'A.DocReferencia,' +
  'A.ReceptorCorreos,' +
  'A.IdSituacion,' +
  'A.IdPlantilla,' +
  'A.Adjuntos,' +
  'A.ExtensionAdjuntos,' +
  'A.ReferenciaTipo,' +
  'A.IdEmpresa,' +
  'B.Nombre AS MedioPagoNombre,' +
  'C.Nombre AS CondicionVentaNombre,' +
  'D.Nombre AS CodigoMonedaNombre,' +
  'D.ABREVIATURA AS CodigoMonedaAbreviatura ' +
  'FROM tb_dcumentosencabezado A ' +
  'LEFT JOIN tb_metodospago B ON A.MedioPago = B.Codigo ' +
  'LEFT JOIN tb_condicionespago C ON A.CondicionVenta = C.Codigo ' +
  'LEFT JOIN tb_monedas D ON A.CodigoMoneda = D.ABREVIATURA ' +
  'WHERE A.Id = ' + IntToStr(mIdHacienda);
    dmObjects.FDQuery3.SQL.Text :=
      'SELECT * FROM tb_dcumentosdetalle WHERE IdEncabezado = ' + IntToStr(mIdHacienda);
    dmObjects.FDQuery4.SQL.Text :=
      'SELECT * FROM tb_dcumentosimpuestos WHERE IdEncabezado = ' + IntToStr(mIdHacienda);
    dmObjects.FDQuery5.SQL.Text :=
      'SELECT * FROM tb_dcumentosotroscargos WHERE IdEncabezado = ' + IntToStr(mIdHacienda);
    dmObjects.FDQuery6.SQL.Text :=
      'SELECT * FROM tb_dcumentosdescuentos WHERE IdEncabezado = ' + IntToStr(mIdHacienda);

    dmObjects.FDQuery1.Connection :=
      dmConnection.FDHaciendaConnection;
    dmObjects.FDQuery2.Connection :=
      dmConnection.FDHaciendaConnection;
    dmObjects.FDQuery3.Connection :=
      dmConnection.FDHaciendaConnection;
    dmObjects.FDQuery4.Connection :=
      dmConnection.FDHaciendaConnection;
    dmObjects.FDQuery5.Connection :=
      dmConnection.FDHaciendaConnection;
    dmObjects.FDQuery6.Connection :=
      dmConnection.FDHaciendaConnection;

    dmReports.frxDBDataset1.DataSet :=
      dmObjects.FDQuery1;
    dmReports.frxDBDataset2.DataSet :=
      dmObjects.FDQuery2;
    dmReports.frxDBDataset3.DataSet :=
      dmObjects.FDQuery3;
    dmReports.frxDBDataset4.DataSet :=
      dmObjects.FDQuery4;
    dmReports.frxDBDataset5.DataSet :=
      dmObjects.FDQuery5;
    dmReports.frxDBDataset6.DataSet :=
      dmObjects.FDQuery6;

    dmReports.frxDBDataset1.Enabled := True;
    dmReports.frxDBDataset2.Enabled := True;
    dmReports.frxDBDataset3.Enabled := True;
    dmReports.frxDBDataset4.Enabled := True;
    dmReports.frxDBDataset5.Enabled := True;
    dmReports.frxDBDataset6.Enabled := True;
    dmReports.frxReport1.LoadFromFile('Plantilla.fr3');
    dmReports.frxReport1.PrepareReport();
    dmReports.frxPDFExport1.FileName := '1.pdf';
    dmReports.frxPDFExport1.ShowProgress := False;
    dmReports.frxPDFExport1.ShowDialog := False;
    dmReports.frxReport1.Export(dmReports.frxPDFExport1);
   // Sleep(3000);
  //  dmReports.frxReport1.ShowReport();
    dmReports.frxDBDataset1.Enabled := False;
    dmReports.frxDBDataset2.Enabled := False;
    dmReports.frxDBDataset3.Enabled := False;
    dmReports.frxDBDataset4.Enabled := False;
    dmReports.frxDBDataset5.Enabled := False;
    dmReports.frxDBDataset6.Enabled := False;

    mtb_docunentosencabezado := TDL_tb_docunentosencabezado.Create;
    with mtb_docunentosencabezado.Dataset do
    begin
      Append();
      mDocumento := TMemoryStream.Create;
      mDocumento.LoadFromFile('1.pdf');
      TBlobField(FieldByName('PDFHacienda')).LoadFromStream(mDocumento);
      Post;
    end;
    dmObjects.DB_Hacienda_ActualizaPDF(dmConnection.FDHaciendaConnection,
      mtb_docunentosencabezado.Dataset,'Id = ' + IntToStr(mIdHacienda), pIdEmpresa, 'tb_dcumentosencabezado',
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    dmObjects.DB_Hacienda_ActualizarCloud(1,
      dmConnection.FDMainConnection, 'Numero = ' + IntToStr(pNumero),
      'TB_FACTURASCLIENTESENCABEZADO', pIdEmpresa,
      pResultado, pError);
    if pResultado = -1 then
      raise Exception.Create('');

    pResultado := 1;
  except
    on E: Exception do
    begin
      pResultado := -1;
      pError := E.Message;
    end;
  end;
end;
{$ENDREGION}

end.
