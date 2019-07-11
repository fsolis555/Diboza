unit FrmCambiarPrecios01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, RzListVw, RzStatus,
  RzPanel, RzTabs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, RxToolEdit, RxCurrEdit,
  System.RegularExpressions, uDL_Skeleton;

type
  TFormCambiarPrecios01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnCerrar: TBitBtn;
    pnlFiltro: TRzPanel;
    pnlCampos: TRzPanel;
    pnlLista: TRzPanel;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    pnlListaTitulo: TRzPanel;
    lvLista1: TRzListView;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtUtilidad: TCurrencyEdit;
    edtCosto: TCurrencyEdit;
    edtVenta: TCurrencyEdit;
    edtMayorista: TCurrencyEdit;
    btnAplicar: TBitBtn;
    edtBuscar: TButtonedEdit;
    Label9: TLabel;
    cbImpuesto: TComboBoxEx;
    Label12: TLabel;
    edtVentaIVA: TCurrencyEdit;
    chkImpuestoIncluido: TCheckBox;
    btnBuscar: TBitBtn;
    Label1: TLabel;
    edtMinimo: TCurrencyEdit;
    Label2: TLabel;
    edtPeso: TCurrencyEdit;
    TabSheet2: TRzTabSheet;
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
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnAplicarClick(Sender: TObject);
    procedure lvLista1Click(Sender: TObject);
    procedure edtUtilidadExit(Sender: TObject);
    procedure edtVentaChange(Sender: TObject);
    procedure cbImpuestoChange(Sender: TObject);
    procedure chkImpuestoIncluidoClick(Sender: TObject);
    procedure edtVentaIVAChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCambiarPrecios01: TFormCambiarPrecios01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Cerrar;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Buscar(pTexto: string);
  procedure Aplicar;
  procedure Consultar_Data(pId: Integer);
  procedure DBToForma(ds1: TDatasetMem);
  procedure LlenarcbImpuestos(cb: TComboBoxEx);
  procedure Actualizar_Impuesto;
  procedure Cambiar_ImpuestoIncluido;
  procedure Actualizar_Venta;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, BS_DBConexion, udmLenguajes,
  FrmMensaje_Espera01, uDL_TB_PRODUCTOS, uDL_TB_IMPUESTOS;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_PRODUCTOS;

const
  lv_Nombre = 0;
  lv_id = 1;

var
  Forma01: TFormCambiarPrecios01;
  _IdProducto: Integer;

{$REGION 'Funciones Forma'}
procedure TFormCambiarPrecios01.FormShow(Sender: TObject);
begin
  Forma01 := FormCambiarPrecios01;

  InicializarForma;
end;

procedure TFormCambiarPrecios01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormCambiarPrecios01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormCambiarPrecios01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormCambiarPrecios01.cbImpuestoChange(Sender: TObject);
begin
  Actualizar_Impuesto;
end;

procedure TFormCambiarPrecios01.btnAplicarClick(Sender: TObject);
begin
  Aplicar;
end;

procedure TFormCambiarPrecios01.edtUtilidadExit(Sender: TObject);
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

procedure TFormCambiarPrecios01.edtVentaChange(Sender: TObject);
begin
  if chkImpuestoIncluido.Checked = False then
    Actualizar_Impuesto;
end;

procedure TFormCambiarPrecios01.edtVentaIVAChange(Sender: TObject);
begin
  if chkImpuestoIncluido.Checked = True then
    Actualizar_Venta;
end;

procedure TFormCambiarPrecios01.btnBuscarClick(Sender: TObject);
begin
  Buscar(edtBuscar.Text);
end;

procedure TFormCambiarPrecios01.lvLista1Click(Sender: TObject);
var
  mLinea: string;
begin
  if lvLista1.Selected <> nil then
  begin
    mLinea :=
      lvLista1.Selected.SubItems[5];
    LimpiarCampos;
    try
      _IdProducto := StrToInt(mLinea);
    except
      _IdProducto := 0;
    end;
    Consultar_Data(_IdProducto);
  end;
  edtBuscar.SetFocus;
end;

procedure TFormCambiarPrecios01.chkImpuestoIncluidoClick(Sender: TObject);
begin
  Cambiar_ImpuestoIncluido;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _IdProducto := 0;
      lvLista1.Items.Clear;
      edtBuscar.Clear;

      LlenarcbImpuestos(cbImpuesto);
      if _Resultado = -1 then
        raise Exception.Create('');

      LimpiarCampos;
      CargarIdioma;
      edtBuscar.SetFocus;
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

    pgcCampos.ActivePageIndex := 0;
    cbImpuesto.ItemIndex := 0;
    edtUtilidad.Value := 0;
    edtCosto.Value := 0;
    edtVenta.Value := 0;
    edtMayorista.Value := 0;
    edtVentaIVA.Value := 0;
    chkImpuestoIncluido.Checked := False;
    edtVenta.Enabled := True;
    edtVentaIVA.Enabled := False;
    if Global.ImpuestoIncluido = 1 then
    begin
      chkImpuestoIncluido.Checked := True;
      edtVenta.Enabled := False;
      edtVentaIVA.Enabled := True;
    end;
    edtMinimo.Value := 0;
    edtPeso.Value := 0;
    edtMinimoLunes.Value := 0;
    edtMinimoMartes.Value := 0;
    edtMinimoMiercoles.Value := 0;
    edtMinimoJueves.Value := 0;
    edtMinimoViernes.Value := 0;
    edtMinimoSabado.Value := 0;
    edtMinimoDomingo.Value := 0;

  end;
