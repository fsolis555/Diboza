unit FrmVendedores01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.Mask,
  RxToolEdit, RxCurrEdit;

type
  TFormVendedores01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtCodigo: TEdit;
    edtNombre: TEdit;
    edtDireccion: TEdit;
    edtTelefono1: TEdit;
    edtTelefono2: TEdit;
    edtEmail: TEdit;
    TabSheet2: TRzTabSheet;
    pnlOpcionesClientes: TPanel;
    Label7: TLabel;
    cbClientes: TComboBoxEx;
    btnAgregarClientes: TBitBtn;
    btnEliminarClientes: TBitBtn;
    stbEstado: TStatusBar;
    lvLista1: TListView;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnAgregarClientesClick(Sender: TObject);
    procedure btnEliminarClientesClick(Sender: TObject);
  private
    FId: Integer;
    FOpcion: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
  end;

var
  FormVendedores01: TFormVendedores01;

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
  procedure LlenarcbClientes(cb: TComboBoxEx);
  procedure Agregar_Clientes;
  procedure Eliminar_Clientes;
  procedure LlenarListaClientes;
  procedure Consultar_Data_Clientes(pId: Integer);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_VENDEDORES, BS_DBConexion, DL_DBGeneral,
  uDL_TB_CONSECUTIVOS, uDL_TB_CLIENTES, uDL_TB_VENDEDORESCLIENTES,
  udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_VENDEDORES;

var
  Forma01: TFormVendedores01;
  _Codigo: string;
  _DL_TB_VENDEDORESCLIENTES: TDL_TB_VENDEDORESCLIENTES;

{$REGION 'Funciones Forma'}
procedure TFormVendedores01.FormShow(Sender: TObject);
begin
  Forma01 := FormVendedores01;

  InicializarForma;
end;

procedure TFormVendedores01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormVendedores01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormVendedores01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormVendedores01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormVendedores01.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', 'a'..'z', 'A'..'Z', '_', ' ']) then
    Key := #0;
end;

procedure TFormVendedores01.btnAgregarClientesClick(Sender: TObject);
begin
  Agregar_Clientes;
end;

