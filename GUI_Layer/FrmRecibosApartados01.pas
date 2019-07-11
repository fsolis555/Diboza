unit FrmRecibosApartados01;

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
  TFormRecibosApartados01 = class(TForm)
    pnlEncabezado: TRzPanel;
    Label14: TLabel;
    cbCliente: TComboBoxEx;
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
    pnlCodigoProducto: TRzPanel;
    Label5: TLabel;
    cbDocumentos: TComboBoxEx;
    pnlCodigoBarras: TRzPanel;
    Label6: TLabel;
    edtAbono: TCurrencyEdit;
    btnInsertarLinea: TBitBtn;
    btnEliminarLinea: TBitBtn;
    pnlListaTitulo: TRzPanel;
    chkTodoLista1: TCheckBox;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    lvLista1: TRzListView;
    ImageList1: TImageList;
    popImprimir: TPopupMenu;
    Imprimir1: TMenuItem;
    VistaPrevia1: TMenuItem;
    dtpFecha: TRzDateTimeEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnAnularClick(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure VistaPrevia1Click(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscar_ClientesClick(Sender: TObject);
    procedure btnInsertarLineaClick(Sender: TObject);
    procedure btnEliminarLineaClick(Sender: TObject);
    procedure cbClienteChange(Sender: TObject);
    procedure chkTodoLista1Click(Sender: TObject);
    procedure cbDocumentosDropDown(Sender: TObject);
    procedure cbDocumentosChange(Sender: TObject);
    procedure cbClienteDropDown(Sender: TObject);
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
  FormRecibosApartados01: TFormRecibosApartados01;

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
  procedure DBToFormaDetalle(ds1: TDatasetMem);
  procedure ActualizarTotales(ds1: TDatasetMem);
  procedure LlenarcbClientes(cb: TComboBoxEx);
  procedure Consultar_Cliente(pId: Integer);
  procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
  procedure Nuevo;
  procedure Pagar_Data;
  procedure Anular_Data;
  procedure Imprimir_Data;
  procedure VistaPrevia;
  procedure Cerrar;
  procedure Consultar_Documento(pId: Integer);
  procedure Consultar_Encabezado(pId: Integer);
  procedure DBToFormaEncabezado(ds1: TDatasetMem);
  procedure Consultar_Detalle(pId: Integer);
  procedure CamposValidos_Pagar1;
  procedure CamposValidos_Pagar2;
  procedure CamposValidos_Detalle;
  procedure Insertar_AsientoDetalle(pAsientoDetalle: TDL_TB_AsientosDetalle;
    pIdAsiento: Integer; pTipoPago: Integer);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_RECIBOSAPARTADOSENCABEZADO, BS_DBConexion,
  FrmMensaje_Espera01, uDL_TB_PRODUCTOS, uDL_TB_RECIBOSAPARTADOSDETALLE,
  uDL_TB_CLIENTES, FrmMantenimientoClientes01,
  uDL_TB_CONSECUTIVOS, uDL_TB_PLANTILLAS, uDL_TB_APARTADOSENCABEZADO,
  FrmPagar01, udmReports, uDL_TB_EMPRESAS,
  uDL_TB_AsientosEncabezado, DL_DBGeneral, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_RECIBOSAPARTADOSENCABEZADO;
  Clase_Tipo2 = TDL_TB_RECIBOSAPARTADOSDETALLE;

const
  lv_Nombre = 0;
  lv_id = 1;

var
  Forma01: TFormRecibosApartados01;
  _NumeroFactura: Integer;
  _DL_TB_FACTURASDETALLEActual: Clase_Tipo2;
  _Total: Double;

{$REGION 'Funciones Forma'}
procedure TFormRecibosApartados01.FormShow(Sender: TObject);
begin
  Forma01 := FormRecibosApartados01;

  InicializarForma;
end;

procedure TFormRecibosApartados01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormRecibosApartados01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormRecibosApartados01.btnNuevoClick(Sender: TObject);
begin
  Nuevo;
end;

procedure TFormRecibosApartados01.btnPagarClick(Sender: TObject);
begin
  Pagar_Data;
end;

procedure TFormRecibosApartados01.btnAnularClick(Sender: TObject);
begin
  Anular_Data;
end;

procedure TFormRecibosApartados01.Imprimir1Click(Sender: TObject);
begin
  Imprimir_Data;
end;

procedure TFormRecibosApartados01.VistaPrevia1Click(Sender: TObject);
begin
  VistaPrevia;
end;

procedure TFormRecibosApartados01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormRecibosApartados01.btnBuscar_ClientesClick(Sender: TObject);
begin
  FormMantenimientoClientes01.ShowModal;
  LlenarcbClientes(cbCliente);
end;

procedure TFormRecibosApartados01.btnInsertarLineaClick(Sender: TObject);
begin
  Insertar_Detalle;
end;

procedure TFormRecibosApartados01.btnEliminarLineaClick(Sender: TObject);
begin
  Eliminar_Detalle;
end;

procedure TFormRecibosApartados01.cbClienteChange(Sender: TObject);
begin
  if _IdEstado = 1 then
    Consultar_Cliente(GetCombo(cbCliente));
end;

procedure TFormRecibosApartados01.chkTodoLista1Click(Sender: TObject);
begin
  MDLista_Todos(lvLista1, chkTodoLista1);
end;

procedure TFormRecibosApartados01.cbDocumentosDropDown(Sender: TObject);
begin
  cbDocumentos.Perform(CB_SETDROPPEDWIDTH, 600, 0);
end;

procedure TFormRecibosApartados01.cbDocumentosChange(Sender: TObject);
begin
  Consultar_Documento(GetCombo(cbDocumentos));
end;

procedure TFormRecibosApartados01.cbClienteDropDown(Sender: TObject);
begin
  cbCliente.Perform(CB_SETDROPPEDWIDTH, 600, 0);
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

      LlenarcbClientes(cbCliente);
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
        pnlTitulo2.Caption := 'Abierta';
        pnlEstado3.Caption := '';
        pnlEstado1.Caption := '';
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

    cbCliente.ItemIndex := 0;

  end;
end;

procedure LimpiarCampos_DetalleCampos;
begin
  with Forma01 do
  begin

    _NumeroFactura := 0;

    cbDocumentos.ItemIndex := 0;
    edtAbono.Value := 0;

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

      mEncontrado :=
        _DL_TB_FACTURASDETALLEActual.Dataset.Locate('NUMEROFACTURA', _NumeroFactura, []);

      // Llena el DataSet
      with _DL_TB_FACTURASDETALLEActual.Dataset do
      begin
        Append;
        FieldByName('NUMEROFACTURA').Tag := 1;
        FieldByName('NUMEROFACTURA').AsInteger :=
          _NumeroFactura;
        FieldByName('MONTOABONO').Tag := 1;
        FieldByName('MONTOABONO').AsFloat :=
          edtAbono.Value;
        FieldByName('LINEA').Tag := 1;
        FieldByName('LINEA').AsInteger := 0;
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
            FieldByName('NUMEROFACTURA').AsString);
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('MONTOABONO').AsFloat));
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
      _NumeroFactura :=
        FieldByName('NUMEROFACTURA').AsInteger;

    end;

  end;
