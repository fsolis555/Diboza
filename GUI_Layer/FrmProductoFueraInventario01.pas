unit FrmProductoFueraInventario01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RxToolEdit, RxCurrEdit,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, RzPanel;

type
  TFormProductoFueraInventario01 = class(TForm)
    Label1: TLabel;
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNombre: TEdit;
    edtPrecio: TCurrencyEdit;
    edtCantidad: TCurrencyEdit;
    edtTotal: TCurrencyEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtPrecioChange(Sender: TObject);
    procedure edtCantidadChange(Sender: TObject);
  private
    FNombre: string;
    FCantidad: Double;
    FPrecio: Double;
    FTotal: Double;
  public
    property _Nombre: string  read FNombre write FNombre;
    property _Cantidad: Double  read FCantidad write FCantidad;
    property _Precio: Double  read FPrecio write FPrecio;
    property _Total: Double  read FTotal write FTotal;
  end;

var
  FormProductoFueraInventario01: TFormProductoFueraInventario01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure ActualizarTotal;
  procedure CargarIdioma;

implementation
uses
  udmLenguajes;

{$R *.dfm}

var
  Forma01: TFormProductoFueraInventario01;

{$REGION 'Funciones Forma'}
procedure TFormProductoFueraInventario01.FormShow(Sender: TObject);
begin
  Forma01 := FormProductoFueraInventario01;

  InicializarForma;
end;

procedure TFormProductoFueraInventario01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormProductoFueraInventario01.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormProductoFueraInventario01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormProductoFueraInventario01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormProductoFueraInventario01.edtCantidadChange(Sender: TObject);
begin
  ActualizarTotal;
end;

procedure TFormProductoFueraInventario01.edtPrecioChange(Sender: TObject);
begin
  ActualizarTotal;
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
      edtNombre.SetFocus;
    except
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

    edtNombre.Clear;
    edtPrecio.Value := 0;
    edtCantidad.Value := 1;
    edtTotal.Value := 0;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    if Trim(edtNombre.Text) <> '' then
    begin
      _Nombre := edtNombre.Text;
      _Cantidad := edtCantidad.Value;
      _Precio := edtPrecio.Value;
      _Total := edtTotal.Value;
      Tag := 1;
      Close;
    end
    else
      Application.MessageBox('Debe tener un nombre', 'Advertencia', MB_ICONWARNING);

  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure ActualizarTotal;
var
  mPrecio, mCantidad: Double;
begin
  with Forma01 do
  begin

    mPrecio := edtPrecio.Value;
    mCantidad := edtCantidad.Value;
    edtTotal.Value := mPrecio * mCantidad;

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
    end;

  end;
end;
{$ENDREGION}

end.