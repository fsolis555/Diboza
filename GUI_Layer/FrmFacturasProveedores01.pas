unit FrmFacturasProveedores01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, RzListVw, RzStatus, Vcl.Mask, RxToolEdit,
  RxCurrEdit, Vcl.ImgList,
  System.RegularExpressions, uDL_Skeleton, Vcl.Menus, RzButton,
  System.DateUtils,
  FireDAC.Comp.Client, Data.DB, uDL_TB_AsientosDetalle, RzEdit;

type
  TFormFacturasProveedores01 = class(TForm)
    pnlEncabezado: TRzPanel;
    Label14: TLabel;
    Label16: TLabel;
    lblFechaVencimiento: TLabel;
    cbProveedor: TComboBoxEx;
    edtLimiteCredito: TCurrencyEdit;
    btnBuscar_Clientes: TBitBtn;
    pnlTitulo: TRzPanel;
    pnlTitulo1: TRzPanel;
    pnlTitulo2: TRzPanel;
    pnlEstado: TRzPanel;
    pnlEstado1: TRzPanel;
    pnlEstado2: TRzPanel;
    pnlEstado4: TRzPanel;
    pnlEstado3: TRzPanel;
    pnlOpciones: TRzPanel;
    pnlOpciones1: TRzPanel;
    btnImprimir: TRzToolButton;
    btnPagar: TBitBtn;
    btnNuevo: TBitBtn;
    btnAnular: TBitBtn;
    btnCerrar: TBitBtn;
    pnlTotal: TRzPanel;
    pnlCampos: TRzPanel;
    pnlDetalle: TRzPanel;
    pnlDetalle2: TRzPanel;
    btnEliminarLinea: TBitBtn;
    btnInsertarLinea: TBitBtn;
    pnlDetalle1: TRzPanel;
    pnlDetalle11: TRzPanel;
    pnlCodigoProducto: TRzPanel;
    Label5: TLabel;
    edtCodigoProducto: TButtonedEdit;
    pnlCodigoBarras: TRzPanel;
    Label6: TLabel;
    edtCodigoBarras: TButtonedEdit;
    pnlCantidad: TRzPanel;
    Label7: TLabel;
    edtCantidad: TCurrencyEdit;
    pnlDescuentoDetalle: TRzPanel;
    Label8: TLabel;
    edtDescuento: TCurrencyEdit;
    pnlDetalle12: TRzPanel;
    pnlProducto: TRzPanel;
    Label9: TLabel;
    edtProductoNombre: TButtonedEdit;
    pnlPrecio: TRzPanel;
    Label10: TLabel;
    edtPrecio: TCurrencyEdit;
    pnlExistencia: TRzPanel;
    Label11: TLabel;
    edtExistencia: TCurrencyEdit;
    pnlDescripcion1: TRzPanel;
    Label12: TLabel;
    edtDescripcion1: TButtonedEdit;
    pnlDescripcion2: TRzPanel;
    Label13: TLabel;
    edtDescripcion2: TButtonedEdit;
    pnlListaTitulo: TRzPanel;
    chkTodoLista1: TCheckBox;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    lvLista1: TRzListView;
    pnlPie: TRzPanel;
    pnlSubTotal: TRzPanel;
    Label1: TLabel;
    pnlDescuento: TRzPanel;
    Label2: TLabel;
    pnlServicio: TRzPanel;
    Label3: TLabel;
    pnlImpuesto: TRzPanel;
    Label4: TLabel;
    ImageList1: TImageList;
    popImprimir: TPopupMenu;
    Imprimir1: TMenuItem;
    VistaPrevia1: TMenuItem;
    btnDescuentoMonto: TBitBtn;
    popDetalle: TPopupMenu;
    CambiarDetalle1: TMenuItem;
    Label15: TLabel;
    edtDocumentoOrigen: TEdit;
    dtpFecha: TRzDateTimeEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnAnularClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscar_ClientesClick(Sender: TObject);
    procedure btnInsertarLineaClick(Sender: TObject);
    procedure btnEliminarLineaClick(Sender: TObject);
    procedure edtCodigoProductoExit(Sender: TObject);
    procedure edtCodigoBarrasExit(Sender: TObject);
    procedure edtCodigoProductoRightButtonClick(Sender: TObject);
    procedure edtProductoNombreRightButtonClick(Sender: TObject);
    procedure chkTodoLista1Click(Sender: TObject);
    procedure edtCodigoProductoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodigoBarrasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCantidadKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDescuentoMontoClick(Sender: TObject);
    procedure CambiarDetalle1Click(Sender: TObject);
  private
    FIdDocumento: Integer;
    FIdEstado: Integer;
    FIdFormaPago: Integer;
    FNumero: Integer;
  public
    property _IdDocumento: Integer read FIdDocumento write FIdDocumento;
    property _IdEstado: Integer read FIdEstado write FIdEstado;
    property _IdFormaPago: Integer read FIdFormaPago write FIdFormaPago;
    property _Numero: Integer read FNumero write FNumero;
  end;

var
  FormFacturasProveedores01: TFormFacturasProveedores01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure LimpiarCampos_Titulo;
  procedure LimpiarCampos_Encabezado;
  procedure LimpiarCampos_DetalleCampos;
  procedure LimpiarCampos_DetalleLista;
  procedure LimpiarCampos_Pie;
  procedure Insertar_Detalle;
  procedure Eliminar_Detalle;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Buscar_ProductoCodigo(pTexto: string);
  procedure Buscar_ProductoCodigoBarras(pTexto: string);
  procedure DBToFormaDetalle(ds1: TDatasetMem);
  procedure ActualizarTotales(ds1: TDatasetMem);
  procedure LlenarcbClientes(cb: TComboBoxEx);
  procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
  procedure Nuevo;
  procedure Pagar_Data;
  procedure Anular_Data;
  procedure Imprimir_Data;
  procedure VistaPrevia;
  procedure Cerrar;
  procedure Consultar_Encabezado(pId: Integer);
  procedure DBToFormaEncabezado(ds1: TDatasetMem);
  procedure Consultar_Detalle(pId: Integer);
  procedure CamposValidos_Pagar1;
  procedure CamposValidos_Pagar2;
  procedure CamposValidos_Detalle;
  procedure CambiarDetalle;
  procedure DescuentoMonto;
  procedure Insertar_AsientoDetalle(pAsientoDetalle: TDL_TB_AsientosDetalle;
    pIdAsiento: Integer; pTipoPago: Integer);
  procedure Insertar_AsientoDetalle_Anulado(pAsientoDetalle: TDL_TB_AsientosDetalle;
    pIdAsiento: Integer; pTipoPago: Integer);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_ENTRADASENCABEZADO, BS_DBConexion,
  FrmMensaje_Espera01, uDL_TB_PRODUCTOS, uDL_TB_ENTRADASDETALLE,
  uDL_TB_PROVEEDORES, FrmMantenimientoProveedores01,
  FrmMantenimientoVendedores01, FrmMantenimientoProductos01,
  uDL_TB_CONSECUTIVOS, FrmBuscar_Productos01, uDL_TB_PLANTILLAS,
  FrmPagar01, udmReports, uDL_TB_EMPRESAS, FrmCambiarDetalle01,
  FrmDesuentoMonto01, uDL_TB_AsientosEncabezado,
  DL_DBGeneral, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_ENTRADASENCABEZADO;
  Clase_Tipo2 = TDL_TB_ENTRADASDETALLE;

const
  lv_Nombre = 0;
  lv_id = 1;

var
  Forma01: TFormFacturasProveedores01;
  _IdProducto: Integer;
  _DL_TB_FACTURASDETALLEActual: Clase_Tipo2;
  _SubTotal: Double;
  _DescuentoM: Double;
  _IVAM: Double;
  _ISM: Double;
  _Total: Double;

{$REGION 'Funciones Forma'}
procedure TFormFacturasProveedores01.FormShow(Sender: TObject);
begin
  Forma01 := FormFacturasProveedores01;

  InicializarForma;
end;

procedure TFormFacturasProveedores01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormFacturasProveedores01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormFacturasProveedores01.btnNuevoClick(Sender: TObject);
begin
  Nuevo;
