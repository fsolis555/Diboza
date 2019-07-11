unit FrmPlantillas01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs,
  Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls,
  Winapi.ShellAPI, Data.DB;

type
  TFormPlantillas01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label1: TLabel;
    edtNombre: TEdit;
    btnPlantilla: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPlantillaClick(Sender: TObject);
  private
    FId: Integer;
  public
    property _Id: Integer read FId write FId;
  end;

var
  FormPlantillas01: TFormPlantillas01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure DBToForma(ds1: TDatasetMem);
  procedure Consultar_Data(pId: Integer);
  procedure CamposValidos;
  procedure Modificar_Data(pId: Integer);
  procedure Plantilla;
  procedure CrearEstructuras;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_PLANTILLAS, BS_DBConexion, DL_DBGeneral,
  uReportBuild, FireDAC.Comp.Client, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_PLANTILLAS;

var
  Forma01: TFormPlantillas01;
  mBS_Hacienda: TFDMemTable;
  mBS_empresas: TFDMemTable;
  mBS_facturasclientesencabezado: TFDMemTable;
  mBS_facturasclientesdetalle: TFDMemTable;
  mProformasEncabezado: TFDMemTable;
  mDetalle: TFDMemTable;
  mApartadosEncabezado: TFDMemTable;
  mRecibosEncabezado: TFDMemTable;
  mRecibosDetalle: TFDMemTable;
  mCierresCaja: TFDMemTable;
  mOrdenes_Encabezado: TFDMemTable;
  mOrdenes_Detalle: TFDMemTable;
  mHacienda: TFDMemTable;

  _Plantilla: string;

{$REGION 'Funciones Forma'}
procedure TFormPlantillas01.FormShow(Sender: TObject);
begin
  Forma01 := FormPlantillas01;

  InicializarForma;
end;

procedure TFormPlantillas01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormPlantillas01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormPlantillas01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormPlantillas01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormPlantillas01.btnPlantillaClick(Sender: TObject);
begin
  Plantilla;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LimpiarCampos;
      CargarIdioma;

      CrearEstructuras;

      pnlAccion.Caption := 'MODIFICAR';
      Consultar_Data(_Id);
      if _Resultado = -1 then
        raise Exception.Create('');
      edtNombre.SetFocus;
    except
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
        PostMessage(Handle, WM_CLOSE, 0, 0);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure FinalizarForma;
begin
  with Forma01 do
  begin

    try

    except
    end;

  end;
end;

procedure KeyDownForma(var Key: Word; Shift: TShiftState);
begin
  with Forma01 do
  begin

    if Key = VK_ESCAPE then
    begin
      Key := 0;
      Close;
    end;
    if Key = VK_F10 then
    begin
      Key := 0;
      btnAceptar.Click;
    end;
    if Key = VK_F11 then
    begin
      Key := 0;
      btnCancelar.Click;
    end;

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    _Plantilla := '';

    pgcCampos.ActivePageIndex := 0;
    edtNombre.Clear;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    Modificar_Data(_Id);
    if _Resultado = 1 then
    begin
      Tag := 1;
      Close;
    end;

  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure DBToForma(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      _Plantilla :=
        FieldByName('PLANTILLA').AsString;

      edtNombre.Text :=
        FieldByName('DESCRIPCION').AsString;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Plantillas: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Plantillas := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Plantillas.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Plantillas.Dataset);
      mBS_Plantillas.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      _Resultado := -1;
    end;

  end;
end;

