unit FrmAsientos01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, RzListVw, Vcl.Mask,
  RxToolEdit, RxCurrEdit, FireDAC.Comp.Client;

type
  TFormAsientos01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnlOpcionesAsientos: TPanel;
    stbEstado: TStatusBar;
    pnlListaTitulo: TRzPanel;
    chkTodoLista1: TCheckBox;
    lvLista1: TRzListView;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbCuenta: TComboBoxEx;
    edtDescripcion: TEdit;
    edtReferencia: TEdit;
    edtDebe: TCurrencyEdit;
    edtHaber: TCurrencyEdit;
    btnInsertarDetalle: TBitBtn;
    btnEliminarDetalle: TBitBtn;
    Label6: TLabel;
    dtpFecha: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInsertarDetalleClick(Sender: TObject);
    procedure btnEliminarDetalleClick(Sender: TObject);
  private
    FId: Integer;
    FOpcion: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
  end;

var
  FormAsientos01: TFormAsientos01;

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
  procedure LlenarCuentas(cb: TComboBoxEx);
  procedure Insertar_Detalle;
  procedure Eliminar_Detalle;
  procedure LlenarLista(lv: TRzListView; ds: TFDMemTable);
  procedure Actualizar_Totales;
  procedure CamposValidosDetalle;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_Cuentas, BS_DBConexion, DL_DBGeneral,
  uDL_TB_AsientosDetalle, uDL_TB_AsientosEncabezado, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_Cuentas;

var
  Forma01: TFormAsientos01;
  _Nombre: string;
  _DL_TB_AsientosDetalle: TDL_TB_AsientosDetalle;

{$REGION 'Funciones Forma'}
procedure TFormAsientos01.FormShow(Sender: TObject);
begin
  Forma01 := FormAsientos01;

  InicializarForma;
end;

procedure TFormAsientos01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormAsientos01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormAsientos01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormAsientos01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormAsientos01.btnInsertarDetalleClick(Sender: TObject);
begin
  Insertar_Detalle;
end;

