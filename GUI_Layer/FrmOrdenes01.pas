unit FrmOrdenes01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, RzStatus, RzListVw,
  Vcl.Mask, RxToolEdit, RxCurrEdit, Vcl.Printers;

type
  TFormOrdenes01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edtEtiqueta: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    memComentarios: TMemo;
    TabSheet2: TRzTabSheet;
    Label5: TLabel;
    dtpFecha: TDateTimePicker;
    dtpHora: TDateTimePicker;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    pnlOpcionesDetalle: TPanel;
    pnlListaTitulo: TRzPanel;
    chkTodoLista1: TCheckBox;
    lvLista1: TRzListView;
    cbNumeros: TComboBoxEx;
    cbCliente: TComboBoxEx;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCantidad: TCurrencyEdit;
    cbProductos: TComboBoxEx;
    btnBuscar_Producto: TBitBtn;
    pnlListaOpciones1: TRzPanel;
    btnInsertarLinea: TBitBtn;
    btnEliminarLinea: TBitBtn;
    cbImpresora: TComboBoxEx;
    btnBuscar_Clientes: TBitBtn;
    Label9: TLabel;
    rbAbierto: TRadioButton;
    rbCerrado: TRadioButton;
    RzStatusPane2: TRzStatusPane;
    edtNumero: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnInsertarLineaClick(Sender: TObject);
    procedure btnEliminarLineaClick(Sender: TObject);
    procedure chkTodoLista1Click(Sender: TObject);
    procedure btnBuscar_ProductoClick(Sender: TObject);
    procedure btnBuscar_ClientesClick(Sender: TObject);
    procedure cbProductosChange(Sender: TObject);
  private
    FId: Integer;
    FOpcion: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
  end;

var
  FormOrdenes01: TFormOrdenes01;

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
  procedure LlenarcbNumeros(cb: TComboBoxEx);
  procedure LlenarcbCliente(cb: TComboBoxEx);
  procedure LlenarcbProductos(cb: TComboBoxEx);
  procedure LlenarcbImpresora(cb: TComboBoxEx);
  procedure Insertar_Detalle;
  procedure Eliminar_Detalle;
  procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
  procedure LlenarLista;
  procedure Buscar_Producto;
  procedure Consultar_Producto(pId: Integer);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_OrdenesEncabezado, BS_DBConexion, DL_DBGeneral,
  uDL_TB_CLIENTES, uDL_TB_PRODUCTOS, uDL_TB_OrdenesDetalle,
  FrmBuscar_Productos01, FrmMantenimientoClientes01, udmReports,
  uDL_TB_PLANTILLAS, uDL_TB_EMPRESAS, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_OrdenesEncabezado;
  Clase_Tipo2 = TDL_TB_OrdenesDetalle;

var
  Forma01: TFormOrdenes01;
  _Nombre: string;
  _DL_TB_OrdenesDetalle: Clase_Tipo2;
  _Venta: Double;

{$REGION 'Funciones Forma'}
procedure TFormOrdenes01.FormShow(Sender: TObject);
begin
  Forma01 := FormOrdenes01;

  InicializarForma;
end;

procedure TFormOrdenes01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormOrdenes01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormOrdenes01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormOrdenes01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormOrdenes01.btnInsertarLineaClick(Sender: TObject);
begin
  Insertar_Detalle;
end;

procedure TFormOrdenes01.btnEliminarLineaClick(Sender: TObject);
begin
  Eliminar_Detalle;
end;

procedure TFormOrdenes01.chkTodoLista1Click(Sender: TObject);
begin
  MDLista_Todos(lvLista1, chkTodoLista1);
end;

procedure TFormOrdenes01.btnBuscar_ProductoClick(Sender: TObject);
begin
  Buscar_Producto;
end;

procedure TFormOrdenes01.btnBuscar_ClientesClick(Sender: TObject);
begin
  FormMantenimientoClientes01.ShowModal;
  LlenarcbCliente(cbCliente);
end;

