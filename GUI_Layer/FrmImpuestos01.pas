unit FrmImpuestos01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, Vcl.Mask, RxToolEdit,
  RxCurrEdit;

type
  TFormImpuestos01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label1: TLabel;
    edtNombre: TEdit;
    Label8: TLabel;
    edtPorcentaje: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtNombreKeyPress(Sender: TObject; var Key: Char);
  private
    FId: Integer;
    FOpcion: Integer;
  public
    property _Id: Integer read FId write FId;
    property _Opcion: Integer read FOpcion write FOpcion;
  end;

var
  FormImpuestos01: TFormImpuestos01;

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
  uSistema, ufunciones, uDL_TB_IMPUESTOS, BS_DBConexion, DL_DBGeneral,
  udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_Impuestos;

var
  Forma01: TFormImpuestos01;
  _Nombre: string;

{$REGION 'Funciones Forma'}
procedure TFormImpuestos01.FormShow(Sender: TObject);
begin
  Forma01 := FormImpuestos01;

  InicializarForma;
end;

procedure TFormImpuestos01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormImpuestos01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormImpuestos01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormImpuestos01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormImpuestos01.edtNombreKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in [#8, '0'..'9', 'a'..'z', 'A'..'Z', '_', ' ']) then
    Key := #0;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

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

    _Nombre := '';
    pgcCampos.ActivePageIndex := 0;
    edtNombre.Clear;
    edtPorcentaje.Value := 0;

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
      edtNombre.Text :=
        FieldByName('Nombre').AsString;
      edtPorcentaje.Value :=
        FieldByName('PORCENTAJE').AsFloat;

    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Impuestos: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Impuestos := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Impuestos.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Impuestos.Dataset);
      mBS_Impuestos.Destroy;

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
  mBS_Impuestos: Clase_Tipo1;
  mEncontrado: Boolean;
  mWhere: TStringList;
  mNombre: string;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

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
    mBS_Impuestos := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mWhere.Add('Nombre=' + QuotedStr(mNombre));
    mEncontrado :=
      mBS_Impuestos.Existe_Campo(mWhere.Text, 'Nombre', _Resultado, _ErrorM);
    mWhere.Free;
    mBS_Impuestos.Destroy;
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

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure Insertar_Data;
var
  mBS_Impuestos: Clase_Tipo1;
  mWhere: TStringList;
  mId: Integer;
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

      mBS_Impuestos := Clase_Tipo1.Create;
      with mBS_Impuestos.Dataset do
      begin
        EmptyDataSet;
        mBS_Impuestos.Limpiar_Tag;
        Append;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('PORCENTAJE').Tag := 1;
        FieldByName('PORCENTAJE').AsFloat :=
          edtPorcentaje.Value;
        Post;
      end;

      mBS_Impuestos.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Impuestos.Destroy;

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
  mBS_Impuestos: Clase_Tipo1;
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

      mBS_Impuestos := Clase_Tipo1.Create;
      with mBS_Impuestos.Dataset do
      begin
        EmptyDataSet;
        mBS_Impuestos.Limpiar_Tag;
        Append;
        FieldByName('NOMBRE').Tag := 1;
        FieldByName('NOMBRE').AsString :=
          edtNombre.Text;
        FieldByName('PORCENTAJE').Tag := 1;
        FieldByName('PORCENTAJE').AsFloat :=
          edtPorcentaje.Value;
        Post;
      end;
      mBS_Impuestos.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Impuestos.Destroy;

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