procedure CamposValidos;
var
  mValido: Boolean;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (Trim(edtNombre.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'La descripción no puede estar vacia';
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Modificar_Data(pId: Integer);
var
  mBS_Plantillas: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mReportBuild: TReportBuild;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mReportBuild := TReportBuild.Create(Global.PathAplicacion);
      mReportBuild.Create(Global.PathAplicacion);
      mReportBuild.ArchivoConfig :=
        Global.PathAplicacion + '\Config_ReportBuild.ini';

      _Plantilla := mReportBuild.PlantillaSalidaContenido;
      mReportBuild.Destroy;

      mBS_Plantillas := Clase_Tipo1.Create;
      with mBS_Plantillas.Dataset do
      begin
        EmptyDataSet;
        mBS_Plantillas.Limpiar_Tag;
        Append;
        FieldByName('DESCRIPCION').Tag := 1;
        FieldByName('DESCRIPCION').AsString :=
          edtNombre.Text;
        FieldByName('PLANTILLA').Tag := 1;
        FieldByName('PLANTILLA').AsString :=
          _Plantilla;
        Post;
      end;
      mBS_Plantillas.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Plantillas.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      if _Resultado = 0 then
      begin
        Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
      end;
      _Resultado := -1;
    end;

  end;
end;

procedure Plantilla;
var
  mANombre: string;
  mReportBuild: TReportBuild;
  mArchivo: TStringList;
begin
  with Forma01 do
  begin

    mReportBuild := TReportBuild.Create(Global.PathAplicacion);
    mReportBuild.Create(Global.PathAplicacion);
    mReportBuild.ArchivoConfig :=
      Global.PathAplicacion + '\Config_ReportBuild.ini';
    mReportBuild.OrigenPre := 2;
    mReportBuild.ContenidoPre := _Plantilla;
    if _Plantilla <>  '' then
      mReportBuild.Precargar := 1
    else
      mReportBuild.Precargar := 0;


     {
      mReportBuild.GenerarEstructura(mCierresCaja,
        nil, nil, nil, nil, nil, nil, nil);
        }

    if _Id = 1 then
    begin
      mReportBuild.DataSet1Name := 'Facturas_Encabezado';
      mReportBuild.DataSet2Name := 'Facturas_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.DataSet4Name := 'Hacienda';
      mReportBuild.GenerarEstructura(mBS_facturasclientesencabezado,
        mBS_facturasclientesdetalle, mBS_empresas, mBS_Hacienda, nil, nil, nil, nil);
    end;
    if _Id = 2 then
    begin
      mReportBuild.DataSet1Name := 'Facturas_Encabezado';
      mReportBuild.DataSet2Name := 'Facturas_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.DataSet3Name := 'Hacienda';
      mReportBuild.GenerarEstructura(mBS_facturasclientesencabezado,
        mBS_facturasclientesdetalle, mBS_empresas, nil, nil, nil, nil, nil);
    end;
    if _Id = 3 then
    begin
      mReportBuild.DataSet1Name := 'Proformas_Encabezado';
      mReportBuild.DataSet2Name := 'Proformas_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.GenerarEstructura(mProformasEncabezado,
        mDetalle, mBS_empresas, nil, nil, nil, nil, nil);
    end;
    if _Id = 4 then
    begin
      mReportBuild.DataSet1Name := 'Proformas_Encabezado';
      mReportBuild.DataSet2Name := 'Proformas_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.GenerarEstructura(mProformasEncabezado,
        mDetalle, mBS_empresas, nil, nil, nil, nil, nil);
    end;
    if _Id = 9 then
    begin
      mReportBuild.DataSet1Name := 'RecibosAbonos_Encabezado';
      mReportBuild.DataSet2Name := 'RecibosAbonos_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.GenerarEstructura(mRecibosEncabezado,
        mRecibosDetalle, mBS_empresas, nil, nil, nil, nil, nil);
    end;
    if _Id = 11 then
    begin
      mReportBuild.DataSet1Name := 'Apartado_Encabezado';
      mReportBuild.DataSet2Name := 'Apartado_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.GenerarEstructura(mApartadosEncabezado,
        mDetalle, mBS_empresas, nil, nil, nil, nil, nil);
    end;
    if _Id = 12 then
    begin
      mReportBuild.DataSet1Name := 'RecibosAbonos_Encabezado';
      mReportBuild.DataSet2Name := 'RecibosAbonos_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.GenerarEstructura(mRecibosEncabezado,
        mRecibosDetalle, mBS_empresas, nil, nil, nil, nil, nil);
    end;
    if _Id = 13 then
    begin
      mReportBuild.DataSet1Name := 'Cierre_Caja_Encabezado';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.GenerarEstructura(mCierresCaja,
        mBS_empresas, mBS_empresas, nil, nil, nil, nil, nil);
    end;
    if _Id = 17 then
    begin
      mReportBuild.DataSet1Name := 'Ordenes_Encabezado';
      mReportBuild.DataSet2Name := 'Ordenes_Detalle';
      mReportBuild.DataSet3Name := 'Empresa';
      mReportBuild.GenerarEstructura(mOrdenes_Encabezado,
        mOrdenes_Detalle, mBS_empresas, nil, nil, nil, nil, nil);
    end;

    mReportBuild.Destroy;

    mANombre := Global.PathAplicacion + '\ReportBuild.exe';
    ShellExecute(Handle, 'open', PChar(mANombre), '', '', SW_SHOWNORMAL);

    {
    mArchivo := TStringList.Create;
    mArchivo.LoadFromFile(Global.PathAplicacion + '\PlantillaSalida.fr3');
    _Plantilla := mArchivo.Text;
    mArchivo.Free;
    ShowMessage(_Plantilla);
                        }
  end;
