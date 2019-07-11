unit FrmMantenimientoUsuarios01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  RzListVw, RzStatus, RzPanel, Vcl.ExtCtrls,
  System.RegularExpressions, uDL_Skeleton, Vcl.Mask, RzEdit, RzBtnEdt;

type
  TFormMantenimientoUsuarios01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    pnlFiltro: TRzPanel;
    pnlListaTitulo: TRzPanel;
    lvLista1: TRzListView;
    chkTodoLista1: TCheckBox;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnEliminar: TBitBtn;
    btnRefrescar: TBitBtn;
    btnCerrar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edtBuscar_Usuario: TRzButtonEdit;
    edtBuscar_Nombre: TRzButtonEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chkTodoLista1Click(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnEliminarClick(Sender: TObject);
    procedure btnRefrescarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure lvLista1DblClick(Sender: TObject);
    procedure edtBuscar_UsuarioInvokeSearch(Sender: TObject);
    procedure edtBuscar_NombreInvokeSearch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMantenimientoUsuarios01: TFormMantenimientoUsuarios01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Insertar;
  procedure Modificar(lv: TRzListView);
  procedure Eliminar(lv: TRzListView);
  procedure Refrescar(lv: TRzListView);
  procedure Cerrar;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Eliminar_Data(pId: Integer);
  procedure Buscar_Usuario(pTexto: string; lv: TRzListView);
  procedure Buscar_Nombre(pTexto: string; lv: TRzListView);
  procedure MDLista_Todos(lv: TRzListView; chk: TCheckBox);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_USUARIOS, BS_DBConexion,
  FrmUsuarios01, FrmMensaje_Espera01, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_USUARIOS;

const
  lv_Usuario = 0;
  lv_Nombre = 1;
  lv_id = 2;

var
  Forma01: TFormMantenimientoUsuarios01;

{$REGION 'Funciones Forma'}
procedure TFormMantenimientoUsuarios01.FormShow(Sender: TObject);
begin
  Forma01 := FormMantenimientoUsuarios01;

  InicializarForma;
end;

procedure TFormMantenimientoUsuarios01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormMantenimientoUsuarios01.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormMantenimientoUsuarios01.chkTodoLista1Click(Sender: TObject);
begin
  MDLista_Todos(lvLista1, chkTodoLista1);
end;

procedure TFormMantenimientoUsuarios01.btnInsertarClick(Sender: TObject);
begin
  Insertar;
end;

procedure TFormMantenimientoUsuarios01.btnModificarClick(Sender: TObject);
begin
  Modificar(lvLista1);
end;

procedure TFormMantenimientoUsuarios01.btnEliminarClick(Sender: TObject);
begin
  Eliminar(lvLista1);
end;

procedure TFormMantenimientoUsuarios01.btnRefrescarClick(Sender: TObject);
begin
  Refrescar(lvLista1);
end;

procedure TFormMantenimientoUsuarios01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormMantenimientoUsuarios01.lvLista1DblClick(Sender: TObject);
begin
  btnModificar.Click;
end;

procedure TFormMantenimientoUsuarios01.edtBuscar_UsuarioInvokeSearch(
  Sender: TObject);
begin
  Buscar_Usuario(edtBuscar_Usuario.Text, lvLista1);
end;

procedure TFormMantenimientoUsuarios01.edtBuscar_NombreInvokeSearch(
  Sender: TObject);
begin
  Buscar_Nombre(edtBuscar_Nombre.Text, lvLista1);
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
      Refrescar(lvLista1);
      if _Resultado = -1 then
        raise Exception.Create('');
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
    if Key = VK_F2 then
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
      btnEliminar.Click;
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

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    edtBuscar_Usuario.Clear;
    edtBuscar_Nombre.Clear;

  end;
end;

procedure Insertar;
begin
  with Forma01 do
  begin

    FormUsuarios01._Opcion := 1;
    FormUsuarios01.ShowModal;
    if FormUsuarios01.Tag = 1 then
      btnRefrescar.Click;

  end;
end;

procedure Modificar(lv: TRzListView);
var
  mLinea: string;
  mId: Integer;
begin
  with Forma01 do
  begin

    if lv.Selected <> nil then
    begin
      mLinea := lv.Selected.SubItems[lv_id];
      try
        mId := StrToInt(mLinea);
      except
        mId := 0;
      end;
      if mId > 0 then
      begin
        FormUsuarios01._Id := mId;
        FormUsuarios01._Opcion := 2;
        FormUsuarios01.ShowModal;
        if FormUsuarios01.Tag = 1 then
          btnRefrescar.Click;
      end;
    end;

  end;
end;

procedure Eliminar(lv: TRzListView);
var
  mFila, mId: Integer;
  mLinea: string;
begin
  with Forma01 do
  begin

    if Application.MessageBox('Desea eliminar los registros marcados?',
      'Confirmar', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      for mFila := 0 to lv.Items.Count - 1 do
      begin
        if lv.Items[mFila].Checked = True then
        begin
          mLinea := lv.Items[mFila].SubItems[lv_id];
          try
            mId := StrToInt(mLinea);
          except
            mId := 0;
          end;
          if mId > 0 then
            Eliminar_Data(mId);
        end;
      end;
      btnRefrescar.Click;
    end;

  end;
end;

procedure Refrescar(lv: TRzListView);
var
  mBS_Usuarios: Clase_Tipo1;
  mWhere, mOrderBy: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    Screen.Cursor := crHourGlass;
    FormMensaje_Espera01.Show;
    FormMensaje_Espera01.Repaint;
    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Usuarios := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Clear;
      mWhere.Add('ESVISIBLE=1');
      mOrderBy := TStringList.Create;
      mOrderBy.Clear;
      mOrderBy.Add('A.USUARIO');
      mBS_Usuarios.Consultar(_Resultado, _ErrorM, mWhere.Text,
        mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarlvLista1(lv, mBS_Usuarios.Dataset);
      mBS_Usuarios.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      _Resultado := -1;
      mResultado := _Resultado;
      mErrorM := _ErrorM;
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := mResultado;
      _ErrorM := mErrorM;
    end;
    FormMensaje_Espera01.Close;
    Screen.Cursor := crDefault;

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
          Caption := '';
          SubItems.Add(
            FieldByName('USUARIO').AsString);
          SubItems.Add(
            FieldByName('NOMBRECOMPLETO').AsString);
          SubItems.Add(
            FieldByName('ID').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Eliminar_Data(pId: Integer);
var
  mBS_Usuarios: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Usuarios := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('ID = ' + IntToStr(pId));
      mBS_Usuarios.Eliminar(mWhere.Text, _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Usuarios.Destroy;

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
      _Resultado := -1;
    end;

  end;
end;

procedure Buscar_Usuario(pTexto: string; lv: TRzListView);
var
  mEncontrado: Boolean;
  mFila: Integer;
  mTexto, mLinea: string;
  regexpr : TRegEx;
  match   : TMatch;
begin
  with Forma01 do
  begin

    mEncontrado := False;
    mTexto := Trim(pTexto);
    for mFila := 0 to lv.Items.Count - 1 do
    begin
      mLinea := Trim(lv.Items[mFila].SubItems[lv_Usuario]);
      if mTexto <> '' then
      begin
        regexpr := TRegEx.Create(mTexto,[roIgnoreCase,roMultiline]);
        match := regexpr.Match(mLinea);
        if match.Success then
        begin
          mEncontrado := True;
          lv.Items[mFila].Selected := true;
          lv.Items[mFila].MakeVisible(True);
          lv.SetFocus;
          Break;
        end;
      end
      else
        Break;
    end;
    if mEncontrado = False then
      Application.MessageBox('No encontrado', 'Advertencia', MB_OK);

  end;
end;

procedure Buscar_Nombre(pTexto: string; lv: TRzListView);
var
  mEncontrado: Boolean;
  mFila: Integer;
  mTexto, mLinea: string;
  regexpr : TRegEx;
  match   : TMatch;
begin
  with Forma01 do
  begin

    mEncontrado := False;
    mTexto := Trim(pTexto);
    for mFila := 0 to lv.Items.Count - 1 do
    begin
      mLinea := Trim(lv.Items[mFila].SubItems[lv_Nombre]);
      if mTexto <> '' then
      begin
        regexpr := TRegEx.Create(mTexto,[roIgnoreCase,roMultiline]);
        match := regexpr.Match(mLinea);
        if match.Success then
        begin
          mEncontrado := True;
          lv.Items[mFila].Selected := true;
          lv.Items[mFila].MakeVisible(True);
          lv.SetFocus;
          Break;
        end;
      end
      else
        Break;
    end;
    if mEncontrado = False then
      Application.MessageBox('No encontrado', 'Advertencia', MB_OK);

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
