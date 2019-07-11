unit FrmProductos01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, Vcl.Mask, RxToolEdit,
  RxCurrEdit;

type
  TFormProductos01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNombre: TEdit;
    Label3: TLabel;
    edtCodigoBarras: TEdit;
    edtUtilidad: TCurrencyEdit;
    Label4: TLabel;
    edtCosto: TCurrencyEdit;
    Label5: TLabel;
    edtVenta: TCurrencyEdit;
    Label6: TLabel;
    edtMayorista: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    cbProveedor: TComboBoxEx;
    Label9: TLabel;
    cbImpuesto: TComboBoxEx;
    edtExistencia: TCurrencyEdit;
    Label10: TLabel;
    edtMinimo: TCurrencyEdit;
    Label11: TLabel;
    edtVentaIVA: TCurrencyEdit;
    Label12: TLabel;
    Label13: TLabel;
    cbFamilia: TComboBoxEx;
    Label14: TLabel;
    dtpVencimiento: TDateTimePicker;
    rbFisico: TRadioButton;
    rbServicio: TRadioButton;
    chkImpuestoIncluido: TCheckBox;
    btnBuscar_Proveedores: TBitBtn;
    btnBuscar_Familias: TBitBtn;
    TabSheet2: TRzTabSheet;
    Label17: TLabel;
    btnMovimientoExistencias: TBitBtn;
    Label20: TLabel;
    edtPeso: TCurrencyEdit;
    TabSheet3: TRzTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cbCuentaIngresos: TComboBoxEx;
    cbCuentaGastos: TComboBoxEx;
    cbCuentaActivos: TComboBoxEx;
    cbCuentaDesembolso: TComboBoxEx;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edtMinimoLunes: TCurrencyEdit;
    edtMinimoMartes: TCurrencyEdit;
    edtMinimoMiercoles: TCurrencyEdit;
    edtMinimoJueves: TCurrencyEdit;
    edtMinimoViernes: TCurrencyEdit;
    edtMinimoSabado: TCurrencyEdit;
    edtMinimoDomingo: TCurrencyEdit;
    chkPermitirDescuentos: TCheckBox;
    Label28: TLabel;
    cbComanda: TComboBoxEx;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtUtilidadExit(Sender: TObject);
    procedure edtVentaChange(Sender: TObject);
    procedure cbImpuestoChange(Sender: TObject);
    procedure chkImpuestoIncluidoClick(Sender: TObject);
    procedure edtVentaIVAChange(Sender: TObject);
    procedure btnBuscar_FamiliasClick(Sender: TObject);
    procedure btnBuscar_ProveedoresClick(Sender: TObject);
    procedure btnMovimientoExistenciasClick(Sender: TObject);
  private
    FId: Integer;
    FOpcion: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
  end;

var
  FormProductos01: TFormProductos01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure DBToForma(ds1: TDatasetMem);
  procedure Consultar_Data(pId: Integer);
  procedure CamposValidos;
  procedure Insertar_Data;
  procedure Modificar_Data(pId: Integer);
  procedure LlenarcbProveedores(cb: TComboBoxEx);
  procedure LlenarcbImpuestos(cb: TComboBoxEx);
  procedure LlenarcbFamilias(cb: TComboBoxEx);
  procedure Actualizar_Impuesto;
  procedure Cambiar_ImpuestoIncluido;
  procedure Actualizar_Venta;
  procedure Buscar_Famlias;
  procedure Buscar_Proveedores;
  procedure LlenarcbCuenta(cb: TComboBoxEx);
  procedure Movimiento_Inventario;
  procedure LlenarImpresoras;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_FAMILIAS, BS_DBConexion, DL_DBGeneral,
  uDL_TB_PROVEEDORES, uDL_TB_IMPUESTOS, uDL_TB_PRODUCTOS,
  FrmMantenimientoFamilias01, FrmMantenimientoProveedores01,
  uDL_TB_Cuentas, FrmMovimientoInventario01, uDL_TB_INVENTARIOM,
  uDL_TB_AsientosEncabezado, uDL_TB_AsientosDetalle,
  uDL_TB_CONSECUTIVOS, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_PRODUCTOS;

var
  Forma01: TFormProductos01;
  _Codigo: string;
  _Nombre: string;
  _CodigoBarras: string;
  _ExistenciaAnterior: Double;

{$REGION 'Funciones Forma'}
procedure TFormProductos01.FormShow(Sender: TObject);
begin
  Forma01 := FormProductos01;

  InicializarForma;
end;

procedure TFormProductos01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormProductos01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormProductos01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormProductos01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormProductos01.cbImpuestoChange(Sender: TObject);
begin
  Actualizar_Impuesto;
end;

procedure TFormProductos01.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', 'a'..'z', 'A'..'Z', '_', ' ']) then
    Key := #0;
end;

procedure TFormProductos01.edtUtilidadExit(Sender: TObject);
var
  mUtilidad, mUtilidadPM: Double;
  mCompra, mVenta: Double;
begin
  mUtilidad := edtUtilidad.Value;
  mCompra := edtCosto.Value;
  mUtilidadPM := 0;
  if mUtilidad > 0 then
    mUtilidadPM := mUtilidad / 100;
  mVenta := (mCompra * mUtilidadPM) + mCompra;
  edtVenta.Value := mVenta;
end;

procedure TFormProductos01.edtVentaChange(Sender: TObject);
begin
  if chkImpuestoIncluido.Checked = False then
    Actualizar_Impuesto;