end;

procedure TFormFacturasProveedores01.btnPagarClick(Sender: TObject);
begin
  Pagar_Data;
end;

procedure TFormFacturasProveedores01.CambiarDetalle1Click(Sender: TObject);
begin
  CambiarDetalle;
end;

procedure TFormFacturasProveedores01.btnAnularClick(Sender: TObject);
begin
  Anular_Data;
end;

procedure TFormFacturasProveedores01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormFacturasProveedores01.btnDescuentoMontoClick(Sender: TObject);
begin
  DescuentoMonto;
end;

procedure TFormFacturasProveedores01.btnBuscar_ClientesClick(Sender: TObject);
begin
  FormMantenimientoProveedores01.ShowModal;
  LlenarcbClientes(cbProveedor);
end;

procedure TFormFacturasProveedores01.btnInsertarLineaClick(Sender: TObject);
begin
  Insertar_Detalle;
  edtCodigoProducto.SetFocus;
end;

procedure TFormFacturasProveedores01.btnEliminarLineaClick(Sender: TObject);
begin
  Eliminar_Detalle;
  edtCodigoProducto.SetFocus;
end;

procedure TFormFacturasProveedores01.edtCodigoProductoExit(Sender: TObject);
begin
  Buscar_ProductoCodigo(edtCodigoProducto.Text);
end;

procedure TFormFacturasProveedores01.edtCodigoBarrasExit(Sender: TObject);
begin
  Buscar_ProductoCodigoBarras(edtCodigoBarras.Text);
end;

procedure TFormFacturasProveedores01.edtCodigoProductoRightButtonClick(
  Sender: TObject);
begin
  FormBuscar_Productos01.ShowModal;
  if FormBuscar_Productos01.Tag = 1 then
  begin
    edtCodigoProducto.Text := FormBuscar_Productos01._Codigo;
    Buscar_ProductoCodigo(edtCodigoProducto.Text);
  end;
  edtCodigoProducto.SetFocus;
end;

procedure TFormFacturasProveedores01.edtProductoNombreRightButtonClick(
  Sender: TObject);
begin
  FormMantenimientoProductos01.ShowModal;
  edtCodigoProducto.SetFocus;
end;

procedure TFormFacturasProveedores01.chkTodoLista1Click(Sender: TObject);
begin
  MDLista_Todos(lvLista1, chkTodoLista1);
  edtCodigoProducto.SetFocus;
end;

procedure TFormFacturasProveedores01.edtCodigoProductoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    edtCodigoBarras.SetFocus;
  end;
end;

procedure TFormFacturasProveedores01.edtCodigoBarrasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    edtCantidad.SetFocus;
  end;
end;

procedure TFormFacturasProveedores01.edtCantidadKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    btnInsertarLinea.Click;
  end;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _DL_TB_FACTURASDETALLEActual := Clase_Tipo2.Create;

      LlenarcbClientes(cbProveedor);
      if _Resultado = -1 then
        raise Exception.Create('');

      LimpiarCampos;
      CargarIdioma;

      if _IdEstado = 1 then
      begin
        btnPagar.Enabled := True;
        btnAnular.Enabled := False;
        btnImprimir.Enabled := False;
        pnlEstado.Enabled := True;
        pnlEncabezado.Enabled := True;
        pnlDetalle.Enabled := True;
        pnlListaTitulo.Enabled := True;
        lblFechaVencimiento.Visible := False;
        pnlTitulo2.Caption := 'Abierta';
        pnlEstado3.Caption := '';
        pnlEstado1.Caption := '';
        edtCodigoProducto.SetFocus;
      end;
      if _IdEstado = 2 then
      begin
        btnPagar.Enabled := False;
        btnAnular.Enabled := True;
        btnImprimir.Enabled := True;
        Consultar_Encabezado(_IdDocumento);
        Consultar_Detalle(_Numero);
        pnlEstado.Enabled := False;
        pnlEncabezado.Enabled := False;
        pnlDetalle.Enabled := False;
        pnlListaTitulo.Enabled := True;
        if _IdFormaPago = 1 then
          lblFechaVencimiento.Visible := False;
        if _IdFormaPago = 5 then
          lblFechaVencimiento.Visible := True;
        pnlTitulo2.Caption := 'Pagada';
        if _IdFormaPago = 1 then
          pnlEstado3.Caption := 'Contado';
        if _IdFormaPago = 5 then
          pnlEstado3.Caption := 'Cr�dito';
        pnlEstado1.Caption := 'N�mero: ' + IntToStr(_Numero);
      end;
      if _IdEstado = 3 then
      begin
        btnPagar.Enabled := False;
        btnAnular.Enabled := False;
        btnImprimir.Enabled := True;
        Consultar_Encabezado(_IdDocumento);
        Consultar_Detalle(_Numero);
        pnlEstado.Enabled := False;
        pnlEncabezado.Enabled := False;
        pnlDetalle.Enabled := False;
        pnlListaTitulo.Enabled := True;
        if _IdFormaPago = 1 then
          lblFechaVencimiento.Visible := False;
        if _IdFormaPago = 5 then
          lblFechaVencimiento.Visible := True;
        pnlTitulo2.Caption := 'Anulada';
        if _IdFormaPago = 1 then
          pnlEstado3.Caption := 'Contado';
        if _IdFormaPago = 5 then
          pnlEstado3.Caption := 'Cr�dito';
        pnlEstado1.Caption := 'N�mero: ' + IntToStr(_Numero);
      end;
      if _IdEstado = 4 then
      begin
        btnPagar.Enabled := False;
        btnAnular.Enabled := True;
        btnImprimir.Enabled := True;
        Consultar_Encabezado(_IdDocumento);
        Consultar_Detalle(_Numero);
        pnlEstado.Enabled := False;
        pnlEncabezado.Enabled := False;
        pnlDetalle.Enabled := False;
        pnlListaTitulo.Enabled := True;
        if _IdFormaPago = 1 then
          lblFechaVencimiento.Visible := False;
        if _IdFormaPago = 5 then
          lblFechaVencimiento.Visible := True;
        pnlTitulo2.Caption := 'Pendiente';
        if _IdFormaPago = 1 then
          pnlEstado3.Caption := 'Contado';
        if _IdFormaPago = 5 then
          pnlEstado3.Caption := 'Cr�dito';
        pnlEstado1.Caption := 'N�mero: ' + IntToStr(_Numero);
      end;

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
      _DL_TB_FACTURASDETALLEActual.Destroy;
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
   { if Key = VK_F2 then
    begin
      Key := 0;
      Insertar;
    end;
    if Key = VK_F3 then
    begin
      Key := 0;
      btnModificar.Click;
    end;
    if Key = VK_F4 then
    begin
      Key := 0;
      btnRefrescar.Click;
    end;
    if (Key = (ord('T') Or ord('t'))) and (Shift = [ssCtrl]) then
    begin
      Key := 0;
      lvLista1.SetFocus;
    end;
           }
  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    LimpiarCampos_Titulo;
    LimpiarCampos_Encabezado;
    LimpiarCampos_DetalleCampos;
    LimpiarCampos_DetalleLista;
    LimpiarCampos_Pie;

  end;
end;

procedure LimpiarCampos_Titulo;
begin
  with Forma01 do
  begin

    pnlTitulo2.Caption := '';
    pnlEstado1.Caption := 'N�mero: ';
    dtpFecha.Date := Date;
    pnlEstado3.Caption := '';
    pnlEstado4.Caption := '';
    pnlTotal.Caption := '0';

  end;
end;

procedure LimpiarCampos_Encabezado;
begin
  with Forma01 do
  begin

    cbProveedor.ItemIndex := 0;
    edtLimiteCredito.Value := 0;
    lblFechaVencimiento.Visible := False;
    edtDocumentoOrigen.Clear;

  end;
end;

procedure LimpiarCampos_DetalleCampos;
begin
  with Forma01 do
  begin

    _IdProducto := 0;
    edtCodigoProducto.Clear;
    edtCodigoBarras.Clear;
    edtCantidad.Value := 1;
    edtDescuento.Value := 0;
    edtProductoNombre.Clear;
    edtPrecio.Value := 0;
    edtExistencia.Value := 0;
    edtDescripcion1.Clear;
    edtDescripcion2.Clear;

  end;