procedure TFormOrdenes01.cbProductosChange(Sender: TObject);
begin
  _Venta := 0;
  Consultar_Producto(GetCombo(cbProductos));
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _DL_TB_OrdenesDetalle := Clase_Tipo2.Create;

      LlenarcbNumeros(cbNumeros);
      if _Resultado =-1 then
        raise Exception.Create('');

      LlenarcbCliente(cbCliente);
      if _Resultado =-1 then
        raise Exception.Create('');

      LlenarcbProductos(cbProductos);
      if _Resultado =-1 then
        raise Exception.Create('');

      LlenarcbImpresora(cbImpresora);

      LimpiarCampos;
      CargarIdioma;

      case _Opcion of
        1: begin
          cbNumeros.Visible := True;
          edtNumero.Visible := False;
          cbNumeros.SetFocus;
          pnlAccion.Caption := 'NUEVO';
        end;
        2: begin
          cbNumeros.Visible := False;
          edtNumero.Visible := True;
          edtNumero.Text := IntToStr(_Id);
          edtEtiqueta.SetFocus;
          pnlAccion.Caption := 'MODIFICAR';
          Consultar_Data(_Id);
          if _Resultado = -1 then
            raise Exception.Create('');
        end;
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
      _DL_TB_OrdenesDetalle.Destroy;
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

    _Venta := 0;
    _Nombre := '';
    pgcCampos.ActivePageIndex := 0;
    dtpFecha.Date := Date;
    dtpHora.Time := Time;
    cbNumeros.ItemIndex := 0;
    edtEtiqueta.Clear;
    cbCliente.ItemIndex := 0;
    memComentarios.Clear;
    RzStatusPane1.Caption := 'Registros: 0';
    RzStatusPane2.Caption := 'Precio: 0';
    cbProductos.ItemIndex := 0;
    edtCantidad.Value := 1;
    cbImpresora.ItemIndex := 0;
    chkTodoLista1.Checked := False;
    rbAbierto.Checked := True;
    lvLista1.Items.Clear;

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
      dtpHora.Time :=
        StrToTime(FieldByName('HORA').AsString);
      cbNumeros.ItemIndex := SetCombo(cbNumeros,
        FieldByName('ID').AsInteger);
      edtEtiqueta.Text :=
        FieldByName('ETIQUETA').AsString;
      cbCliente.ItemIndex := SetCombo(cbCliente,
        FieldByName('IDCLIENTE').AsInteger);
      memComentarios.Text :=
        FieldByName('COMENTARIOS').AsString;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mDL_TB_OrdenesEncabezado: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mDL_TB_OrdenesEncabezado := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mDL_TB_OrdenesEncabezado.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mDL_TB_OrdenesEncabezado.Dataset);
      mDL_TB_OrdenesEncabezado.Destroy;

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
  mEncontrado: Boolean;
  mWhere: TStringList;
  mNombre: string;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if (mValido = True) and (cbNumeros.ItemIndex < 1) then
    begin
      mValido := False;
      _ErrorM := 'Debe seleccionar un n�mero de orden';
    end;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data;