end;

procedure TFormProductos01.edtVentaIVAChange(Sender: TObject);
begin
  if chkImpuestoIncluido.Checked = True then
    Actualizar_Venta;
end;

procedure TFormProductos01.chkImpuestoIncluidoClick(Sender: TObject);
begin
  Cambiar_ImpuestoIncluido;
end;

procedure TFormProductos01.btnBuscar_FamiliasClick(Sender: TObject);
begin
  Buscar_Famlias;
end;

procedure TFormProductos01.btnBuscar_ProveedoresClick(Sender: TObject);
begin
  Buscar_Proveedores;
end;

procedure TFormProductos01.btnMovimientoExistenciasClick(Sender: TObject);
begin
  Movimiento_Inventario;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
var
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mUltimo: Integer;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LlenarcbProveedores(cbProveedor);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbImpuestos(cbImpuesto);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbFamilias(cbFamilia);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbCuenta(cbCuentaIngresos);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbCuenta(cbCuentaGastos);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbCuenta(cbCuentaActivos);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbCuenta(cbCuentaDesembolso);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarImpresoras;

      LimpiarCampos;
      CargarIdioma;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mUltimo :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'PRODUCTOS', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mUltimo);
      edtCodigo.Text := IntToStr(mUltimo);

      case _Opcion of
        1: begin
          pnlAccion.Caption := 'NUEVO';
          btnMovimientoExistencias.Enabled := False;
          edtExistencia.ReadOnly := False;
        end;
        2: begin
          pnlAccion.Caption := 'MODIFICAR';
          Consultar_Data(_Id);
          if _Resultado = -1 then
            raise Exception.Create('');
          btnMovimientoExistencias.Enabled := True;
          edtExistencia.ReadOnly := True;
        end;
      end;
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

    _Codigo := '';
    _Nombre := '';
    _CodigoBarras := '';
    _ExistenciaAnterior := 0;

    pgcCampos.ActivePageIndex := 0;
    edtCodigo.Clear;
    edtNombre.Clear;
    edtCodigoBarras.Clear;
    cbProveedor.ItemIndex := 0;
    cbImpuesto.ItemIndex := 0;
    edtUtilidad.Value := 0;
    edtCosto.Value := 0;
    edtVenta.Value := 0;
    edtMayorista.Value := 0;
    edtExistencia.Value := 0;
    edtMinimo.Value := 0;
    edtVentaIVA.Value := 0;
    cbFamilia.ItemIndex := 0;
    dtpVencimiento.Date := Date;
    rbFisico.Checked := True;
    chkImpuestoIncluido.Checked := False;
    edtVenta.Enabled := True;
    edtVentaIVA.Enabled := False;
    if Global.ImpuestoIncluido = 1 then
    begin
      chkImpuestoIncluido.Checked := True;
      edtVenta.Enabled := False;
      edtVentaIVA.Enabled := True;
    end;
    cbCuentaIngresos.ItemIndex := 0;
    cbCuentaGastos.ItemIndex := 0;
    cbCuentaActivos.ItemIndex := 0;
    cbCuentaDesembolso.ItemIndex := 0;
    edtPeso.Value := 0;
    edtMinimoLunes.Value := 0;
    edtMinimoMartes.Value := 0;
    edtMinimoMiercoles.Value := 0;
    edtMinimoJueves.Value := 0;
    edtMinimoViernes.Value := 0;
    edtMinimoSabado.Value := 0;
    edtMinimoDomingo.Value := 0;
    chkPermitirDescuentos.Checked := True;
    cbComanda.ItemIndex := 0;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    case _Opcion of
      1: Insertar_Data;
      2: Modificar_Data(_Id);
    end;

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
      _Nombre :=
        FieldByName('Nombre').AsString;
      _Codigo :=
        FieldByName('CODIGO').AsString;
      _CodigoBarras :=
        FieldByName('CODIGOBARRAS').AsString;
      _ExistenciaAnterior :=
        FieldByName('EXISTENCIA').AsFloat;;

      edtCodigo.Text :=
        FieldByName('CODIGO').AsString;
      edtNombre.Text :=
        FieldByName('Nombre').AsString;
      edtCodigoBarras.Text :=
        FieldByName('CODIGOBARRAS').AsString;
      cbProveedor.ItemIndex := SetCombo(cbProveedor,
        FieldByName('IDProveedor').AsInteger);
      cbImpuesto.ItemIndex := SetCombo(cbImpuesto,
        FieldByName('CODIGOIMPUESTO').AsInteger);
      edtUtilidad.Value :=
        FieldByName('UTILIDAD').AsFloat;
      edtCosto.Value :=
        FieldByName('PRECIOCOSTO').AsFloat;
      edtVenta.Value :=
        FieldByName('PRECIOVENTA').AsFloat;
      edtMayorista.Value :=
        FieldByName('PRECIOMAYORISTA').AsFloat;
      edtExistencia.Value :=
        FieldByName('EXISTENCIA').AsFloat;
      edtMinimo.Value :=
        FieldByName('EXISTENCIAMINIMA').AsFloat;
      cbFamilia.ItemIndex := SetCombo(cbFamilia,
        FieldByName('CODIGOFAMILIA').AsInteger);
      dtpVencimiento.Date :=
        FieldByName('FechaVencimiento').AsDateTime;
      if FieldByName('IdTipo').AsInteger = 1 then
        rbFisico.Checked := True
      else
        rbServicio.Checked := True;
      edtPeso.Value :=
        FieldByName('Peso').AsFloat;
      edtMinimoLunes.Value :=
        FieldByName('MINIMOLUNES').AsFloat;
      edtMinimoMartes.Value :=
        FieldByName('MINIMOMARTES').AsFloat;
      edtMinimoMiercoles.Value :=
        FieldByName('MINIMOMIERCOLES').AsFloat;
      edtMinimoJueves.Value :=
        FieldByName('MINIMOJUEVES').AsFloat;
      edtMinimoViernes.Value :=
        FieldByName('MINIMOVIERNES').AsFloat;
      edtMinimoSabado.Value :=
        FieldByName('MINIMOSABADO').AsFloat;
      edtMinimoDomingo.Value :=
        FieldByName('MINIMODOMINGO').AsFloat;
      if FieldByName('PERMITIRDESCUENTOS').AsInteger = 1 then
        chkPermitirDescuentos.Checked := True
      else
        chkPermitirDescuentos.Checked := False;
      cbComanda.ItemIndex := SetCombo(cbComanda,
        FieldByName('CODIGOCOMANDA').AsInteger);
    end;
    Actualizar_Impuesto;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Productos: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Productos := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Productos.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Productos.Dataset);
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

