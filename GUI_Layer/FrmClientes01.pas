unit FrmClientes01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.Mask,
  RxToolEdit, RxCurrEdit;

type
  TFormClientes01 = class(TForm)
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
    edtDireccion: TEdit;
    Label4: TLabel;
    edtTelefono1: TEdit;
    Label5: TLabel;
    edtTelefono2: TEdit;
    Label6: TLabel;
    edtEmail: TEdit;
    Label7: TLabel;
    edtContacto: TEdit;
    Label8: TLabel;
    edtLimiteCredito: TCurrencyEdit;
    Label9: TLabel;
    edtSaldo: TCurrencyEdit;
    rbContado: TRadioButton;
    rbCredito: TRadioButton;
    Label10: TLabel;
    spePlazo: TSpinEdit;
    chkAplicarLimiteCredito: TCheckBox;
    chkAplicarImpuesto: TCheckBox;
    Label11: TLabel;
    edtDescuentoPor: TCurrencyEdit;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    FId: Integer;
    FOpcion: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
  end;

var
  FormClientes01: TFormClientes01;

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
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_CLIENTES, BS_DBConexion, DL_DBGeneral,
  uDL_TB_CONSECUTIVOS, uDL_TB_SISTEMA, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_CLIENTES;

var
  Forma01: TFormClientes01;
  _Codigo: string;

{$REGION 'Funciones Forma'}
procedure TFormClientes01.FormShow(Sender: TObject);
begin
  Forma01 := FormClientes01;

  InicializarForma;
end;