var
  mDL_TB_OrdenesEncabezado: Clase_Tipo1;
  mWhere: TStringList;
  mId: Integer;
  mResultado: Integer;
  mErrorM: string;
  mVenta: Double;
  DL_TB_PLANTILLAS: TDL_TB_PLANTILLAS;
  mDL_TB_EMPRESAS: TDL_TB_EMPRESAS;
  mArchivo: TStringList;
  mNombreArchivo: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mVenta := 0;
      with _DL_TB_OrdenesDetalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          mVenta := mVenta +
          FieldByName('Venta').AsFloat;
          Next;
        end;
      end;

      mDL_TB_OrdenesEncabezado := Clase_Tipo1.Create;
      with mDL_TB_OrdenesEncabezado.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_OrdenesEncabezado.Limpiar_Tag;
        Append;
        FieldByName('ETIQUETA').Tag := 1;
        FieldByName('ETIQUETA').AsString :=
          edtEtiqueta.Text;
        FieldByName('VENTA').Tag := 1;
        FieldByName('VENTA').AsFloat := mVenta;
        FieldByName('COMENTARIOS').Tag := 1;
        FieldByName('COMENTARIOS').AsString :=
          memComentarios.Text;
        FieldByName('IDCLIENTE').Tag := 1;
        FieldByName('IDCLIENTE').AsInteger :=
          GetCombo(cbCliente);
        FieldByName('FECHA').Tag := 1;
        FieldByName('FECHA').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
        FieldByName('HORA').Tag := 1;
        FieldByName('HORA').AsString :=
          FormatDateTime('HH:mm:ss', dtpHora.Time);
        FieldByName('CODIGOESTADO').Tag := 1;
        FieldByName('CODIGOESTADO').AsInteger := 1;
        Post;
      end;
      mDL_TB_OrdenesEncabezado.Modificar('Id=' + IntToStr(GetCombo(cbNumeros)), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      with _DL_TB_OrdenesDetalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IDENCABEZADO').Tag := 1;
          FieldByName('IDENCABEZADO').AsInteger :=
            GetCombo(cbNumeros);
          Post;
          Next;
        end;
      end;
      _DL_TB_OrdenesDetalle.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      mDL_TB_EMPRESAS := TDL_TB_EMPRESAS.Create;
      mDL_TB_EMPRESAS.Consultar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      mArchivo := TStringList.Create;
      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(17));
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

      dmReports.frxDBDataset1.DataSet := mDL_TB_OrdenesEncabezado.Dataset;
      dmReports.frxDBDataset2.DataSet := _DL_TB_OrdenesDetalle.Dataset;
      dmReports.frxDBDataset3.DataSet := mDL_TB_EMPRESAS.Dataset;
      dmReports.frxDBDataset1.Enabled := True;
      dmReports.frxDBDataset2.Enabled := True;
      dmReports.frxDBDataset3.Enabled := True;

      try
        dmReports.frxReport1.LoadFromFile(mNombreArchivo);
      except
      end;

      with _DL_TB_OrdenesDetalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          if FieldByName('idImpresora').AsInteger = 1 then
          begin
            dmReports.frxReport1.PrepareReport();
            dmReports.frxReport1.PrintOptions.Printer :=
              Global.OrdenesImpresora1;
            dmReports.frxReport1.PrintOptions.ShowDialog := False;
            dmReports.frxReport1.Print;
          end;
          if FieldByName('idImpresora').AsInteger = 2 then
          begin
            dmReports.frxReport1.PrepareReport();
            dmReports.frxReport1.PrintOptions.Printer :=
              Global.OrdenesImpresora2;
            dmReports.frxReport1.PrintOptions.ShowDialog := False;
            dmReports.frxReport1.Print;
          end;
          if FieldByName('idImpresora').AsInteger = 3 then
          begin
            dmReports.frxReport1.PrepareReport();
            dmReports.frxReport1.PrintOptions.Printer :=
              Global.OrdenesImpresora3;
            dmReports.frxReport1.PrintOptions.ShowDialog := False;
            dmReports.frxReport1.Print;
          end;
          if FieldByName('idImpresora').AsInteger = 4 then
          begin
            dmReports.frxReport1.PrepareReport();
            dmReports.frxReport1.PrintOptions.Printer :=
              Global.OrdenesImpresora4;
            dmReports.frxReport1.PrintOptions.ShowDialog := False;
            dmReports.frxReport1.Print;
          end;

          Next;
        end;
      end;

      dmReports.frxDBDataset1.Enabled := False;
      dmReports.frxDBDataset2.Enabled := False;
      dmReports.frxDBDataset3.Enabled := False;

      mDL_TB_EMPRESAS.Destroy;
      mDL_TB_OrdenesEncabezado.Destroy;

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