end;

procedure LimpiarCampos_DetalleLista;
begin
  with Forma01 do
  begin

    chkTodoLista1.Checked := False;
    lvLista1.Items.Clear;

  end;
end;

procedure LimpiarCampos_Pie;
begin
  with Forma01 do
  begin

    pnlSubTotal.Caption := '0';
    pnlDescuento.Caption := '0';
    pnlServicio.Caption := '0';
    pnlImpuesto.Caption := '0';

  end;
end;

procedure Insertar_Detalle;
var
  mProductos: TDL_TB_PRODUCTOS;
  mWhere: TStringList;
  mCantidadAnterior, mCantidad, mPrecio, mPrecioDescuento, mPrecioServicio, mPrecioFinal, mMonto: Double;
  mDescuentoP, mDescuentoPM, mDescuentoM: Double;
  mServicioPM, mServicioM: Double;
  mIVAPorcentaje, mIVAPM, mIVAM: Double;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      CamposValidos_Detalle;
      if _Resultado = 0 then
        raise Exception.Create('');

      mCantidadAnterior := 0;
      mEncontrado :=
        _DL_TB_FACTURASDETALLEActual.Dataset.Locate('IdProducto', _IdProducto, []);
      if mEncontrado = True then
        mCantidadAnterior :=
          _DL_TB_FACTURASDETALLEActual.Dataset.FieldByName('Cantidad').AsFloat;

      mCantidad := edtCantidad.Value + mCantidadAnterior;
      mPrecio := edtPrecio.Value;

      // Calcula el Descuento
      mDescuentoPM := 0;
      mDescuentoP := edtDescuento.Value;
      if mDescuentoP <> 0 then
        mDescuentoPM := mDescuentoP / 100;
      mDescuentoM := (mPrecio * mDescuentoPM) * mCantidad;
      mPrecioDescuento := mPrecio - (mPrecio * mDescuentoPM);

      mPrecioServicio := mPrecioDescuento;

      // Obtener Impuesto Porcentaje
      {mIVAPorcentaje := 0;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(_IdProducto));
      mProductos := TDL_TB_PRODUCTOS.Create;
      mIVAPorcentaje :=
        mProductos.Obtener_ImpuestoPorcentaje(mWhere.Text,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mProductos.Destroy;   }

      // Calcula el Impuesto
      {mIVAPM := 0;
      if mIVAPorcentaje <> 0 then
        mIVAPM := mIVAPorcentaje / 100;
      mIVAM := (mPrecioServicio * mIVAPM) * mCantidad;
      mPrecioFinal := mPrecioServicio - (mPrecioServicio * mIVAPM);
                                                  }
      mPrecioFinal := mPrecioServicio;

      mMonto := mPrecioFinal * mCantidad;

      // Llena el DataSet
      with _DL_TB_FACTURASDETALLEActual.Dataset do
      begin
        if mEncontrado = True then
          Edit;
        if mEncontrado = False then
          Append;
        FieldByName('CODIGO').Tag := 1;
        FieldByName('CODIGO').AsString :=
          edtCodigoProducto.Text;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtProductoNombre.Text;
        FieldByName('CANTIDAD').Tag := 1;
        FieldByName('CANTIDAD').AsFloat :=
          mCantidad;
        FieldByName('PRECIOUNITARIO').Tag := 1;
        FieldByName('PRECIOUNITARIO').AsFloat :=
          mPrecio;
        FieldByName('DESCUENTOP').Tag := 1;
        FieldByName('DESCUENTOP').AsFloat :=
          mDescuentoP;
        FieldByName('DESCUENTOM').Tag := 1;
        FieldByName('DESCUENTOM').AsFloat :=
          mDescuentoM;
        FieldByName('IVAP').Tag := 1;
        FieldByName('IVAP').AsFloat :=
          0;
        FieldByName('IVAM').Tag := 1;
        FieldByName('IVAM').AsFloat :=
          0;
        FieldByName('PRECIOUNITARIOFINAL').Tag := 1;
        FieldByName('PRECIOUNITARIOFINAL').AsFloat :=
          mPrecioFinal;
        FieldByName('PRECIOFINAL').Tag := 1;
        FieldByName('PRECIOFINAL').AsFloat :=
          mMonto;
        FieldByName('LINEA').Tag := 1;
        FieldByName('LINEA').AsInteger := 0;
        FieldByName('IdProducto').Tag := 1;
        FieldByName('IdProducto').AsInteger :=
          _IdProducto;
        Post;
      end;

      LlenarlvLista1(lvLista1, _DL_TB_FACTURASDETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_FACTURASDETALLEActual.Dataset);
      LimpiarCampos_DetalleCampos;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure Eliminar_Detalle;
var
  mFila: Integer;
  mLinea: string;
  mIdProducto: Integer;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      for mFila := 0 to lvLista1.Items.Count - 1 do
      begin
        if lvLista1.Items[mFila].Checked = True then
        begin
          mLinea := lvLista1.Items[mFila].SubItems[5];
          try
            mIdProducto := StrToInt(mLinea);
          except
            mIdProducto := 0;
          end;
          mEncontrado :=
            _DL_TB_FACTURASDETALLEActual.Dataset.Locate('IdProducto', mIdProducto, []);
          if mEncontrado = True then
            _DL_TB_FACTURASDETALLEActual.Dataset.Delete;
        end;
      end;

      LlenarlvLista1(lvLista1, _DL_TB_FACTURASDETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_FACTURASDETALLEActual.Dataset);

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    lv.Items.Clear;

    with ds1 do
    begin
      RzStatusPane1.Caption := 'Registros: ' +
        FormatFloat('#,##0', RecordCount);
      First;
      while not Eof do
      begin
        with lv.Items.Add do
        begin
          Caption := '';
          SubItems.Add(
            FieldByName('CODIGO').AsString);
          SubItems.Add(
            FieldByName('NOMBRE').AsString);
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('CANTIDAD').AsFloat));
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('PRECIOUNITARIO').AsFloat));
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('PRECIOFINAL').AsFloat));
          SubItems.Add(
            FieldByName('IdProducto').AsString);
          SubItems.Add(
            FieldByName('ID').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Buscar_ProductoCodigo(pTexto: string);
var
  mBS_Productos: TDL_TB_PRODUCTOS;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mTexto: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;
      mTexto := Trim(pTexto);

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Productos := TDL_TB_PRODUCTOS.Create;
      mWhere := TStringList.Create;
      mWhere.Add('Upper(A.CODIGO)=Upper(' + QuotedStr(mTexto) + ')');
      mBS_Productos.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToFormaDetalle(mBS_Productos.Dataset);
      with mBS_Productos.Dataset do
      begin
        if IsEmpty = False then
          edtCodigoBarras.Text :=
            FieldByName('CODIGOBARRAS').AsString;
      end;
      mBS_Productos.Destroy;

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

procedure Buscar_ProductoCodigoBarras(pTexto: string);
var
  mBS_Productos: TDL_TB_PRODUCTOS;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mTexto: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;
      mTexto := Trim(pTexto);

      if mTexto <> '' then
      begin
        _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

        mBS_Productos := TDL_TB_PRODUCTOS.Create;
        mWhere := TStringList.Create;
        mWhere.Add('A.CODIGOBARRAS=' + QuotedStr(mTexto));
        mBS_Productos.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
        if _Resultado = -1 then
          raise Exception.Create('');
        mWhere.Free;
        DBToFormaDetalle(mBS_Productos.Dataset);
        with mBS_Productos.Dataset do
        begin
          if IsEmpty = False then
            edtCodigoProducto.Text :=
              FieldByName('CODIGO').AsString;
        end;
        mBS_Productos.Destroy;

        _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);
      end;

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