end;

procedure Cerrar;
begin
  with Forma01 do
  begin

    Close;

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
          Caption :=
            FieldByName('CODIGO').AsString;
          SubItems.Add(
            FieldByName('NOMBRE').AsString);
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('UTILIDAD').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('PRECIOCOSTO').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('PRECIOVENTA').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('PRECIOMAYORISTA').AsFloat));
          SubItems.Add(
            FieldByName('ID').AsString);
          SubItems.Add(
            FieldByName('EXISTENCIA').AsString);
          SubItems.Add(
            FieldByName('EXISTENCIAMINIMA').AsString);
          SubItems.Add(
            FieldByName('Peso').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Buscar(pTexto: string);
var
  mTexto: string;
  mBS_Productos: Clase_Tipo1;
  mWhere, mOrderBy: TStringList;
  mBuscar: string;
begin
  with Forma01 do
  begin

    lvLista1.Items.Clear;
    RzStatusPane1.Caption := 'Registros: 0';

    mTexto := pTexto;
    mTexto := Trim(mTexto);
    mTexto := UpperCase(mTexto);
   // mBuscar := QuotedStr('%' + mTexto + '%');
    mBuscar := QuotedStr(mTexto + '%');
    if mTexto <> '' then
    begin
      mBS_Productos := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mWhere.Add('(A.Codigo like UPPER(' + mBuscar + '))');
      mWhere.Add(' Or ');
      mWhere.Add('(A.Nombre like UPPER(' + mBuscar + '))');
      mWhere.Add(' Or ');
      mWhere.Add('(A.CODIGOBARRAS like UPPER(' + mBuscar + '))');
      mOrderBy.Add('A.Nombre');
      mBS_Productos.Consultar(_Resultado, _ErrorM, mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      LlenarlvLista1(lvLista1, mBS_Productos.Dataset);
      mBS_Productos.Destroy;
    end;

  end;
end;

procedure Aplicar;
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
      with mBS_Productos.Dataset do
      begin
        EmptyDataSet;
        mBS_Productos.Limpiar_Tag;
        Append;
        FieldByName('PRECIOCOSTO').Tag := 1;
        FieldByName('PRECIOCOSTO').AsFloat :=
          edtCosto.Value;
        FieldByName('PRECIOVENTA').Tag := 1;
        FieldByName('PRECIOVENTA').AsFloat :=
          edtVenta.Value;
        FieldByName('UTILIDAD').Tag := 1;
        FieldByName('UTILIDAD').AsFloat :=
          edtUtilidad.Value;
        FieldByName('PRECIOVENTASIMPLE').Tag := 1;
        FieldByName('PRECIOVENTASIMPLE').AsFloat :=
          edtVenta.Value;
        FieldByName('PRECIOMAYORISTA').Tag := 1;
        FieldByName('PRECIOMAYORISTA').AsFloat :=
          edtMayorista.Value;
        FieldByName('CODIGOIMPUESTO').Tag := 1;
        FieldByName('CODIGOIMPUESTO').AsInteger :=
          GetCombo(cbImpuesto);
        FieldByName('EXISTENCIAMINIMA').Tag := 1;
        FieldByName('EXISTENCIAMINIMA').AsFloat :=
          edtMinimo.Value;
        FieldByName('Peso').Tag := 1;
        FieldByName('Peso').AsFloat :=
          edtPeso.Value;
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
        Post;
      end;
      mBS_Productos.Modificar('Id=' + IntToStr(_IdProducto), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Productos.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      Buscar(edtBuscar.Text);

      _Resultado := 1;
    except
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
      _Resultado := -1;
    end;

    edtBuscar.SetFocus;

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

procedure DBToForma(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      edtUtilidad.Value :=
        FieldByName('UTILIDAD').AsFloat;
      edtCosto.Value :=
        FieldByName('PRECIOCOSTO').AsFloat;
      edtVenta.Value :=
        FieldByName('PRECIOVENTA').AsFloat;
      edtMayorista.Value :=
        FieldByName('PRECIOMAYORISTA').AsFloat;
      cbImpuesto.ItemIndex := SetCombo(cbImpuesto,
        FieldByName('CODIGOIMPUESTO').AsInteger);
      edtVentaIVA.Value :=
        FieldByName('PRECIOVENTA').AsFloat;
      edtMinimo.Value :=
        FieldByName('EXISTENCIAMINIMA').AsFloat;
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
    end;
    Actualizar_Impuesto;

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
