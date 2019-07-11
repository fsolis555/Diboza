unit FrmNotasCredito01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, RzListVw, RzStatus, Vcl.Mask, RxToolEdit,
  RxCurrEdit, Vcl.ImgList,
  System.RegularExpressions, uDL_Skeleton, Vcl.Menus, RzButton,
  System.DateUtils,
  FireDAC.Comp.Client, Data.DB, RzEdit;

type
  TFormNotasCredito01 = class(TForm)
    pnlEncabezado: TRzPanel;
    Label14: TLabel;
    cbFactura: TComboBoxEx;
    btnBuscar_Facturas: TBitBtn;
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
    popDetalle: TPopupMenu;
    CambiarDetalle1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtpFecha: TRzDateTimeEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure CambiarDetalle1Click(Sender: TObject);
    procedure btnAnularClick(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure VistaPrevia1Click(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnEliminarLineaClick(Sender: TObject);
    procedure chkTodoLista1Click(Sender: TObject);
    procedure btnBuscar_FacturasClick(Sender: TObject);
    procedure cbFacturaChange(Sender: TObject);
  private
    FIdDocumento: Integer;
    FIdEstado: Integer;
    FIdFormaPago: Integer;
    FNumero: Integer;
    FOrigen: Integer;
    FFactura: Integer;
  public
    property _IdDocumento: Integer read FIdDocumento write FIdDocumento;
    property _IdEstado: Integer read FIdEstado write FIdEstado;
    property _IdFormaPago: Integer read FIdFormaPago write FIdFormaPago;
    property _Numero: Integer read FNumero write FNumero;
    property _Origen: Integer read FOrigen write FOrigen;
    property _Factura: Integer read FFactura write FFactura;
  end;

var
  FormNotasCredito01: TFormNotasCredito01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure LimpiarCampos_Titulo;
  procedure LimpiarCampos_Encabezado;
  procedure LimpiarCampos_DetalleLista;
  procedure LimpiarCampos_Pie;
  procedure Insertar_Detalle;
  procedure Eliminar_Detalle;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure DBToFormaDetalle(ds1: TDatasetMem);
  procedure ActualizarTotales(ds1: TDatasetMem);
  procedure LlenarcbFacturas(cb: TComboBoxEx);
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
  procedure BuscarFactura;
  procedure Consultar_DetalleFactura(pId: Integer);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_NOTASCREDITOENCABEZADO, BS_DBConexion,
  FrmMensaje_Espera01, uDL_TB_PRODUCTOS, uDL_TB_NOTASCREDITODETALLE,
  uDL_TB_CLIENTES, uDL_TB_VENDEDORES,
  uDL_TB_CONSECUTIVOS, FrmBuscar_Productos01, uDL_TB_PLANTILLAS,
  FrmPagar01, udmReports, uDL_TB_EMPRESAS, FrmFacturaClientes01,
  uDL_TB_FACTURASCLIENTESDETALLE, FrmCambiarDetalle01, FrmDesuentoMonto01,
  FrmBuscar_Facturas01, uDL_TB_FACTURASCLIENTESENCABEZADO,
  uDL_TB_SISTEMA, udmLenguajes, udmObjects, udmConnection;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_NOTASCREDITOENCABEZADO;
  Clase_Tipo2 = TDL_TB_NOTASCREDITODETALLE;

const
  lv_Nombre = 0;
  lv_id = 1;

var
  Forma01: TFormNotasCredito01;
  _IdProducto: Integer;
  _DL_TB_NOTASCREDITODETALLEActual: Clase_Tipo2;
  _SubTotal: Double;
  _DescuentoM: Double;
  _IVAM: Double;
  _ISM: Double;
  _Total: Double;

{$REGION 'Funciones Forma'}
procedure TFormNotasCredito01.FormShow(Sender: TObject);
begin
  Forma01 := FormNotasCredito01;

  InicializarForma;
end;

procedure TFormNotasCredito01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormNotasCredito01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormNotasCredito01.btnNuevoClick(Sender: TObject);
begin
  Nuevo;
end;

procedure TFormNotasCredito01.btnPagarClick(Sender: TObject);
begin
  Pagar_Data;
end;

procedure TFormNotasCredito01.CambiarDetalle1Click(Sender: TObject);
begin
  CambiarDetalle;
end;

procedure TFormNotasCredito01.btnAnularClick(Sender: TObject);
begin
  Anular_Data;
end;

procedure TFormNotasCredito01.Imprimir1Click(Sender: TObject);
begin
  Imprimir_Data;
end;

procedure TFormNotasCredito01.VistaPrevia1Click(Sender: TObject);
begin
  VistaPrevia;
end;

procedure TFormNotasCredito01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormNotasCredito01.btnBuscar_FacturasClick(Sender: TObject);
begin
  BuscarFactura;
end;

procedure TFormNotasCredito01.btnEliminarLineaClick(Sender: TObject);
begin
  Eliminar_Detalle;
end;

procedure TFormNotasCredito01.chkTodoLista1Click(Sender: TObject);
begin
  MDLista_Todos(lvLista1, chkTodoLista1);
end;

procedure TFormNotasCredito01.cbFacturaChange(Sender: TObject);
begin
  if pnlEncabezado.Enabled = True then
    Consultar_DetalleFactura(GetCombo(cbFactura));
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _DL_TB_NOTASCREDITODETALLEActual := Clase_Tipo2.Create;

      LlenarcbFacturas(cbFactura);
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
        pnlListaTitulo.Enabled := True;
        pnlTitulo2.Caption := 'Abierta';
        pnlEstado3.Caption := '';
        pnlEstado1.Caption := '';
        if _Origen = 2 then
        begin
          cbFactura.ItemIndex :=
            SetCombo(cbFactura, _Factura);
        end;
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
        pnlListaTitulo.Enabled := True;
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
        pnlListaTitulo.Enabled := True;
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
        pnlListaTitulo.Enabled := True;
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
      _DL_TB_NOTASCREDITODETALLEActual.Destroy;
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
    if Key = VK_F2 then
    begin
      Key := 0;
      btnNuevo.Click;
    end;
    if (Key = VK_F3) and (btnPagar.Enabled = True) then
    begin
      Key := 0;
      btnPagar.Click;
    end;
    if (Key = VK_F4) and (btnAnular.Enabled = True) then
    begin
      Key := 0;
      btnAnular.Click;
    end;
    if (Key = VK_F5) and (btnImprimir.Enabled = True) then
    begin
      Key := 0;
      Imprimir1.Click;
    end;
    if (Key = VK_F6)  then
    begin
      Key := 0;
//      btnInsertarLinea.Click;
    end;
    if (Key = (ord('T') Or ord('t'))) and (Shift = [ssCtrl]) then
    begin
      Key := 0;
      lvLista1.SetFocus;
    end;

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    LimpiarCampos_Titulo;
    LimpiarCampos_Encabezado;
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

    cbFactura.ItemIndex := 0;

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
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mCantidadAnterior, mCantidad, mPrecio, mPrecioDescuento, mPrecioServicio, mPrecioFinal, mMonto: Double;
  mDescuentoP, mDescuentoPM, mDescuentoM: Double;
  mServicioPM, mServicioM: Double;
  mIVAPorcentaje, mIVAPM, mIVAM: Double;
  mEncontrado: Boolean;
  mAplicarImpuesto: Integer;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      CamposValidos_Detalle;
      if _Resultado = 0 then
        raise Exception.Create('');

      mAplicarImpuesto := 1;
      if GetCombo(cbFactura) > 0 then
      begin
        mWhere := TStringList.Create;
        mWhere.Add('Id=' + IntToStr(GetCombo(cbFactura)));
        mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
        mAplicarImpuesto :=
          mDL_TB_CLIENTES.Obtener_Valor(mWhere.Text, 'APLICARIMPUESTO',
          _Resultado, _ErrorM);
        mWhere.Free;
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_CLIENTES.Destroy;
      end;

      mCantidadAnterior := 0;
      mEncontrado :=
        _DL_TB_NOTASCREDITODETALLEActual.Dataset.Locate('IdProducto', _IdProducto, []);
      if mEncontrado = True then
        mCantidadAnterior :=
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('Cantidad').AsFloat;

   //   mCantidad := edtCantidad.Value + mCantidadAnterior;
   //   mPrecio := edtPrecio.Value;

      // Calcula el Descuento
      mDescuentoPM := 0;
   //   mDescuentoP := edtDescuento.Value;
      if mDescuentoP <> 0 then
        mDescuentoPM := mDescuentoP / 100;
      mDescuentoM := (mPrecio * mDescuentoPM) * mCantidad;
      mPrecioDescuento := mPrecio - (mPrecio * mDescuentoPM);

      mPrecioServicio := mPrecioDescuento;

      // Obtener Impuesto Porcentaje
      if mAplicarImpuesto = 1 then
      begin
        mIVAPorcentaje := 0;
        mWhere := TStringList.Create;
        mWhere.Add('A.Id=' + IntToStr(_IdProducto));
        mProductos := TDL_TB_PRODUCTOS.Create;
        mIVAPorcentaje :=
          mProductos.Obtener_ImpuestoPorcentaje(mWhere.Text,
          _Resultado, _ErrorM);
        mWhere.Free;
        if _Resultado = -1 then
          raise Exception.Create('');
        mProductos.Destroy;

        // Calcula el Impuesto
        mIVAPM := 0;
        if mIVAPorcentaje <> 0 then
          mIVAPM := mIVAPorcentaje / 100;
        mIVAM := (mPrecioServicio * mIVAPM) * mCantidad;
      end;
      mPrecioFinal := mPrecioServicio;

      mMonto := mPrecioFinal * mCantidad;

      // Llena el DataSet
      with _DL_TB_NOTASCREDITODETALLEActual.Dataset do
      begin
        if mEncontrado = True then
          Edit;
        if mEncontrado = False then
          Append;
        FieldByName('CODIGO').Tag := 1;
      //  FieldByName('CODIGO').AsString :=
      //    edtCodigoProducto.Text;
        FieldByName('NOMBRE').Tag := 1;
     //   FieldByName('NOMBRE').AsString :=
     //     edtProductoNombre.Text;
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
          mIVAPorcentaje;
        FieldByName('IVAM').Tag := 1;
        FieldByName('IVAM').AsFloat :=
          mIVAM;
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

      LlenarlvLista1(lvLista1, _DL_TB_NOTASCREDITODETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_NOTASCREDITODETALLEActual.Dataset);
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
            _DL_TB_NOTASCREDITODETALLEActual.Dataset.Locate('IdProducto', mIdProducto, []);
          if mEncontrado = True then
            _DL_TB_NOTASCREDITODETALLEActual.Dataset.Delete;
        end;
      end;

      LlenarlvLista1(lvLista1, _DL_TB_NOTASCREDITODETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_NOTASCREDITODETALLEActual.Dataset);

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

procedure DBToFormaDetalle(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      _IdProducto :=
        FieldByName('Id').AsInteger;
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
    mImpuesto := 0;
    mTotal := 0;
    mServicio := 0;

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

    _SubTotal := mSubTotal;
    _DescuentoM := mDescuento;
    _IVAM := mImpuesto;
    _ISM := 0;
    if Global.APLICARREDONDEO = 1 then
      mTotal := Round(mTotal);
    if Global.APLICARREDONDEO5 = 1 then
      mTotal := Round(mTotal / 5) * 5;

    _Total := mTotal;

    pnlTotal.Caption :=
      FormatFloat('#,##0.00', mTotal);

  end;
end;

procedure LlenarcbFacturas(cb: TComboBoxEx);
var
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_FACTURASCLIENTESENCABEZADO;
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
      mOrderBy.Add('A.NUMERO');
      mWhere.Add('A.CODIGOESTADO<>3');
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NUMERO').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

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

procedure LlenarcbVendedores(cb: TComboBoxEx);
var
  mDL_TB_Vendedores: TDL_TB_VENDEDORES;
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
      mDL_TB_Vendedores := TDL_TB_VENDEDORES.Create;
      mDL_TB_Vendedores.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_Vendedores.Dataset do
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
      mDL_TB_Vendedores.Destroy;

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
  mDL_TB_NOTASCREDITOENCABEZADO: Clase_Tipo1;
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mNumero: Integer;
  mNombreCliente, mNombreVendedor: string;
  mFechaVencimiento: TDateTime;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_FACTURASCLIENTESENCABEZADO;
  mDL_TB_FACTURASCLIENTESDETALLE: TDL_TB_FACTURASCLIENTESDETALLE;
  mIdCliente, mIdVendedor: Integer;
  mSaldo: Double;
  mFormaPago: Integer;
  mEncontrado: Boolean;
  mDL_TB_SISTEMA: TDL_TB_SISTEMA;
  mAplicarRebajarInventarioNC: Integer;
  idFactura: Integer;
  mCondicionVenta, mPlazoCredito, mMedioPago: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      CamposValidos_Pagar1;
      if _Resultado = 0 then
        raise Exception.Create('');

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mDL_TB_SISTEMA := TDL_TB_SISTEMA.Create;
      mAplicarRebajarInventarioNC :=
        mDL_TB_SISTEMA.Obtener_Valor('', 'AplicarBajarInventarioNC', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_SISTEMA.Destroy;

      idFactura := GetCombo(cbFactura);
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mIdCliente :=
        mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor('Id=' + IntToStr(GetCombo(cbFactura)),
          'IdCliente', _Resultado, _ErrorM);
      mIdVendedor :=
        mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor('Id=' + IntToStr(GetCombo(cbFactura)),
          'IdVendedor', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mFormaPago :=
        mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor('Id=' + IntToStr(GetCombo(cbFactura)),
          'CODIGOFORMAPAGO', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mNumero :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'NOTASCREDITO',
      _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mNumero);

      mDL_TB_NOTASCREDITOENCABEZADO := TDL_TB_NOTASCREDITOENCABEZADO.Create;
      with mDL_TB_NOTASCREDITOENCABEZADO.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_NOTASCREDITOENCABEZADO.Limpiar_Tag;
        Append;
        FieldByName('Numero').Tag := 1;
        FieldByName('Numero').AsInteger :=
          mNumero;
        FieldByName('FECHA').Tag := 1;
        FieldByName('FECHA').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
        FieldByName('HORA').Tag := 1;
        FieldByName('HORA').AsString :=
          FormatDateTime('HH:mm:ss', Time);
        FieldByName('NOMBRECLIENTE').Tag := 1;
        FieldByName('NOMBRECLIENTE').AsString := '';
        FieldByName('IdCliente').Tag := 1;
        FieldByName('IdCliente').AsInteger :=
          mIdCliente;
        FieldByName('NumeroDocumento').Tag := 1;
        FieldByName('NumeroDocumento').AsInteger :=
          StrToInt(cbFactura.Text);
        FieldByName('Total').Tag :=  1;
        FieldByName('Total').AsFloat :=
          _Total;
        FieldByName('Comentarios').Tag := 1;
        FieldByName('Comentarios').AsString := '';
        FieldByName('CODIGOESTADO').Tag := 1;
        FieldByName('CODIGOESTADO').AsInteger := 2;
        FieldByName('CODIGOFORMAPAGO').Tag := 1;
        FieldByName('CODIGOFORMAPAGO').AsInteger := 1;
        FieldByName('EFECTIVO').Tag :=  1;
        FieldByName('EFECTIVO').AsFloat :=
          _Total;
        FieldByName('IdVendedor').Tag := 1;
        FieldByName('IdVendedor').AsInteger :=
          mIdVendedor;
        Post;
      end;
      mDL_TB_NOTASCREDITOENCABEZADO.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_NOTASCREDITOENCABEZADO.Destroy;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mDL_TB_CONSECUTIVOS.Actualizar_Campo('', 'NOTASCREDITO', mNumero,
      _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;

      with _DL_TB_NOTASCREDITODETALLEActual.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('NUMERO').Tag := 1;
          FieldByName('NUMERO').AsInteger :=
            mNumero;
          FieldByName('CODIGOESTADO').Tag := 1;
          FieldByName('CODIGOESTADO').AsInteger := 3;
          Post;
          Next;
        end;
      end;
      _DL_TB_NOTASCREDITODETALLEActual.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      if mAplicarRebajarInventarioNC = 1 then
      begin
        _DL_TB_NOTASCREDITODETALLEActual.Sumar_Existencias('NUMERO=' + IntToStr(mNumero),
          _DL_TB_NOTASCREDITODETALLEActual.Dataset, _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
      end;

      mDL_TB_FACTURASCLIENTESDETALLE := TDL_TB_FACTURASCLIENTESDETALLE.Create;
      mDL_TB_FACTURASCLIENTESDETALLE.Consultar(_Resultado, _ErrorM, 'Numero=' + IntToStr(GetCombo(cbFactura)));
      with _DL_TB_NOTASCREDITODETALLEActual.Dataset do
      begin
        First;
        while not Eof do
        begin
          mEncontrado :=
            mDL_TB_FACTURASCLIENTESDETALLE.Dataset.Locate('IdProducto',
            FieldByName('IdProducto').AsInteger, []);
          if mEncontrado = True then
          begin
            mDL_TB_FACTURASCLIENTESDETALLE.Actualizar_Campo('Numero=' + IntToStr(GetCombo(cbFactura)) + ' And IdProducto=' + FieldByName('IdProducto').AsString,
              'CODIGOESTADO', 3, _Resultado, _ErrorM);
          end;
          Next;
        end;
      end;
      mDL_TB_FACTURASCLIENTESDETALLE.Destroy;

      if mFormaPago = 5 then
      begin
        mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
        mSaldo :=
          mDL_TB_CLIENTES.Obtener_Valor('Id=' + IntToStr(mIdCliente),
            'SALDO', _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mSaldo := mSaldo - _Total;
        mDL_TB_CLIENTES.Actualizar_Campo('Id=' + IntToStr(mIdCliente),
          'SALDO', mSaldo, _Resultado, _ErrorM);
        mDL_TB_CLIENTES.Destroy;
      end;

      mWhere := TStringList.Create;
      mWhere.Add('Numero=' + IntToStr(GetCombo(cbFactura)));
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Actualizar_Estado(mWhere.Text, 3,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      // Documento Electronico
      dmObjects.DB_Hacienda_Insertar(
        dmConnection.FDMainConnection, mCondicionVenta,
        mPlazoCredito, mMedioPago, _DL_TB_NOTASCREDITODETALLEActual.Dataset,
        dmObjects.FDQuery1, Global.IdSucursal, Global.IdTerminal,
        mNumero, mDL_TB_CLIENTES.Dataset, _DL_TB_NOTASCREDITODETALLEActual.Dataset,
        Global.PathTemp, Global.PathAplicacion, 'NC', Global.EmpresaCodigo,
        _Resultado, _ErrorM);

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
      {
      if Application.MessageBox('Desea Imprimir el documento?',
        'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDYES then
        Imprimir_Data;
      }
      _Resultado := 1;

      _IdEstado := 1;
      _IdFormaPago := 0;
      _IdDocumento := 0;
      _Numero := 0;

      if _Origen = 1 then
        Nuevo
      else
        Close;
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
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
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

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _IdEstado := 3;

      if _IdEstado = 3 then
        pnlTitulo2.Caption := 'Anulado';

      btnPagar.Enabled := False;
      btnAnular.Enabled := False;
      btnImprimir.Enabled := True;
      pnlEstado.Enabled := False;
      pnlEncabezado.Enabled := False;
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
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
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
        FieldDefs.Add('Proforma_Numero', ftInteger, 0);
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
        FieldDefs.Add('Numero_Factura', ftInteger, 0);
        FieldDefs.Add('PagoCon', ftFloat, 0);
        FieldDefs.Add('Cambio', ftFloat, 0);
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
        FieldDefs.Add('DescuentoPorcentaje', ftFloat, 0);
        FieldDefs.Add('DescuentoMonto', ftFloat, 0);
        FieldDefs.Add('PrecioFinal', ftFloat, 0);
        FieldDefs.Add('Impuesto', ftFloat, 0);
        FieldDefs.Add('PrecioUnitarioFinal', ftFloat, 0);
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
          mBS_facturasclientesencabezado.FieldByName('Proforma_Numero').AsInteger :=
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
          mBS_facturasclientesencabezado.FieldByName('Numero_Factura').AsInteger :=
            FieldByName('NUMEROFACTURA').AsInteger;
          mBS_facturasclientesencabezado.FieldByName('PagoCon').AsFloat :=
            FieldByName('PAGOCON').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('Cambio').AsFloat :=
            FieldByName('CAMBIO').AsFloat;
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
          mBS_facturasclientesdetalle.FieldByName('DescuentoMonto').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('PrecioFinal').AsFloat :=
            FieldByName('PRECIOFINAL').AsFloat;
          mBS_facturasclientesdetalle.FieldByName('Impuesto').AsFloat :=
            FieldByName('IVAM').AsFloat;
//          mBS_facturasclientesdetalle.FieldByName('PrecioUnitarioFinal').AsFloat :=
 //           FieldByName('PrecioUnitarioFinal').AsFloat;
          mBS_facturasclientesdetalle.Post;

          Next;
        end;
      end;
      mDL_TB_FACTURASDETALLE.Destroy;

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      if _IdFormaPago = 1 then
        mWhere.Add('Id=' + IntToStr(3));
      if _IdFormaPago = 5 then
        mWhere.Add('Id=' + IntToStr(4));
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

      if mArchivo.Text = '' then
      begin
        _Resultado := 1;
        _ErrorM := 'No tiene plantilla';
                Application.MessageBox(PChar(_ErrorM),
          'Advertencia', MB_ICONWARNING);
        raise Exception.Create('');
      end;
      mArchivo.Free;

      dmReports.frxDBDataset1.DataSet := mBS_facturasclientesencabezado;
      dmReports.frxDBDataset2.DataSet := mBS_facturasclientesdetalle;
      dmReports.frxDBDataset3.DataSet := mDL_TB_EMPRESAS.Dataset;
      dmReports.frxDBDataset1.Enabled := True;
      dmReports.frxDBDataset2.Enabled := True;
      dmReports.frxDBDataset3.Enabled := True;

      dmReports.frxReport1.LoadFromFile(mNombreArchivo);
      dmReports.frxReport1.PrepareReport();
      dmReports.frxReport1.PrintOptions.Printer :=
        Global.ImpresoraRecibos;
  //    dmReports.frxReport1.ShowReport();
      dmReports.frxReport1.PrintOptions.ShowDialog := False;
      dmReports.frxReport1.Print;
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
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mArchivo: TStringList;
  mNombreArchivo: string;
  mDL_TB_EMPRESAS: TDL_TB_EMPRESAS;
  mBS_Proformasencabezado: TFDMemTable;
  mBS_Proformasdetalle: TFDMemTable;
  mNombrecliente, mNombreVendedor: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mBS_Proformasencabezado := TFDMemTable.Create(nil);
      with mBS_Proformasencabezado do
      begin
        FieldDefs.Clear;
        FieldDefs.Add('Proforma_Numero', ftInteger, 0);
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
        FieldDefs.Add('Numero_Factura', ftInteger, 0);
        FieldDefs.Add('PagoCon', ftFloat, 0);
        FieldDefs.Add('Cambio', ftFloat, 0);
        FieldDefs.Add('FraseMayorista', ftString, 300);
        CreateDataSet;
        Open;
      end;

      mBS_Proformasdetalle := TFDMemTable.Create(nil);
      with mBS_Proformasdetalle do
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

      mDL_TB_EMPRESAS := TDL_TB_EMPRESAS.Create;
      mDL_TB_EMPRESAS.Consultar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Proformasencabezado.Append;
      mBS_Proformasencabezado.FieldByName('Proforma_Numero').AsInteger :=
        _Numero;
      mBS_Proformasencabezado.FieldByName('Fecha').AsString :=
        FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
      mBS_Proformasencabezado.FieldByName('Hora').AsString :=
        FormatDateTime('HH:mm:ss', Time);
      if Trim(cbFactura.Text) <> '[SIN SELECCIONAR]' then
        mNombrecliente := Trim(cbFactura.Text)
      else
        mNombrecliente := '';
      mBS_Proformasencabezado.FieldByName('NombreCliente').AsString :=
        mNombrecliente;
      mBS_Proformasencabezado.FieldByName('SubTotal').AsFloat :=
        _SubTotal;
      mBS_Proformasencabezado.FieldByName('DescuentoMonto').AsFloat :=
        _DescuentoM;
      mBS_Proformasencabezado.FieldByName('IVAMonto').AsFloat :=
        _IVAM;
      mBS_Proformasencabezado.FieldByName('Total').AsFloat :=
        _Total;
     // mBS_facturasclientesencabezado.FieldByName('FechaVencimiento').AsString :=
     //   FormatDateTime('dd/MM/yyyy', FieldByName('FECHAVENCIMIENTO').AsDateTime);
      mBS_Proformasencabezado.FieldByName('NombreVendedor').AsString :=
        mNombreVendedor;
      mBS_Proformasencabezado.Post;

      with _DL_TB_NOTASCREDITODETALLEActual.Dataset do
      begin
        First;
        while not Eof do
        begin
          mBS_Proformasdetalle.Append;
          mBS_Proformasdetalle.FieldByName('Codigo_Producto').AsString :=
            FieldByName('CODIGO').AsString;
          mBS_Proformasdetalle.FieldByName('Nombre_Producto').AsString :=
            FieldByName('NOMBRE').AsString;
          mBS_Proformasdetalle.FieldByName('Cantidad').AsFloat :=
            FieldByName('Cantidad').AsFloat;
          mBS_Proformasdetalle.FieldByName('PrecioUnitario').AsFloat :=
            FieldByName('PRECIOUNITARIO').AsFloat;
          mBS_Proformasdetalle.FieldByName('PrecioUnitarioFinal').AsFloat :=
            FieldByName('PRECIOUNITARIOFINAL').AsFloat;
          mBS_Proformasdetalle.FieldByName('DescuentoMonto').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          mBS_Proformasdetalle.FieldByName('PrecioFinal').AsFloat :=
            FieldByName('PRECIOFINAL').AsFloat;
          mBS_Proformasdetalle.FieldByName('Impuesto').AsFloat :=
            FieldByName('IVAM').AsFloat;
          mBS_Proformasdetalle.Post;

          Next;
        end;
      end;

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      if _IdFormaPago = 1 then
        mWhere.Add('Id=' + IntToStr(3));
      if _IdFormaPago = 5 then
        mWhere.Add('Id=' + IntToStr(4));
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

      dmReports.frxDBDataset1.DataSet := mBS_Proformasencabezado;
      dmReports.frxDBDataset2.DataSet := mBS_Proformasdetalle;
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
      cbFactura.ItemIndex := SetCombo(cbFactura,
        FieldByName('IdCliente').AsInteger);
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
      _DL_TB_NOTASCREDITODETALLEActual.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      LlenarlvLista1(lvLista1, _DL_TB_NOTASCREDITODETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_NOTASCREDITODETALLEActual.Dataset);

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

    if (mValido = True) and (_DL_TB_NOTASCREDITODETALLEActual.Dataset.RecordCount = 0) then
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
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mAPLICARLIMITECREDITO: Integer;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (_IdFormaPago = 5) then
    begin
      if (GetCombo(cbFactura) <= 0)  then
      begin
        mValido := False;
        _ErrorM := 'Debe Seleccionar un cliente';
      end;
    end;
    if (mValido = True) and (_IdFormaPago = 5) then
    begin
      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(GetCombo(cbFactura)));
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mAPLICARLIMITECREDITO :=
        mDL_TB_CLIENTES.Obtener_Valor(mWhere.Text,
          'APLICARLIMITECREDITO', _Resultado, _ErrorM);
      mWhere.Free;
      mDL_TB_CLIENTES.Destroy;
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
        _DL_TB_NOTASCREDITODETALLEActual.Dataset.Locate('IdProducto', mId, []);
      if mEncontrado = True then
      begin
        mCantidad := _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('CANTIDAD').AsFloat;
        mPrecio :=  _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('PRECIOUNITARIO').AsFloat;
        mDescuento :=  _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('DESCUENTOP').AsFloat;
        mIVAPorcentaje :=  _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('IVAP').AsFloat;
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
          with _DL_TB_NOTASCREDITODETALLEActual.Dataset do
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

          LlenarlvLista1(lvLista1, _DL_TB_NOTASCREDITODETALLEActual.Dataset);
          ActualizarTotales(_DL_TB_NOTASCREDITODETALLEActual.Dataset);
        end;
      end;
    end;

  end;
end;

procedure BuscarFactura;
begin
  with Forma01 do
  begin

    FormBuscar_Facturas01.ShowModal;
    if FormBuscar_Facturas01.Tag = 1 then
    begin
      cbFactura.ItemIndex := FormBuscar_Facturas01._Id;
    end;

  end;
end;

procedure Consultar_DetalleFactura(pId: Integer);
var
  mDL_TB_FACTURASCLIENTESDETALLE: TDL_TB_FACTURASCLIENTESDETALLE;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      _DL_TB_NOTASCREDITODETALLEActual.Dataset.EmptyDataSet;

      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mWhere.Add(' And ');
      mWhere.Add('A.CODIGOESTADO <> 3');
      mDL_TB_FACTURASCLIENTESDETALLE := TDL_TB_FACTURASCLIENTESDETALLE.Create;
      mDL_TB_FACTURASCLIENTESDETALLE.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      with mDL_TB_FACTURASCLIENTESDETALLE.Dataset do
      begin
        First;
        while not Eof do
        begin
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.Append;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('CODIGO').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('CODIGO').AsString :=
            FieldByName('CODIGO').AsString;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('NOMBRE').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('CANTIDAD').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('CANTIDAD').AsFloat :=
            FieldByName('CANTIDAD').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('PRECIOUNITARIO').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('PRECIOUNITARIO').AsFloat :=
            FieldByName('PRECIOUNITARIO').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('DESCUENTOP').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('DESCUENTOP').AsFloat :=
            FieldByName('DESCUENTOP').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('DESCUENTOM').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('DESCUENTOM').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('IVAP').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('IVAP').AsFloat :=
            FieldByName('IVAP').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('IVAM').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('IVAM').AsFloat :=
            FieldByName('IVAM').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('PRECIOUNITARIOFINAL').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('PRECIOUNITARIOFINAL').AsFloat :=
            FieldByName('PRECIOUNITARIOFINAL').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('PRECIOFINAL').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('PRECIOFINAL').AsFloat :=
            FieldByName('PRECIOFINAL').AsFloat;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('LINEA').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('LINEA').AsInteger :=
            FieldByName('LINEA').AsInteger;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('IdProducto').Tag := 1;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.FieldByName('IdProducto').AsInteger :=
            FieldByName('IdProducto').AsInteger;
          _DL_TB_NOTASCREDITODETALLEActual.Dataset.Post;
          Next;
        end;
      end;
      mDL_TB_FACTURASCLIENTESDETALLE.Destroy;

      LlenarlvLista1(lvLista1, _DL_TB_NOTASCREDITODETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_NOTASCREDITODETALLEActual.Dataset);

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