procedure TFormVendedores01.btnEliminarClientesClick(Sender: TObject);
begin
  Eliminar_Clientes;
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

      _DL_TB_VENDEDORESCLIENTES := TDL_TB_VENDEDORESCLIENTES.Create;

      LlenarcbClientes(cbClientes);
      if _Resultado = -1 then
        raise Exception.Create('');

      LimpiarCampos;
      CargarIdioma;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mUltimo :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'VENDEDORES', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mUltimo);
      edtCodigo.Text := IntToStr(mUltimo);

      case _Opcion of
        1: begin
          pnlAccion.Caption := 'NUEVO';
        end;
        2: begin
          pnlAccion.Caption := 'MODIFICAR';
          Consultar_Data(_Id);
          if _Resultado = -1 then
            raise Exception.Create('');
          Consultar_Data_Clientes(_Id);
          LlenarListaClientes;
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
      _DL_TB_VENDEDORESCLIENTES.Destroy;
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
    pgcCampos.ActivePageIndex := 0;
    edtCodigo.Clear;
    edtNombre.Clear;
    edtDireccion.Clear;
    edtTelefono1.Clear;
    edtTelefono2.Clear;
    edtEmail.Clear;
    cbClientes.ItemIndex := 0;
    lvLista1.Items.Clear;
    stbEstado.Panels[0].Text := 'Registros: 0';

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
      _Codigo :=
        FieldByName('CODIGO').AsString;
      edtCodigo.Text :=
        FieldByName('CODIGO').AsString;
      edtNombre.Text :=
        FieldByName('NombreCompleto').AsString;
      edtDireccion.Text :=
        FieldByName('DIRECCION').AsString;
      edtTelefono1.Text :=
        FieldByName('TELEFONO1').AsString;
      edtTelefono2.Text :=
        FieldByName('TELEFONO2').AsString;
      edtEmail.Text :=
        FieldByName('EMAIL').AsString;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Vendedores: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Vendedores := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Vendedores.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Vendedores.Dataset);
      mBS_Vendedores.Destroy;

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
  mBS_Vendedores: Clase_Tipo1;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mCodigo: string;
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
      mCodigo := Trim(edtCodigo.Text);
    if _Opcion = 2 then
    begin
      // C�digo
      if Trim(_Codigo) = Trim(edtCodigo.Text) then
        mCodigo := _Codigo;
      if Trim(_Codigo) <> Trim(edtCodigo.Text) then
        mCodigo := Trim(edtCodigo.Text);
    end;
    // Valida C�digo
    mBS_Vendedores := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Codigo=' + QuotedStr(mCodigo));
    mEncontrado :=
      mBS_Vendedores.Existe_Campo(mWhere.Text, 'Codigo', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Vendedores.Destroy;
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

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data;
var
  mDL_TB_CONSECUTIVOS: TDL_TB_CONSECUTIVOS;
  mBS_Vendedores: Clase_Tipo1;
  mWhere: TStringList;
  mId: Integer;
  mResultado: Integer;
  mErrorM: string;
  mUltimo: Integer;
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
      mUltimo :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'VENDEDORES', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mUltimo);

      mBS_Vendedores := Clase_Tipo1.Create;
      with mBS_Vendedores.Dataset do
      begin
        EmptyDataSet;
        mBS_Vendedores.Limpiar_Tag;
        Append;
        FieldByName('Id').Tag := 1;
        FieldByName('Id').AsInteger :=
          mUltimo;
        FieldByName('CODIGO').Tag := 1;
        FieldByName('CODIGO').AsString :=
          edtCodigo.Text;
        FieldByName('FECHAALTA').Tag := 1;
        FieldByName('FECHAALTA').AsString :=
          FormatDateTime('dd/MM/yyyy', Date);
        FieldByName('NOMBRECOMPLETO').Tag := 1;
        FieldByName('NOMBRECOMPLETO').AsString :=
          edtNombre.Text;
        FieldByName('DIRECCION').Tag := 1;
        FieldByName('DIRECCION').AsString :=
          edtDireccion.Text;
        FieldByName('EMAIL').Tag := 1;
        FieldByName('EMAIL').AsString :=
          edtEmail.Text;
        FieldByName('TELEFONO1').Tag := 1;
        FieldByName('TELEFONO1').AsString :=
          edtTelefono1.Text;
        FieldByName('TELEFONO2').Tag := 1;
        FieldByName('TELEFONO2').AsString :=
          edtTelefono2.Text;
        Post;
      end;
      mBS_Vendedores.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Vendedores.Destroy;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mDL_TB_CONSECUTIVOS.Actualizar_Campo('', 'VENDEDORES', mUltimo,  _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;

      with _DL_TB_VENDEDORESCLIENTES.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IDVENDEDOR').Tag := 1;
          FieldByName('IDVENDEDOR').AsInteger := mUltimo;
          Post;
          Next;
        end;
      end;
      _DL_TB_VENDEDORESCLIENTES.Insertar(_Resultado, _ErrorM);
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
  mBS_Vendedores: Clase_Tipo1;
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

      mBS_Vendedores := Clase_Tipo1.Create;
      with mBS_Vendedores.Dataset do
      begin
        EmptyDataSet;
        mBS_Vendedores.Limpiar_Tag;
        Append;
        FieldByName('CODIGO').Tag := 1;
        FieldByName('CODIGO').AsString :=
          edtCodigo.Text;
        FieldByName('NOMBRECOMPLETO').Tag := 1;
        FieldByName('NOMBRECOMPLETO').AsString :=
          edtNombre.Text;
        FieldByName('DIRECCION').Tag := 1;
        FieldByName('DIRECCION').AsString :=
          edtDireccion.Text;
        FieldByName('EMAIL').Tag := 1;
        FieldByName('EMAIL').AsString :=
          edtEmail.Text;
        FieldByName('TELEFONO1').Tag := 1;
        FieldByName('TELEFONO1').AsString :=
          edtTelefono1.Text;
        FieldByName('TELEFONO2').Tag := 1;
        FieldByName('TELEFONO2').AsString :=
          edtTelefono2.Text;
        Post;
      end;
      mBS_Vendedores.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Vendedores.Destroy;

      _DL_TB_VENDEDORESCLIENTES.Eliminar('IDVENDEDOR=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      with _DL_TB_VENDEDORESCLIENTES.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IDVENDEDOR').Tag := 1;
          FieldByName('IDVENDEDOR').AsInteger := pId;
          Post;
          Next;
        end;
      end;
      _DL_TB_VENDEDORESCLIENTES.Insertar(_Resultado, _ErrorM);
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

procedure LlenarcbClientes(cb: TComboBoxEx);
var
  mDL_TB_Clientes: TDL_TB_CLIENTES;
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

procedure Agregar_Clientes;
var
  mIdCliente: Integer;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mIdCliente := GetCombo(cbClientes);
      mEncontrado :=
        _DL_TB_VENDEDORESCLIENTES.Dataset.Locate('IDCLIENTE', mIdCliente, []);
      if mEncontrado = False then
      begin
        with _DL_TB_VENDEDORESCLIENTES.Dataset do
        begin
          Append;
          FieldByName('IDCLIENTE').Tag := 1;
          FieldByName('IDCLIENTE').AsInteger := mIdCliente;
          Post;
        end;
        LlenarListaClientes;
      end;

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

procedure Eliminar_Clientes;
var
  mLinea: string;
  mFila, mIdCliente: Integer;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      for mFila := 0 to lvLista1.Items.Count - 1 do
      begin
        mLinea := lvLista1.Items[mFila].SubItems[2];
        try
          mIdCliente := StrToInt(mLinea);
        except
          mIdCliente := 0;
        end;
        mEncontrado :=
          _DL_TB_VENDEDORESCLIENTES.Dataset.Locate('IDCLIENTE', mIdCliente, []);
        if mEncontrado = True then
          _DL_TB_VENDEDORESCLIENTES.Dataset.Delete;
      end;
      LlenarListaClientes;

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

procedure LlenarListaClientes;
begin
  with Forma01 do
  begin

    lvLista1.Items.Clear;
    stbEstado.Panels[0].Text := 'Registros: 0';

    with _DL_TB_VENDEDORESCLIENTES.Dataset do
    begin
      stbEstado.Panels[0].Text := 'Registros: ' +
        FormatFloat('#,##0', RecordCount);
      First;
      while not Eof do
      begin
        with lvLista1.Items.Add do
        begin
          Caption := '';
          SubItems.Add(
            FieldByName('ClienteCODIGO').AsString);
          SubItems.Add(
            FieldByName('ClienteNOMBRECOMPLETO').AsString);
          SubItems.Add(
            FieldByName('IDCLIENTE').AsString);
          SubItems.Add(
            FieldByName('Id').AsString);
        end;

        Next;
      end;
    end;

  end;
end;

procedure Consultar_Data_Clientes(pId: Integer);
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
      mWhere.Add('A.IDVENDEDOR=' + IntToStr(pId));
      _DL_TB_VENDEDORESCLIENTES.Dataset.EmptyDataSet;
      _DL_TB_VENDEDORESCLIENTES.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;

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
      if Forma01.Components[mCount] is TListView then
      begin
        for mCount2 := 0 to TListView(Forma01.Components[mCount]).Columns.Count - 1 do
        begin
          mValor := TListView(Forma01.Components[mCount]).Columns[mCount2].Caption;
          mValor := dmLenguajes.GetValue(mValor);
          if Trim(mValor) <> '' then
            TListView(Forma01.Components[mCount]).Columns[mCount2].Caption := mValor;
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