procedure Modificar_Data(pId: Integer);
var
  mDL_TB_OrdenesEncabezado: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mVenta: Double;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);
     {
      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');
                 }
      mVenta := 0;
      with _DL_TB_OrdenesDetalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          mVenta := mVenta +
          FieldByName('Venta').AsFloat;
          Next;
        end;
      end;

      mDL_TB_OrdenesEncabezado := Clase_Tipo1.Create;
      with mDL_TB_OrdenesEncabezado.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_OrdenesEncabezado.Limpiar_Tag;
        Append;
        FieldByName('ETIQUETA').Tag := 1;
        FieldByName('ETIQUETA').AsString :=
          edtEtiqueta.Text;
        FieldByName('VENTA').Tag := 1;
        FieldByName('VENTA').AsFloat := mVenta;
        FieldByName('COMENTARIOS').Tag := 1;
        FieldByName('COMENTARIOS').AsString :=
          memComentarios.Text;
        FieldByName('IDCLIENTE').Tag := 1;
        FieldByName('IDCLIENTE').AsInteger :=
          GetCombo(cbCliente);
        FieldByName('FECHA').Tag := 1;
        FieldByName('FECHA').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
        FieldByName('HORA').Tag := 1;
        FieldByName('HORA').AsString :=
          FormatDateTime('HH:mm:ss', dtpHora.Time);
        FieldByName('CODIGOESTADO').Tag := 1;
        FieldByName('CODIGOESTADO').AsInteger := 1;
        Post;
      end;
      mDL_TB_OrdenesEncabezado.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_OrdenesEncabezado.Destroy;

      _DL_TB_OrdenesDetalle.Eliminar('IDENCABEZADO=' + IntToStr(GetCombo(cbNumeros)), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      with _DL_TB_OrdenesDetalle.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IDENCABEZADO').Tag := 1;
          FieldByName('IDENCABEZADO').AsInteger :=
            GetCombo(cbNumeros);
          Post;
          Next;
        end;
      end;
      _DL_TB_OrdenesDetalle.Insertar(_Resultado, _ErrorM);
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

procedure LlenarcbNumeros(cb: TComboBoxEx);
var
  mDL_TB_OrdenesEncabezado: TDL_TB_OrdenesEncabezado;
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
      mWhere.Add('A.CODIGOESTADO=2');
      mOrderBy.Add('A.ID');
      mDL_TB_OrdenesEncabezado := TDL_TB_OrdenesEncabezado.Create;
      mDL_TB_OrdenesEncabezado.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_OrdenesEncabezado.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('ID').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_OrdenesEncabezado.Destroy;

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

procedure LlenarcbCliente(cb: TComboBoxEx);
var
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
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
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mDL_TB_CLIENTES.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_CLIENTES.Dataset do
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
      mDL_TB_CLIENTES.Destroy;

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

procedure LlenarcbProductos(cb: TComboBoxEx);
var
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
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
      mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
      mDL_TB_PRODUCTOS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_PRODUCTOS.Dataset do
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
      mDL_TB_PRODUCTOS.Destroy;

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

procedure LlenarcbImpresora(cb: TComboBoxEx);
var
  mFila: Integer;
begin
  with Forma01 do
  begin

    cbImpresora.Items.Clear;

    cbImpresora.Items.AddObject('[SIN SELECCIONAR]', TObject(0));
    cbImpresora.Items.AddObject('Impresora 1', TObject(1));
    cbImpresora.Items.AddObject('Impresora 2', TObject(2));
    cbImpresora.Items.AddObject('Impresora 3', TObject(3));
    cbImpresora.Items.AddObject('Impresora 4', TObject(4));

  end;
end;

procedure Insertar_Detalle;
var
  mIdProducto: Integer;
  mEncontrado: Boolean;
  mCantidad: Double;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mCantidad := edtCantidad.Value;

      mIdProducto := GetCombo(cbProductos);
      if mIdProducto <= 0 then
      begin
        _ErrorM := 'Debe seleccionar un producto';
        _Resultado := 0;
        raise Exception.Create('');
      end;

      mEncontrado :=
        _DL_TB_OrdenesDetalle.Dataset.Locate('IdProducto', mIdProducto, []);
      if mEncontrado = True then
        mCantidad := mCantidad +
          _DL_TB_OrdenesDetalle.Dataset.FieldByName('Cantidad').AsFloat;

      with _DL_TB_OrdenesDetalle.Dataset do
      begin
        if mEncontrado = True then
          Edit;
        if mEncontrado = False then
          Append;
        FieldByName('IdProducto').Tag := 1;
        FieldByName('IdProducto').AsInteger :=
          mIdProducto;
        FieldByName('Cantidad').Tag := 1;
        FieldByName('Cantidad').AsFloat :=
          mCantidad;
        FieldByName('idImpresora').Tag := 1;
        FieldByName('idImpresora').AsFloat :=
          GetCombo(cbImpresora);
       // FieldByName('ProductoNombre').Tag := 1;
        FieldByName('ProductoNombre').AsString :=
          Trim(cbProductos.Text);
        FieldByName('Venta').Tag := 1;
        FieldByName('Venta').AsFloat :=
          _Venta;
        Post;
      end;

      LlenarLista;

      cbProductos.ItemIndex := 0;
      edtCantidad.Value := 1;

      _Resultado := 1;
    except
      Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
        'Error', MB_ICONERROR);
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

    for mFila := 0 to lvLista1.Items.Count - 1 do
    begin
      if lvLista1.Items[mFila].Checked = True then
      begin
        mLinea := lvLista1.Items[mFila].SubItems[3];
        try
          mIdProducto := StrToInt(mLinea);
        except
          mIdProducto := 0;
        end;
        if mIdProducto > 0 then
        begin
          mEncontrado :=
            _DL_TB_OrdenesDetalle.Dataset.Locate('IdProducto', mIdProducto, []);
          if mEncontrado = True then
            _DL_TB_OrdenesDetalle.Dataset.Delete;
        end;
      end;
    end;
    LlenarLista;

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