procedure TFormClientes01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormClientes01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormClientes01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormClientes01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormClientes01.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', 'a'..'z', 'A'..'Z', '_', ' ']) then
    Key := #0;
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

      LimpiarCampos;
      CargarIdioma;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mUltimo :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'CLIENTES', _Resultado, _ErrorM);
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
    pgcCampos.ActivePageIndex := 0;
    edtCodigo.Clear;
    edtNombre.Clear;
    edtDireccion.Clear;
    edtTelefono1.Clear;
    edtTelefono2.Clear;
    edtEmail.Clear;
    edtContacto.Clear;
    edtLimiteCredito.Value := 0;
    edtSaldo.Value := 0;
    rbContado.Checked := True;
    spePlazo.Value := 0;
    chkAplicarLimiteCredito.Checked := True;
    chkAplicarImpuesto.Checked := True;
    edtDescuentoPor.Value := 0;

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
      edtContacto.Text :=
        FieldByName('CONTACTONOMBRE').AsString;
      edtLimiteCredito.Value :=
        FieldByName('LIMITECREDITO').AsFloat;
      edtSaldo.Value :=
        FieldByName('SALDO').AsFloat;
      if FieldByName('TIPOPAGO').AsInteger = 1 then
        rbContado.Checked := True
      else
        rbCredito.Checked := True;
      spePlazo.Value :=
        FieldByName('PLAZO').AsInteger;
      if FieldByName('APLICARLIMITECREDITO').AsInteger = 1 then
        chkAplicarLimiteCredito.Checked := True
      else
        chkAplicarLimiteCredito.Checked := False;
      if FieldByName('APLICARIMPUESTO').AsInteger = 1 then
        chkAplicarImpuesto.Checked := True
      else
        chkAplicarImpuesto.Checked := False;
      edtDescuentoPor.Value :=
        FieldByName('DescuentoPor').AsFloat;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Clientes: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Clientes := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Clientes.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Clientes.Dataset);
      mBS_Clientes.Destroy;

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
  mBS_Clientes: Clase_Tipo1;
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
    mBS_Clientes := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Codigo=' + QuotedStr(mCodigo));
    mEncontrado :=
      mBS_Clientes.Existe_Campo(mWhere.Text, 'Codigo', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Clientes.Destroy;
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
  mBS_Clientes: Clase_Tipo1;
  mWhere: TStringList;
  mId: Integer;
  mResultado: Integer;
  mErrorM: string;
  mUltimo, mTipoMaquina, mCodigoEstado: Integer;
  mDL_TB_SISTEMA: TDL_TB_SISTEMA;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos;
      if _Resultado = 0 then
        raise Exception.Create('');

      mDL_TB_SISTEMA := TDL_TB_SISTEMA.Create;
      mTipoMaquina :=
        mDL_TB_SISTEMA.Obtener_Valor('', 'TIPOMAQUINA', _Resultado, _ErrorM);
      mDL_TB_SISTEMA.Destroy;
      if mTipoMaquina = 2 then
        mCodigoEstado := 1
      else
        mCodigoEstado := 0;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mUltimo :=
        mDL_TB_CONSECUTIVOS.Obtener_Valor('', 'CLIENTES', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;
      Inc(mUltimo);

      mBS_Clientes := Clase_Tipo1.Create;
      with mBS_Clientes.Dataset do
      begin
        EmptyDataSet;
        mBS_Clientes.Limpiar_Tag;
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
        FieldByName('SALDO').Tag := 1;
        FieldByName('SALDO').AsFloat := 0;
        FieldByName('LIMITECREDITO').Tag := 1;
        FieldByName('LIMITECREDITO').AsFloat :=
          edtLimiteCredito.Value;
        FieldByName('APLICARLIMITECREDITO').Tag := 1;
        if chkAplicarLimiteCredito.Checked = True then
          FieldByName('APLICARLIMITECREDITO').AsInteger := 1
        else
          FieldByName('APLICARLIMITECREDITO').AsInteger := 0;
        FieldByName('CONTACTONOMBRE').Tag := 1;
        FieldByName('CONTACTONOMBRE').AsString :=
          edtContacto.Text;
        FieldByName('TIPOPAGO').Tag := 1;
        if rbContado.Checked = True then
          FieldByName('TIPOPAGO').AsInteger := 1;
        if rbCredito.Checked = True then
          FieldByName('TIPOPAGO').AsInteger := 2;
        FieldByName('PLAZO').Tag := 1;
        FieldByName('PLAZO').AsInteger :=
          spePlazo.Value;
        FieldByName('APLICARIMPUESTO').Tag := 1;
        if chkAplicarImpuesto.Checked = True then
          FieldByName('APLICARIMPUESTO').AsInteger := 1
        else
          FieldByName('APLICARIMPUESTO').AsInteger := 0;
        FieldByName('DescuentoPor').Tag := 1;
        FieldByName('DescuentoPor').AsFloat :=
          edtDescuentoPor.Value;
        FieldByName('CodigoEstado').Tag := 1;
        FieldByName('CodigoEstado').AsInteger :=
          mCodigoEstado;
        FieldByName('Temp').Tag := 1;
        FieldByName('Temp').AsInteger :=
          mUltimo;
        Post;
      end;
      mBS_Clientes.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Clientes.Destroy;

      mDL_TB_CONSECUTIVOS := TDL_TB_CONSECUTIVOS.Create;
      mDL_TB_CONSECUTIVOS.Actualizar_Campo('', 'CLIENTES', mUltimo,  _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CONSECUTIVOS.Destroy;

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
  mBS_Clientes: Clase_Tipo1;
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

      mBS_Clientes := Clase_Tipo1.Create;
      with mBS_Clientes.Dataset do
      begin
        EmptyDataSet;
        mBS_Clientes.Limpiar_Tag;
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
        FieldByName('LIMITECREDITO').Tag := 1;
        FieldByName('LIMITECREDITO').AsFloat :=
          edtLimiteCredito.Value;
        FieldByName('APLICARLIMITECREDITO').Tag := 1;
        if chkAplicarLimiteCredito.Checked = True then
          FieldByName('APLICARLIMITECREDITO').AsInteger := 1
        else
          FieldByName('APLICARLIMITECREDITO').AsInteger := 0;
        FieldByName('CONTACTONOMBRE').Tag := 1;
        FieldByName('CONTACTONOMBRE').AsString :=
          edtContacto.Text;
        FieldByName('TIPOPAGO').Tag := 1;
        if rbContado.Checked = True then
          FieldByName('TIPOPAGO').AsInteger := 1;
        if rbCredito.Checked = True then
          FieldByName('TIPOPAGO').AsInteger := 2;
        FieldByName('PLAZO').Tag := 1;
        FieldByName('PLAZO').AsInteger :=
          spePlazo.Value;
        FieldByName('APLICARIMPUESTO').Tag := 1;
        if chkAplicarImpuesto.Checked = True then
          FieldByName('APLICARIMPUESTO').AsInteger := 1
        else
          FieldByName('APLICARIMPUESTO').AsInteger := 0;
        FieldByName('DescuentoPor').Tag := 1;
        FieldByName('DescuentoPor').AsFloat :=
          edtDescuentoPor.Value;
        Post;
      end;
      mBS_Clientes.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Clientes.Destroy;

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