end;

procedure CrearEstructuras;
begin
  mBS_Hacienda := TFDMemTable.Create(nil);
  with mBS_Hacienda do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('ID', ftInteger, 0);
    FieldDefs.Add('IDENCABEZADO', ftInteger, 0);
    FieldDefs.Add('SUCURSAL', ftString, 3);
    FieldDefs.Add('TERMINAL', ftString, 5);
    FieldDefs.Add('TIPO', ftString, 2);
    FieldDefs.Add('NUMERACION', ftString, 10);
    FieldDefs.Add('CONSECUTIVO', ftString, 20);
    FieldDefs.Add('PAIS', ftString, 3);
    FieldDefs.Add('DIA', ftString, 3);
    FieldDefs.Add('MES', ftString, 3);
    FieldDefs.Add('MYEAR', ftString, 3);
    FieldDefs.Add('IDENTIFICACION', ftString, 11);
    FieldDefs.Add('SITUACION', ftString, 1);
    FieldDefs.Add('SEGURIDAD', ftString, 8);
    FieldDefs.Add('CLAVE', ftString, 50);
    FieldDefs.Add('MQR', ftMemo, 0);
    CreateDataSet;
    Open;
  end;

  mBS_facturasclientesencabezado := TFDMemTable.Create(nil);
  with mBS_facturasclientesencabezado do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Factura_Numero', ftInteger, 0);
    FieldDefs.Add('Fecha', ftDateTime, 0);
    FieldDefs.Add('Hora', ftDateTime, 0);
    FieldDefs.Add('CodigoCliente', ftString, 300);
    FieldDefs.Add('NombreCliente', ftString, 300);
    FieldDefs.Add('SubTotal', ftFloat, 0);
    FieldDefs.Add('DescuentoPorcentaje', ftFloat, 0);
    FieldDefs.Add('DescuentoMonto', ftFloat, 0);
    FieldDefs.Add('IVAPorcentaje', ftFloat, 0);
    FieldDefs.Add('IVAMonto', ftFloat, 0);
    FieldDefs.Add('Transporte', ftFloat, 0);
    FieldDefs.Add('Total', ftFloat, 0);
    FieldDefs.Add('TotalGravado', ftFloat, 0);
    FieldDefs.Add('TotalExcento', ftFloat, 0);
    FieldDefs.Add('Estado', ftString, 300);
    FieldDefs.Add('FormaPago', ftString, 300);
    FieldDefs.Add('Moneda', ftString, 300);
    FieldDefs.Add('TipoCambio', ftFloat, 0);
    FieldDefs.Add('Serie', ftString, 300);
    FieldDefs.Add('Impresa', ftString, 300);
    FieldDefs.Add('NumeroDoc', ftString, 300);
    FieldDefs.Add('FechaVencimiento', ftDateTime, 0);
    FieldDefs.Add('Tipo', ftInteger, 0);
    FieldDefs.Add('Saldo', ftFloat, 0);
    FieldDefs.Add('CarCredito', ftString, 300);
    FieldDefs.Add('CarContado', ftString, 300);
    FieldDefs.Add('CodigoVendedor', ftString, 300);
    FieldDefs.Add('NombreVendedor', ftString, 300);
    FieldDefs.Add('Numero_Proforma', ftInteger, 0);
    FieldDefs.Add('PagoCon', ftFloat, 0);
    FieldDefs.Add('Cambio', ftFloat, 0);
    FieldDefs.Add('FraseMayorista', ftString, 300);
    FieldDefs.Add('DireccionCliente', ftString, 300);
    FieldDefs.Add('Telefono1Cliente', ftString, 300);
    FieldDefs.Add('ServicioMonto', ftFloat, 0);
    FieldDefs.Add('ContactoNombre', ftString, 300);
    CreateDataSet;
    Open;
  end;

  mBS_facturasclientesdetalle := TFDMemTable.Create(nil);
  with mBS_facturasclientesdetalle do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Codigo_Producto', ftString, 300);
    FieldDefs.Add('Nombre_Producto', ftString, 300);
    FieldDefs.Add('Cantidad', ftFloat, 0);
    FieldDefs.Add('UnidadMedida', ftString, 300);
    FieldDefs.Add('PrecioUnitario', ftFloat, 0);
    FieldDefs.Add('PrecioUnitarioFinal', ftFloat, 0);
    FieldDefs.Add('DescuentoPorcentaje', ftFloat, 0);
    FieldDefs.Add('DescuentoMonto', ftFloat, 0);
    FieldDefs.Add('PrecioFinal', ftFloat, 0);
    FieldDefs.Add('Impuesto', ftFloat, 0);
    FieldDefs.Add('PrecioMayoristaAplicado', ftString, 300);
    FieldDefs.Add('Descripcion_Producto', ftString, 300);
    FieldDefs.Add('CodigoBarras', ftString, 300);
    FieldDefs.Add('PrecioUnitarioBase', ftFloat, 0);
    FieldDefs.Add('PrecioFinalBase', ftFloat, 0);
    FieldDefs.Add('Descripcion1', ftString, 300);
    FieldDefs.Add('Descripcion2', ftString, 300);
    CreateDataSet;
    Open;
  end;

  mBS_empresas := TFDMemTable.Create(nil);
  with mBS_empresas do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('ID', ftInteger, 0);
    FieldDefs.Add('CODIGO', ftInteger, 0);
    FieldDefs.Add('NOMBRE', ftString, 200);
    FieldDefs.Add('CEDULA', ftString, 100);
    FieldDefs.Add('DIRECCION', ftString, 255);
    FieldDefs.Add('TELEFONO1', ftString, 17);
    FieldDefs.Add('TELEFONO2', ftString, 17);
    FieldDefs.Add('FAX', ftString, 17);
    FieldDefs.Add('EMAIL', ftString, 100);
    FieldDefs.Add('WEB', ftString, 200);
    FieldDefs.Add('NombreJuridico', ftString, 200);
    FieldDefs.Add('RedSocial', ftString, 200);
    CreateDataSet;
    Open;
  end;

  mProformasEncabezado := TFDMemTable.Create(nil);
  with mProformasEncabezado do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Proforma_Numero', ftInteger, 0);
    FieldDefs.Add('Fecha', ftDateTime, 0);
    FieldDefs.Add('Hora', ftDateTime, 0);
    FieldDefs.Add('CodigoCliente', ftString, 300);
    FieldDefs.Add('NombreCliente', ftString, 300);
    FieldDefs.Add('SubTotal', ftFloat, 0);
    FieldDefs.Add('DescuentoPorcentaje', ftFloat, 0);
    FieldDefs.Add('DescuentoMonto', ftFloat, 0);
    FieldDefs.Add('IVAPorcentaje', ftFloat, 0);
    FieldDefs.Add('IVAMonto', ftFloat, 0);
    FieldDefs.Add('Transporte', ftFloat, 0);
    FieldDefs.Add('Total', ftFloat, 0);
    FieldDefs.Add('TotalGravado', ftFloat, 0);
    FieldDefs.Add('TotalExcento', ftFloat, 0);
    FieldDefs.Add('Estado', ftString, 300);
    FieldDefs.Add('FormaPago', ftString, 300);
    FieldDefs.Add('Moneda', ftString, 300);
    FieldDefs.Add('TipoCambio', ftFloat, 0);
    FieldDefs.Add('Serie', ftString, 300);
    FieldDefs.Add('Impresa', ftString, 300);
    FieldDefs.Add('NumeroDoc', ftString, 300);
    FieldDefs.Add('FechaVencimiento', ftDateTime, 0);
    FieldDefs.Add('Tipo', ftInteger, 0);
    FieldDefs.Add('Saldo', ftFloat, 0);
    FieldDefs.Add('CarCredito', ftString, 300);
    FieldDefs.Add('CarContado', ftString, 300);
    FieldDefs.Add('CodigoVendedor', ftString, 300);
    FieldDefs.Add('NombreVendedor', ftString, 300);
    FieldDefs.Add('Numero_Factura', ftInteger, 0);
    FieldDefs.Add('PagoCon', ftFloat, 0);
    FieldDefs.Add('Cambio', ftFloat, 0);
    FieldDefs.Add('FraseMayorista', ftString, 300);
    CreateDataSet;
    Open;
  end;

  mDetalle := TFDMemTable.Create(nil);
  with mDetalle do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Codigo_Producto', ftString, 300);
    FieldDefs.Add('Nombre_Producto', ftString, 300);
    FieldDefs.Add('Cantidad', ftFloat, 0);
    FieldDefs.Add('UnidadMedida', ftString, 300);
    FieldDefs.Add('PrecioUnitario', ftFloat, 0);
    FieldDefs.Add('DescuentoPorcentaje', ftFloat, 0);
    FieldDefs.Add('DescuentoMonto', ftFloat, 0);
    FieldDefs.Add('PrecioFinal', ftFloat, 0);
    FieldDefs.Add('Impuesto', ftFloat, 0);
    FieldDefs.Add('PrecioUnitarioFinal', ftFloat, 0);
    FieldDefs.Add('PrecioMayoristaAplicado', ftString, 100);
    FieldDefs.Add('Descripcion_Producto', ftString, 200);
    FieldDefs.Add('CodigoBarras', ftString, 100);
    CreateDataSet;
    Open;
  end;

  mApartadosEncabezado := TFDMemTable.Create(nil);
  with mApartadosEncabezado do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Apartado_Numero', ftInteger, 0);
    FieldDefs.Add('Fecha', ftDateTime, 0);
    FieldDefs.Add('Hora', ftDateTime, 0);
    FieldDefs.Add('CodigoCliente', ftString, 300);
    FieldDefs.Add('NombreCliente', ftString, 300);
    FieldDefs.Add('SubTotal', ftFloat, 0);
    FieldDefs.Add('DescuentoPorcentaje', ftFloat, 0);
    FieldDefs.Add('DescuentoMonto', ftFloat, 0);
    FieldDefs.Add('IVAPorcentaje', ftFloat, 0);
    FieldDefs.Add('IVAMonto', ftFloat, 0);
    FieldDefs.Add('Transporte', ftFloat, 0);
    FieldDefs.Add('Total', ftFloat, 0);
    FieldDefs.Add('TotalGravado', ftFloat, 0);
    FieldDefs.Add('TotalExcento', ftFloat, 0);
    FieldDefs.Add('Estado', ftString, 300);
    FieldDefs.Add('FormaPago', ftString, 300);
    FieldDefs.Add('Moneda', ftString, 300);
    FieldDefs.Add('TipoCambio', ftFloat, 0);
    FieldDefs.Add('Serie', ftString, 300);
    FieldDefs.Add('Impresa', ftString, 300);
    FieldDefs.Add('NumeroDoc', ftString, 300);
    FieldDefs.Add('FechaVencimiento', ftDateTime, 0);
    FieldDefs.Add('Tipo', ftInteger, 0);
    FieldDefs.Add('Saldo', ftFloat, 0);
    FieldDefs.Add('CarCredito', ftString, 300);
    FieldDefs.Add('CarContado', ftString, 300);
    FieldDefs.Add('CodigoVendedor', ftString, 300);
    FieldDefs.Add('NombreVendedor', ftString, 300);
    FieldDefs.Add('Numero_Factura', ftInteger, 0);
    FieldDefs.Add('PagoCon', ftFloat, 0);
    FieldDefs.Add('Cambio', ftFloat, 0);
    FieldDefs.Add('FraseMayorista', ftString, 300);
    CreateDataSet;
    Open;
  end;

  mRecibosEncabezado := TFDMemTable.Create(nil);
  with mRecibosEncabezado do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Recibo_Numero', ftInteger, 0);
    FieldDefs.Add('Fecha', ftDateTime, 0);
    FieldDefs.Add('Hora', ftDateTime, 0);
    FieldDefs.Add('CodigoCliente', ftString, 100);
    FieldDefs.Add('NombreCliente', ftString, 160);
    FieldDefs.Add('MontoLetras', ftMemo, 0);
    FieldDefs.Add('SaldoAnterior', ftFloat, 0);
    FieldDefs.Add('MontoNumero', ftFloat, 0);
    FieldDefs.Add('SaldoActual', ftFloat, 0);
    FieldDefs.Add('Estado', ftString, 100);
    FieldDefs.Add('FormaPago', ftString, 100);
    FieldDefs.Add('Moneda', ftString, 100);
    FieldDefs.Add('Impresa', ftString, 100);
    FieldDefs.Add('Tipo', ftString, 100);
    CreateDataSet;
    Open;
  end;

  mRecibosDetalle := TFDMemTable.Create(nil);
  with mRecibosDetalle do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Factura_Numero', ftString, 50);
    FieldDefs.Add('MontoAbono', ftFloat, 0);
    CreateDataSet;
    Open;
  end;

  mCierresCaja := TFDMemTable.Create(nil);
  with mCierresCaja do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('Codigo', ftInteger, 0);
    FieldDefs.Add('IdMaquina', ftString, 100);
    FieldDefs.Add('FechaDe', ftDate, 0);
    FieldDefs.Add('FechaHasta', ftDate, 0);
    FieldDefs.Add('HoraDe', ftString, 20);
    FieldDefs.Add('HoraHasta', ftString, 20);
    FieldDefs.Add('TotalMontoEfectivo', ftFloat, 0);
    FieldDefs.Add('TotalMontoTarjeta', ftFloat, 0);
    FieldDefs.Add('TotalMontoCheque', ftFloat, 0);
    FieldDefs.Add('TotalMontoTransferencia', ftFloat, 0);
    FieldDefs.Add('TotalMontoFinal', ftFloat, 0);
    FieldDefs.Add('Empresa', ftString, 100);
    FieldDefs.Add('TOTALNOTASCREDITO', ftFloat, 0);
    FieldDefs.Add('TOTALDESCUENTOS', ftFloat, 0);
    FieldDefs.Add('TOTALKILOS', ftFloat, 0);
    FieldDefs.Add('MontoInicial', ftFloat, 0);
    CreateDataSet;
    Open;
  end;

  mOrdenes_Encabezado := TFDMemTable.Create(nil);
  with mOrdenes_Encabezado do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('ID', ftInteger, 0);
    FieldDefs.Add('ETIQUETA', ftString, 100);
    FieldDefs.Add('VENTA', ftFloat, 0);
    FieldDefs.Add('COMENTARIOS', ftMemo, 0);
    FieldDefs.Add('IDCLIENTE', ftInteger, 0);
    FieldDefs.Add('FECHA', ftDate, 0);
    FieldDefs.Add('HORA', ftString, 30);
    FieldDefs.Add('CODIGOESTADO', ftInteger, 0);
    FieldDefs.Add('EstadoNombre', ftString, 50);
    CreateDataSet;
    Open;
  end;

  mOrdenes_Detalle := TFDMemTable.Create(nil);
  with mOrdenes_Detalle do
  begin
    FieldDefs.Clear;
    FieldDefs.Add('ID', ftInteger, 0);
    FieldDefs.Add('IDENCABEZADO', ftInteger, 0);
    FieldDefs.Add('IDPRODUCTO', ftInteger, 0);
    FieldDefs.Add('CANTIDAD', ftFloat, 0);
    FieldDefs.Add('idImpresora', ftInteger, 0);
    FieldDefs.Add('Venta', ftFloat, 0);
    FieldDefs.Add('ProductoNombre', ftString, 100);
    CreateDataSet;
    Open;
  end;

end;

procedure CargarIdioma;
var
  mValor: string;
  mCount, mLen: Integer;
begin
  with Forma01 do
  begin

    for mCount := 0 to Forma01.ComponentCount - 1 do
    begin
      if Forma01.Components[mCount] is TLabel then
      begin
        mValor := TLabel(Forma01.Components[mCount]).Caption;
        mLen := Length(mValor);
        if mValor[mLen] = ':' then
          mValor := Copy(mValor, 1, mLen - 1);
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TLabel(Forma01.Components[mCount]).Caption := mValor;
      end;
      if Forma01.Components[mCount] is TBitBtn then
      begin
        mValor := TBitBtn(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TBitBtn(Forma01.Components[mCount]).Caption := mValor;
      end;
      if Forma01.Components[mCount] is TRzPanel then
      begin
        mValor := TRzPanel(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TRzPanel(Forma01.Components[mCount]).Caption := mValor;
      end;
      if Forma01.Components[mCount] is TRzTabSheet then
      begin
        mValor := TRzTabSheet(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TRzTabSheet(Forma01.Components[mCount]).Caption := mValor;
      end;
    end;

  end;
end;
{$ENDREGION}

end.