procedure CamposValidos;
var
  mValido: Boolean;
  mBS_Productos: Clase_Tipo1;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mNombre, mCodigo, mCodigoBarras: string;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (Trim(edtCodigo.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El c�digo no puede estar vacio';
    end;
    if (mValido = True) and (Trim(edtNombre.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El nombre no puede estar vacio';
    end;

    if _Opcion = 1 then
    begin
      mNombre := Trim(edtNombre.Text);
      mCodigo := Trim(edtCodigo.Text);
      mCodigoBarras := Trim(edtCodigoBarras.Text);
    end;
    if _Opcion = 2 then
    begin
      // Nombre
      if Trim(_Nombre) = Trim(edtNombre.Text) then
        mNombre := _Nombre;
      if Trim(_Nombre) <> Trim(edtNombre.Text) then
        mNombre := Trim(edtNombre.Text);
      // Codigo
      if Trim(_Codigo) = Trim(edtCodigo.Text) then
        mCodigo := _Codigo;
      if Trim(_Codigo) <> Trim(edtCodigo.Text) then
        mCodigo := Trim(edtCodigo.Text);
      // Codigo Barras
      if Trim(_CodigoBarras) = Trim(edtCodigoBarras.Text) then
        mCodigoBarras := _CodigoBarras;
      if Trim(_CodigoBarras) <> Trim(edtCodigoBarras.Text) then
        mCodigoBarras := Trim(edtCodigoBarras.Text);
    end;
    // Valida Nombre
    mBS_Productos := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Nombre=' + QuotedStr(mNombre));
    mEncontrado :=
      mBS_Productos.Existe_Campo(mWhere.Text, 'Nombre', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Productos.Destroy;
    if _Opcion = 1 then
    begin
      if (mValido = True) and (mEncontrado = True) then
      begin
        mValido := False;
        _ErrorM := 'El nombre ya existe';
      end;
    end;
    if _Opcion = 2 then
    begin
      if Trim(edtNombre.Text) = _Nombre then
      begin
        if (mValido = True) and (mEncontrado = False) then
        begin
          mValido := False;
          _ErrorM := 'El nombre no existe';
        end;
      end;
      if Trim(edtNombre.Text) <> _Nombre then
      begin
        if (mValido = True) and (mEncontrado = True) then
        begin
          mValido := False;
          _ErrorM := 'El nombre ya existe';
        end;
      end;
    end;

    // Valida Codigo
    mBS_Productos := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Codigo=' + QuotedStr(mCodigo));
    mEncontrado :=
      mBS_Productos.Existe_Campo(mWhere.Text, 'Codigo', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Productos.Destroy;
    if _Opcion = 1 then
    begin
      if (mValido = True) and (mEncontrado = True) then
      begin
        mValido := False;
        _ErrorM := 'El c�digo ya existe';
      end;
    end;
    if _Opcion = 2 then
    begin
      if Trim(edtCodigo.Text) = _Codigo then
      begin
        if (mValido = True) and (mEncontrado = False) then
        begin
          mValido := False;
          _ErrorM := 'El c�digo no existe';
        end;
      end;
      if Trim(edtCodigo.Text) <> _Codigo then
      begin
        if (mValido = True) and (mEncontrado = True) then
        begin
          mValido := False;
          _ErrorM := 'El c�digo ya existe';
        end;
      end;
    end;

    // Valida C�digo Barras
    if Trim(edtCodigoBarras.Text) <> '' then
    begin
      mBS_Productos := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOBARRAS=' + QuotedStr(mCodigoBarras));
      mEncontrado :=
        mBS_Productos.Existe_Campo(mWhere.Text, 'CODIGOBARRAS', _Resultado, _ErrorM);
      mWhere.Free;
      mBS_Productos.Destroy;
      if _Opcion = 1 then
      begin
        if (mValido = True) and (mEncontrado = True) then
        begin
          mValido := False;
          _ErrorM := 'El c�digo barras ya existe';
        end;
      end;
      if _Opcion = 2 then
      begin
        if Trim(edtCodigoBarras.Text) = _CodigoBarras then
        begin
          if (mValido = True) and (mEncontrado = False) then
          begin
            mValido := False;
            _ErrorM := 'El c�digo barras no existe';
          end;
        end;
        if Trim(edtCodigoBarras.Text) <> _CodigoBarras then
        begin
          if (mValido = True) and (mEncontrado = True) then
          begin
            mValido := False;
            _ErrorM := 'El c�digo barras ya existe';
          end;
        end;
      end;
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data;
var
  mBS_Productos: Clase_Tipo1;
  mWhere: TStringList;
  mId: Integer;
  mResultado: Integer;
  mErrorM: string;
  mDL_TB_INVENTARIOM: TDL_TB_INVENTARIOM;
  mbs_DBGeneral: tbs_DBGeneral;
  mUltimo, mIdAsiento: Integer;
  mDL_TB_AsientosEncabezado: TDL_TB_AsientosEncabezado;
  mDL_TB_AsientosDetalle: TDL_TB_AsientosDetalle;
  mIdCuentaIngreso, mIdCuentaDesembolso: Integer;
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mUltimoProducto: Integer;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mUltimoProducto :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'PRODUCTOS', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mUltimoProducto);

      mBS_Productos := Clase_Tipo1.Create;
      with mBS_Productos.Dataset do
      begin
        EmptyDataSet;
        mBS_Productos.Limpiar_Tag;
        Append;
        FieldByName('Id').Tag := 1;
        FieldByName('Id').AsInteger :=
          mUltimoProducto;
        FieldByName('CODIGO').Tag := 1;
        FieldByName('CODIGO').AsString :=
          edtCodigo.Text;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('EXISTENCIA').Tag := 1;
        FieldByName('EXISTENCIA').AsFloat :=
          edtExistencia.Value;
        FieldByName('EXISTENCIAMINIMA').Tag := 1;
        FieldByName('EXISTENCIAMINIMA').AsFloat :=
          edtMinimo.Value;
        FieldByName('APLICAREXISTENCIAMINIMA').Tag := 1;
        FieldByName('APLICAREXISTENCIAMINIMA').AsInteger := 1;
        FieldByName('APLICARIVA').Tag := 1;
        FieldByName('APLICARIVA').AsInteger := 1;
        FieldByName('COMPROMETIDOS').Tag := 1;
        FieldByName('COMPROMETIDOS').AsFloat := 0;
        FieldByName('PRECIOCOSTO').Tag := 1;
        FieldByName('PRECIOCOSTO').AsFloat :=
          edtCosto.Value;
        FieldByName('PRECIOVENTA').Tag := 1;
        FieldByName('PRECIOVENTA').AsFloat :=
          edtVenta.Value;
        FieldByName('UTILIDAD').Tag := 1;
        FieldByName('UTILIDAD').AsFloat :=
          edtUtilidad.Value;
        FieldByName('CODIGOIMPUESTO').Tag := 1;
        FieldByName('CODIGOIMPUESTO').AsInteger :=
          GetCombo(cbImpuesto);
        FieldByName('CODIGOBARRAS').Tag := 1;
        FieldByName('CODIGOBARRAS').AsString :=
          edtCodigoBarras.Text;
        FieldByName('PRECIOVENTASIMPLE').Tag := 1;
        FieldByName('PRECIOVENTASIMPLE').AsFloat :=
          edtVenta.Value;
        FieldByName('PRECIOMAYORISTA').Tag := 1;
        FieldByName('PRECIOMAYORISTA').AsFloat :=
          edtMayorista.Value;
        FieldByName('IDProveedor').Tag := 1;
        FieldByName('IDProveedor').AsInteger :=
          GetCombo(cbProveedor);
        FieldByName('CODIGOFAMILIA').Tag := 1;
        FieldByName('CODIGOFAMILIA').AsInteger :=
          GetCombo(cbFamilia);
        FieldByName('IdTipo').Tag := 1;
        if rbFisico.Checked = True then
          FieldByName('IdTipo').AsInteger := 1;
        if rbServicio.Checked = True then
          FieldByName('IdTipo').AsInteger := 2;
        FieldByName('FechaVencimiento').Tag := 1;
        FieldByName('FechaVencimiento').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpVencimiento.Date);
        FieldByName('ESCOMPUESTO').Tag := 1;
        FieldByName('ESCOMPUESTO').AsInteger := 0;
        FieldByName('Peso').Tag := 1;
        FieldByName('Peso').AsFloat := edtPeso.Value;
        FieldByName('MINIMOLUNES').Tag := 1;
        FieldByName('MINIMOLUNES').AsFloat := edtMinimoLunes.Value;
        FieldByName('MINIMOMARTES').Tag := 1;
        FieldByName('MINIMOMARTES').AsFloat := edtMinimoMartes.Value;
        FieldByName('MINIMOMIERCOLES').Tag := 1;
        FieldByName('MINIMOMIERCOLES').AsFloat := edtMinimoMiercoles.Value;
        FieldByName('MINIMOJUEVES').Tag := 1;
        FieldByName('MINIMOJUEVES').AsFloat := edtMinimoJueves.Value;
        FieldByName('MINIMOVIERNES').Tag := 1;
        FieldByName('MINIMOVIERNES').AsFloat := edtMinimoViernes.Value;
        FieldByName('MINIMOSABADO').Tag := 1;
        FieldByName('MINIMOSABADO').AsFloat := edtMinimoSabado.Value;
        FieldByName('MINIMODOMINGO').Tag := 1;
        FieldByName('MINIMODOMINGO').AsFloat := edtMinimoDomingo.Value;
        FieldByName('PERMITIRDESCUENTOS').Tag := 1;
        if chkPermitirDescuentos.Checked = True then
          FieldByName('PERMITIRDESCUENTOS').AsInteger := 1
        else
          FieldByName('PERMITIRDESCUENTOS').AsInteger := 0;
        FieldByName('CODIGOCOMANDA').Tag := 1;
        FieldByName('CODIGOCOMANDA').AsInteger :=
          GetCombo(cbComanda);
        Post;
      end;
      mBS_Productos.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Productos.Destroy;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mDL_TB_CONSECUTIVOS.Actualizar_Campo('', 'PRODUCTOS', mUltimoProducto,  _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;

      mDL_TB_INVENTARIOM := TDL_TB_INVENTARIOM.Create;
      with mDL_TB_INVENTARIOM.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_INVENTARIOM.Limpiar_Tag;
        Append;
        FieldByName('FECHA').Tag := 1;
        FieldByName('FECHA').AsString :=
          FormatDateTime('dd/MM/yyyy', Date);
        FieldByName('IDPRODUCTO').Tag := 1;
        FieldByName('IDPRODUCTO').AsInteger :=
          mUltimoProducto;
        FieldByName('CANTIDAD').Tag := 1;
        FieldByName('CANTIDAD').AsFloat :=
          edtExistencia.Value;
        FieldByName('TIPO').Tag := 1;
        FieldByName('TIPO').AsInteger := 1;
        FieldByName('MOTIVO').Tag := 1;
        FieldByName('MOTIVO').AsString :=
          'Saldo Inicial';
        Post;
      end;
      mDL_TB_INVENTARIOM.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_INVENTARIOM.Destroy;

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

        mIdCuentaIngreso := GetCombo(cbCuentaIngresos);
        mIdCuentaDesembolso := GetCombo(cbCuentaDesembolso);

        mDL_TB_AsientosDetalle := TDL_TB_AsientosDetalle.Create;
        with mDL_TB_AsientosDetalle.Dataset do
        begin
          EmptyDataSet;
          mDL_TB_AsientosDetalle.Limpiar_Tag;
          Append;
          FieldByName('IDENCABEZADO').Tag := 1;
          FieldByName('IDENCABEZADO').AsInteger :=
            mIdAsiento;
          FieldByName('IDMOVIMIENTO').Tag := 1;
          FieldByName('IDMOVIMIENTO').AsInteger := 1;
          FieldByName('IDCUENTA').Tag := 1;
          FieldByName('IDCUENTA').AsInteger := 20;
          FieldByName('DESCRIPCION').Tag := 1;
          FieldByName('DESCRIPCION').AsString := 'Compra de mercader�as';
          FieldByName('REFERENCIA').Tag := 1;
          FieldByName('REFERENCIA').AsString := '';
          FieldByName('MONTO').Tag := 1;
          FieldByName('MONTO').AsFloat := edtCosto.Value * edtExistencia.Value;
          FieldByName('DEBE').Tag := 1;
          FieldByName('DEBE').AsFloat := edtCosto.Value * edtExistencia.Value;
          FieldByName('HABER').Tag := 1;
          FieldByName('HABER').AsFloat := 0;
          Post;
        end;
        mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_AsientosDetalle.Destroy;

        mDL_TB_AsientosDetalle := TDL_TB_AsientosDetalle.Create;
        with mDL_TB_AsientosDetalle.Dataset do
        begin
          EmptyDataSet;
          mDL_TB_AsientosDetalle.Limpiar_Tag;
          Append;
          FieldByName('IDENCABEZADO').Tag := 1;
          FieldByName('IDENCABEZADO').AsInteger :=
            mIdAsiento;
          FieldByName('IDMOVIMIENTO').Tag := 1;
          FieldByName('IDMOVIMIENTO').AsInteger := 1;
          FieldByName('IDCUENTA').Tag := 1;
          FieldByName('IDCUENTA').AsInteger := 15;
          FieldByName('DESCRIPCION').Tag := 1;
          FieldByName('DESCRIPCION').AsString := 'Compra de mercader�as';
          FieldByName('REFERENCIA').Tag := 1;
          FieldByName('REFERENCIA').AsString := '';
          FieldByName('MONTO').Tag := 1;
          FieldByName('MONTO').AsFloat := edtCosto.Value * edtExistencia.Value;
          FieldByName('DEBE').Tag := 1;
          FieldByName('DEBE').AsFloat := 0;
          FieldByName('HABER').Tag := 1;
          FieldByName('HABER').AsFloat := edtCosto.Value * edtExistencia.Value;
          Post;
        end;
        mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_AsientosDetalle.Destroy;
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

procedure Modificar_Data(pId: Integer);
var
  mBS_Productos: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mDL_TB_INVENTARIOM: TDL_TB_INVENTARIOM;
  mCantidad: Double;
  mbs_DBGeneral: tbs_DBGeneral;
  mDL_TB_AsientosEncabezado: TDL_TB_AsientosEncabezado;
  mDL_TB_AsientosDetalle: TDL_TB_AsientosDetalle;
  mIdAsiento: Integer;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mBS_Productos := Clase_Tipo1.Create;
      with mBS_Productos.Dataset do
      begin
        EmptyDataSet;
        mBS_Productos.Limpiar_Tag;
        Append;
        FieldByName('CODIGO').Tag := 1;
        FieldByName('CODIGO').AsString :=
          edtCodigo.Text;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('EXISTENCIA').Tag := 1;
        FieldByName('EXISTENCIA').AsFloat :=
          edtExistencia.Value;
        FieldByName('EXISTENCIAMINIMA').Tag := 1;
        FieldByName('EXISTENCIAMINIMA').AsFloat :=
          edtMinimo.Value;
        FieldByName('APLICAREXISTENCIAMINIMA').Tag := 1;
        FieldByName('APLICAREXISTENCIAMINIMA').AsInteger := 1;
        FieldByName('APLICARIVA').Tag := 1;
        FieldByName('APLICARIVA').AsInteger := 1;
        FieldByName('PRECIOCOSTO').Tag := 1;
        FieldByName('PRECIOCOSTO').AsFloat :=
          edtCosto.Value;
        FieldByName('PRECIOVENTA').Tag := 1;
        FieldByName('PRECIOVENTA').AsFloat :=
          edtVenta.Value;
        FieldByName('UTILIDAD').Tag := 1;
        FieldByName('UTILIDAD').AsFloat :=
          edtUtilidad.Value;
        FieldByName('CODIGOIMPUESTO').Tag := 1;
        FieldByName('CODIGOIMPUESTO').AsInteger :=
          GetCombo(cbImpuesto);
        FieldByName('CODIGOBARRAS').Tag := 1;
        FieldByName('CODIGOBARRAS').AsString :=
          edtCodigoBarras.Text;
        FieldByName('PRECIOVENTASIMPLE').Tag := 1;
        FieldByName('PRECIOVENTASIMPLE').AsFloat :=
          edtVenta.Value;
        FieldByName('PRECIOMAYORISTA').Tag := 1;
        FieldByName('PRECIOMAYORISTA').AsFloat :=
          edtMayorista.Value;
        FieldByName('IDProveedor').Tag := 1;
        FieldByName('IDProveedor').AsInteger :=
          GetCombo(cbProveedor);
        FieldByName('CODIGOFAMILIA').Tag := 1;
        FieldByName('CODIGOFAMILIA').AsInteger :=
          GetCombo(cbFamilia);
        FieldByName('FechaVencimiento').Tag := 1;
        FieldByName('FechaVencimiento').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpVencimiento.Date);
        FieldByName('IdTipo').Tag := 1;
        if rbFisico.Checked = True then
          FieldByName('IdTipo').AsInteger := 1;
        if rbServicio.Checked = True then
          FieldByName('IdTipo').AsInteger := 2;
        FieldByName('Peso').Tag := 1;
        FieldByName('Peso').AsFloat := edtPeso.Value;
        FieldByName('MINIMOLUNES').Tag := 1;
        FieldByName('MINIMOLUNES').AsFloat := edtMinimoLunes.Value;
        FieldByName('MINIMOMARTES').Tag := 1;
        FieldByName('MINIMOMARTES').AsFloat := edtMinimoMartes.Value;
        FieldByName('MINIMOMIERCOLES').Tag := 1;
        FieldByName('MINIMOMIERCOLES').AsFloat := edtMinimoMiercoles.Value;
        FieldByName('MINIMOJUEVES').Tag := 1;
        FieldByName('MINIMOJUEVES').AsFloat := edtMinimoJueves.Value;
        FieldByName('MINIMOVIERNES').Tag := 1;
        FieldByName('MINIMOVIERNES').AsFloat := edtMinimoViernes.Value;
        FieldByName('MINIMOSABADO').Tag := 1;
        FieldByName('MINIMOSABADO').AsFloat := edtMinimoSabado.Value;
        FieldByName('MINIMODOMINGO').Tag := 1;
        FieldByName('MINIMODOMINGO').AsFloat := edtMinimoDomingo.Value;
        FieldByName('PERMITIRDESCUENTOS').Tag := 1;
        if chkPermitirDescuentos.Checked = True then
          FieldByName('PERMITIRDESCUENTOS').AsInteger := 1
        else
          FieldByName('PERMITIRDESCUENTOS').AsInteger := 0;
        FieldByName('CODIGOCOMANDA').Tag := 1;
        FieldByName('CODIGOCOMANDA').AsInteger :=
          GetCombo(cbComanda);
        Post;
      end;
      mBS_Productos.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Productos.Destroy;

      mCantidad :=  edtExistencia.Value - _ExistenciaAnterior;
      mCantidad := Abs(mCantidad);
      if _ExistenciaAnterior <> edtExistencia.Value then
      begin
        mDL_TB_INVENTARIOM := TDL_TB_INVENTARIOM.Create;
        with mDL_TB_INVENTARIOM.Dataset do
        begin
          EmptyDataSet;
          mDL_TB_INVENTARIOM.Limpiar_Tag;
          Append;
          FieldByName('FECHA').Tag := 1;
          FieldByName('FECHA').AsString :=
            FormatDateTime('dd/MM/yyyy', Date);
          FieldByName('IDPRODUCTO').Tag := 1;
          FieldByName('IDPRODUCTO').AsInteger :=
            pId;
          FieldByName('CANTIDAD').Tag := 1;
          FieldByName('CANTIDAD').AsFloat :=
            mCantidad;
          FieldByName('TIPO').Tag := 1;
          if edtExistencia.Value > _ExistenciaAnterior then
            FieldByName('TIPO').AsInteger := 1;
          if edtExistencia.Value < _ExistenciaAnterior then
            FieldByName('TIPO').AsInteger := 2;
          FieldByName('MOTIVO').Tag := 1;
          if edtExistencia.Value > _ExistenciaAnterior then
            FieldByName('MOTIVO').AsString := 'Entrada';
          if edtExistencia.Value < _ExistenciaAnterior then
            FieldByName('MOTIVO').AsString := 'Salida';
          Post;
        end;
        mDL_TB_INVENTARIOM.Insertar(_Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');
        mDL_TB_INVENTARIOM.Destroy;
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

        // Sobrante
        if edtExistencia.Value > _ExistenciaAnterior then
        begin
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
          with mDL_TB_AsientosDetalle.Dataset do
          begin
            EmptyDataSet;
            mDL_TB_AsientosDetalle.Limpiar_Tag;
            Append;
            FieldByName('IDENCABEZADO').Tag := 1;
            FieldByName('IDENCABEZADO').AsInteger :=
              mIdAsiento;
            FieldByName('IDMOVIMIENTO').Tag := 1;
            FieldByName('IDMOVIMIENTO').AsInteger := 1;
            FieldByName('IDCUENTA').Tag := 1;
            FieldByName('IDCUENTA').AsInteger := 20;
            FieldByName('DESCRIPCION').Tag := 1;
            FieldByName('DESCRIPCION').AsString := 'Sobrantes de Inventario';
            FieldByName('REFERENCIA').Tag := 1;
            FieldByName('REFERENCIA').AsString := '';
            FieldByName('MONTO').Tag := 1;
            FieldByName('MONTO').AsFloat := edtCosto.Value * mCantidad;
            FieldByName('DEBE').Tag := 1;
            FieldByName('DEBE').AsFloat := edtCosto.Value * mCantidad;
            FieldByName('HABER').Tag := 1;
            FieldByName('HABER').AsFloat := 0;
            Post;
          end;
          mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_AsientosDetalle.Destroy;

          mDL_TB_AsientosDetalle := TDL_TB_AsientosDetalle.Create;
          with mDL_TB_AsientosDetalle.Dataset do
          begin
            EmptyDataSet;
            mDL_TB_AsientosDetalle.Limpiar_Tag;
            Append;
            FieldByName('IDENCABEZADO').Tag := 1;
            FieldByName('IDENCABEZADO').AsInteger :=
              mIdAsiento;
            FieldByName('IDMOVIMIENTO').Tag := 1;
            FieldByName('IDMOVIMIENTO').AsInteger := 1;
            FieldByName('IDCUENTA').Tag := 1;
            FieldByName('IDCUENTA').AsInteger := 70;
            FieldByName('DESCRIPCION').Tag := 1;
            FieldByName('DESCRIPCION').AsString := 'Sobrantes de Inventario';
            FieldByName('REFERENCIA').Tag := 1;
            FieldByName('REFERENCIA').AsString := '';
            FieldByName('MONTO').Tag := 1;
            FieldByName('MONTO').AsFloat := edtCosto.Value * mCantidad;
            FieldByName('DEBE').Tag := 1;
            FieldByName('DEBE').AsFloat := 0;
            FieldByName('HABER').Tag := 1;
            FieldByName('HABER').AsFloat := edtCosto.Value * mCantidad;
            Post;
          end;
          mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_AsientosDetalle.Destroy;
        end;

        // Faltante
        if edtExistencia.Value < _ExistenciaAnterior then
        begin
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
          with mDL_TB_AsientosDetalle.Dataset do
          begin
            EmptyDataSet;
            mDL_TB_AsientosDetalle.Limpiar_Tag;
            Append;
            FieldByName('IDENCABEZADO').Tag := 1;
            FieldByName('IDENCABEZADO').AsInteger :=
              mIdAsiento;
            FieldByName('IDMOVIMIENTO').Tag := 1;
            FieldByName('IDMOVIMIENTO').AsInteger := 1;
            FieldByName('IDCUENTA').Tag := 1;
            FieldByName('IDCUENTA').AsInteger := 71;
            FieldByName('DESCRIPCION').Tag := 1;
            FieldByName('DESCRIPCION').AsString := 'Faltantes de Inventario';
            FieldByName('REFERENCIA').Tag := 1;
            FieldByName('REFERENCIA').AsString := '';
            FieldByName('MONTO').Tag := 1;
            FieldByName('MONTO').AsFloat := edtCosto.Value * mCantidad;
            FieldByName('DEBE').Tag := 1;
            FieldByName('DEBE').AsFloat := edtCosto.Value * mCantidad;
            FieldByName('HABER').Tag := 1;
            FieldByName('HABER').AsFloat := 0;
            Post;
          end;
          mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_AsientosDetalle.Destroy;

          mDL_TB_AsientosDetalle := TDL_TB_AsientosDetalle.Create;
          with mDL_TB_AsientosDetalle.Dataset do
          begin
            EmptyDataSet;
            mDL_TB_AsientosDetalle.Limpiar_Tag;
            Append;
            FieldByName('IDENCABEZADO').Tag := 1;
            FieldByName('IDENCABEZADO').AsInteger :=
              mIdAsiento;
            FieldByName('IDMOVIMIENTO').Tag := 1;
            FieldByName('IDMOVIMIENTO').AsInteger := 1;
            FieldByName('IDCUENTA').Tag := 1;
            FieldByName('IDCUENTA').AsInteger := 20;
            FieldByName('DESCRIPCION').Tag := 1;
            FieldByName('DESCRIPCION').AsString := 'Faltantes de Inventario';
            FieldByName('REFERENCIA').Tag := 1;
            FieldByName('REFERENCIA').AsString := '';
            FieldByName('MONTO').Tag := 1;
            FieldByName('MONTO').AsFloat := edtCosto.Value * mCantidad;
            FieldByName('DEBE').Tag := 1;
            FieldByName('DEBE').AsFloat := 0;
            FieldByName('HABER').Tag := 1;
            FieldByName('HABER').AsFloat := edtCosto.Value * mCantidad;
            Post;
          end;
          mDL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
          if _Resultado = -1 then
            raise Exception.Create('');
          mDL_TB_AsientosDetalle.Destroy;
        end;
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

procedure LlenarcbProveedores(cb: TComboBoxEx);
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

procedure LlenarcbImpuestos(cb: TComboBoxEx);
var
  mDL_TB_IMPUESTOS: TDL_TB_IMPUESTOS;
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
      mOrderBy.Add('A.NOMBRE');
      mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
      mDL_TB_IMPUESTOS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_IMPUESTOS.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRE').AsString + ' - ' + FormatFloat('###0.00%', FieldByName('PORCENTAJE').AsFloat),
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_IMPUESTOS.Destroy;

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

procedure LlenarcbFamilias(cb: TComboBoxEx);
var
  mDL_TB_FAMILIAS: TDL_TB_FAMILIAS;
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
      mOrderBy.Add('A.NOMBRE');
      mDL_TB_FAMILIAS := TDL_TB_FAMILIAS.Create;
      mDL_TB_FAMILIAS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_FAMILIAS.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRE').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FAMILIAS.Destroy;

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

procedure Actualizar_Impuesto;
var
  mDL_TB_IMPUESTOS: TDL_TB_IMPUESTOS;
  mWhere: TStringList;
  mIVAPM, mPrecioIVA, mVenta: Double;
  mIdImpuesto: Integer;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mIdImpuesto := GetCombo(cbImpuesto);
      mVenta := edtVenta.Value;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(mIdImpuesto));
      mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
      mIVAPM :=
        mDL_TB_IMPUESTOS.Obtener_PorcentajeValor(mWhere.Text,
          _Resultado, _ErrorM);
      mWhere.Free;
      mDL_TB_IMPUESTOS.Destroy;
      mPrecioIVA := (mIVAPM * mVenta) +
        mVenta;
      edtVentaIVA.Value := mPrecioIVA;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure Cambiar_ImpuestoIncluido;
begin
  with Forma01 do
  begin

    if chkImpuestoIncluido.Checked = True then
    begin
      edtVenta.Enabled := False;
      edtVentaIVA.Enabled := True;
    end
    else begin
      edtVenta.Enabled := True;
      edtVentaIVA.Enabled := False
    end;

  end;
end;

procedure Actualizar_Venta;
var
  mDL_TB_IMPUESTOS: TDL_TB_IMPUESTOS;
  mWhere: TStringList;
  mIVAPM, mPrecioIVA, mVenta: Double;
  mIdImpuesto: Integer;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mIdImpuesto := GetCombo(cbImpuesto);
      mVenta := edtVentaIVA.Value;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(mIdImpuesto));
      mDL_TB_IMPUESTOS := TDL_TB_IMPUESTOS.Create;
      mIVAPM :=
        mDL_TB_IMPUESTOS.Obtener_PorcentajeValor(mWhere.Text,
          _Resultado, _ErrorM);
      mWhere.Free;
      mDL_TB_IMPUESTOS.Destroy;
      mIVAPM := mIVAPM + 1;
      mPrecioIVA := (mVenta / mIVAPM);
      edtVenta.Value := mPrecioIVA;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure Buscar_Famlias;
begin
  with Forma01 do
  begin

    FormMantenimientoFamilias01.ShowModal;
    LlenarcbFamilias(cbFamilia);

  end;
end;

procedure Buscar_Proveedores;
begin
  with Forma01 do
  begin

    FormMantenimientoProveedores01.ShowModal;
    LlenarcbProveedores(cbProveedor);

  end;
end;

procedure LlenarcbCuenta(cb: TComboBoxEx);
var
  mDL_TB_Cuentas: TDL_TB_Cuentas;
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
      mOrderBy.Add('A.NOMBRE');
      mDL_TB_Cuentas := TDL_TB_Cuentas.Create;
      mDL_TB_Cuentas.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_Cuentas.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NOMBRE').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_Cuentas.Destroy;

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

procedure Movimiento_Inventario;
begin
  with Forma01 do
  begin

    FormMovimientoInventario01._ExistenciaActual := edtExistencia.Value;
    FormMovimientoInventario01.ShowModal;
    if FormMovimientoInventario01.Tag = 1 then
    begin
      if FormMovimientoInventario01._Movimiento = 1 then
        edtExistencia.Value := edtExistencia.Value +
          FormMovimientoInventario01._Cantidad;
      if FormMovimientoInventario01._Movimiento = 2 then
        edtExistencia.Value := edtExistencia.Value -
          FormMovimientoInventario01._Cantidad;
    end;

  end;
end;

procedure LlenarImpresoras;
begin
  with Forma01 do
  begin

    cbComanda.Items.Clear;
    cbComanda.Items.AddObject('[SIN SELECCIONAR]', TObject(0));
    cbComanda.Items.AddObject('Impresora 1', TObject(1));
    cbComanda.Items.AddObject('Impresora 2', TObject(2));
    cbComanda.Items.AddObject('Impresora 3', TObject(3));
    cbComanda.Items.AddObject('Impresora 4', TObject(4));

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