procedure TFormAsientos01.btnEliminarDetalleClick(Sender: TObject);
begin
  Eliminar_Detalle;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _DL_TB_AsientosDetalle := TDL_TB_AsientosDetalle.Create;

      LlenarCuentas(cbCuenta);
      if _Resultado = -1 then
        raise Exception.Create('');

      LimpiarCampos;
      CargarIdioma;

      case _Opcion of
        1: begin
          pnlAccion.Caption := 'NUEVO';
        end;
        2: begin
          pnlAccion.Caption := 'MODIFICAR';
          Consultar_Data(_Id);
          if _Resultado = -1 then
            raise Exception.Create('');
        end;
      end;
      cbCuenta.SetFocus;
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
      _DL_TB_AsientosDetalle.Destroy;
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

    _Nombre := '';
    pgcCampos.ActivePageIndex := 0;
    cbCuenta.ItemIndex := 0;
    edtDescripcion.Clear;
    edtReferencia.Clear;
    dtpFecha.Date := Date;
    edtDebe.Value := 0;
    edtHaber.Value := 0;

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
      dtpFecha.Date :=
        FieldByName('FECHA').AsDateTime;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Cuentas: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Cuentas := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Cuentas.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Cuentas.Dataset);
      mBS_Cuentas.Destroy;

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
  mBS_Cuentas: Clase_Tipo1;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mNombre: string;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;
     {
    if (mValido = True) and (Length(Trim(edtCodigo.Text)) < 10) then
    begin
      mValido := False;
      _ErrorM := 'El c�digo debe tener 10 caracteres';
    end;
    if (mValido = True) and (Trim(edtNombre.Text) = '') then
    begin
      mValido := False;
      _ErrorM := 'El nombre no puede estar vacio';
    end;

    if _Opcion = 1 then
      mNombre := Trim(edtNombre.Text);
    if _Opcion = 2 then
    begin
      // Nombre
      if Trim(_Nombre) = Trim(edtNombre.Text) then
        mNombre := _Nombre;
      if Trim(_Nombre) <> Trim(edtNombre.Text) then
        mNombre := Trim(edtNombre.Text);
    end;
    // Valida Nombre
    mBS_Cuentas := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Nombre=' + QuotedStr(mNombre));
    mEncontrado :=
      mBS_Cuentas.Existe_Campo(mWhere.Text, 'Nombre', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Cuentas.Destroy;
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
             }
    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data;
var
  mDL_TB_AsientosEncabezado: TDL_TB_AsientosEncabezado;
  mbs_DBGeneral: tbs_DBGeneral;
  mWhere: TStringList;
  mId: Integer;
  mResultado: Integer;
  mErrorM: string;
  mTotal: Double;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mTotal := 0;
      with _DL_TB_AsientosDetalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          mTotal := mTotal +
            FieldByName('DEBE').AsFloat;
          Next;
        end;
      end;

      mbs_DBGeneral := tbs_DBGeneral.Create;
      mId :=
        mbs_DBGeneral.Obtener_Ultimo('TB_AsientosEncabezado', 'ID', '', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mbs_DBGeneral.Destroy;
      Inc(mId);

      // Encabezado
      mDL_TB_AsientosEncabezado := TDL_TB_AsientosEncabezado.Create;
      with mDL_TB_AsientosEncabezado.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_AsientosEncabezado.Limpiar_Tag;
        Append;
        FieldByName('FECHACREACION').Tag := 1;
        FieldByName('FECHACREACION').AsString :=
          FormatDateTime('dd/MM/yyyy',
          Date);
        FieldByName('FECHA').Tag := 1;
        FieldByName('FECHA').AsString :=
          FormatDateTime('dd/MM/yyyy',
          dtpFecha.Date);
        FieldByName('NUMERO').Tag := 1;
        FieldByName('NUMERO').AsString := IntToStr(mId);
        FieldByName('CODIGOESTADO').Tag := 1;
        FieldByName('CODIGOESTADO').AsInteger := 2;
        FieldByName('CODIGOCIERRE').Tag := 1;
        FieldByName('CODIGOCIERRE').AsInteger := 0;
        FieldByName('TOTAL').Tag := 1;
        FieldByName('TOTAL').AsFloat := mTotal;
        Post;
      end;
      mDL_TB_AsientosEncabezado.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_AsientosEncabezado.Destroy;

      mbs_DBGeneral := tbs_DBGeneral.Create;
      mId :=
        mbs_DBGeneral.Obtener_Ultimo('TB_AsientosEncabezado', 'ID', '', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mbs_DBGeneral.Destroy;

      // Detalle
      with _DL_TB_AsientosDetalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IDENCABEZADO').Tag := 1;
          FieldByName('IDENCABEZADO').AsInteger := mId;
          Post;
          Next;
        end;
      end;
      _DL_TB_AsientosDetalle.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

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
  mBS_Cuentas: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mBS_Cuentas := Clase_Tipo1.Create;
      with mBS_Cuentas.Dataset do
      begin
        EmptyDataSet;
        mBS_Cuentas.Limpiar_Tag;
        Append;
       { FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('CODIGO').Tag := 1;
        FieldByName('CODIGO').AsString :=
          edtCodigo.Text;
        FieldByName('IDTIPO').Tag := 1;
        FieldByName('IDTIPO').AsInteger :=
          GetCombo(cbTipo);
        FieldByName('CODIGOPADREID').Tag := 1;
        FieldByName('CODIGOPADREID').AsInteger :=
          GetCombo(cbPadre);   }
        Post;
      end;
      mBS_Cuentas.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Cuentas.Destroy;

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

procedure LlenarCuentas(cb: TComboBoxEx);
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
      mWhere.Add('A.MOSTRALISTA=1');
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

procedure Insertar_Detalle;
var
  mLinea: Integer;
begin
  with Forma01 do
  begin

    try
      with _DL_TB_AsientosDetalle.Dataset do
      begin
        Last;
        mLinea :=
          FieldByName('LINEA').AsInteger;
      end;
      Inc(mLinea);

      with _DL_TB_AsientosDetalle.Dataset do
      begin
        Append;
        FieldByName('IDMOVIMIENTO').Tag := 1;
        FieldByName('IDMOVIMIENTO').AsInteger := 0;
        FieldByName('IDCUENTA').Tag := 1;
        FieldByName('IDCUENTA').AsInteger := 0;
        FieldByName('DESCRIPCION').Tag := 1;
        FieldByName('DESCRIPCION').AsString :=
          edtDescripcion.Text;
        FieldByName('REFERENCIA').Tag := 1;
        FieldByName('REFERENCIA').AsString :=
          edtReferencia.Text;
        FieldByName('MONTO').Tag := 1;
        FieldByName('MONTO').AsFloat := 0;
        FieldByName('DEBE').Tag := 1;
        FieldByName('DEBE').AsFloat :=
          edtDebe.Value;
        FieldByName('HABER').Tag := 1;
        FieldByName('HABER').AsFloat :=
          edtHaber.Value;
        FieldByName('LINEA').Tag := 1;
        FieldByName('LINEA').AsInteger := mLinea;
        FieldByName('CuentaNombre').AsString :=
          Trim(cbCuenta.Text);
        Post;
      end;

      LlenarLista(lvLista1, _DL_TB_AsientosDetalle.Dataset);
      Actualizar_Totales;

      cbCuenta.ItemIndex := 0;
      edtDescripcion.Clear;
      edtReferencia.Clear;
      edtDebe.Value := 0;
      edtHaber.Value := 0;
    except
    end;

  end;
end;

procedure Eliminar_Detalle;
var
  mFila, mId, mCount: Integer;
  mLinea: string;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    for mFila := 0 to lvLista1.Items.Count - 1 do
    begin
      if lvLista1.Items[mFila].Checked = True then
      begin
        mLinea :=
          lvLista1.Items[mFila].SubItems[0];
        try
          mId := StrToInt(mLinea);
        except
          mId := 0;
        end;
        mEncontrado :=
          _DL_TB_AsientosDetalle.Dataset.Locate('LINEA', mLinea, []);
        if mEncontrado = True then
          _DL_TB_AsientosDetalle.Dataset.Delete;
      end;
    end;

    mCount := 1;
    with _DL_TB_AsientosDetalle.Dataset do
    begin
      First;
      while not Eof do
      begin
        Edit;
        FieldByName('LINEA').AsInteger := mCount;
        Post;

        Inc(mCount);
        Next;
      end;
    end;

    LlenarLista(lvLista1, _DL_TB_AsientosDetalle.Dataset);
    Actualizar_Totales;

  end;
end;

procedure LlenarLista(lv: TRzListView; ds: TFDMemTable);
begin
  with Forma01 do
  begin

    lv.Items.Clear;

    with ds do
    begin
      First;
      while not Eof do
      begin
        with lv.Items.Add do
        begin
          Caption := '';
          SubItems.Add(
            FieldByName('LINEA').AsString);
          SubItems.Add(
            FieldByName('CuentaNombre').AsString);
          SubItems.Add(
            FieldByName('DESCRIPCION').AsString);
          SubItems.Add(
            FieldByName('REFERENCIA').AsString);
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('DEBE').AsFloat));
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('HABER').AsFloat));
          SubItems.Add(
            FieldByName('LINEA').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Actualizar_Totales;
var
  mDebe, mHaber, mDiferencia: Double;
begin
  with Forma01 do
  begin

    mDebe := 0;
    mHaber := 0;
    with _DL_TB_AsientosDetalle.Dataset do
    begin
      First;
      while not Eof do
      begin
        mDebe := mDebe +
          FieldByName('DEBE').AsFloat;
        mHaber := mHaber +
          FieldByName('HABER').AsFloat;
        Next;
      end;
    end;
    mDiferencia := mDebe - mHaber;

    stbEstado.Panels[0].Text := FormatFloat('#,##0.00', mDebe);
    stbEstado.Panels[1].Text := FormatFloat('#,##0.00', mHaber);
    stbEstado.Panels[2].Text := FormatFloat('#,##0.00', mDiferencia);

  end;
end;

procedure CamposValidosDetalle;
var
  mValido: Boolean;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (cbCuenta.ItemIndex <= 0) then
    begin
      mValido := False;
      _ErrorM := 'Debe seleccionar una cuenta';
    end;
    if (mValido = True) and ((edtDebe.Value = 0) and (edtHaber.Value = 0)) then
    begin
      mValido := False;
      _ErrorM := 'El debe y el haber no pueden ser mayores a cero';
    end;
    if (mValido = True) and ((edtDebe.Value = 0) and (edtHaber.Value = 0)) then
    begin
      mValido := False;
      _ErrorM := 'El debe y el haber no pueden ser mayores a cero';
    end;

    if mValido = False then
      _Resultado := 0;

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