end;

procedure ActualizarTotales(ds1: TDatasetMem);
var
  mTotal: Double;
begin
  with Forma01 do
  begin

    mTotal := 0;

    with ds1 do
    begin
      First;
      while not Eof do
      begin
        mTotal := mTotal +
          FieldByName('MONTOABONO').AsFloat;

        Next;
      end;
    end;

    _Total := mTotal;

    pnlTotal.Caption :=
      FormatFloat('#,##0.00', mTotal);

  end;
end;

procedure LlenarcbClientes(cb: TComboBoxEx);
var
  mDL_TB_Clientes: TDL_TB_CLIENTES;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mOrderBy.Add('A.NOMBRECOMPLETO');
      mDL_TB_Clientes := TDL_TB_CLIENTES.Create;
      mDL_TB_Clientes.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_Clientes.Dataset do
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
      mDL_TB_Clientes.Destroy;

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

procedure Consultar_Cliente(pId: Integer);
var
  mWhere, mOrderBy: TStringList;
  mResultado: Integer;
  mErrorM, mLinea: string;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_APARTADOSENCABEZADO;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      with _DL_TB_FACTURASDETALLEActual.Dataset do
        EmptyDataSet;
      LlenarlvLista1(lvLista1, _DL_TB_FACTURASDETALLEActual.Dataset);
      ActualizarTotales(_DL_TB_FACTURASDETALLEActual.Dataset);

      cbDocumentos.Items.Clear;
      cbDocumentos.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mWhere.Add('IdCliente=' + IntToStr(pId));
      mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=5');
      mWhere.Add(' And ');
      mWhere.Add('CODIGOESTADO=4');
      mOrderBy.Add('A.FECHAVENCIMIENTO');
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_APARTADOSENCABEZADO.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          mLinea := FieldByName('NUMERO').AsString + ' - ';
          mLinea := mLinea + FormatFloat('#,##0.00', FieldByName('SALDO').AsFloat) + ' - ';
          mLinea := mLinea + FormatDateTime('dd/MM/yyyy', FieldByName('FECHAVENCIMIENTO').AsDateTime);
          cbDocumentos.Items.AddObject(mLinea,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
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
  mDL_TB_FACTURASProformasENCABEZADO: Clase_Tipo1;
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mNumero: Integer;
  mNombreCliente, mNombreVendedor: string;
  mFechaVencimiento: TDateTime;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_APARTADOSENCABEZADO;
  mSaldo, mTotalDocumento: Double;
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
      FormPagar01.pnlCredito.Visible := False;
      FormPagar01._Total := _Total;
      FormPagar01._Plazo := Global.DiasVencimientoDefault;
      FormPagar01.ShowModal;
      if FormPagar01.Tag = 0 then
      begin
        _Resultado := 1;
        raise Exception.Create('');
      end;
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
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'RECIBOSABONOSAPARTADOS',
      _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mNumero);

      if Trim(cbCliente.Text)  = '[SIN SELECCIONAR]' then
        mNombreCliente := ''
      else
        mNombreCliente := Trim(cbCliente.Text);

      // Encabezado
      mDL_TB_FACTURASProformasENCABEZADO := Clase_Tipo1.Create;
      with mDL_TB_FACTURASProformasENCABEZADO.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_FACTURASProformasENCABEZADO.Limpiar_Tag;
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
        FieldByName('MONTONUMERO').Tag := 1;
        FieldByName('MONTONUMERO').AsFloat :=
          _Total;
        FieldByName('NOMBRECLIENTE').Tag := 1;
        FieldByName('NOMBRECLIENTE').AsString :=
          mNombreCliente;
        FieldByName('TOTALFINAL').Tag := 1;
        FieldByName('TOTALFINAL').AsFloat :=
          _Total;
        FieldByName('CODIGOESTADO').Tag := 1;
        FieldByName('CODIGOESTADO').AsInteger := 2;
        FieldByName('CODIGOFORMAPAGO').Tag := 1;
        FieldByName('CODIGOFORMAPAGO').AsInteger :=
          FormPagar01._IDFormaPago;
        FieldByName('EFECTIVO').Tag := 1;
        FieldByName('EFECTIVO').AsFloat :=
          FormPagar01._EfectivoTotal;
        FieldByName('TARJETA').Tag := 1;
        FieldByName('TARJETA').AsFloat :=
          FormPagar01._TarjetaTotal;
        FieldByName('TRANSFERENCIA').Tag := 1;
        FieldByName('TRANSFERENCIA').AsFloat :=
          FormPagar01._TransferenciaTotal;
        FieldByName('CHEQUE').Tag := 1;
        FieldByName('CHEQUE').AsFloat :=
          FormPagar01._ChequeTotal;
        FieldByName('IdCliente').Tag := 1;
        FieldByName('IdCliente').AsInteger :=
          GetCombo(cbCliente);
        Post;
      end;
      mDL_TB_FACTURASProformasENCABEZADO.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASProformasENCABEZADO.Destroy;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mDL_TB_CONSECUTIVOS.Actualizar_Campo('', 'RECIBOSABONOSAPARTADOS', mNumero,
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
          Post;

          //Actualizar Saldo Factura
          mWhere := TStringList.Create;
          mWhere.Add('Numero=' + IntToStr(FieldByName('NUMEROFACTURA').AsInteger));
          mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_APARTADOSENCABEZADO.Create;
          mSaldo :=
            mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor(mWhere.Text,
              'Saldo', _Resultado, _ErrorM);
          mTotalDocumento :=
            mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor(mWhere.Text,
              'Total', _Resultado, _ErrorM);
          mWhere.Free;
          mSaldo := mSaldo - FieldByName('MONTOABONO').AsFloat;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.EmptyDataSet;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Limpiar_Tag;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.Append;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('SALDO').Tag := 1;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('SALDO').AsFloat :=
            mSaldo;
          if mSaldo = mTotalDocumento then
          begin
            mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('CODIGOESTADO').Tag := 1;
            mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('CODIGOESTADO').AsInteger := 2;
          end;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.Post;
          mWhere := TStringList.Create;
          mWhere.Add('Numero=' + IntToStr(FieldByName('NUMEROFACTURA').AsInteger));
          mDL_TB_FACTURASCLIENTESENCABEZADO.Modificar(mWhere.Text,
            _Resultado,  _ErrorM);
          if _Resultado = -1 then
            raise Exception.Create('');
          mWhere.Free;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

          Next;
        end;
      end;
      _DL_TB_FACTURASDETALLEActual.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(GetCombo(cbCliente)));
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mDL_TB_CLIENTES.Restar_Saldo(mWhere.Text, _Total,
        _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      mDL_TB_CLIENTES.Destroy;

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

      if Application.MessageBox('Desea Imprimir el documento?',
        'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDYES then
        Imprimir_Data;

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
  mDL_TB_RECIBOSENCABEZADO: Clase_Tipo1;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_APARTADOSENCABEZADO;
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mSaldo, mTotalDocumento: Double;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      // Encabezado
      mWhere := TStringList.Create;
      mWhere.Add('Numero=' + IntToStr(_Numero));
      mDL_TB_RECIBOSENCABEZADO := Clase_Tipo1.Create;
      mDL_TB_RECIBOSENCABEZADO.Actualizar_Estado(mWhere.Text, 3,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_RECIBOSENCABEZADO.Destroy;

      // Detalle
      with _DL_TB_FACTURASDETALLEActual.Dataset do
      begin
        First;
        while not Eof do
        begin
          //Actualizar Saldo Factura
          mWhere := TStringList.Create;
          mWhere.Add('Numero=' + IntToStr(FieldByName('NUMEROFACTURA').AsInteger));
          mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_APARTADOSENCABEZADO.Create;
          mSaldo :=
            mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor(mWhere.Text,
              'Saldo', _Resultado, _ErrorM);
          mTotalDocumento :=
            mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor(mWhere.Text,
              'Total', _Resultado, _ErrorM);
          mWhere.Free;
          mSaldo := mSaldo + FieldByName('MONTOABONO').AsFloat;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.EmptyDataSet;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Limpiar_Tag;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.Append;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('SALDO').Tag := 1;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('SALDO').AsFloat :=
            mSaldo;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('CODIGOESTADO').Tag := 1;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.FieldByName('CODIGOESTADO').AsInteger := 4;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset.Post;
          mWhere := TStringList.Create;
          mWhere.Add('Numero=' + IntToStr(FieldByName('NUMEROFACTURA').AsInteger));
          mDL_TB_FACTURASCLIENTESENCABEZADO.Modificar(mWhere.Text,
            _Resultado,  _ErrorM);
          if _Resultado = -1 then
            raise Exception.Create('');
          mWhere.Free;
          mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

          Next;
        end;
      end;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(GetCombo(cbCliente)));
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mDL_TB_CLIENTES.Sumar_Saldo(mWhere.Text, _Total,
        _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      mDL_TB_CLIENTES.Destroy;

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
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mArchivo: TStringList;
  mNombreArchivo: string;
  mDL_TB_EMPRESAS: TDL_TB_EMPRESAS;
  mBS_facturasclientesencabezado: TFDMemTable;
  mBS_facturasclientesdetalle: TFDMemTable;
  mSaldo, mSaldoAnterior, mSaldoActual: Double;
  mIdCliente: Integer;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mIdCliente := GetCombo(cbCliente);
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mSaldo :=
        mDL_TB_CLIENTES.Obtener_Valor('Id=' + IntToStr(mIdCliente), 'Saldo', _Resultado, _ErrorM);
      mDL_TB_CLIENTES.Destroy;
      mSaldoAnterior := mSaldo + _Total;
      mSaldoActual := mSaldo;

      mBS_facturasclientesencabezado := TFDMemTable.Create(nil);
      with mBS_facturasclientesencabezado do
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

      mBS_facturasclientesdetalle := TFDMemTable.Create(nil);
      with mBS_facturasclientesdetalle do
      begin
        FieldDefs.Clear;
        FieldDefs.Add('Factura_Numero', ftString, 50);
        FieldDefs.Add('MontoAbono', ftFloat, 0);
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
          mBS_facturasclientesencabezado.FieldByName('Recibo_Numero').AsInteger :=
            FieldByName('NUMERO').AsInteger;
          mBS_facturasclientesencabezado.FieldByName('Fecha').AsString :=
            FormatDateTime('dd/MM/yyyy', FieldByName('Fecha').AsDateTime);
          mBS_facturasclientesencabezado.FieldByName('Hora').AsString :=
            FieldByName('HORA').AsString;
          mBS_facturasclientesencabezado.FieldByName('NombreCliente').AsString :=
            FieldByName('NOMBRECLIENTE').AsString;
          mBS_facturasclientesencabezado.FieldByName('MontoNumero').AsFloat :=
            FieldByName('TOTALFINAL').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('SaldoAnterior').AsFloat :=
            mSaldoAnterior;
          mBS_facturasclientesencabezado.FieldByName('SaldoActual').AsFloat :=
            mSaldoActual;
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
          mBS_facturasclientesdetalle.FieldByName('Factura_Numero').AsString :=
            FieldByName('NUMEROFACTURA').AsString;
          mBS_facturasclientesdetalle.FieldByName('MontoAbono').AsFloat :=
            FieldByName('MONTOABONO').AsFloat;
          mBS_facturasclientesdetalle.Post;

          Next;
        end;
      end;
      mDL_TB_FACTURASDETALLE.Destroy;

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(12));
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
  mNombrecliente, mNombreVendedor: string;
  mIdCliente: Integer;
  mSaldo, mSaldoAnterior, mSaldoActual: Double;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mIdCliente := GetCombo(cbCliente);
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mSaldo :=
        mDL_TB_CLIENTES.Obtener_Valor('Id=' + IntToStr(mIdCliente), 'Saldo', _Resultado, _ErrorM);
      mDL_TB_CLIENTES.Destroy;
      mSaldoAnterior := mSaldo + _Total;
      mSaldoActual := mSaldo;

      mBS_facturasclientesencabezado := TFDMemTable.Create(nil);
      with mBS_facturasclientesencabezado do
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

      mBS_facturasclientesdetalle := TFDMemTable.Create(nil);
      with mBS_facturasclientesdetalle do
      begin
        FieldDefs.Clear;
        FieldDefs.Add('Factura_Numero', ftString, 50);
        FieldDefs.Add('MontoAbono', ftFloat, 0);
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
          mBS_facturasclientesencabezado.FieldByName('Recibo_Numero').AsInteger :=
            FieldByName('NUMERO').AsInteger;
          mBS_facturasclientesencabezado.FieldByName('Fecha').AsString :=
            FormatDateTime('dd/MM/yyyy', FieldByName('Fecha').AsDateTime);
          mBS_facturasclientesencabezado.FieldByName('Hora').AsString :=
            FieldByName('HORA').AsString;
          mBS_facturasclientesencabezado.FieldByName('NombreCliente').AsString :=
            FieldByName('NOMBRECLIENTE').AsString;
          mBS_facturasclientesencabezado.FieldByName('MontoNumero').AsFloat :=
            FieldByName('TOTALFINAL').AsFloat;
          mBS_facturasclientesencabezado.FieldByName('SaldoAnterior').AsFloat :=
            mSaldoAnterior;
          mBS_facturasclientesencabezado.FieldByName('SaldoActual').AsFloat :=
            mSaldoActual;
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
          mBS_facturasclientesdetalle.FieldByName('Factura_Numero').AsString :=
            FieldByName('NUMEROFACTURA').AsString;
          mBS_facturasclientesdetalle.FieldByName('MontoAbono').AsFloat :=
            FieldByName('MONTOABONO').AsFloat;
          mBS_facturasclientesdetalle.Post;

          Next;
        end;
      end;
      mDL_TB_FACTURASDETALLE.Destroy;

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(12));
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
     // dmReports.frxReport1.PrintOptions.Printer :=
     //   Global.ImpresoraRecibos;
      dmReports.frxReport1.ShowReport();
   //   dmReports.frxReport1.PrintOptions.ShowDialog := False;
  //    dmReports.frxReport1.Print;
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

procedure Consultar_Documento(pId: Integer);
var
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mSaldo: Double;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_APARTADOSENCABEZADO;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(pId));
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_APARTADOSENCABEZADO.Create;
      mSaldo :=
        mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor(mWhere.Text, 'Saldo',
          _Resultado, _ErrorM);
      _NumeroFactura :=
        mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_Valor(mWhere.Text, 'Numero',
          _Resultado, _ErrorM);
      mWhere.Free;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      edtAbono.Value := mSaldo;

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
        FieldByName('TOTALFINAL').AsFloat);
      cbCliente.ItemIndex := SetCombo(cbCliente,
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
      if (GetCombo(cbCliente) <= 0)  then
      begin
        mValido := False;
        _ErrorM := 'Debe Seleccionar un cliente';
      end;
    end;
    if (mValido = True) and (_IdFormaPago = 5) then
    begin
      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(GetCombo(cbCliente)));
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mAPLICARLIMITECREDITO :=
        mDL_TB_CLIENTES.Obtener_Valor(mWhere.Text,
          'APLICARLIMITECREDITO', _Resultado, _ErrorM);
      mWhere.Free;
      mDL_TB_CLIENTES.Destroy;
      if mAPLICARLIMITECREDITO = 1 then
      begin
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
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 15;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').AsString := 'Venta de mercader�as';
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
        pAsientoDetalle.Dataset.FieldByName('IDCUENTA').AsInteger := 18;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').Tag := 1;
        pAsientoDetalle.Dataset.FieldByName('DESCRIPCION').AsString := 'Venta de mercader�as';
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