procedure LlenarLista;
var
  mVenta: Double;
begin
  with Forma01 do
  begin

    lvLista1.Items.Clear;
    mVenta := 0;

    with _DL_TB_OrdenesDetalle.Dataset do
    begin
      First;
      RzStatusPane1.Caption := 'Registros: ' +
        FormatFloat('#,##0', RecordCount);
      while not Eof do
      begin
        with lvLista1.Items.Add do
        begin
          Caption := '';
          SubItems.Add(
            FieldByName('ProductoNombre').AsString);
          SubItems.Add(
            FormatFloat('#,##0.00',
            FieldByName('Cantidad').AsFloat));
          if FieldByName('idImpresora').AsInteger = 0 then
            SubItems.Add('Sin Asignar');
          if FieldByName('idImpresora').AsInteger = 1 then
            SubItems.Add('Impresora 1');
          if FieldByName('idImpresora').AsInteger = 2 then
            SubItems.Add('Impresora 2');
          if FieldByName('idImpresora').AsInteger = 3 then
            SubItems.Add('Impresora 3');
          if FieldByName('idImpresora').AsInteger = 4 then
            SubItems.Add('Impresora 4');
          SubItems.Add(
            FieldByName('IdProducto').AsString);
        end;
        mVenta := mVenta +
          FieldByName('Venta').AsFloat;

        Next;
      end;
    end;
    RzStatusPane2.Caption := 'Precio: ' +
      FormatFloat('#,##0', mVenta);

  end;
end;

procedure Buscar_Producto;
begin
  with Forma01 do
  begin

    FormBuscar_Productos01.ShowModal;
    if FormBuscar_Productos01.Tag = 1 then
      cbProductos.ItemIndex := SetCombo(cbProductos,
        FormBuscar_Productos01._Id);

  end;
end;

procedure Consultar_Producto(pId: Integer);
var
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _Venta := 0;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mDL_TB_PRODUCTOS.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      with mDL_TB_PRODUCTOS.Dataset do
      begin
        if IsEmpty = False then
        begin
          _Venta :=
            FieldByName('PRECIOVENTA').AsFloat;
        end;
      end;
      mDL_TB_PRODUCTOS.Destroy;

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
