unit FrmAcceso02;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RzPanel;

type
  TFormAcceso02 = class(TForm)
    Label1: TLabel;
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    edtClave: TEdit;
    Label2: TLabel;
    edtUsuario: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAcceso02: TFormAcceso02;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure CamposValidos;
  procedure CargarIdioma;

implementation
uses
  uSistema, ufunciones, uDL_TB_USUARIOS, udmLenguajes;

{$R *.dfm}

var
  Forma01: TFormAcceso02;

{$REGION 'Funciones Forma'}
procedure TFormAcceso02.FormShow(Sender: TObject);
begin
  Forma01 := FormAcceso02;

  InicializarForma;
end;

procedure TFormAcceso02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormAcceso02.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormAcceso02.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormAcceso02.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormAcceso02.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    if Trim(edtClave.Text) <> '' then
      btnAceptar.Click
    else
      edtClave.SetFocus;
  end;
end;

procedure TFormAcceso02.edtClaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Key := 0;
    btnAceptar.Click;
  end;
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
      edtUsuario.SetFocus;
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

    edtUsuario.Clear;
    edtClave.Clear;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    CamposValidos;
    if _Resultado = 1 then
    begin
      Tag := 1;
      Close;
    end;
    if _Resultado = 0 then
    begin
      Application.MessageBox(PChar('El usuario o la clave son incorrectos'),
        'Error', MB_ICONERROR);
      edtUsuario.SetFocus;
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

procedure CamposValidos;
var
  mDL_TB_USUARIOS: TDL_TB_USUARIOS;
  mWhere: TStringList;
  mUsuario, mClave: string;
  mUsuarioDB, mClaveDB, mClaveDB1: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 0;

      mUsuario := Trim(edtUsuario.Text);
      mClave := Trim(edtClave.Text);
      mUsuario := UpperCase(mUsuario);
      mClave := UpperCase(mClave);
//      mClave := StringToHex(mClave);

      mWhere := TStringList.Create;
      mDL_TB_USUARIOS := TDL_TB_USUARIOS.Create;
      mDL_TB_USUARIOS.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      _Resultado := 0;
      with mDL_TB_USUARIOS.Dataset do
      begin
        First;
        while not Eof do
        begin
          mUsuarioDB := Trim(
            FieldByName('USUARIO').AsString);
          mUsuarioDB := UpperCase(mUsuarioDB);
          mClaveDB :=
            FieldByName('CLAVE').AsString;
          mClaveDB1 := HexToString(mClaveDB);
          mClaveDB := UpperCase(mClaveDB1);
          if (mUsuarioDB = mUsuario) and
            (mClaveDB = mClave) then
          begin
            _Resultado := 1;
            Break;
          end;
          Next;
        end;
      end;
      mDL_TB_USUARIOS.Destroy;
    except
      if _Resultado = -1 then
      begin
        Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
          'Error', MB_ICONERROR);
      end;
      _Resultado := -1;
    end;
    edtUsuario.SetFocus;

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
