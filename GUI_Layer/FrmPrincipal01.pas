unit FrmPrincipal01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzTabs, RzPanel, Vcl.Menus,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.FileCtrl, RzSpnEdt, Vcl.Imaging.jpeg,
  Winapi.ShellAPI, Vcl.Styles, vcl.Themes, FireDAC.Comp.Client;

type
  TFormPrincipal01 = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    RzPanel1: TRzPanel;
    pnlCampos: TRzPanel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    BasedeDatos1: TMenuItem;
    Empresas1: TMenuItem;
    OpenDialog1: TOpenDialog;
    Usuarios1: TMenuItem;
    Opciones1: TMenuItem;
    N1: TMenuItem;
    Salir1: TMenuItem;
    Mantenimientos1: TMenuItem;
    Familias1: TMenuItem;
    Productos1: TMenuItem;
    Clientes1: TMenuItem;
    Proveedores1: TMenuItem;
    Vendedores1: TMenuItem;
    Impuestos1: TMenuItem;
    RzRapidFireButton1: TRzRapidFireButton;
    N2: TMenuItem;
    CambiarPrecios1: TMenuItem;
    Facturacin1: TMenuItem;
    FacturaGeneral1: TMenuItem;
    Image1: TImage;
    Plantillas1: TMenuItem;
    Ayuda1: TMenuItem;
    Acercade1: TMenuItem;
    Proformas1: TMenuItem;
    Apartados1: TMenuItem;
    Compras1: TMenuItem;
    Entradas1: TMenuItem;
    Recibos1: TMenuItem;
    Recibos2: TMenuItem;
    CierresdeCaja1: TMenuItem;
    Reportes1: TMenuItem;
    Manual1: TMenuItem;
    N3: TMenuItem;
    RzRapidFireButton2: TRzRapidFireButton;
    RzRapidFireButton3: TRzRapidFireButton;
    RzRapidFireButton4: TRzRapidFireButton;
    RzRapidFireButton5: TRzRapidFireButton;
    RzRapidFireButton6: TRzRapidFireButton;
    RzRapidFireButton7: TRzRapidFireButton;
    RzRapidFireButton8: TRzRapidFireButton;
    RzRapidFireButton9: TRzRapidFireButton;
    RzRapidFireButton10: TRzRapidFireButton;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    ListadodeFamilias1: TMenuItem;
    ListadodeProductos1: TMenuItem;
    ListadodeClientes1: TMenuItem;
    ListadodeProveedores1: TMenuItem;
    ListadodeVendedores1: TMenuItem;
    Entradas2: TMenuItem;
    Facturas1: TMenuItem;
    RecibosEntradas1: TMenuItem;
    RecibosFacturas1: TMenuItem;
    RecibosApartados1: TMenuItem;
    Apartados2: TMenuItem;
    Proformas2: TMenuItem;
    CierresdeCaja2: TMenuItem;
    Compras2: TMenuItem;
    Ventas1: TMenuItem;
    EstadodeCuenta1: TMenuItem;
    Grupos1: TMenuItem;
    NotasdeCrdito1: TMenuItem;
    Utilidad1: TMenuItem;
    ValordelInventario1: TMenuItem;
    RecibosdeApartados1: TMenuItem;
    Ordenes1: TMenuItem;
    lblLicencia: TLabel;
    Licencia1: TMenuItem;
    lvlVersion: TLabel;
    Contabilidad1: TMenuItem;
    Cuentas1: TMenuItem;
    Estadistico1: TMenuItem;
    Asientos1: TMenuItem;
    MovimientosdeInventario1: TMenuItem;
    NotasdeCrdito2: TMenuItem;
    Sincronizar1: TMenuItem;
    Descuentos1: TMenuItem;
    Kilos1: TMenuItem;
    ProductosDevueltos1: TMenuItem;
    Mnimos1: TMenuItem;
    A1: TMenuItem;
    I1: TMenuItem;
    L1: TMenuItem;
    pnlEmpresa: TRzPanel;
    lblEmpresa: TLabel;
    S1: TMenuItem;
    NotasdeDebito1: TMenuItem;
    T1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BasedeDatos1Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure Opciones1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Familias1Click(Sender: TObject);
    procedure Productos1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Proveedores1Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure Impuestos1Click(Sender: TObject);
    procedure CambiarPrecios1Click(Sender: TObject);
    procedure FacturaGeneral1Click(Sender: TObject);
    procedure Plantillas1Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
    procedure Proformas1Click(Sender: TObject);
    procedure Apartados1Click(Sender: TObject);
    procedure Entradas1Click(Sender: TObject);
    procedure RzRapidFireButton4Click(Sender: TObject);
    procedure RzRapidFireButton3Click(Sender: TObject);
    procedure RzRapidFireButton2Click(Sender: TObject);
    procedure RzRapidFireButton1Click(Sender: TObject);
    procedure RzRapidFireButton5Click(Sender: TObject);
    procedure RzRapidFireButton7Click(Sender: TObject);
    procedure RzRapidFireButton8Click(Sender: TObject);
    procedure RzRapidFireButton10Click(Sender: TObject);
    procedure Recibos1Click(Sender: TObject);
    procedure Recibos2Click(Sender: TObject);
    procedure CierresdeCaja1Click(Sender: TObject);
    procedure RzRapidFireButton6Click(Sender: TObject);
    procedure RzRapidFireButton9Click(Sender: TObject);
    procedure ListadodeFamilias1Click(Sender: TObject);
    procedure ListadodeProductos1Click(Sender: TObject);
    procedure ListadodeClientes1Click(Sender: TObject);
    procedure ListadodeProveedores1Click(Sender: TObject);
    procedure ListadodeVendedores1Click(Sender: TObject);
    procedure Entradas2Click(Sender: TObject);
    procedure Facturas1Click(Sender: TObject);
    procedure RecibosEntradas1Click(Sender: TObject);
    procedure RecibosFacturas1Click(Sender: TObject);
    procedure RecibosApartados1Click(Sender: TObject);
    procedure Apartados2Click(Sender: TObject);
    procedure Proformas2Click(Sender: TObject);
    procedure CierresdeCaja2Click(Sender: TObject);
    procedure Compras2Click(Sender: TObject);
    procedure Ventas1Click(Sender: TObject);
    procedure EstadodeCuenta1Click(Sender: TObject);
    procedure Grupos1Click(Sender: TObject);
    procedure NotasdeCrdito1Click(Sender: TObject);
    procedure Utilidad1Click(Sender: TObject);
    procedure ValordelInventario1Click(Sender: TObject);
    procedure RecibosdeApartados1Click(Sender: TObject);
    procedure Ordenes1Click(Sender: TObject);
    procedure Manual1Click(Sender: TObject);
    procedure Licencia1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Cuentas1Click(Sender: TObject);
    procedure Estadistico1Click(Sender: TObject);
    procedure Asientos1Click(Sender: TObject);
    procedure MovimientosdeInventario1Click(Sender: TObject);
    procedure NotasdeCrdito2Click(Sender: TObject);
    procedure Sincronizar1Click(Sender: TObject);
    procedure Descuentos1Click(Sender: TObject);
    procedure Kilos1Click(Sender: TObject);
    procedure ProductosDevueltos1Click(Sender: TObject);
    procedure Mnimos1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure NotasdeDebito1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal01: TFormPrincipal01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  {$REGION 'Funciones Menu'}
  procedure mmBaseDatos;
  procedure mmEmpresas;
  procedure mmEmpresasLista;
  procedure mmEmpresasSeleccionar;
  procedure mmUsuarios;
  procedure mmOpciones;
  procedure mmPlantillas;
  procedure mmSalir;
  procedure mmFamilias;
  procedure mmGrupos;
  procedure mmProductos;
  procedure mmClientes;
  procedure mmProveedores;
  procedure mmVendedores;
  procedure mmImpuestos;
  procedure mmCambiarPrecios;
  procedure mmCompras;
  procedure mmRecibosProveedores;
  procedure mmFacturacion;
  procedure mmProformas;
  procedure mmApartados;
  procedure mmRecibosClientes;
  procedure mmCierresCaja;
  procedure mmRecibosApartados;
  procedure mmNotasCredito;
  procedure mmNotasDebito;
  procedure mmTiquetes;
  procedure mmManual;
  procedure mmAcercaDe;
  procedure mmLicencia;
  procedure mmFacturas_Nuevos;
  procedure mmProformas_Nuevos;
  procedure mmEntradas_Nuevos;
  procedure mmApartados_Nuevos;
  procedure mmRecibosClientes_Nuevos;
  procedure mmCierresCaja_Nuevos;
  procedure mmOrdenes;
  procedure mmCuentas;
  procedure mmAsientos;
  procedure mmListadoFamlias;
  procedure mmListadoProductos;
  procedure mmListadoClientes;
  procedure mmListadoProveedores;
  procedure mmListadoVendedores;
  procedure mmFacturasProveedores;
  procedure mmRecibosAbonosProveedores;
  procedure mmFacturasClientes;
  procedure mmRecibosAbonosClientes;
  procedure mmReporteApartados;
  procedure mmRecibosAbonosApartados;
  procedure mmReporteProformas;
  procedure mmReporteCierresCaja;
  procedure mmReporteCompras;
  procedure mmReporteVentas;
  procedure mmEstadoCuenta;
  procedure mmReporteNotasCredito;
  procedure mmUtilidad;
  procedure mmValorInventario;
  procedure mEstadistico;
  procedure mmReporteMovimientosInventario;
  procedure mmSincronizar;
  procedure mmReporteDescuentos;
  procedure mmReporteKilos;
  procedure mmReporteProductosDevueltos;
  procedure mmReporteProductosMinimos;
  {$ENDREGION}
  function LicenciaValida(var pMensaje: string): Boolean;
  procedure mmSincronizarServidor;
  procedure mmSincronizarCliente;
  procedure CopiarEstructuraProductos(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraClientes(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraImpuestos(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraEmpresas(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraEstados(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraFamilias(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraFormasPago(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraNivelesUsuarios(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraPlantillas(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraProveedores(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraUsuarios(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructuraVendedores(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CopiarEstructura2(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uConfig, BS_DBConexion,
  udmLenguajes, FrmPresentacion01,
  FmrEmpresas01, FrmMantenimientoUsuarios01, FrmBaseDatos01,
  FrmMantenimientoFamilias01, FrmMantenimientoProductos01,
  FrmMantenimientoClientes01, FrmMantenimientoProveedores01,
  FrmMantenimientoVendedores01, FrmMantenimientoImpuestos01,
  FrmCambiarPrecios01, FrmMantenimientoFacturasClientes01,
  FrmMantenimientoPlantillas01, FrmAcercaDe01, FrmMantenimientoProformas01,
  FrmMantenimientoApartados01, FrmMantenimientoFacturasProveedores01,
  FrmFacturaClientes01, FrmProformas01, FrmFacturasProveedores01,
  FrmApartados01, FrmOpciones01, FrmMantenimientoRecibosClientes01,
  FrmMantenimientoRecibosProveedores01, FrmMantenimientoRecibosCierresCaja01,
  FrmAcceso01, FrmMantenimientoRecibosApartados01, uDL_TB_SISTEMA,
  FrmRecibosClientes01, FrmCierresCaja01, RptListadoFamilias01,
  RptListadoProductos01, RptListadoClientes01, RptListadoProveedores01,
  RptListadoVendedores01, RptFacturasProveedores01,
  RptFacturasClientes01, RptRecibosProveedores01, RptRecibosClientes01,
  RptRecibosApartados01, RptApartados01, RptProformas01,
  RptCierresCaja01, RptCompras01, RptVentas01, RptEstadoCuenta01,
  FrmMantenimientoGrupos01, RptNotasCredito01, RptUtilidad01,
  RptValorInventario01, FrmOpcionesIniciales01, FrmMantenimientoOrdenes01,
  uLicencia, FrmPedirLicencia01, FrmActivarLicencia01,
  FrmMantenimientoCuentas01, FrmAcceso02, RptEstadistico01,
  FrmMantenimientoAsientos01, RptMovimientosInventario01,
  FrmMantenimientoNotasCredito01, uDL_TB_CONEXIONES, uDL_TB_PRODUCTOS,
  uDL_TB_CLIENTES, uDL_TB_CONSECUTIVOS, uDL_TB_APARTADOSENCABEZADO,
  udmConnection, uDL_TB_FACTURASCLIENTESENCABEZADO,
  uDL_TB_NOTASDEBITOENCABEZADO, uDL_TB_OrdenesEncabezado,
  uDL_TB_PROFORMASENCABEZADO, uDL_TB_RECIBOSCLIENTESENCABEZADO,
  uDL_TB_RECIBOSAPARTADOSENCABEZADO, uDL_TB_VENDEDORESCLIENTES,
  RptDescuentos01, RptKilos01, RptProductosDevueltos01,
  RptProductosMinimos01, FrmListadoProductos01, FrmListadoClientes01,
  FrmRuta01, DL_DBGeneral, uDL_TB_IMPUESTOS, uDL_TB_EMPRESAS,
  uDL_TB_ESTADOS, uDL_TB_FAMILIAS, uDL_TB_FORMASPAGO,
  uDL_TB_NIVELESUSUARIOS, uDL_TB_PLANTILLAS, uDL_TB_PROVEEDORES,
  uDL_TB_USUARIOS, uDL_TB_VENDEDORES, FrmEmpresasLista01,
  FrmSeleccionarEmpresa01, FrmMantenimientoNotasDebito01;

{$R *.dfm}

var
  Forma01: TFormPrincipal01;
  _Actualizando: Boolean;
  _PasaForma: Boolean;

{$REGION 'Funciones Forma'}
procedure TFormPrincipal01.FormCreate(Sender: TObject);
var
  mConfig: TConfig;
begin
  _PasaForma := False;

  lblLicencia.Caption  := '';
  lblEmpresa.Caption  := 'Empresa:';

  InicialiarSistema;

  mConfig := TConfig.Create;
  mConfig.LeerIni;
  mConfig.Destroy;
                 {
  case Global.TipoPantalla of
     0: TStyleManager.SetStyle('Windows');
     1: TStyleManager.SetStyle('Slate Classico');
  else
    TStyleManager.SetStyle('Windows');
  end;
              }
  Forma01 := FormPrincipal01;
end;

procedure TFormPrincipal01.FormActivate(Sender: TObject);
begin
  if _PasaForma = False then
    InicializarForma;
  _PasaForma := True;
end;

procedure TFormPrincipal01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormPrincipal01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

{$REGION 'Funciones Menu'}
procedure TFormPrincipal01.BasedeDatos1Click(Sender: TObject);
begin
  mmBaseDatos;
end;

procedure TFormPrincipal01.I1Click(Sender: TObject);
begin
  mmEmpresas;
end;

procedure TFormPrincipal01.L1Click(Sender: TObject);
begin
  mmEmpresasLista;
end;

procedure TFormPrincipal01.S1Click(Sender: TObject);
begin
  mmEmpresasSeleccionar;
end;

procedure TFormPrincipal01.Usuarios1Click(Sender: TObject);
begin
  mmUsuarios;
end;

procedure TFormPrincipal01.Opciones1Click(Sender: TObject);
begin
  mmOpciones;
end;

procedure TFormPrincipal01.Plantillas1Click(Sender: TObject);
begin
  mmPlantillas;
end;

procedure TFormPrincipal01.Salir1Click(Sender: TObject);
begin
  mmSalir;
end;

procedure TFormPrincipal01.Familias1Click(Sender: TObject);
begin
  mmFamilias;
end;

procedure TFormPrincipal01.Grupos1Click(Sender: TObject);
begin
  mmGrupos;
end;

procedure TFormPrincipal01.Productos1Click(Sender: TObject);
begin
  mmProductos;
end;

procedure TFormPrincipal01.Clientes1Click(Sender: TObject);
begin
  mmClientes;
end;

procedure TFormPrincipal01.Proveedores1Click(Sender: TObject);
begin
  mmProveedores;
end;

procedure TFormPrincipal01.Vendedores1Click(Sender: TObject);
begin
  mmVendedores;
end;

procedure TFormPrincipal01.Impuestos1Click(Sender: TObject);
begin
  mmImpuestos;
end;

procedure TFormPrincipal01.CambiarPrecios1Click(Sender: TObject);
begin
  mmCambiarPrecios;
end;

procedure TFormPrincipal01.Entradas1Click(Sender: TObject);
begin
  mmCompras;
end;

procedure TFormPrincipal01.FacturaGeneral1Click(Sender: TObject);
begin
  mmFacturacion;
end;

procedure TFormPrincipal01.Proformas1Click(Sender: TObject);
begin
  mmProformas;
end;

procedure TFormPrincipal01.Apartados1Click(Sender: TObject);
begin
  mmApartados;
end;

procedure TFormPrincipal01.A1Click(Sender: TObject);
begin
//  WebUpdate1.URLGetFile()
end;

procedure TFormPrincipal01.Acercade1Click(Sender: TObject);
begin
  mmAcercaDe;
end;

procedure TFormPrincipal01.RzRapidFireButton4Click(Sender: TObject);
begin
  mmProductos;
end;

procedure TFormPrincipal01.RzRapidFireButton3Click(Sender: TObject);
begin
  mmClientes;
end;

procedure TFormPrincipal01.RzRapidFireButton2Click(Sender: TObject);
begin
  mmProveedores;
end;

procedure TFormPrincipal01.RzRapidFireButton1Click(Sender: TObject);
begin
  mmCambiarPrecios;
end;

procedure TFormPrincipal01.Cuentas1Click(Sender: TObject);
begin
  mmCuentas;
end;

procedure TFormPrincipal01.Asientos1Click(Sender: TObject);
begin
  mmAsientos;
end;

procedure TFormPrincipal01.Recibos1Click(Sender: TObject);
begin
  mmRecibosClientes;
end;

procedure TFormPrincipal01.Recibos2Click(Sender: TObject);
begin
  mmRecibosProveedores;
end;

procedure TFormPrincipal01.CierresdeCaja1Click(Sender: TObject);
begin
  mmCierresCaja;
end;

procedure TFormPrincipal01.Ordenes1Click(Sender: TObject);
begin
  mmOrdenes;
end;

procedure TFormPrincipal01.NotasdeCrdito2Click(Sender: TObject);
begin
  mmNotasCredito;
end;

procedure TFormPrincipal01.NotasdeDebito1Click(Sender: TObject);
begin
  mmNotasDebito;
end;

procedure TFormPrincipal01.T1Click(Sender: TObject);
begin
  mmTiquetes;
end;

procedure TFormPrincipal01.RzRapidFireButton5Click(Sender: TObject);
begin
  mmFacturas_Nuevos;
end;

procedure TFormPrincipal01.RzRapidFireButton6Click(Sender: TObject);
begin
  mmRecibosClientes_Nuevos;
end;

procedure TFormPrincipal01.RzRapidFireButton7Click(Sender: TObject);
begin
  mmProformas_Nuevos;
end;

procedure TFormPrincipal01.RzRapidFireButton8Click(Sender: TObject);
begin
  mmEntradas_Nuevos;
end;

procedure TFormPrincipal01.RzRapidFireButton10Click(Sender: TObject);
begin
  mmApartados_Nuevos;
end;

procedure TFormPrincipal01.RzRapidFireButton9Click(Sender: TObject);
begin
  FormAcceso01.ShowModal;
  if FormAcceso01.Tag = 1 then
    mmCierresCaja_Nuevos;
end;

procedure TFormPrincipal01.ListadodeFamilias1Click(Sender: TObject);
begin
  mmListadoFamlias;
end;

procedure TFormPrincipal01.ListadodeProductos1Click(Sender: TObject);
begin
  mmListadoProductos;
end;

procedure TFormPrincipal01.Licencia1Click(Sender: TObject);
begin
  mmLicencia;
end;

procedure TFormPrincipal01.ListadodeClientes1Click(Sender: TObject);
begin
  mmListadoClientes;
end;

procedure TFormPrincipal01.ListadodeProveedores1Click(Sender: TObject);
begin
  mmListadoProveedores;
end;

procedure TFormPrincipal01.ListadodeVendedores1Click(Sender: TObject);
begin
  mmListadoVendedores;
end;

procedure TFormPrincipal01.Entradas2Click(Sender: TObject);
begin
  mmFacturasProveedores;
end;

procedure TFormPrincipal01.RecibosEntradas1Click(Sender: TObject);
begin
  mmRecibosAbonosProveedores
end;

procedure TFormPrincipal01.Facturas1Click(Sender: TObject);
begin
  mmFacturasClientes;
end;

procedure TFormPrincipal01.RecibosFacturas1Click(Sender: TObject);
begin
  mmRecibosAbonosClientes;
end;

procedure TFormPrincipal01.Apartados2Click(Sender: TObject);
begin
  mmReporteApartados;
end;

procedure TFormPrincipal01.RecibosApartados1Click(Sender: TObject);
begin
  mmRecibosAbonosApartados;
end;

procedure TFormPrincipal01.RecibosdeApartados1Click(Sender: TObject);
begin
  mmRecibosApartados;
end;

procedure TFormPrincipal01.Manual1Click(Sender: TObject);
begin
  mmManual;
end;

procedure TFormPrincipal01.Proformas2Click(Sender: TObject);
begin
  mmReporteProformas;
end;

procedure TFormPrincipal01.CierresdeCaja2Click(Sender: TObject);
begin
  mmReporteCierresCaja;
end;

procedure TFormPrincipal01.Compras2Click(Sender: TObject);
begin
  mmReporteCompras;
end;

procedure TFormPrincipal01.Ventas1Click(Sender: TObject);
begin
  mmReporteVentas;
end;

procedure TFormPrincipal01.EstadodeCuenta1Click(Sender: TObject);
begin
  mmEstadoCuenta;
end;

procedure TFormPrincipal01.NotasdeCrdito1Click(Sender: TObject);
begin
  mmReporteNotasCredito;
end;

procedure TFormPrincipal01.Utilidad1Click(Sender: TObject);
begin
  mmUtilidad;
end;

procedure TFormPrincipal01.ValordelInventario1Click(Sender: TObject);
begin
  mmValorInventario;
end;

procedure TFormPrincipal01.Estadistico1Click(Sender: TObject);
begin
  mEstadistico;
end;

procedure TFormPrincipal01.MovimientosdeInventario1Click(Sender: TObject);
begin
  mmReporteMovimientosInventario;
end;

procedure TFormPrincipal01.Sincronizar1Click(Sender: TObject);
begin
  mmSincronizar;
end;

procedure TFormPrincipal01.Descuentos1Click(Sender: TObject);
begin
  mmReporteDescuentos;
end;

procedure TFormPrincipal01.Kilos1Click(Sender: TObject);
begin
  mmReporteKilos;
end;

procedure TFormPrincipal01.ProductosDevueltos1Click(Sender: TObject);
begin
  mmReporteProductosDevueltos;
end;

procedure TFormPrincipal01.Mnimos1Click(Sender: TObject);
begin
  mmReporteProductosMinimos;
end;
{$ENDREGION}

procedure TFormPrincipal01.Label1Click(Sender: TObject);
begin
  ShellExecute(0, 'Open', PChar(Global.Web),
    PChar(''), nil, SW_SHOWNORMAL);
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
var
  mConfig: TConfig;
  mDL_TB_SISTEMA: TDL_TB_SISTEMA;
  mMensajeLicencia: string;
  mLicenciaValida: Boolean;
  mLicenciaGenerador: TLicenciaGenerador;
  mSerial, mUnidad, mDiscoDuroSerie, mMAC, mNombreArchivo: string;
  mArchivo: TStringList;
  mCantidadEmpresas: Integer;
  mNombreBaseDatos: string;
begin
  with Forma01 do
  begin

    try
      FormatSettings.ShortDateFormat := 'dd/MM/yyyy';
      FormatSettings.TimeSeparator := ':';
      FormatSettings.DecimalSeparator := '.';
      FormatSettings.ThousandSeparator := ',';

      _Actualizando := False;
      InicialiarSistema;

      mConfig := TConfig.Create;
      mConfig.LeerIni;
      mCantidadEmpresas := mConfig.CantidadEmpresas;
      mConfig.Destroy;

      dmLenguajes.CargarArchivo;

      RzPageControl1.ActivePageIndex := 0;

      mMensajeLicencia := 'Licencia Completa';
      mLicenciaValida := True;//LicenciaValida(mMensajeLicencia);
      if mLicenciaValida = False then
      begin
        if TieneInternet = False then
        begin
          _Resultado := -1;
          _ErrorM := 'Necesita conexi�n a Internet para activar la licencia';
          raise Exception.Create('');
        end;

        FormActivarLicencia01._Version := GetAppVersion;
        FormActivarLicencia01._Serial := Global.Serial;
        FormActivarLicencia01._Licencia := Global.Licencia;
        FormActivarLicencia01.ShowModal;
        if FormActivarLicencia01.Tag = 0 then
        begin
          _Resultado := -1;
          _ErrorM := mMensajeLicencia;
          raise Exception.Create('');
        end;
        if FormActivarLicencia01.Tag = 1 then
        begin
          mLicenciaGenerador := TLicenciaGenerador.Create(
            Global.PathAplicacion, Global.Aplicacion);
          mLicenciaGenerador.ArchivoSerial :=
            Global.Aplicacion + '.lic';
          mUnidad := Copy(Global.PathAplicacion, 1, 3);
          mDiscoDuroSerie :=
            mLicenciaGenerador.ExtraerSerieDiscoDuro(mUnidad);
          mMAC :=
            mLicenciaGenerador.GetMACAdress;
          mLicenciaGenerador.DiscoDuroSerie := mDiscoDuroSerie;
          mLicenciaGenerador.MAC := mMAC;
          mLicenciaGenerador.Licencia := Global.Licencia;
          mLicenciaGenerador.FechaInicio := Date;
          mLicenciaGenerador.FechaFin := Date;
          mLicenciaGenerador.TipoLicencia := tlCompleta;
          mLicenciaGenerador.Instalado := 3;
          mSerial := mLicenciaGenerador.Generar_Serial;
          mArchivo := TStringList.Create;
          mArchivo.Add(mSerial);
          mNombreArchivo := Global.PathAplicacion + '\' + Global.Aplicacion + '.lic';
          mArchivo.SaveToFile(mNombreArchivo);
          mArchivo.Free;
          mLicenciaGenerador.Destroy;
          mMensajeLicencia := 'Licencia Completa';
        end;
      end;

      FormPresentacion01.Show;
      FormPresentacion01.Repaint;
      Sleep(3000);

      if Global.Instalado = 0 then
      begin
        Global.DB_BaseDatos :=
          Global.PathAplicacion + '\SISFAC.FDB';
        mConfig := TConfig.Create;
        mConfig.EscribirIni_BaseDatosPathFull;
        mConfig.Destroy;
      end;

      if _Actualizando = False then
      begin
        mNombreBaseDatos := ExtractFileName(Global.DB_BaseDatos);
        mNombreBaseDatos := Copy(mNombreBaseDatos, 1, Pos('.', mNombreBaseDatos) - 1);
        mConfig := TConfig.Create;
        if mConfig.ExisteEmpresa(mNombreBaseDatos) = False then
        begin
          mConfig.EscribirIni_EmpresaLista(mNombreBaseDatos, Global.DB_BaseDatos);
        end;
        mConfig.Destroy;

        if mCantidadEmpresas > 1 then
        begin
          FormSeleccionarEmpresa01.ShowModal;
          Global.DB_BaseDatos := FormSeleccionarEmpresa01._Archivo;
        end;

        BS_DBConexion_Conectar_Main('FB');
        if _Resultado = -1 then
        begin
          Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
            'Error', MB_ICONERROR);
        end;
        if _Resultado = 1 then
        begin
          Global.ImpuestoServicio := 0;
          Global.APLICARREDONDEO := 0;
          Global.APLICARREDONDEO5 := 0;
          Global.ImpuestoIncluido := 0;
          Global.USARSEGURIDAD := 0;
          Global.USARCONTABILIDAD := 0;

          mDL_TB_SISTEMA := TDL_TB_SISTEMA.Create;
          mDL_TB_SISTEMA.Consultar(_Resultado, _ErrorM);
          with mDL_TB_SISTEMA.Dataset do
          begin
            if IsEmpty = False then
            begin
              Global.ImpuestoServicio :=
                FieldByName('ISERVICIO').AsFloat;
              Global.APLICARREDONDEO :=
                FieldByName('APLICARREDONDEO').AsInteger;
              Global.APLICARREDONDEO5 :=
                FieldByName('APLICARREDONDEO5').AsInteger;
              Global.ImpuestoIncluido :=
                FieldByName('PRODUCTOIMPUESTOINCLUIDO').AsInteger;
              Global.USARSEGURIDAD :=
                FieldByName('USARSEGURIDAD').AsInteger;
              Global.USARCONTABILIDAD :=
                FieldByName('USARCONTABILIDAD').AsInteger;
              Global.IdVendedorDefault :=
                FieldByName('IdVendedor').AsInteger;
            end;
          end;
          mDL_TB_SISTEMA.Destroy;
        end;
      end;

      if Global.Instalado = 0 then
      begin
        FormOpcionesIniciales01.ShowModal;
        if FormOpcionesIniciales01.Tag = 1 then
        begin
          Global.Instalado := 1;
          mConfig := TConfig.Create;
          mConfig.EscribirIni_Instalado;
          mConfig.Destroy;
        end;
      end;
      try
        dmConnection.DB_Conectar2(dmConnection.FDHaciendaConnection, 'MySQL',
          Global.DB_HaciendaServidor, Global.DB_HaciendaBaseDatos,
          Global.DB_HaciendaUsuario, Global.DB_HaciendaClave,
          Global.DB_HaciendaPuerto, Global.DB_HaciendaVarios,
          _Resultado, _ErrorM);
      except
        ShowMessage(_ErrorM);
      end;
      FormPresentacion01.Close;
      lvlVersion.Caption := 'versi�n: ' + GetAppVersionFinal;
      Label1.Caption := Global.Web;
      lblLicencia.Caption := mMensajeLicencia;

      if Global.USARSEGURIDAD = 1 then
      begin
        Application.ProcessMessages;
        FormAcceso02.ShowModal;
      end;

      lblEmpresa.Caption := ExtractFileName(Global.DB_BaseDatos);
      lblEmpresa.Caption := 'Empresa: ' + Copy(lblEmpresa.Caption, 1, Pos('.', lblEmpresa.Caption) - 1);

      CargarIdioma;
    except
      if _Resultado = - 1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
        FormPresentacion01.Close;
      end;
      _Resultado := -1;
      Halt(0);
    end;

  end;
end;

procedure FinalizarForma;
begin
  with Forma01 do
  begin

    try
      BS_DBConexion_Desonectar_Main;
      dmConnection.DB_Desconectar(dmConnection.FDHaciendaConnection,
        _Resultado, _ErrorM);
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

  end;
end;

{$REGION 'Funciones Menu'}
procedure mmBaseDatos;
var
  mConfig: TConfig;
begin
  with Forma01 do
  begin

    FormBaseDatos01.ShowModal;
    if FormBaseDatos01.Tag = 1 then
    begin
      BS_DBConexion_Conectar_Main('FB');
      if _Resultado = -1 then
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
    end;

  end;
end;

procedure mmEmpresas;
begin
  with Forma01 do
  begin

    FormEmpresas01._Id := 1;
    FormEmpresas01.ShowModal;

  end;
end;

procedure mmEmpresasLista;
begin
  with Forma01 do
  begin

    FormEmpresasLista01.ShowModal;

  end;
end;

procedure mmEmpresasSeleccionar;
begin
  with Forma01 do
  begin

    FormSeleccionarEmpresa01.ShowModal;
    if FormSeleccionarEmpresa01.Tag = 1 then
    begin
      Global.DB_BaseDatos := FormSeleccionarEmpresa01._Archivo;
      BS_DBConexion_Conectar_Main('FB');
      if _Resultado = -1 then
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      lblEmpresa.Caption := ExtractFileName(Global.DB_BaseDatos);
      lblEmpresa.Caption := 'Empresa: ' + Copy(lblEmpresa.Caption, 1, Pos('.', lblEmpresa.Caption) - 1);
    end;

  end;
end;

procedure mmUsuarios;
begin
  with Forma01 do
  begin

    FormMantenimientoUsuarios01.ShowModal;

  end;
end;

procedure mmOpciones;
begin
  with Forma01 do
  begin

    FormOpciones01.ShowModal;

  end;
end;

procedure mmPlantillas;
begin
  with Forma01 do
  begin

    FormMantenimientoPlantillas01.ShowModal;

  end;
end;

procedure mmSalir;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure mmFamilias;
begin
  with Forma01 do
  begin

    FormMantenimientoFamilias01.ShowModal;

  end;
end;

procedure mmGrupos;
begin
  with Forma01 do
  begin

    FormMantenimientoGrupos01.ShowModal;

  end;
end;

procedure mmProductos;
begin
  with Forma01 do
  begin

    FormMantenimientoProductos01.ShowModal;

  end;
end;

procedure mmClientes;
begin
  with Forma01 do
  begin

    FormMantenimientoClientes01.ShowModal;

  end;
end;

procedure mmProveedores;
begin
  with Forma01 do
  begin

    FormMantenimientoProveedores01.ShowModal;

  end;
end;

procedure mmVendedores;
begin
  with Forma01 do
  begin

    FormMantenimientoVendedores01.ShowModal;

  end;
end;

procedure mmImpuestos;
begin
  with Forma01 do
  begin

    FormMantenimientoImpuestos01.ShowModal;

  end;
end;

procedure mmCambiarPrecios;
begin
  with Forma01 do
  begin

    FormCambiarPrecios01.ShowModal;

  end;
end;

procedure mmCompras;
begin
  with Forma01 do
  begin

    FormMantenimientoFacturasProveedores01.ShowModal;

  end;
end;

procedure mmRecibosProveedores;
begin
  with Forma01 do
  begin

    FormMantenimientoRecibosProveedores01.ShowModal;

  end;
end;

procedure mmFacturacion;
begin
  with Forma01 do
  begin

    FormMantenimientoFacturasClientes01.ShowModal;

  end;
end;

procedure mmProformas;
begin
  with Forma01 do
  begin

    FormMantenimientoProformas01.ShowModal;

  end;
end;

procedure mmApartados;
begin
  with Forma01 do
  begin

    FormMantenimientoApartados01.ShowModal;

  end;
end;

procedure mmRecibosClientes;
begin
  with Forma01 do
  begin

    FormMantenimientoRecibosClientes01.ShowModal;

  end;
end;

procedure mmCierresCaja;
begin
  with Forma01 do
  begin

    FormAcceso01.ShowModal;
    if FormAcceso01.Tag = 1 then
      FormMantenimientoRecibosCierresCaja01.ShowModal;

  end;
end;

procedure mmOrdenes;
begin
  with Forma01 do
  begin

    FormMantenimientoOrdenes01.ShowModal;

  end;
end;

procedure mmCuentas;
begin
  with Forma01 do
  begin

    FormMantenimientoCuentas01.ShowModal;

  end;
end;

procedure mmAsientos;
begin
  with Forma01 do
  begin

    FormMantenimientoAsientos01.ShowModal;

  end;
end;

procedure mmRecibosApartados;
begin
  with Forma01 do
  begin

    FormMantenimientoRecibosApartados01.ShowModal;

  end;
end;

procedure mmNotasCredito;
begin
  with Forma01 do
  begin

    FormMantenimientoNotasCredito01.ShowModal;

  end;
end;

procedure mmNotasDebito;
begin
  with Forma01 do
  begin

    FormMantenimientoNotasDebito01.ShowModal;

  end;
end;

procedure mmTiquetes;
begin
  with Forma01 do
  begin

    FormMantenimientoNotasDebito01.ShowModal;

  end;
end;

procedure mmManual;
var
  mArchivo: string;
begin
  with Forma01 do
  begin

    mArchivo := Global.PathAplicacion + '\Manual de Usuario Sisfac.pdf';
    if FileExists(mArchivo) = True then
      ShellExecute(0, 'Open', PChar(mArchivo),
        PChar(''), nil, SW_SHOWNORMAL);

  end;
end;

procedure mmAcercaDe;
begin
  with Forma01 do
  begin

    FormAcercaDe01.ShowModal;

  end;
end;

procedure mmLicencia;
begin
  with Forma01 do
  begin

    FormPedirLicencia01.ShowModal;

  end;
end;

procedure mmFacturas_Nuevos;
begin
  with Forma01 do
  begin

    FormFacturaClientes01._IdCliente := 0;
    FormFacturaClientes01._Orden := 0;
    FormFacturaClientes01._Origen := 1;
    FormFacturaClientes01._IdEstado := 1;
    FormFacturaClientes01._IdFormaPago := 0;
    FormFacturaClientes01._IdDocumento := 0;
    FormFacturaClientes01._Numero := 0;
    FormFacturaClientes01.WindowState := wsMaximized;
    FormFacturaClientes01.ShowModal;

  end;
end;

procedure mmProformas_Nuevos;
begin
  with Forma01 do
  begin

    FormProformas01._IdEstado := 1;
    FormProformas01._IdFormaPago := 0;
    FormProformas01._IdDocumento := 0;
    FormProformas01._Numero := 0;
    FormProformas01.WindowState := wsMaximized;
    FormProformas01.ShowModal;

  end;
end;

procedure mmEntradas_Nuevos;
begin
  with Forma01 do
  begin

    FormFacturasProveedores01._IdEstado := 1;
    FormFacturasProveedores01._IdFormaPago := 0;
    FormFacturasProveedores01._IdDocumento := 0;
    FormFacturasProveedores01._Numero := 0;
    FormFacturasProveedores01.WindowState := wsMaximized;
    FormFacturasProveedores01.ShowModal;

  end;
end;

procedure mmApartados_Nuevos;
begin
  with Forma01 do
  begin

    FormApartados01._IdEstado := 1;
    FormApartados01._IdFormaPago := 0;
    FormApartados01._IdDocumento := 0;
    FormApartados01._Numero := 0;
    FormApartados01.WindowState := wsMaximized;
    FormApartados01.ShowModal;

  end;
end;

procedure mmRecibosClientes_Nuevos;
begin
  with Forma01 do
  begin

    FormRecibosClientes01._IdEstado := 1;
    FormRecibosClientes01._IdFormaPago := 0;
    FormRecibosClientes01._IdDocumento := 0;
    FormRecibosClientes01._Numero := 0;
    FormRecibosClientes01.WindowState := wsMaximized;
    FormRecibosClientes01.ShowModal;

  end;
end;

procedure mmCierresCaja_Nuevos;
begin
  with Forma01 do
  begin

    FormCierresCaja01._IdEstado := 1;
    FormCierresCaja01._IdFormaPago := 0;
    FormCierresCaja01._IdDocumento := 0;
    FormCierresCaja01._Numero := 0;
    FormCierresCaja01.ShowModal;

  end;
end;

procedure mmListadoFamlias;
begin
  with Forma01 do
  begin

    ReptListadoFamilias01.ShowModal;

  end;
end;

procedure mmListadoProductos;
begin
  with Forma01 do
  begin

    ReptListadoProductos01.ShowModal;

  end;
end;

procedure mmListadoClientes;
begin
  with Forma01 do
  begin

    ReptListadoClientes01.ShowModal;

  end;
end;

procedure mmListadoProveedores;
begin
  with Forma01 do
  begin

    ReptListadoProveedores01.ShowModal;

  end;
end;

procedure mmListadoVendedores;
begin
  with Forma01 do
  begin

    ReptListadoVendedores01.ShowModal;

  end;
end;

procedure mmFacturasProveedores;
begin
  with Forma01 do
  begin

    ReptFacturasProveedores01.ShowModal;

  end;
end;

procedure mmRecibosAbonosProveedores;
begin
  with Forma01 do
  begin

    ReptRecibosProveedores01.ShowModal;

  end;
end;

procedure mmFacturasClientes;
begin
  with Forma01 do
  begin

    ReptFacturasClientes01.ShowModal;

  end;
end;

procedure mmRecibosAbonosClientes;
begin
  with Forma01 do
  begin

    ReptRecibosClientes01.ShowModal;

  end;
end;

procedure mmReporteApartados;
begin
  with Forma01 do
  begin

    ReptApartados01.ShowModal;

  end;
end;

procedure mmRecibosAbonosApartados;
begin
  with Forma01 do
  begin

    ReptRecibosApartados01.ShowModal;

  end;
end;

procedure mmReporteProformas;
begin
  with Forma01 do
  begin

    ReptProformas01.ShowModal;

  end;
end;

procedure mmReporteCierresCaja;
begin
  with Forma01 do
  begin

    FormAcceso01.ShowModal;
    if FormAcceso01.Tag = 1 then
      ReptCierresCaja01.ShowModal;

  end;
end;

procedure mmReporteCompras;
begin
  with Forma01 do
  begin

    ReptCompras01.ShowModal;

  end;
end;

procedure mmReporteVentas;
begin
  with Forma01 do
  begin

    ReptVentas01.ShowModal;

  end;
end;

procedure mmEstadoCuenta;
begin
  with Forma01 do
  begin

    ReptEstadoCuenta01.ShowModal;

  end;
end;

procedure mmReporteNotasCredito;
begin
  with Forma01 do
  begin

    ReptNotasCredito01.ShowModal;

  end;
end;

procedure mmUtilidad;
begin
  with Forma01 do
  begin

    ReptUtilidad01.ShowModal;

  end;
end;

procedure mmValorInventario;
begin
  with Forma01 do
  begin

    ReptValorInventario01.ShowModal;

  end;
end;

procedure mEstadistico;
begin
  with Forma01 do
  begin

    ReptEstadistico01.ShowModal;

  end;
end;

procedure mmReporteMovimientosInventario;
begin
  with Forma01 do
  begin

    ReptMovimientosInventario01.ShowModal;

  end;
end;

procedure mmSincronizar;
var
  mDL_TB_SISTEMA: TDL_TB_SISTEMA;
  mTipo: Integer;
begin
  with Forma01 do
  begin

    mDL_TB_SISTEMA := TDL_TB_SISTEMA.Create;
    mTipo :=
      mDL_TB_SISTEMA.Obtener_Valor('', 'TIPOMAQUINA', _Resultado, _ErrorM);
    mDL_TB_SISTEMA.Destroy;
    if mTipo = 1 then
      mmSincronizarServidor;
    if mTipo = 2 then
      mmSincronizarCliente;

  end;
end;

procedure mmReporteDescuentos;
begin
  with Forma01 do
  begin

    ReptDescuentos01.ShowModal;

  end;
end;

procedure mmReporteKilos;
begin
  with Forma01 do
  begin

    ReptKilos01.ShowModal;

  end;
end;

procedure mmReporteProductosDevueltos;
begin
  with Forma01 do
  begin

    ReptProductosDevueltos01.ShowModal;

  end;
end;

procedure mmReporteProductosMinimos;
begin
  with Forma01 do
  begin

    ReptProductosMinimos01.ShowModal;

  end;
end;
{$ENDREGION}

function LicenciaValida(var pMensaje: string): Boolean;
var
  mLicenciaGenerador: TLicenciaGenerador;
  mResultado: Boolean;
  mUnidad: string;
  mDiscoDuroSerie: string;
  mMAC: string;
begin
  with Forma01 do
  begin

    try
      mLicenciaGenerador := TLicenciaGenerador.Create(
        Global.PathAplicacion, Global.Aplicacion);
      mLicenciaGenerador.ArchivoSerial :=
        Global.Aplicacion + '.lic';
      mUnidad := Copy(Global.PathAplicacion, 1, 3);
      mDiscoDuroSerie :=
        mLicenciaGenerador.ExtraerSerieDiscoDuro(mUnidad);
      mMAC :=
        mLicenciaGenerador.GetMACAdress;
      mResultado :=
        mLicenciaGenerador.EsSerialValido2(pMensaje,
          Global.Aplicacion, mDiscoDuroSerie, mMAC);
      Global.Licencia := mLicenciaGenerador.Licencia;
      Global.Serial := mLicenciaGenerador.Serial;
      mLicenciaGenerador.Destroy;
    except
    end;

    Result := mResultado;

  end;
end;

procedure mmSincronizarServidor;
var
  mIdConexion: Integer;
  mResultado: Integer;
  mFila, mId: Integer;
  mErrorM, mLinea: string;
  mProductosSeleccionados: string;
  mClientesSeleccionados: string;
  mDL_TB_CONEXIONES: TDL_TB_CONEXIONES;
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
  mDL_TB_PRODUCTOSMain: TDL_TB_PRODUCTOS;
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mDL_TB_CLIENTESMain: TDL_TB_CLIENTES;
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mUltimo: Integer;
  mDL_TB_APARTADOSENCABEZADO: TDL_TB_APARTADOSENCABEZADO;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_FACTURASCLIENTESENCABEZADO;
  mDL_TB_NOTASDEBITOENCABEZADO: TDL_TB_NOTASDEBITOENCABEZADO;
  mDL_TB_OrdenesEncabezado: TDL_TB_OrdenesEncabezado;
  mDL_TB_PROFORMASENCABEZADO: TDL_TB_PROFORMASENCABEZADO;
  mDL_TB_RECIBOSCLIENTESENCABEZADO: TDL_TB_RECIBOSCLIENTESENCABEZADO;
  mDL_TB_RECIBOSAPARTADOSENCABEZADO: TDL_TB_RECIBOSAPARTADOSENCABEZADO;
  mDL_TB_VENDEDORESCLIENTES: TDL_TB_VENDEDORESCLIENTES;
  mbs_DBGeneral: tbs_DBGeneral;
  mDL_TB_IMPUESTOS, mDL_TB_IMPUESTOSMain: TDL_TB_IMPUESTOS;
  mDL_TB_EMPRESAS, mDL_TB_EMPRESASMain: TDL_TB_EMPRESAS;
  mDL_TB_ESTADOS, mDL_TB_ESTADOSMain: TDL_TB_ESTADOS;
  mDL_TB_FAMILIAS, mDL_TB_FAMILIASMain: TDL_TB_FAMILIAS;
  mDL_TB_FORMASPAGO, mDL_TB_FORMASPAGOMAIN: TDL_TB_FORMASPAGO;
  mDL_TB_NIVELESUSUARIOS, mDL_TB_NIVELESUSUARIOSMain: TDL_TB_NIVELESUSUARIOS;
  mDL_TB_PLANTILLAS, mDL_TB_PLANTILLASMain: TDL_TB_PLANTILLAS;
  mDL_TB_PROVEEDORES, mDL_TB_PROVEEDORESMain: TDL_TB_PROVEEDORES;
  mDL_TB_USUARIOS, mDL_TB_USUARIOSMain: TDL_TB_USUARIOS;
  mDL_TB_VENDEDORES, mDL_TB_VENDEDORESMain: TDL_TB_VENDEDORES;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      FormRuta01.ShowModal;
      if FormRuta01.Tag = 1 then
      begin
        mIdConexion := FormRuta01._Id;
        FormListadoProductos01.ShowModal;
        FormListadoClientes01.ShowModal;

        // Productos
        mProductosSeleccionados := '0,';
        for mFila := 0 to FormListadoProductos01.lvLista1.Items.Count - 1 do
        begin
          if FormListadoProductos01.lvLista1.Items[mFila].Checked = True then
          begin
            mLinea := FormListadoProductos01.lvLista1.Items[mFila].SubItems[5];
            mProductosSeleccionados := mProductosSeleccionados + mLinea + ',';
          end;
        end;
        mProductosSeleccionados := Copy(mProductosSeleccionados, 1, Length(mProductosSeleccionados) - 1);
        mProductosSeleccionados := '(' + mProductosSeleccionados + ')';

        mDL_TB_PRODUCTOSMain := TDL_TB_PRODUCTOS.Create;
        mDL_TB_PRODUCTOSMain.Consultar(_Resultado, _ErrorM, 'A.Id In ' + mProductosSeleccionados);
        if _Resultado = -1 then
          raise Exception.Create('');

        // Clientes
        mClientesSeleccionados :=  '0,';
        for mFila := 0 to FormListadoClientes01.lvLista1.Items.Count - 1 do
        begin
          if FormListadoClientes01.lvLista1.Items[mFila].Checked = True then
          begin
            mLinea := FormListadoClientes01.lvLista1.Items[mFila].SubItems[4];
            mClientesSeleccionados := mClientesSeleccionados + mLinea + ',';
          end;
        end;
        mClientesSeleccionados := Copy(mClientesSeleccionados, 1, Length(mClientesSeleccionados) - 1);
        mClientesSeleccionados := '(' + mClientesSeleccionados + ')';

        mDL_TB_CLIENTESMain := TDL_TB_CLIENTES.Create;
        mDL_TB_CLIENTESMain.Consultar(_Resultado, _ErrorM, 'A.Id In ' + mClientesSeleccionados);
        if _Resultado = -1 then
          raise Exception.Create('');

        // Impuestos
        mDL_TB_IMPUESTOSMain := TDL_TB_IMPUESTOS.Create;
        mDL_TB_IMPUESTOSMain.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Empresas
        mDL_TB_EMPRESASMain := TDL_TB_EMPRESAS.Create;
        mDL_TB_EMPRESASMain.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Estados
        mDL_TB_EstadosMain := TDL_TB_Estados.Create;
        mDL_TB_EstadosMain.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Familias
        mDL_TB_FamiliasMain := TDL_TB_Familias.Create;
        mDL_TB_FamiliasMain.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Formas de Pago
        mDL_TB_FORMASPAGO := TDL_TB_FormasPago.Create;
        mDL_TB_FORMASPAGO.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Niveles de Usuarios
        mDL_TB_NivelesUsuarios := TDL_TB_NivelesUsuarios.Create;
        mDL_TB_NivelesUsuarios.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Plantillas
        mDL_TB_PLANTILLAS := TDL_TB_PLANTILLAS.Create;
        mDL_TB_PLANTILLAS.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Proveedores
        mDL_TB_ProveedoresMain := TDL_TB_Proveedores.Create;
        mDL_TB_ProveedoresMain.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Usuarios
        mDL_TB_UsuariosMain := TDL_TB_Usuarios.Create;
        mDL_TB_UsuariosMain.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Vendedores
        mDL_TB_VendedoresMain := TDL_TB_Vendedores.Create;
        mDL_TB_VendedoresMain.Consultar(_Resultado, _ErrorM, '');
        if _Resultado = -1 then
          raise Exception.Create('');

        // Conexion
        mDL_TB_CONEXIONES := TDL_TB_CONEXIONES.Create;
        mDL_TB_CONEXIONES.Consultar(_Resultado, _ErrorM, 'A.Id=' + IntToStr(mIdConexion));
        if _Resultado = -1 then
          raise Exception.Create('');
        if mDL_TB_CONEXIONES.Dataset.IsEmpty = False then
        begin
          Global.DB_ClienteDriver :=
            mDL_TB_CONEXIONES.Dataset.FieldByName('Driver').AsString;
          Global.DB_ClienteServidor :=
            mDL_TB_CONEXIONES.Dataset.FieldByName('IP').AsString;
          Global.DB_ClienteBaseDatos :=
            mDL_TB_CONEXIONES.Dataset.FieldByName('BaseDatos').AsString;
          Global.DB_ClienteUsuario :=
            mDL_TB_CONEXIONES.Dataset.FieldByName('Usuario').AsString;
          Global.DB_ClienteClave :=
            mDL_TB_CONEXIONES.Dataset.FieldByName('Clave').AsString;
          Global.DB_ClientePuerto :=
            mDL_TB_CONEXIONES.Dataset.FieldByName('Puerto').AsInteger;
          BS_DBConexion_Conectar_Cliente('MySQL');
          if _Resultado = -1 then
            raise Exception.Create('');
          dmConnection.FDType3Connection.Params.Clear;
          with dmConnection.FDType3Connection do
          begin
            Params.Add('DriverId=MYSQL');
            Params.Add('Server=' + Global.DB_ClienteServidor);
            Params.Add('Database=' + Global.DB_ClienteBaseDatos);
            Params.Add('User_name=' + Global.DB_ClienteUsuario);
            Params.Add('Password=' + Global.DB_ClienteClave);
            Params.Add('Port=3306');
          end;
          dmConnection.FDType3Connection.Open();
          if dmConnection.FDType3Connection.Connected = True then
          ShowMessage('Conectado');

          // Productos
          mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
          mDL_TB_PRODUCTOS.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_PRODUCTOS.Destroy;

          mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
          CopiarEstructuraProductos(mDL_TB_PRODUCTOSMain.Dataset, mDL_TB_PRODUCTOS.Dataset);
          mDL_TB_PRODUCTOS.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_PRODUCTOS.Destroy;

          // Clientes
          mDL_TB_Clientes := TDL_TB_CLIENTES.Create;
          mDL_TB_Clientes.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Clientes.Destroy;

          mDL_TB_Clientes := TDL_TB_CLIENTES.Create;
          CopiarEstructuraClientes(mDL_TB_CLIENTESMain.Dataset, mDL_TB_CLIENTES.Dataset);
          mDL_TB_Clientes.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Clientes.Destroy;

          // Impuestos
          mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
          mDL_TB_IMPUESTOS.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_IMPUESTOS.Destroy;

          mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
          mDL_TB_IMPUESTOS.Set_AutoInc(1, 2, _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_IMPUESTOS.Destroy;

          mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
          CopiarEstructuraImpuestos(mDL_TB_IMPUESTOSMain.Dataset, mDL_TB_IMPUESTOS.Dataset);
          mDL_TB_IMPUESTOS.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_IMPUESTOS.Destroy;

          // Empresas
          mDL_TB_Empresas := TDL_TB_Empresas.Create;
          mDL_TB_Empresas.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Empresas.Destroy;

          mDL_TB_Empresas := TDL_TB_Empresas.Create;
          mDL_TB_Empresas.Set_AutoInc(1, 2, _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Empresas.Destroy;

          mDL_TB_Empresas := TDL_TB_Empresas.Create;
          CopiarEstructuraEmpresas(mDL_TB_EmpresasMain.Dataset, mDL_TB_Empresas.Dataset);
          mDL_TB_Empresas.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Empresas.Destroy;

          // Estados
          mDL_TB_Estados := TDL_TB_Estados.Create;
          mDL_TB_Estados.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Estados.Destroy;

          mDL_TB_Estados := TDL_TB_Estados.Create;
          CopiarEstructuraEstados(mDL_TB_EstadosMain.Dataset, mDL_TB_Estados.Dataset);
          mDL_TB_Estados.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Estados.Destroy;

          // Familias
          mDL_TB_Familias := TDL_TB_Familias.Create;
          mDL_TB_Familias.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Familias.Destroy;

          mDL_TB_Familias := TDL_TB_Familias.Create;
          mDL_TB_Familias.Set_AutoInc(1, 2, _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Familias.Destroy;

          mDL_TB_Familias := TDL_TB_Familias.Create;
          CopiarEstructuraFamilias(mDL_TB_FamiliasMain.Dataset, mDL_TB_Familias.Dataset);
          mDL_TB_Familias.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Familias.Destroy;

          // Formas de Pago
          mDL_TB_FORMASPAGO := TDL_TB_FORMASPAGO.Create;
          mDL_TB_FORMASPAGO.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_FORMASPAGO.Destroy;

          mDL_TB_FORMASPAGO := TDL_TB_FORMASPAGO.Create;
          CopiarEstructuraFormasPago(mDL_TB_FORMASPAGOMain.Dataset, mDL_TB_FORMASPAGO.Dataset);
          mDL_TB_FORMASPAGO.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_FORMASPAGO.Destroy;

          // Niveles de Usuarios
          mDL_TB_NivelesUsuarios := TDL_TB_NivelesUsuarios.Create;
          mDL_TB_NivelesUsuarios.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_NivelesUsuarios.Destroy;

          mDL_TB_NivelesUsuarios := TDL_TB_NivelesUsuarios.Create;
          CopiarEstructuraNivelesUsuarios(mDL_TB_NivelesUsuariosMain.Dataset, mDL_TB_NivelesUsuarios.Dataset);
          mDL_TB_NivelesUsuarios.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_NivelesUsuarios.Destroy;

          // Plantillas
          mDL_TB_Plantillas := TDL_TB_Plantillas.Create;
          mDL_TB_Plantillas.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Plantillas.Destroy;

          mDL_TB_Plantillas := TDL_TB_Plantillas.Create;
          CopiarEstructuraPlantillas(mDL_TB_PlantillasMain.Dataset, mDL_TB_Plantillas.Dataset);
          mDL_TB_Plantillas.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Plantillas.Destroy;

          // Proveedoes
          mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
          mDL_TB_PROVEEDORES.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_PROVEEDORES.Destroy;

          mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
          mDL_TB_PROVEEDORES.Set_AutoInc(1, 2, _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_PROVEEDORES.Destroy;

          mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
          CopiarEstructuraPROVEEDORES(mDL_TB_PROVEEDORESMain.Dataset, mDL_TB_PROVEEDORES.Dataset);
          mDL_TB_PROVEEDORES.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_PROVEEDORES.Destroy;

          // Usuarios
          mDL_TB_Usuarios := TDL_TB_Usuarios.Create;
          mDL_TB_Usuarios.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Usuarios.Destroy;

          mDL_TB_Usuarios := TDL_TB_Usuarios.Create;
          mDL_TB_Usuarios.Set_AutoInc(1, 2, _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Usuarios.Destroy;

          mDL_TB_Usuarios := TDL_TB_Usuarios.Create;
          CopiarEstructuraUsuarios(mDL_TB_UsuariosMain.Dataset, mDL_TB_Usuarios.Dataset);
          mDL_TB_Usuarios.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Usuarios.Destroy;

          // Vendedores
          mDL_TB_Vendedores := TDL_TB_Vendedores.Create;
          mDL_TB_Vendedores.Eliminar('', _Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Vendedores.Destroy;

          mDL_TB_Vendedores := TDL_TB_Vendedores.Create;
          CopiarEstructuraVendedores(mDL_TB_VendedoresMain.Dataset, mDL_TB_Vendedores.Dataset);
          mDL_TB_Vendedores.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_Vendedores.Destroy;

          dmConnection.FDType3Connection.Close;
        end;
        mDL_TB_PRODUCTOSMain.Destroy;
        mDL_TB_CLIENTESMain.Destroy;
        mDL_TB_IMPUESTOSMain.Destroy;
        mDL_TB_EMPRESASMain.Destroy;
        mDL_TB_EstadosMain.Destroy;
        mDL_TB_FamiliasMain.Destroy;
        mDL_TB_FORMASPAGO.Destroy;
        mDL_TB_NivelesUsuarios.Destroy;
        mDL_TB_PLANTILLAS.Destroy;
        mDL_TB_ProveedoresMain.Destroy;
        mDL_TB_UsuariosMain.Destroy;
        mDL_TB_VendedoresMain.Destroy;
        mDL_TB_CONEXIONES.Destroy;
      end;

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

procedure mmSincronizarCliente;
var
  mIdConexion: Integer;
  mResultado: Integer;
  mFila, mId: Integer;
  mErrorM, mLinea: string;
  mProductosSeleccionados: string;
  mDL_TB_CONEXIONES: TDL_TB_CONEXIONES;
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
  mDL_TB_PRODUCTOSMain: TDL_TB_PRODUCTOS;
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mDL_TB_CLIENTESMain: TDL_TB_CLIENTES;
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mUltimo: Integer;
  mDL_TB_APARTADOSENCABEZADO: TDL_TB_APARTADOSENCABEZADO;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_FACTURASCLIENTESENCABEZADO;
  mDL_TB_NOTASDEBITOENCABEZADO: TDL_TB_NOTASDEBITOENCABEZADO;
  mDL_TB_OrdenesEncabezado: TDL_TB_OrdenesEncabezado;
  mDL_TB_PROFORMASENCABEZADO: TDL_TB_PROFORMASENCABEZADO;
  mDL_TB_RECIBOSCLIENTESENCABEZADO: TDL_TB_RECIBOSCLIENTESENCABEZADO;
  mDL_TB_RECIBOSAPARTADOSENCABEZADO: TDL_TB_RECIBOSAPARTADOSENCABEZADO;
  mDL_TB_VENDEDORESCLIENTES: TDL_TB_VENDEDORESCLIENTES;
  mbs_DBGeneral: tbs_DBGeneral;
  mDL_TB_IMPUESTOS, mDL_TB_IMPUESTOSMain: TDL_TB_IMPUESTOS;
  mDL_TB_EMPRESAS, mDL_TB_EMPRESASMain: TDL_TB_EMPRESAS;
  mDL_TB_ESTADOS, mDL_TB_ESTADOSMain: TDL_TB_ESTADOS;
  mDL_TB_FAMILIAS, mDL_TB_FAMILIASMain: TDL_TB_FAMILIAS;
  mDL_TB_FORMASPAGO, mDL_TB_FORMASPAGOMAIN: TDL_TB_FORMASPAGO;
  mDL_TB_NIVELESUSUARIOS, mDL_TB_NIVELESUSUARIOSMain: TDL_TB_NIVELESUSUARIOS;
  mDL_TB_PLANTILLAS, mDL_TB_PLANTILLASMain: TDL_TB_PLANTILLAS;
  mDL_TB_PROVEEDORES, mDL_TB_PROVEEDORESMain: TDL_TB_PROVEEDORES;
  mDL_TB_USUARIOS, mDL_TB_USUARIOSMain: TDL_TB_USUARIOS;
  mDL_TB_VENDEDORES, mDL_TB_VENDEDORESMain: TDL_TB_VENDEDORES;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      // Productos
      mDL_TB_PRODUCTOSMain := TDL_TB_PRODUCTOS.Create;
      mDL_TB_PRODUCTOSMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_PRODUCTOSMain.Destroy;

      // Clientes
      mDL_TB_CLIENTESMain := TDL_TB_CLIENTES.Create;
      mDL_TB_CLIENTESMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CLIENTESMain.Destroy;

      // Impuestos
      mDL_TB_IMPUESTOSMain := TDL_TB_IMPUESTOS.Create;
      mDL_TB_IMPUESTOSMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_IMPUESTOSMain.Destroy;

      // Empresas
      mDL_TB_EmpresasMain := TDL_TB_Empresas.Create;
      mDL_TB_EmpresasMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_EmpresasMain.Destroy;

      // Estados
      mDL_TB_EstadosMain := TDL_TB_Estados.Create;
      mDL_TB_EstadosMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_EstadosMain.Destroy;

      // Familias
      mDL_TB_FamiliasMain := TDL_TB_Familias.Create;
      mDL_TB_FamiliasMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FamiliasMain.Destroy;

      // Formas de Pago
      mDL_TB_FORMASPAGOMain := TDL_TB_FORMASPAGO.Create;
      mDL_TB_FORMASPAGOMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FORMASPAGOMain.Destroy;

      // Niveles de Usuarios
      mDL_TB_NivelesUsuariosMain := TDL_TB_NivelesUsuarios.Create;
      mDL_TB_NivelesUsuariosMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_NivelesUsuariosMain.Destroy;

      // Plantillas
      mDL_TB_PlantillasMain := TDL_TB_Plantillas.Create;
      mDL_TB_PlantillasMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_PlantillasMain.Destroy;

      // Proveedores
      mDL_TB_ProveedoresMain := TDL_TB_Proveedores.Create;
      mDL_TB_ProveedoresMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_ProveedoresMain.Destroy;

      // Usuarios
      mDL_TB_UsuariosMain := TDL_TB_Usuarios.Create;
      mDL_TB_UsuariosMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_UsuariosMain.Destroy;

      // Vendedores
      mDL_TB_VendedoresMain := TDL_TB_Vendedores.Create;
      mDL_TB_VendedoresMain.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_VendedoresMain.Destroy;

      // Conexiones
      mDL_TB_CONEXIONES := TDL_TB_CONEXIONES.Create;
      mDL_TB_CONEXIONES.Consultar(_Resultado, _ErrorM, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONEXIONES.Dataset.First;
      if mDL_TB_CONEXIONES.Dataset.IsEmpty = False then
      begin
        Global.DB_ClienteDriver :=
          mDL_TB_CONEXIONES.Dataset.FieldByName('Driver').AsString;
        Global.DB_ClienteServidor :=
          mDL_TB_CONEXIONES.Dataset.FieldByName('IP').AsString;
        Global.DB_ClienteBaseDatos :=
          mDL_TB_CONEXIONES.Dataset.FieldByName('BaseDatos').AsString;
        Global.DB_ClienteUsuario :=
          mDL_TB_CONEXIONES.Dataset.FieldByName('Usuario').AsString;
        Global.DB_ClienteClave :=
          mDL_TB_CONEXIONES.Dataset.FieldByName('Clave').AsString;
        Global.DB_ClientePuerto :=
          mDL_TB_CONEXIONES.Dataset.FieldByName('Puerto').AsInteger;
        BS_DBConexion_Conectar_Cliente('MySQL');
        if _Resultado = -1 then
          raise Exception.Create('');
        dmConnection.FDType3Connection.Params.Clear;
        with dmConnection.FDType3Connection do
        begin
          Params.Add('DriverId=MYSQL');
          Params.Add('Server=' + Global.DB_ClienteServidor);
          Params.Add('Database=' + Global.DB_ClienteBaseDatos);
          Params.Add('User_name=' + Global.DB_ClienteUsuario);
          Params.Add('Password=' + Global.DB_ClienteClave);
          Params.Add('Port=3306');
        end;
        dmConnection.FDType3Connection.Open();

        // Productos
        mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
        mDL_TB_PRODUCTOS.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        mDL_TB_PRODUCTOSMain := TDL_TB_PRODUCTOS.Create;
        CopiarEstructuraProductos(mDL_TB_PRODUCTOS.Dataset, mDL_TB_PRODUCTOSMain.Dataset);
        mDL_TB_PRODUCTOS.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');

        // Clientes
        mDL_TB_Clientes := TDL_TB_CLIENTES.Create;
        mDL_TB_Clientes.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        mDL_TB_CLIENTESMain := TDL_TB_CLIENTES.Create;
        CopiarEstructuraClientes(mDL_TB_CLIENTES.Dataset, mDL_TB_CLIENTESMain.Dataset);
        mDL_TB_Clientes.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        // Impuestos
        mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
        mDL_TB_IMPUESTOS.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        mDL_TB_IMPUESTOSMain := TDL_TB_IMPUESTOS.Create;
        mDL_TB_IMPUESTOSMain.Set_AutoInc(1, 1, _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraImpuestos(mDL_TB_IMPUESTOS.Dataset, mDL_TB_IMPUESTOSMain.Dataset);
        mDL_TB_IMPUESTOS.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_IMPUESTOS.Destroy;

        // Empresas
        mDL_TB_Empresas := TDL_TB_Empresas.Create;
        mDL_TB_Empresas.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        mDL_TB_EmpresasMain := TDL_TB_Empresas.Create;
        mDL_TB_EmpresasMain.Set_AutoInc(1, 1, _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraEmpresas(mDL_TB_Empresas.Dataset, mDL_TB_EmpresasMain.Dataset);
        mDL_TB_Empresas.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_Empresas.Destroy;

        // Estados
        mDL_TB_Estados := TDL_TB_Estados.Create;
        mDL_TB_Estados.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraEstados(mDL_TB_Estados.Dataset, mDL_TB_EstadosMain.Dataset);
        mDL_TB_Estados.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_Estados.Destroy;

        // Familias
        mDL_TB_Familias := TDL_TB_Familias.Create;
        mDL_TB_Familias.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        mDL_TB_FamiliasMain := TDL_TB_Familias.Create;
        mDL_TB_FamiliasMain.Set_AutoInc(1, 1, _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraFamilias(mDL_TB_Familias.Dataset, mDL_TB_FamiliasMain.Dataset);
        mDL_TB_Familias.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_Familias.Destroy;

        // Formas de Pago
        mDL_TB_FormasPago := TDL_TB_FormasPago.Create;
        mDL_TB_FormasPago.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraFormasPago(mDL_TB_FormasPago.Dataset, mDL_TB_FormasPagoMain.Dataset);
        mDL_TB_FormasPago.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_FormasPago.Destroy;

        // Niveles de Usuarios
        mDL_TB_NivelesUsuarios := TDL_TB_NivelesUsuarios.Create;
        mDL_TB_NivelesUsuarios.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraNivelesUsuarios(mDL_TB_NivelesUsuarios.Dataset, mDL_TB_NivelesUsuariosMain.Dataset);
        mDL_TB_FormasPago.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_NivelesUsuarios.Destroy;

        // Plantillas
        mDL_TB_Plantillas := TDL_TB_Plantillas.Create;
        mDL_TB_Plantillas.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraPlantillas(mDL_TB_Plantillas.Dataset, mDL_TB_PlantillasMain.Dataset);
        mDL_TB_FormasPago.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_Plantillas.Destroy;

        // Proveedores
        mDL_TB_Proveedores := TDL_TB_Proveedores.Create;
        mDL_TB_Proveedores.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        mDL_TB_ProveedoresMain := TDL_TB_Proveedores.Create;
        mDL_TB_ProveedoresMain.Set_AutoInc(1, 1, _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraProveedores(mDL_TB_Proveedores.Dataset, mDL_TB_ProveedoresMain.Dataset);
        mDL_TB_Proveedores.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_Proveedores.Destroy;

        // Usuarios
        mDL_TB_Usuarios := TDL_TB_Usuarios.Create;
        mDL_TB_Usuarios.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        mDL_TB_UsuariosMain := TDL_TB_Usuarios.Create;
        mDL_TB_UsuariosMain.Set_AutoInc(1, 1, _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraUsuarios(mDL_TB_Usuarios.Dataset, mDL_TB_UsuariosMain.Dataset);
        mDL_TB_Usuarios.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_Usuarios.Destroy;

        // Vendedores
        mDL_TB_Vendedores := TDL_TB_Vendedores.Create;
        mDL_TB_Vendedores.Consultar(_Resultado, _ErrorM, '', '', '', '', '', nil, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');

        CopiarEstructuraVendedores(mDL_TB_Vendedores.Dataset, mDL_TB_VendedoresMain.Dataset);
        mDL_TB_Vendedores.Insertar(_Resultado, _ErrorM, udmConnection.Type3);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_Estados.Destroy;

        dmConnection.FDType3Connection.Close;
      end;
      mDL_TB_PRODUCTOS.Destroy;
      mDL_TB_Clientes.Destroy;
      mDL_TB_IMPUESTOS.Destroy;

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

procedure CopiarEstructuraProductos(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('CODIGO').Tag := 1;
          dsDestino.FieldByName('CODIGO').AsString :=
            FieldByName('CODIGO').AsString;
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.FieldByName('EXISTENCIA').Tag := 1;
          dsDestino.FieldByName('EXISTENCIA').AsFloat :=
            FieldByName('EXISTENCIA').AsFloat;
          dsDestino.FieldByName('EXISTENCIAMINIMA').Tag := 1;
          dsDestino.FieldByName('EXISTENCIAMINIMA').AsFloat :=
            FieldByName('EXISTENCIAMINIMA').AsFloat;
          dsDestino.FieldByName('APLICAREXISTENCIAMINIMA').Tag := 1;
          dsDestino.FieldByName('APLICAREXISTENCIAMINIMA').AsInteger := 1;
          dsDestino.FieldByName('APLICARIVA').Tag := 1;
          dsDestino.FieldByName('APLICARIVA').AsInteger := 1;
          dsDestino.FieldByName('COMPROMETIDOS').Tag := 1;
          dsDestino.FieldByName('COMPROMETIDOS').AsFloat := 0;
          dsDestino.FieldByName('PRECIOCOSTO').Tag := 1;
          dsDestino.FieldByName('PRECIOCOSTO').AsFloat :=
            FieldByName('PRECIOCOSTO').AsFloat;
          dsDestino.FieldByName('PRECIOVENTA').Tag := 1;
          dsDestino.FieldByName('PRECIOVENTA').AsFloat :=
            FieldByName('PRECIOVENTA').AsFloat;
          dsDestino.FieldByName('UTILIDAD').Tag := 1;
          dsDestino.FieldByName('UTILIDAD').AsFloat :=
            FieldByName('UTILIDAD').AsFloat;
          dsDestino.FieldByName('CODIGOIMPUESTO').Tag := 1;
          dsDestino.FieldByName('CODIGOIMPUESTO').AsInteger :=
            FieldByName('CODIGOIMPUESTO').AsInteger;
          dsDestino.FieldByName('CODIGOBARRAS').Tag := 1;
          dsDestino.FieldByName('CODIGOBARRAS').AsString :=
            FieldByName('CODIGOBARRAS').AsString;
          dsDestino.FieldByName('PRECIOVENTASIMPLE').Tag := 1;
          dsDestino.FieldByName('PRECIOVENTASIMPLE').AsFloat :=
            FieldByName('PRECIOVENTASIMPLE').AsFloat;
          dsDestino.FieldByName('PRECIOMAYORISTA').Tag := 1;
          dsDestino.FieldByName('PRECIOMAYORISTA').AsFloat :=
            FieldByName('PRECIOMAYORISTA').AsFloat;
          dsDestino.FieldByName('IDProveedor').Tag := 1;
          dsDestino.FieldByName('IDProveedor').AsInteger :=
            FieldByName('IDProveedor').AsInteger;
          dsDestino.FieldByName('CODIGOFAMILIA').Tag := 1;
          dsDestino.FieldByName('CODIGOFAMILIA').AsInteger :=
            FieldByName('CODIGOFAMILIA').AsInteger;
          dsDestino.FieldByName('IdTipo').Tag := 1;
          dsDestino.FieldByName('IdTipo').AsInteger :=
            FieldByName('IdTipo').AsInteger;
          dsDestino.FieldByName('FechaVencimiento').Tag := 1;
          dsDestino.FieldByName('FechaVencimiento').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FechaVencimiento').AsDateTime);
          dsDestino.FieldByName('ESCOMPUESTO').Tag := 1;
          dsDestino.FieldByName('ESCOMPUESTO').AsInteger :=
            FieldByName('ESCOMPUESTO').AsInteger;
          dsDestino.FieldByName('Peso').Tag := 1;
          dsDestino.FieldByName('Peso').AsFloat :=
            FieldByName('Peso').AsFloat;
          dsDestino.FieldByName('MINIMOLUNES').Tag := 1;
          dsDestino.FieldByName('MINIMOLUNES').AsFloat :=
            FieldByName('MINIMOLUNES').AsFloat;
          dsDestino.FieldByName('MINIMOMARTES').Tag := 1;
          dsDestino.FieldByName('MINIMOMARTES').AsFloat :=
            FieldByName('MINIMOMARTES').AsFloat;
          dsDestino.FieldByName('MINIMOMIERCOLES').Tag := 1;
          dsDestino.FieldByName('MINIMOMIERCOLES').AsFloat :=
            FieldByName('MINIMOMIERCOLES').AsFloat;
          dsDestino.FieldByName('MINIMOJUEVES').Tag := 1;
          dsDestino.FieldByName('MINIMOJUEVES').AsFloat :=
            FieldByName('MINIMOJUEVES').AsFloat;
          dsDestino.FieldByName('MINIMOVIERNES').Tag := 1;
          dsDestino.FieldByName('MINIMOVIERNES').AsFloat :=
            FieldByName('MINIMOVIERNES').AsFloat;
          dsDestino.FieldByName('MINIMOSABADO').Tag := 1;
          dsDestino.FieldByName('MINIMOSABADO').AsFloat :=
            FieldByName('MINIMOSABADO').AsFloat;
          dsDestino.FieldByName('MINIMODOMINGO').Tag := 1;
          dsDestino.FieldByName('MINIMODOMINGO').AsFloat :=
            FieldByName('MINIMODOMINGO').AsFloat;
          dsDestino.FieldByName('PERMITIRDESCUENTOS').Tag := 1;
          dsDestino.FieldByName('PERMITIRDESCUENTOS').AsInteger :=
            FieldByName('PERMITIRDESCUENTOS').AsInteger;
          dsDestino.FieldByName('CODIGOCOMANDA').Tag := 1;
          dsDestino.FieldByName('CODIGOCOMANDA').AsInteger :=
            FieldByName('CODIGOCOMANDA').AsInteger;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraClientes(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('CODIGO').Tag := 1;
          dsDestino.FieldByName('CODIGO').AsString :=
            FieldByName('CODIGO').AsString;
          dsDestino.FieldByName('FECHAALTA').Tag := 1;
          dsDestino.FieldByName('FECHAALTA').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHAALTA').AsDateTime);
          dsDestino.FieldByName('NOMBRECOMPLETO').Tag := 1;
          dsDestino.FieldByName('NOMBRECOMPLETO').AsString :=
            FieldByName('NOMBRECOMPLETO').AsString;
          dsDestino.FieldByName('DIRECCION').Tag := 1;
          dsDestino.FieldByName('DIRECCION').AsString :=
            FieldByName('DIRECCION').AsString;
          dsDestino.FieldByName('EMAIL').Tag := 1;
          dsDestino.FieldByName('EMAIL').AsString :=
            FieldByName('EMAIL').AsString;
          dsDestino.FieldByName('TELEFONO1').Tag := 1;
          dsDestino.FieldByName('TELEFONO1').AsString :=
            FieldByName('TELEFONO1').AsString;
          dsDestino.FieldByName('TELEFONO2').Tag := 1;
          dsDestino.FieldByName('TELEFONO2').AsString :=
            FieldByName('TELEFONO2').AsString;
          dsDestino.FieldByName('SALDO').Tag := 1;
          dsDestino.FieldByName('SALDO').AsFloat :=
            FieldByName('SALDO').AsFloat;
          dsDestino.FieldByName('LIMITECREDITO').Tag := 1;
          dsDestino.FieldByName('LIMITECREDITO').AsFloat :=
            FieldByName('LIMITECREDITO').AsFloat;
          dsDestino.FieldByName('APLICARLIMITECREDITO').Tag := 1;
          dsDestino.FieldByName('APLICARLIMITECREDITO').AsInteger :=
            FieldByName('APLICARLIMITECREDITO').AsInteger;
          dsDestino.FieldByName('CONTACTONOMBRE').Tag := 1;
          dsDestino.FieldByName('CONTACTONOMBRE').AsString :=
            FieldByName('CONTACTONOMBRE').AsString;
          dsDestino.FieldByName('TIPOPAGO').Tag := 1;
          dsDestino.FieldByName('TIPOPAGO').AsInteger :=
            FieldByName('TIPOPAGO').AsInteger;
          dsDestino.FieldByName('PLAZO').Tag := 1;
          dsDestino.FieldByName('PLAZO').AsInteger :=
            FieldByName('PLAZO').AsInteger;
          dsDestino.FieldByName('APLICARIMPUESTO').Tag := 1;
          dsDestino.FieldByName('APLICARIMPUESTO').AsInteger :=
            FieldByName('APLICARIMPUESTO').AsInteger;
          dsDestino.FieldByName('DescuentoPor').Tag := 1;
          dsDestino.FieldByName('DescuentoPor').AsFloat :=
            FieldByName('DescuentoPor').AsFloat;
          dsDestino.FieldByName('CodigoEstado').Tag := 1;
          dsDestino.FieldByName('CodigoEstado').AsInteger :=
            FieldByName('CodigoEstado').AsInteger;
          dsDestino.FieldByName('Temp').Tag := 1;
          dsDestino.FieldByName('Temp').AsInteger :=
            FieldByName('Temp').AsInteger;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraImpuestos(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.FieldByName('PORCENTAJE').Tag := 1;
          dsDestino.FieldByName('PORCENTAJE').AsFloat :=
            FieldByName('PORCENTAJE').AsFloat;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraEmpresas(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('CODIGO').Tag := 1;
          dsDestino.FieldByName('CODIGO').AsInteger :=
            FieldByName('CODIGO').AsInteger;
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.FieldByName('CEDULA').Tag := 1;
          dsDestino.FieldByName('CEDULA').AsString :=
            FieldByName('CEDULA').AsString;
          dsDestino.FieldByName('DIRECCION').Tag := 1;
          dsDestino.FieldByName('DIRECCION').AsString :=
            FieldByName('DIRECCION').AsString;
          dsDestino.FieldByName('TELEFONO1').Tag := 1;
          dsDestino.FieldByName('TELEFONO1').AsString :=
            FieldByName('TELEFONO1').AsString;
          dsDestino.FieldByName('TELEFONO2').Tag := 1;
          dsDestino.FieldByName('TELEFONO2').AsString :=
            FieldByName('TELEFONO2').AsString;
          dsDestino.FieldByName('FAX').Tag := 1;
          dsDestino.FieldByName('FAX').AsString :=
            FieldByName('FAX').AsString;
          dsDestino.FieldByName('EMAIL').Tag := 1;
          dsDestino.FieldByName('EMAIL').AsString :=
            FieldByName('EMAIL').AsString;
          dsDestino.FieldByName('WEB').Tag := 1;
          dsDestino.FieldByName('WEB').AsString :=
            FieldByName('WEB').AsString;
          dsDestino.FieldByName('NombreJuridico').Tag := 1;
          dsDestino.FieldByName('NombreJuridico').AsString :=
            FieldByName('NombreJuridico').AsString;
          dsDestino.FieldByName('RedSocial').Tag := 1;
          dsDestino.FieldByName('RedSocial').AsString :=
            FieldByName('RedSocial').AsString;
          dsDestino.FieldByName('INICIOPERIODOFISCAL').Tag := 1;
          dsDestino.FieldByName('INICIOPERIODOFISCAL').AsString := '01/01/2000';
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraEstados(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraFamilias(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraFormasPago(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraNivelesUsuarios(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraPlantillas(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('DESCRIPCION').Tag := 1;
          dsDestino.FieldByName('DESCRIPCION').AsString :=
            FieldByName('DESCRIPCION').AsString;
          dsDestino.FieldByName('PLANTILLA').Tag := 1;
          dsDestino.FieldByName('PLANTILLA').AsString :=
            FieldByName('PLANTILLA').AsString;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraProveedores(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('CODIGO').Tag := 1;
          dsDestino.FieldByName('CODIGO').AsString :=
            FieldByName('CODIGO').AsString;
          dsDestino.FieldByName('FECHAALTA').Tag := 1;
          dsDestino.FieldByName('FECHAALTA').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHAALTA').AsDateTime);
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.FieldByName('APELLIDO1').Tag := 1;
          dsDestino.FieldByName('APELLIDO1').AsString :=
            FieldByName('APELLIDO1').AsString;
          dsDestino.FieldByName('APELLIDO2').Tag := 1;
          dsDestino.FieldByName('APELLIDO2').AsString :=
            FieldByName('APELLIDO2').AsString;
          dsDestino.FieldByName('NOMBRECOMPLETO').Tag := 1;
          dsDestino.FieldByName('NOMBRECOMPLETO').AsString :=
            FieldByName('NOMBRECOMPLETO').AsString;
          dsDestino.FieldByName('CODIGOPOSTAL').Tag := 1;
          dsDestino.FieldByName('CODIGOPOSTAL').AsString :=
            FieldByName('CODIGOPOSTAL').AsString;
          dsDestino.FieldByName('DIRECCION').Tag := 1;
          dsDestino.FieldByName('DIRECCION').AsString :=
            FieldByName('DIRECCION').AsString;
          dsDestino.FieldByName('EMAIL').Tag := 1;
          dsDestino.FieldByName('EMAIL').AsString :=
            FieldByName('EMAIL').AsString;
          dsDestino.FieldByName('TELEFONO1').Tag := 1;
          dsDestino.FieldByName('TELEFONO1').AsString :=
            FieldByName('TELEFONO1').AsString;
          dsDestino.FieldByName('TELEFONO2').Tag := 1;
          dsDestino.FieldByName('TELEFONO2').AsString :=
            FieldByName('TELEFONO2').AsString;
          dsDestino.FieldByName('WEB').Tag := 1;
          dsDestino.FieldByName('WEB').AsString :=
            FieldByName('WEB').AsString;
          dsDestino.FieldByName('NOMBREIMPRIMIR').Tag := 1;
          dsDestino.FieldByName('NOMBREIMPRIMIR').AsString :=
            FieldByName('NOMBREIMPRIMIR').AsString;
          dsDestino.FieldByName('CEDULA').Tag := 1;
          dsDestino.FieldByName('CEDULA').AsString :=
            FieldByName('CEDULA').AsString;
          dsDestino.FieldByName('SALDO').Tag := 1;
          dsDestino.FieldByName('SALDO').AsFloat :=
            FieldByName('SALDO').AsFloat;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraUsuarios(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('USUARIO').Tag := 1;
          dsDestino.FieldByName('USUARIO').AsString :=
            FieldByName('USUARIO').AsString;
          dsDestino.FieldByName('CLAVE').Tag := 1;
          dsDestino.FieldByName('CLAVE').AsString :=
            FieldByName('CLAVE').AsString;
          dsDestino.FieldByName('FECHAALTA').Tag := 1;
          dsDestino.FieldByName('FECHAALTA').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHAALTA').AsDateTime);
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.FieldByName('APELLIDO1').Tag := 1;
          dsDestino.FieldByName('APELLIDO1').AsString :=
            FieldByName('APELLIDO1').AsString;
          dsDestino.FieldByName('APELLIDO2').Tag := 1;
          dsDestino.FieldByName('APELLIDO2').AsString :=
            FieldByName('APELLIDO2').AsString;
          dsDestino.FieldByName('NOMBRECOMPLETO').Tag := 1;
          dsDestino.FieldByName('NOMBRECOMPLETO').AsString :=
            FieldByName('NOMBRECOMPLETO').AsString;
          dsDestino.FieldByName('CODIGOPOSTAL').Tag := 1;
          dsDestino.FieldByName('CODIGOPOSTAL').AsString :=
            FieldByName('CODIGOPOSTAL').AsString;
          dsDestino.FieldByName('DIRECCION').Tag := 1;
          dsDestino.FieldByName('DIRECCION').AsString :=
            FieldByName('DIRECCION').AsString;
          dsDestino.FieldByName('EMAIL').Tag := 1;
          dsDestino.FieldByName('EMAIL').AsString :=
            FieldByName('EMAIL').AsString;
          dsDestino.FieldByName('TELEFONO1').Tag := 1;
          dsDestino.FieldByName('TELEFONO1').AsString :=
            FieldByName('TELEFONO1').AsString;
          dsDestino.FieldByName('TELEFONO2').Tag := 1;
          dsDestino.FieldByName('TELEFONO2').AsString :=
            FieldByName('TELEFONO2').AsString;
          dsDestino.FieldByName('CODIGONIVEL').Tag := 1;
          dsDestino.FieldByName('CODIGONIVEL').AsInteger :=
            FieldByName('CODIGONIVEL').AsInteger;
          dsDestino.FieldByName('CODIGOESTADO').Tag := 1;
          dsDestino.FieldByName('CODIGOESTADO').AsInteger :=
            FieldByName('CODIGOESTADO').AsInteger;
          dsDestino.FieldByName('CEDULA').Tag := 1;
          dsDestino.FieldByName('CEDULA').AsString :=
            FieldByName('CEDULA').AsString;
          dsDestino.FieldByName('ESVISIBLE').Tag := 1;
          dsDestino.FieldByName('ESVISIBLE').AsInteger :=
            FieldByName('ESVISIBLE').AsInteger;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructuraVendedores(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      dsDestino.EmptyDataSet;

      with dsOrigen do
      begin
        First;
        while Not Eof do
        begin
          dsDestino.Append;
          dsDestino.FieldByName('Id').Tag := 1;
          dsDestino.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          dsDestino.FieldByName('CODIGO').Tag := 1;
          dsDestino.FieldByName('CODIGO').AsString :=
            FieldByName('CODIGO').AsString;
          dsDestino.FieldByName('FECHAALTA').Tag := 1;
          dsDestino.FieldByName('FECHAALTA').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHAALTA').AsDateTime);
          dsDestino.FieldByName('NOMBRE').Tag := 1;
          dsDestino.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          dsDestino.FieldByName('APELLIDO1').Tag := 1;
          dsDestino.FieldByName('APELLIDO1').AsString :=
            FieldByName('APELLIDO1').AsString;
          dsDestino.FieldByName('APELLIDO2').Tag := 1;
          dsDestino.FieldByName('APELLIDO2').AsString :=
            FieldByName('APELLIDO2').AsString;
          dsDestino.FieldByName('NOMBRECOMPLETO').Tag := 1;
          dsDestino.FieldByName('NOMBRECOMPLETO').AsString :=
            FieldByName('NOMBRECOMPLETO').AsString;
          dsDestino.FieldByName('CODIGOPOSTAL').Tag := 1;
          dsDestino.FieldByName('CODIGOPOSTAL').AsString :=
            FieldByName('CODIGOPOSTAL').AsString;
          dsDestino.FieldByName('DIRECCION').Tag := 1;
          dsDestino.FieldByName('DIRECCION').AsString :=
            FieldByName('DIRECCION').AsString;
          dsDestino.FieldByName('EMAIL').Tag := 1;
          dsDestino.FieldByName('EMAIL').AsString :=
            FieldByName('EMAIL').AsString;
          dsDestino.FieldByName('TELEFONO1').Tag := 1;
          dsDestino.FieldByName('TELEFONO1').AsString :=
            FieldByName('TELEFONO1').AsString;
          dsDestino.FieldByName('TELEFONO2').Tag := 1;
          dsDestino.FieldByName('TELEFONO2').AsString :=
            FieldByName('TELEFONO2').AsString;
          dsDestino.FieldByName('WEB').Tag := 1;
          dsDestino.FieldByName('WEB').AsString :=
            FieldByName('WEB').AsString;
          dsDestino.FieldByName('NOMBREIMPRIMIR').Tag := 1;
          dsDestino.FieldByName('NOMBREIMPRIMIR').AsString :=
            FieldByName('NOMBREIMPRIMIR').AsString;
          dsDestino.FieldByName('CEDULA').Tag := 1;
          dsDestino.FieldByName('CEDULA').AsString :=
            FieldByName('CEDULA').AsString;
          dsDestino.Post;

          Next;
        end;
      end;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure CopiarEstructura2(dsOrigen: TFDMemTable; dsDestino: TFDMemTable);
var
  mColumnas: Integer;
  mLista1: TStringList;
begin
  mLista1 := TStringList.Create;
{  with dsDestino do
  begin
    First;
    for mColumnas := 0 to FieldCount - 1 do
      mLista1.Add(Fields[mColumnas].AsString);
  end;  }

  dsDestino.EmptyDataSet;
 // mLista1.Add(Fields[mColumnas].AsString);
  with dsOrigen do
  begin
    First;
    while not Eof do
    begin
      dsDestino.Append;
      for mColumnas := 0 to FieldCount - 4 do
      begin
        mLista1.Add(Fields[mColumnas].FieldName);

        dsDestino.Fields[mColumnas].Tag := 1;
        dsDestino.Fields[mColumnas].Value := Fields[mColumnas].Value;
      end;
      dsDestino.Post;
      Next;
    end;
  end;

end;

procedure CargarIdioma;
var
  mValor: string;
begin
  with Forma01 do
  begin

    mValor := TabSheet1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      TabSheet1.Caption := mValor;

    mValor := RzRapidFireButton4.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton4.Caption := mValor;

    mValor := RzRapidFireButton3.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton3.Caption := mValor;

    mValor := RzRapidFireButton2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton2.Caption := mValor;

    mValor := RzRapidFireButton1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton1.Caption := mValor;

    mValor := TabSheet2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      TabSheet2.Caption := mValor;

    mValor := RzRapidFireButton5.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton5.Caption := mValor;

    mValor := RzRapidFireButton6.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton6.Caption := mValor;

    mValor := RzRapidFireButton7.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton7.Caption := mValor;

    mValor := RzRapidFireButton8.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton8.Caption := mValor;

    mValor := RzRapidFireButton9.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton9.Caption := mValor;

    mValor := RzRapidFireButton10.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RzRapidFireButton10.Caption := mValor;

    mValor := TabSheet3.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      TabSheet3.Caption := mValor;

    mValor := Label2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Label2.Caption := mValor;

    mValor := Label3.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Label3.Caption := mValor;

    mValor := Label4.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Label4.Caption := mValor;

    mValor := lblLicencia.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      lblLicencia.Caption := mValor;

    mValor := 'Sistema';
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Sistema1.Caption := mValor;

    mValor := BasedeDatos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      BasedeDatos1.Caption := mValor;

    mValor := Empresas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Empresas1.Caption := mValor;

    mValor := Usuarios1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Usuarios1.Caption := mValor;

    mValor := Opciones1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Opciones1.Caption := mValor;

    mValor := Plantillas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Plantillas1.Caption := mValor;

    mValor := Sincronizar1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Sincronizar1.Caption := mValor;

    mValor := Salir1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Salir1.Caption := mValor;

    mValor := 'Mantenimientos';
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Mantenimientos1.Caption := mValor;

    mValor := Familias1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Familias1.Caption := mValor;

    mValor := Grupos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Grupos1.Caption := mValor;

    mValor := Productos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Productos1.Caption := mValor;

    mValor := Clientes1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Clientes1.Caption := mValor;

    mValor := Proveedores1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Proveedores1.Caption := mValor;

    mValor := Vendedores1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Vendedores1.Caption := mValor;

    mValor := Impuestos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Impuestos1.Caption := mValor;

    mValor := CambiarPrecios1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      CambiarPrecios1.Caption := mValor;

    mValor := Compras1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Compras1.Caption := mValor;

    mValor := 'Compras';
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Entradas1.Caption := mValor;

    mValor := Recibos2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Recibos2.Caption := mValor;

    mValor := 'Facturacion';
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Facturacin1.Caption := mValor;

    mValor := FacturaGeneral1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      FacturaGeneral1.Caption := mValor;

    mValor := Proformas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Proformas1.Caption := mValor;

    mValor := Apartados1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Apartados1.Caption := mValor;

    mValor := Recibos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Recibos1.Caption := mValor;

    mValor := CierresdeCaja1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      CierresdeCaja1.Caption := mValor;

    mValor := RecibosdeApartados1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RecibosdeApartados1.Caption := mValor;

    mValor := Ordenes1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Ordenes1.Caption := mValor;

    mValor := NotasdeCrdito2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      NotasdeCrdito2.Caption := mValor;

    mValor := 'Contabilidad';
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Contabilidad1.Caption := mValor;

    mValor := Cuentas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Cuentas1.Caption := mValor;

    mValor := Asientos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Asientos1.Caption := mValor;

    mValor := 'Reportes';
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Reportes1.Caption := mValor;

    mValor := ListadodeFamilias1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      ListadodeFamilias1.Caption := mValor;

    mValor := ListadodeProductos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      ListadodeProductos1.Caption := mValor;

    mValor := ListadodeClientes1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      ListadodeClientes1.Caption := mValor;

    mValor := ListadodeProveedores1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      ListadodeProveedores1.Caption := mValor;

    mValor := ListadodeVendedores1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      ListadodeVendedores1.Caption := mValor;

    mValor := Entradas2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Entradas2.Caption := mValor;

    mValor := RecibosEntradas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RecibosEntradas1.Caption := mValor;

    mValor := Facturas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Facturas1.Caption := mValor;

    mValor := RecibosFacturas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RecibosFacturas1.Caption := mValor;

    mValor := Apartados2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Apartados2.Caption := mValor;

    mValor := RecibosApartados1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      RecibosApartados1.Caption := mValor;

    mValor := Proformas2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Proformas2.Caption := mValor;

    mValor := CierresdeCaja2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      CierresdeCaja2.Caption := mValor;

    mValor := Compras2.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Compras2.Caption := mValor;

    mValor := Ventas1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Ventas1.Caption := mValor;

    mValor := EstadodeCuenta1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      EstadodeCuenta1.Caption := mValor;

    mValor := NotasdeCrdito1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      NotasdeCrdito1.Caption := mValor;

    mValor := Utilidad1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Utilidad1.Caption := mValor;

    mValor := ValordelInventario1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      ValordelInventario1.Caption := mValor;

    mValor := Estadistico1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Estadistico1.Caption := mValor;

    mValor := MovimientosdeInventario1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      MovimientosdeInventario1.Caption := mValor;

    mValor := Descuentos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Descuentos1.Caption := mValor;

    mValor := Kilos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Kilos1.Caption := mValor;

    mValor := ProductosDevueltos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      ProductosDevueltos1.Caption := mValor;

    mValor := Mnimos1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Mnimos1.Caption := mValor;

    mValor := Ayuda1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Ayuda1.Caption := mValor;

    mValor := Manual1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Manual1.Caption := mValor;

    mValor := 'Ayuda';
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      A1.Caption := mValor;

    mValor := Acercade1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Acercade1.Caption := mValor;

    mValor := Licencia1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      Licencia1.Caption := mValor;

    mValor := I1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      I1.Caption := mValor;

    mValor := L1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      L1.Caption := mValor;

    mValor := S1.Caption;
    mValor := dmLenguajes.GetValue(mValor);
    if Trim(mValor) <> '' then
      S1.Caption := mValor;
  end;
end;
{$ENDREGION}

end.
{1010011010}