procedure DBToFormaDetalle(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      _IdProducto :=
        FieldByName('Id').AsInteger;

      edtProductoNombre.Text :=
        FieldByName('Nombre').AsString;
      edtPrecio.Value :=
        FieldByName('PRECIOCOSTO').AsFloat;
      edtExistencia.Value :=
        FieldByName('EXISTENCIA').AsFloat;
    end;

  end;
end;

procedure ActualizarTotales(ds1: TDatasetMem);
var
  mSubTotal, mDescuento, mServicio, mImpuesto, mTotal: Double;
begin
  with Forma01 do
  begin

    mSubTotal := 0;
    mDescuento := 0;
    mServicio := 0;
    mImpuesto := 0;
    mTotal := 0;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        mSubTotal := mSubTotal +
          FieldByName('PRECIOFINAL').AsFloat;
        mDescuento := mDescuento +
          FieldByName('DESCUENTOM').AsFloat;
        mImpuesto := mImpuesto +
          FieldByName('IVAM').AsFloat;

        Next;
      end;
    end;

    mTotal := mSubTotal + mServicio + mImpuesto;

    pnlSubTotal.Caption :=
      FormatFloat('#,##0.00', mSubTotal);
    pnlDescuento.Caption :=
      FormatFloat('#,##0.00', mDescuento);
    pnlServicio.Caption :=
      FormatFloat('#,##0.00', mServicio);
    pnlImpuesto.Caption :=
      FormatFloat('#,##0.00', mImpuesto);
    pnlTotal.Caption :=
      FormatFloat('#,##0.00', mTotal);

    _SubTotal := mSubTotal;
    _DescuentoM := mDescuento;
    _IVAM := mImpuesto;
    _ISM := mServicio;
    _Total := mTotal;

  end;
end;

procedure LlenarcbClientes(cb: TComboBoxEx);
var
  mDL_TB_PROVEEDORES: TDL_TB_PROVEEDORES;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mOrderBy.Add('A.NOMBRECOMPLETO');
      mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
      mDL_TB_PROVEEDORES.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_PROVEEDORES.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRECOMPLETO').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_PROVEEDORES.Destroy;

      _Resultado := 1;
    except
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

procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
var
  mFila: Integer;
begin
  with Forma01 do
  begin

    for mFila := 0 to lv.Items.Count - 1 do
      lv.Items[mFila].Checked := chk.Checked;

  end;
end;

procedure Nuevo;
begin
  with Forma01 do
  begin

    InicializarForma;

  end;
end;

procedure Pagar_Data;
var
  mDL_TB_FACTURASCLIENTESENCABEZADO: Clase_Tipo1;
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mDL_TB_PROVEEDORES: TDL_TB_PROVEEDORES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mNumero: Integer;
  mNombreCliente, mNombreVendedor: string;
  mFechaVencimiento: TDateTime;
  mDL_TB_AsientosEncabezado: TDL_TB_AsientosEncabezado;
  mDL_TB_AsientosDetalle: TDL_TB_AsientosDetalle;
  mIdAsiento: Integer;
  mbs_DBGeneral: tbs_DBGeneral;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      CamposValidos_Pagar1;
      if _Resultado = 0 then
        raise Exception.Create('');

      FormPagar01._PasaForma := False;
      FormPagar01._TipoPago := 1;
      FormPagar01.pnlCredito.Visible := True;
      FormPagar01._Total := _Total;
      FormPagar01._Plazo := Global.DiasVencimientoDefault;
      FormPagar01.ShowModal;
      if FormPagar01.Tag = 0 then
      begin
        _Resultado := 1;
        raise Exception.Create('');
      end;
      mFechaVencimiento := IncDay(dtpFecha.Date, FormPagar01._Plazo);
      lblFechaVencimiento.Caption := FormatDateTime('dd/MM/yyyy',
        mFechaVencimiento);
      if FormPagar01._IDFormaPago = 5 then
        lblFechaVencimiento.Visible := True
      else
        lblFechaVencimiento.Visible := False;
      if FormPagar01._IDFormaPago = 1 then
        _IdEstado := 2;
      if FormPagar01._IDFormaPago = 5 then
        _IdEstado := 4;
      _IdFormaPago := FormPagar01._IDFormaPago;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos_Pagar2;
      if _Resultado = 0 then
        raise Exception.Create('');

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mNumero :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'ENTRADAS',
      _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mNumero);

      if Trim(cbProveedor.Text)  = '[SIN SELECCIONAR]' then
        mNombreCliente := ''
      else
        mNombreCliente := Trim(cbProveedor.Text);

      // Encabezado
      mDL_TB_FACTURASCLIENTESENCABEZADO := Clase_Tipo1.Create;
      with mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_FACTURASCLIENTESENCABEZADO.Limpiar_Tag;
        Append;
        FieldByName('NUMERO').Tag := 1;
        FieldByName('NUMERO').AsInteger :=
          mNumero;
        FieldByName('FECHA').Tag := 1;
        FieldByName('FECHA').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
        FieldByName('HORA').Tag := 1;
        FieldByName('HORA').AsString :=
          FormatDateTime('HH:mm:ss', Time);
        FieldByName('CODIGOMESA').Tag := 1;
        FieldByName('CODIGOMESA').AsInteger := 0;
        FieldByName('NUMEROMESA').Tag := 1;
        FieldByName('NUMEROMESA').AsString := '';
        FieldByName('NOMBREPROVEEDOR').Tag := 1;
        FieldByName('NOMBREPROVEEDOR').AsString :=
          mNombreCliente;
        FieldByName('SUBTOTAL').Tag := 1;
        FieldByName('SUBTOTAL').AsFloat :=
          _SubTotal;
        FieldByName('DESCUENTOP').Tag := 1;
        FieldByName('DESCUENTOP').AsFloat := 0;
        FieldByName('DESCUENTOM').Tag := 1;
        FieldByName('DESCUENTOM').AsFloat :=
          _DescuentoM;
        FieldByName('IVAP').Tag := 1;
        FieldByName('IVAP').AsFloat := 0;
        FieldByName('IVAM').Tag := 1;
        FieldByName('IVAM').AsFloat :=
          _IVAM;
        FieldByName('ISP').Tag := 1;
        FieldByName('ISP').AsFloat := 0;
        FieldByName('ISM').Tag := 1;
        FieldByName('ISM').AsFloat :=
          _ISM;
        FieldByName('TRANSPORTE').Tag := 1;
        FieldByName('TRANSPORTE').AsFloat := 0;
        FieldByName('TOTAL').Tag := 1;
        FieldByName('TOTAL').AsFloat :=
          _Total;
        FieldByName('TOTALGRAVADO').Tag := 1;
        FieldByName('TOTALGRAVADO').AsFloat := 0;
        FieldByName('TOTALEXCENTO').Tag := 1;
        FieldByName('TOTALEXCENTO').AsFloat := 0;
        FieldByName('CODIGOESTADO').Tag := 1;
        FieldByName('CODIGOESTADO').AsInteger :=
          _IdEstado;
        FieldByName('CODIGOFORMAPAGO').Tag := 1;
        FieldByName('CODIGOFORMAPAGO').AsInteger :=
          FormPagar01._IDFormaPago;
        FieldByName('FECHAVENCIMIENTO').Tag := 1;
        FieldByName('FECHAVENCIMIENTO').AsString :=
          FormatDateTime('dd/MM/yyyy', mFechaVencimiento);
        FieldByName('CODIGOTIPO').Tag := 1;
        FieldByName('CODIGOTIPO').AsInteger := 1;
        FieldByName('SALDO').Tag := 1;
        FieldByName('SALDO').AsFloat :=
          FormPagar01._CreditoTotal;
        FieldByName('NOMBREVENDEDOR').Tag := 1;
        FieldByName('NOMBREVENDEDOR').AsString :=
          mNombreVendedor;
        FieldByName('NUMEROPROFORMA').Tag := 1;
        FieldByName('NUMEROPROFORMA').AsInteger := 0;
        FieldByName('PAGOCON').Tag := 1;
        FieldByName('PAGOCON').AsFloat :=
          FormPagar01._Pagado;
        FieldByName('CAMBIO').Tag := 1;
        FieldByName('CAMBIO').AsFloat :=
          FormPagar01._Cambio;
        FieldByName('IdProveedor').Tag := 1;
        FieldByName('IdProveedor').AsInteger :=
          GetCombo(cbProveedor);
        FieldByName('NUMERODOC').Tag := 1;
        FieldByName('NUMERODOC').AsString :=
          edtDocumentoOrigen.Text;
        Post;
      end;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mDL_TB_CONSECUTIVOS.Actualizar_Campo('', 'ENTRADAS', mNumero,
        _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;

      // Detalle
      with _DL_TB_FACTURASDETALLEActual.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('NUMERO').Tag := 1;
          FieldByName('NUMERO').AsInteger :=
            mNumero;
          FieldByName('CODIGOESTADO').Tag := 1;
          FieldByName('CODIGOESTADO').AsInteger := 2;
          Post;
          Next;
        end;
      end;
      _DL_TB_FACTURASDETALLEActual.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      // Actualizar Existencias
      mWhere := TStringList.Create;
      mWhere.Add('Numero=' + IntToStr(mNumero));
      _DL_TB_FACTURASDETALLEActual.Sumar_Existencias(mWhere.Text,
        _DL_TB_FACTURASDETALLEActual.DataSet, _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;

      // Actualiza Saldo Cliente
      if FormPagar01._IDFormaPago = 5 then
      begin
        mWhere := TStringList.Create;
        mWhere.Add('Id=' + IntToStr(GetCombo(cbProveedor)));
        mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
        mDL_TB_PROVEEDORES.Sumar_Saldo(mWhere.Text,
          FormPagar01._CreditoTotal, _Resultado, _ErrorM);
        mWhere.Free;
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_PROVEEDORES.Destroy;
      end;

      if Global.USARCONTABILIDAD = 1 then
      begin
        mbs_DBGeneral := tbs_DBGeneral.Create;
        mIdAsiento :=
          mbs_DBGeneral.Obtener_Ultimo('TB_AsientosEncabezado', _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mbs_DBGeneral.Destroy;
        Inc(mIdAsiento);

        mDL_TB_AsientosEncabezado := TDL_TB_AsientosEncabezado.Create;
        with mDL_TB_AsientosEncabezado.Dataset do
        begin
          EmptyDataSet;
          mDL_TB_AsientosEncabezado.Limpiar_Tag;
          Append;
          FieldByName('FECHACREACION').Tag := 1;
          FieldByName('FECHACREACION').AsString :=
            FormatDateTime('dd/MM/yyyy', Date);
          FieldByName('FECHA').Tag := 1;
          FieldByName('FECHA').AsString :=
            FormatDateTime('dd/MM/yyyy', Date);
          FieldByName('NUMERO').Tag := 1;
          FieldByName('NUMERO').AsString :=
            IntToStr(mIdAsiento);
          FieldByName('CODIGOESTADO').Tag := 1;
          FieldByName('CODIGOESTADO').AsInteger := 2;
          FieldByName('CODIGOCIERRE').Tag := 1;
          FieldByName('CODIGOCIERRE').AsInteger := 0;
          Post;
        end;
        mDL_TB_AsientosEncabezado.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_AsientosEncabezado.Destroy;

        mDL_TB_AsientosDetalle := TDL_TB_AsientosDetalle.Create;
        mDL_TB_AsientosDetalle.Dataset.EmptyDataSet;
        mDL_TB_AsientosDetalle.Limpiar_Tag;
        Insertar_AsientoDetalle(mDL_TB_AsientosDetalle, mIdAsiento,
          FormPagar01._IDFormaPago);
        mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_AsientosDetalle.Destroy;
      end;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      pnlEstado1.Caption := 'N�mero: ' + IntToStr(mNumero);
      if _IdEstado = 2 then
        pnlTitulo2.Caption := 'Pagado';
      if _IdEstado = 4 then
        pnlTitulo2.Caption := 'Pendiente';
      if _IdFormaPago = 1 then
        pnlEstado3.Caption := 'Contado';
      if _IdFormaPago = 5 then
        pnlEstado3.Caption := 'Cr�dito';

      _Numero := mNumero;

      _Resultado := 1;

      _IdEstado := 1;
      _IdFormaPago := 0;
      _IdDocumento := 0;
      _Numero := 0;

      Nuevo;
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

procedure Anular_Data;
var
  mDL_TB_FACTURASCLIENTESENCABEZADO: Clase_Tipo1;
  mDL_TB_PROVEEDORES: TDL_TB_PROVEEDORES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mDL_TB_AsientosEncabezado: TDL_TB_AsientosEncabezado;
  mDL_TB_AsientosDetalle: TDL_TB_AsientosDetalle;
  mIdAsiento: Integer;
  mbs_DBGeneral: tbs_DBGeneral;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      // Encabezado
      mWhere := TStringList.Create;
      mWhere.Add('Numero=' + IntToStr(_Numero));
      mDL_TB_FACTURASCLIENTESENCABEZADO := Clase_Tipo1.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Actualizar_Estado(mWhere.Text, 3,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      // Actualizar Existencias
      mWhere := TStringList.Create;
      mWhere.Add('Numero=' + IntToStr(_Numero));
      _DL_TB_FACTURASDETALLEActual.Restar_Existencias(mWhere.Text,
        _DL_TB_FACTURASDETALLEActual.DataSet, _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;

      // Actualiza Saldo Cliente
      if _IDFormaPago = 5 then
      begin
        mWhere := TStringList.Create;
        mWhere.Add('Id=' + IntToStr(GetCombo(cbProveedor)));
        mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
        mDL_TB_PROVEEDORES.Restar_Saldo(mWhere.Text,
          _Total, _Resultado, _ErrorM);
        mWhere.Free;
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_PROVEEDORES.Destroy;
      end;

      if Global.USARCONTABILIDAD = 1 then
      begin
        mbs_DBGeneral := tbs_DBGeneral.Create;
        mIdAsiento :=
          mbs_DBGeneral.Obtener_Ultimo('TB_AsientosEncabezado', _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mbs_DBGeneral.Destroy;
        Inc(mIdAsiento);

        mDL_TB_AsientosEncabezado := TDL_TB_AsientosEncabezado.Create;
        with mDL_TB_AsientosEncabezado.Dataset do
        begin
          EmptyDataSet;
          mDL_TB_AsientosEncabezado.Limpiar_Tag;
          Append;
          FieldByName('FECHACREACION').Tag := 1;
          FieldByName('FECHACREACION').AsString :=
            FormatDateTime('dd/MM/yyyy', Date);
          FieldByName('FECHA').Tag := 1;
          FieldByName('FECHA').AsString :=
            FormatDateTime('dd/MM/yyyy', Date);
          FieldByName('NUMERO').Tag := 1;
          FieldByName('NUMERO').AsString :=
            IntToStr(mIdAsiento);
          FieldByName('CODIGOESTADO').Tag := 1;
          FieldByName('CODIGOESTADO').AsInteger := 2;
          FieldByName('CODIGOCIERRE').Tag := 1;
          FieldByName('CODIGOCIERRE').AsInteger := 0;
          Post;
        end;
        mDL_TB_AsientosEncabezado.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_AsientosEncabezado.Destroy;

        mDL_TB_AsientosDetalle := TDL_TB_AsientosDetalle.Create;
        mDL_TB_AsientosDetalle.Dataset.EmptyDataSet;
        mDL_TB_AsientosDetalle.Limpiar_Tag;
        Insertar_AsientoDetalle_Anulado(mDL_TB_AsientosDetalle, mIdAsiento,
          FormPagar01._IDFormaPago);
        mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_AsientosDetalle.Destroy;
      end;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _IdEstado := 3;

      if _IdEstado = 3 then
        pnlTitulo2.Caption := 'Anulado';

      btnPagar.Enabled := False;
      btnAnular.Enabled := False;
      btnImprimir.Enabled := True;
      pnlEstado.Enabled := False;
      pnlEncabezado.Enabled := False;
      pnlDetalle.Enabled := False;
      pnlListaTitulo.Enabled := True;

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

procedure Imprimir_Data;
var
  DL_TB_PLANTILLAS: TDL_TB_PLANTILLAS;
  mDL_TB_FACTURASCLIENTESENCABEZADO: Clase_Tipo1;
  mDL_TB_FACTURASDETALLE: Clase_Tipo2;
  mDL_TB_PROVEEDORES: TDL_TB_PROVEEDORES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mArchivo: TStringList;
  mNombreArchivo: string;
  mDL_TB_EMPRESAS: TDL_TB_EMPRESAS;
  mBS_facturasclientesencabezado: TFDMemTable;
  mBS_facturasclientesdetalle: TFDMemTable;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mBS_facturasclientesencabezado := TFDMemTable.Create(nil);
      with mBS_facturasclientesencabezado do
      begin
        FieldDefs.Clear;
        FieldDefs.Add('Factura_Numero', ftInteger, 0);
        FieldDefs.Add('Fecha', ftDateTime, 0);
        FieldDefs.Add('Hora', ftString, 30);
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

      mDL_TB_EMPRESAS := TDL_TB_EMPRESAS.Create;
      mDL_TB_EMPRESAS.Consultar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mWhere := TStringList.Create;
      mWhere.Add('A.Numero=' + IntToStr(_Numero));
      mDL_TB_FACTURASCLIENTESENCABEZADO := Clase_Tipo1.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          mBS_facturasclientesencabezado.Append;
          mBS_facturasclientesencabezado.FieldByName('Factura_Numero').AsInteger :=
            FieldByName('NUMERO').AsInteger;
          mBS_facturasclientesencabezado.FieldByName('Fecha').AsString :=
            FormatDateTime('dd/MM/yyyy', FieldByName('Fecha').AsDateTime);
          mBS_facturasclientesencabezado.FieldByName('Hora').AsString :=
            FieldByName('HORA').AsString;
          mBS_facturasclientesencabezado.FieldByName('NombreCliente').AsString :=
            FieldByName('NOMBRECLIENTE').AsString;
          mBS_facturasclientesencabezado.FieldByName('SubTotal').AsFloat :=
            FieldByName('SUBTOTAL').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('DescuentoMonto').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('IVAMonto').AsFloat :=
            FieldByName('IVAM').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('Total').AsFloat :=
            FieldByName('TOTAL').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('FechaVencimiento').AsString :=
            FormatDateTime('dd/MM/yyyy', FieldByName('FECHAVENCIMIENTO').AsDateTime);
          mBS_facturasclientesencabezado.FieldByName('NombreVendedor').AsString :=
            FieldByName('NOMBREVENDEDOR').AsString;
          mBS_facturasclientesencabezado.FieldByName('Numero_Proforma').AsInteger :=
            FieldByName('NUMEROPROFORMA').AsInteger;
          mBS_facturasclientesencabezado.FieldByName('PagoCon').AsFloat :=
            FieldByName('PAGOCON').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('Cambio').AsFloat :=
            FieldByName('CAMBIO').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('DireccionCliente').AsString :=
            FieldByName('ClienteDireccion').AsString;
          mBS_facturasclientesencabezado.FieldByName('Telefono1Cliente').AsString :=
            FieldByName('ClienteTelefono1').AsString;
          mBS_facturasclientesencabezado.FieldByName('ServicioMonto').AsFloat :=
            FieldByName('ISM').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('ContactoNombre').AsString :=
            FieldByName('ClienteContactoNombre').AsString;
          mBS_facturasclientesencabezado.Post;

          Next;
        end;
      end;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      mWhere := TStringList.Create;
      mWhere.Add('A.Numero=' + IntToStr(_Numero));
      mDL_TB_FACTURASDETALLE := Clase_Tipo2.Create;
      mDL_TB_FACTURASDETALLE.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_FACTURASDETALLE.Dataset do
      begin
        First;
        while not Eof do
        begin
          mBS_facturasclientesdetalle.Append;
          mBS_facturasclientesdetalle.FieldByName('Codigo_Producto').AsString :=
            FieldByName('CODIGO').AsString;
          mBS_facturasclientesdetalle.FieldByName('Nombre_Producto').AsString :=
            FieldByName('NOMBRE').AsString;
          mBS_facturasclientesdetalle.FieldByName('Cantidad').AsFloat :=
            FieldByName('Cantidad').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioUnitario').AsFloat :=
            FieldByName('PRECIOUNITARIO').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioUnitarioFinal').AsFloat :=
            FieldByName('PRECIOUNITARIOFINAL').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('DescuentoMonto').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioFinal').AsFloat :=
            FieldByName('PRECIOFINAL').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('Impuesto').AsFloat :=
            FieldByName('IVAM').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioUnitarioBase').AsFloat :=
            FieldByName('PRECIOUNITARIOBASE').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioFinalBase').AsFloat :=
            FieldByName('PRECIOFINALBASE').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('Descripcion1').AsString :=
            FieldByName('DESCRIPCION1').AsString;
          mBS_facturasclientesdetalle.FieldByName('Descripcion2').AsString :=
            FieldByName('DESCRIPCION2').AsString;
          mBS_facturasclientesdetalle.Post;

          Next;
        end;
      end;
      mDL_TB_FACTURASDETALLE.Destroy;

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      if _IdFormaPago = 1 then
        mWhere.Add('Id=' + IntToStr(1));
      if _IdFormaPago = 5 then
        mWhere.Add('Id=' + IntToStr(2));
      DL_TB_PLANTILLAS := TDL_TB_PLANTILLAS.Create;
      mArchivo.Text :=
        DL_TB_PLANTILLAS.Obtener_Plantilla(mWhere.Text, _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      DL_TB_PLANTILLAS.Destroy;

      mNombreArchivo := Global.PathAplicacion + '\Plantilla.fr3';
      if FileExists(mNombreArchivo) = True then
        DeleteFile(mNombreArchivo);

      mArchivo.SaveToFile(mNombreArchivo);
      mArchivo.Free;

      dmReports.frxDBDataset1.DataSet := mBS_facturasclientesencabezado;
      dmReports.frxDBDataset2.DataSet := mBS_facturasclientesdetalle;
      dmReports.frxDBDataset3.DataSet := mDL_TB_EMPRESAS.Dataset;
      dmReports.frxDBDataset1.Enabled := True;
      dmReports.frxDBDataset2.Enabled := True;
      dmReports.frxDBDataset3.Enabled := True;

      dmReports.frxReport1.LoadFromFile(mNombreArchivo);
      dmReports.frxReport1.PrepareReport();
      dmReports.frxReport1.ShowReport();
//      dmReports.frxReport1.PrintOptions.ShowDialog := False;
 //     dmReports.frxReport1.Print;
      dmReports.frxDBDataset1.Enabled := False;
      dmReports.frxDBDataset2.Enabled := False;
      dmReports.frxDBDataset3.Enabled := False;

      mDL_TB_EMPRESAS.Destroy;

      if FileExists(mNombreArchivo) = True then
        DeleteFile(mNombreArchivo);

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

procedure VistaPrevia;
var
  DL_TB_PLANTILLAS: TDL_TB_PLANTILLAS;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mArchivo: TStringList;
  mNombreArchivo: string;
  mDL_TB_EMPRESAS: TDL_TB_EMPRESAS;
  mBS_facturasclientesencabezado: TFDMemTable;
  mBS_facturasclientesdetalle: TFDMemTable;
  mNombrecliente, mNombreVendedor: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mBS_facturasclientesencabezado := TFDMemTable.Create(nil);
      with mBS_facturasclientesencabezado do
      begin
        FieldDefs.Clear;
        FieldDefs.Add('Factura_Numero', ftInteger, 0);
        FieldDefs.Add('Fecha', ftDateTime, 0);
        FieldDefs.Add('Hora', ftString, 30);
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

      mDL_TB_EMPRESAS := TDL_TB_EMPRESAS.Create;
      mDL_TB_EMPRESAS.Consultar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_facturasclientesencabezado.Append;
      mBS_facturasclientesencabezado.FieldByName('Factura_Numero').AsInteger :=
        _Numero;
      mBS_facturasclientesencabezado.FieldByName('Fecha').AsString :=
        FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
      mBS_facturasclientesencabezado.FieldByName('Hora').AsString :=
        FormatDateTime('HH:mm:ss', Time);
      if Trim(cbProveedor.Text) <> '[SIN SELECCIONAR]' then
        mNombrecliente := Trim(cbProveedor.Text)
      else
        mNombrecliente := '';
      mBS_facturasclientesencabezado.FieldByName('NombreCliente').AsString :=
        mNombrecliente;
      mBS_facturasclientesencabezado.FieldByName('SubTotal').AsFloat :=
        _SubTotal;
      mBS_facturasclientesencabezado.FieldByName('DescuentoMonto').AsFloat :=
        _DescuentoM;
      mBS_facturasclientesencabezado.FieldByName('IVAMonto').AsFloat :=
        _IVAM;
      mBS_facturasclientesencabezado.FieldByName('Total').AsFloat :=
        _Total;
     // mBS_facturasclientesencabezado.FieldByName('FechaVencimiento').AsString :=
     //   FormatDateTime('dd/MM/yyyy', FieldByName('FECHAVENCIMIENTO').AsDateTime);
      mBS_facturasclientesencabezado.FieldByName('NombreVendedor').AsString :=
        mNombreVendedor;
      mBS_facturasclientesencabezado.FieldByName('ServicioMonto').AsFloat :=
        _ISM;
      mBS_facturasclientesencabezado.Post;

      with _DL_TB_FACTURASDETALLEActual.Dataset do
      begin
        First;
        while not Eof do
        begin
          mBS_facturasclientesdetalle.Append;
          mBS_facturasclientesdetalle.FieldByName('Codigo_Producto').AsString :=
            FieldByName('CODIGO').AsString;
          mBS_facturasclientesdetalle.FieldByName('Nombre_Producto').AsString :=
            FieldByName('NOMBRE').AsString;
          mBS_facturasclientesdetalle.FieldByName('Cantidad').AsFloat :=
            FieldByName('Cantidad').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioUnitario').AsFloat :=
            FieldByName('PRECIOUNITARIO').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioUnitarioFinal').AsFloat :=
            FieldByName('PRECIOUNITARIOFINAL').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('DescuentoMonto').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioFinal').AsFloat :=
            FieldByName('PRECIOFINAL').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('Impuesto').AsFloat :=
            FieldByName('IVAM').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioUnitarioBase').AsFloat :=
            FieldByName('PRECIOUNITARIOBASE').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioFinalBase').AsFloat :=
            FieldByName('PRECIOFINALBASE').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('Descripcion1').AsString :=
            FieldByName('DESCRIPCION1').AsString;
          mBS_facturasclientesdetalle.FieldByName('Descripcion2').AsString :=
            FieldByName('DESCRIPCION2').AsString;
          mBS_facturasclientesdetalle.Post;

          Next;
        end;
      end;

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      if _IdFormaPago = 1 then
        mWhere.Add('Id=' + IntToStr(1));
      if _IdFormaPago = 5 then
        mWhere.Add('Id=' + IntToStr(2));
      DL_TB_PLANTILLAS := TDL_TB_PLANTILLAS.Create;
      mArchivo.Text :=
        DL_TB_PLANTILLAS.Obtener_Plantilla(mWhere.Text, _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      DL_TB_PLANTILLAS.Destroy;

      mNombreArchivo := Global.PathAplicacion + '\Plantilla.fr3';
      if FileExists(mNombreArchivo) = True then
        DeleteFile(mNombreArchivo);

      mArchivo.SaveToFile(mNombreArchivo);
      mArchivo.Free;

      dmReports.frxDBDataset1.DataSet := mBS_facturasclientesencabezado;
      dmReports.frxDBDataset2.DataSet := mBS_facturasclientesdetalle;
      dmReports.frxDBDataset3.DataSet := mDL_TB_EMPRESAS.Dataset;
      dmReports.frxDBDataset1.Enabled := True;
      dmReports.frxDBDataset2.Enabled := True;
      dmReports.frxDBDataset3.Enabled := True;

      dmReports.frxReport1.LoadFromFile(mNombreArchivo);
      dmReports.frxReport1.PrepareReport();
      dmReports.frxReport1.ShowReport();
//      dmReports.frxReport1.PrintOptions.ShowDialog := False;
 //     dmReports.frxReport1.Print;
      dmReports.frxDBDataset1.Enabled := False;
      dmReports.frxDBDataset2.Enabled := False;
      dmReports.frxDBDataset3.Enabled := False;

      mDL_TB_EMPRESAS.Destroy;

      if FileExists(mNombreArchivo) = True then
        DeleteFile(mNombreArchivo);

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

procedure Cerrar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure Consultar_Encabezado(pId: Integer);
var
  mDL_TB_FACTURASCLIENTESENCABEZADO: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mDL_TB_FACTURASCLIENTESENCABEZADO := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mDL_TB_FACTURASCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToFormaEncabezado(mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset);
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

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

procedure DBToFormaEncabezado(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      dtpFecha.Date :=
        FieldByName('FECHA').AsDateTime;
      pnlTotal.Caption :=
        FormatFloat('#,##0.00',
        FieldByName('TOTAL').AsFloat);
      cbProveedor.ItemIndex := SetCombo(cbProveedor,
        FieldByName('IdProveedor').AsInteger);
      pnlSubTotal.Caption :=
        FormatFloat('#,##0.00',
        FieldByName('SUBTOTAL').AsFloat);
      pnlDescuento.Caption :=
        FormatFloat('#,##0.00',
        FieldByName('DESCUENTOM').AsFloat);
      pnlServicio.Caption :=
        FormatFloat('#,##0.00',
        FieldByName('ISM').AsFloat);
      pnlImpuesto.Caption :=
        FormatFloat('#,##0.00',
        FieldByName('IVAM').AsFloat);
      edtDocumentoOrigen.Text :=
        FieldByName('NUMERODOC').AsString;
    end;

  end;
end;

procedure Consultar_Detalle(pId: Integer);
var
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mWhere := TStringList.Create;
      mWhere.Add('A.Numero=' + IntToStr(pId));
      _DL_TB_FACTURASDETALLEActual.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      LlenarlvLista1(lvLista1, _DL_TB_FACTURASDETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_FACTURASDETALLEActual.Dataset);

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

procedure CamposValidos_Pagar1;
var
  mValido: Boolean;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (_DL_TB_FACTURASDETALLEActual.Dataset.RecordCount = 0) then
    begin
      mValido := False;
      _ErrorM := 'Debe tener detalles';
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure CamposValidos_Pagar2;
var
  mValido: Boolean;
  mWhere: TStringList;
  mAPLICARLIMITECREDITO: Integer;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (_IdFormaPago = 5) then
    begin
      if (GetCombo(cbProveedor) <= 0)  then
      begin
        mValido := False;
        _ErrorM := 'Debe Seleccionar un proveedor';
      end;
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure CamposValidos_Detalle;
var
  mValido: Boolean;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure CambiarDetalle;
var
  mLinea: string;
  mId: Integer;
  mEncontrado: Boolean;
  mDescuento: Double;
  mCantidad, mPrecio, mPrecioServicio: Double;
  mDescuentoPM, mDescuentoP, mDescuentoM, mPrecioDescuento: Double;
  mIVAPM, mIVAPorcentaje, mIVAM, mPrecioFinal, mMonto: Double;
  mDescripcion1: string;
  mDescripcion2: string;
begin
  with Forma01 do
  begin

    mCantidad := 0;
    if lvLista1.Selected <> nil then
    begin
      mLinea := lvLista1.Selected.SubItems[5];
      try
        mId := StrToInt(mLinea);
      except
        mId := 0;
      end;
      mEncontrado :=
        _DL_TB_FACTURASDETALLEActual.Dataset.Locate('IdProducto', mId, []);
      if mEncontrado = True then
      begin
        mCantidad := _DL_TB_FACTURASDETALLEActual.Dataset.FieldByName('CANTIDAD').AsFloat;
        mPrecio :=  _DL_TB_FACTURASDETALLEActual.Dataset.FieldByName('PRECIOUNITARIO').AsFloat;
        mDescuento :=  _DL_TB_FACTURASDETALLEActual.Dataset.FieldByName('DESCUENTOP').AsFloat;
        mIVAPorcentaje :=  _DL_TB_FACTURASDETALLEActual.Dataset.FieldByName('IVAP').AsFloat;
      end;
      if mEncontrado = True then
      begin
        FormCambiarDetalle01._Origen := 2;
        FormCambiarDetalle01._DescuentoPd := mDescuento;
        FormCambiarDetalle01._Cantidad := mCantidad;
        FormCambiarDetalle01._Precio := mPrecio;
        FormCambiarDetalle01._Descripcion1 := mDescripcion1;
        FormCambiarDetalle01._Descripcion2 := mDescripcion2;
        FormCambiarDetalle01.ShowModal;
        if FormCambiarDetalle01.Tag = 1 then
        begin
          mCantidad := FormCambiarDetalle01._Cantidad;
          mDescuento := FormCambiarDetalle01._DescuentoPd;
          mDescripcion1 := FormCambiarDetalle01._Descripcion1;
          mDescripcion2 := FormCambiarDetalle01._Descripcion2;

          // Calcula el Descuento
          mDescuentoPM := 0;
          mDescuentoP := mDescuento;
          if mDescuentoP <> 0 then
            mDescuentoPM := mDescuentoP / 100;
          mDescuentoM := (mPrecio * mDescuentoPM) * mCantidad;
          mPrecioDescuento := mPrecio - (mPrecio * mDescuentoPM);

          mPrecioServicio := mPrecioDescuento;

          // Calcula el Impuesto
          mIVAPM := 0;
          if mIVAPorcentaje <> 0 then
            mIVAPM := mIVAPorcentaje / 100;
          mIVAM := (mPrecioServicio * mIVAPM) * mCantidad;
          mPrecioFinal := mPrecioServicio;

          mMonto := mPrecioFinal * mCantidad;

          // Llena el DataSet
          with _DL_TB_FACTURASDETALLEActual.Dataset do
          begin
            Edit;
            FieldByName('CANTIDAD').Tag := 1;
            FieldByName('CANTIDAD').AsFloat :=
              FormCambiarDetalle01._Cantidad;
            FieldByName('DESCUENTOP').Tag := 1;
            FieldByName('DESCUENTOP').AsFloat :=
              mDescuentoP;
            FieldByName('DESCUENTOM').Tag := 1;
            FieldByName('DESCUENTOM').AsFloat :=
              mDescuentoM;
            FieldByName('IVAM').Tag := 1;
            FieldByName('IVAM').AsFloat :=
              mIVAM;
            FieldByName('PRECIOUNITARIOFINAL').Tag := 1;
            FieldByName('PRECIOUNITARIOFINAL').AsFloat :=
              mPrecioFinal;
            FieldByName('PRECIOFINAL').Tag := 1;
            FieldByName('PRECIOFINAL').AsFloat :=
              mMonto;
            Post;
          end;

          LlenarlvLista1(lvLista1, _DL_TB_FACTURASDETALLEActual.Dataset);
          ActualizarTotales(_DL_TB_FACTURASDETALLEActual.Dataset);
        end;
      end;
    end;

    if Global.CodigoBarrasDirecto = 0 then
      edtCodigoProducto.SetFocus;
    if Global.CodigoBarrasDirecto = 1 then
      edtCodigoBarras.SetFocus;

  end;
end;

procedure DescuentoMonto;
var
  mDescuento, mPrecio: Double;
begin
  with Forma01 do
  begin

    FormDesuentoMonto01.ShowModal;
    if FormDesuentoMonto01.Tag = 1 then
    begin
      mPrecio := edtPrecio.Value * edtCantidad.Value;
      // Calcula el Descuento
      if (FormDesuentoMonto01._Monto <> 0) and
        (mPrecio <> 0) then
      begin
        mDescuento := FormDesuentoMonto01._Monto / mPrecio;
        mDescuento := mDescuento * 100;
        edtDescuento.Value := mDescuento;
      end;
    end;

  end;
end;

procedure Insertar_AsientoDetalle(pAsientoDetalle: TDL_TB_AsientosDetalle;
  pIdAsiento: Integer; pTipoPago: Integer);
var
  mCantidad, mPrecioUnitario, mValor: Double;
begin
  with Forma01 do
  begin

    with _DL_TB_FACTURASDETALLEActual.Dataset do
    begin
      First;
      while not Eof do
      begin
        mCantidad :=
          FieldByName('CANTIDAD').AsFloat;
        mPrecioUnitario :=
          FieldByName('PRECIOUNITARIO').AsFloat;
        mValor := mPrecioUnitario * mCantidad;

        pAsientoDetalle.Dataset.Append;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').AsInteger :=
          pIdAsiento;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').AsInteger := 1;
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 20;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').AsString := 'Compra de mercader�as';
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').AsString := '';
        pAsientoDetalle.Dataset.FieldByName('MONTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('MONTO').AsFloat := mValor;
        pAsientoDetalle.Dataset.FieldByName('DEBE').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DEBE').AsFloat := mValor;
        pAsientoDetalle.Dataset.FieldByName('HABER').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('HABER').AsFloat := 0;
        pAsientoDetalle.Dataset.Post;

        pAsientoDetalle.Dataset.Append;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').AsInteger :=
          pIdAsiento;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').AsInteger := 1;
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').Tag := 1;
        if pTipoPago = 1 then
          pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 15;
        if pTipoPago = 5 then
          pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 41;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').AsString := 'Compra de mercader�as';
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').AsString := '';
        pAsientoDetalle.Dataset.FieldByName('MONTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('MONTO').AsFloat := mValor;
        pAsientoDetalle.Dataset.FieldByName('DEBE').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DEBE').AsFloat := 0;
        pAsientoDetalle.Dataset.FieldByName('HABER').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('HABER').AsFloat := mValor;
        pAsientoDetalle.Dataset.Post;
        Next;
      end;
    end;

  end;
end;

procedure Insertar_AsientoDetalle_Anulado(pAsientoDetalle: TDL_TB_AsientosDetalle;
  pIdAsiento: Integer; pTipoPago: Integer);
var
  mCantidad, mPrecioUnitario, mValor: Double;
begin
  with Forma01 do
  begin

    with _DL_TB_FACTURASDETALLEActual.Dataset do
    begin
      First;
      while not Eof do
      begin
        mCantidad :=
          FieldByName('CANTIDAD').AsFloat;
        mPrecioUnitario :=
          FieldByName('PRECIOUNITARIO').AsFloat;
        mValor := mPrecioUnitario * mCantidad;

        pAsientoDetalle.Dataset.Append;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').AsInteger :=
          pIdAsiento;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').AsInteger := 1;
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 20;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').AsString := 'Compra de mercader�as';
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').AsString := '';
        pAsientoDetalle.Dataset.FieldByName('MONTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('MONTO').AsFloat := mValor;
        pAsientoDetalle.Dataset.FieldByName('DEBE').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DEBE').AsFloat := 0;
        pAsientoDetalle.Dataset.FieldByName('HABER').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('HABER').AsFloat := mValor;
        pAsientoDetalle.Dataset.Post;

        pAsientoDetalle.Dataset.Append;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDENCABEZADO').AsInteger :=
          pIdAsiento;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('IDMOVIMIENTO').AsInteger := 1;
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').Tag := 1;
        if pTipoPago = 1 then
          pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 15;
        if pTipoPago = 5 then
          pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 41;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').AsString := 'Compra de mercader�as';
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('REFERENCIA').AsString := '';
        pAsientoDetalle.Dataset.FieldByName('MONTO').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('MONTO').AsFloat := mValor;
        pAsientoDetalle.Dataset.FieldByName('DEBE').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DEBE').AsFloat := mValor;
        pAsientoDetalle.Dataset.FieldByName('HABER').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('HABER').AsFloat := 0;
        pAsientoDetalle.Dataset.Post;
        Next;
      end;
    end;

  end;
end;

procedure CargarIdioma;
var
  mValor: string;
  mCount, mLen, mCount2: Integer;
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
      if Forma01.Components[mCount] is TRzListView then
      begin
        for mCount2 := 0 to TRzListView(Forma01.Components[mCount]).Columns.Count - 1 do
        begin
          mValor := TRzListView(Forma01.Components[mCount]).Columns[mCount2].Caption;
          mValor := dmLenguajes.GetValue(mValor);
          if Trim(mValor) <> '' then
            TRzListView(Forma01.Components[mCount]).Columns[mCount2].Caption := mValor;
        end;
      end;
    end;

  end;
end;
{$ENDREGION}

end.
