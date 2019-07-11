unit FrmOpciones01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzTabs, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, uDL_Skeleton, Vcl.ComCtrls, Vcl.Mask, RxToolEdit,
  RxCurrEdit, Vcl.Samples.Spin, Vcl.Printers, Vcl.Styles, vcl.Themes,
  FileCtrl, Vcl.ImgList, RzEdit, RzBtnEdt;

type
  TFormOpciones01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlAccion: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    chkRedondeoDecimales: TCheckBox;
    chkRedondeoFactor5: TCheckBox;
    cbImpresoraRecibos: TComboBoxEx;
    cbImpresoraComandas: TComboBoxEx;
    Label3: TLabel;
    edtImpuestoServicio: TCurrencyEdit;
    chkCodigoBarrasDirecto: TCheckBox;
    Label4: TLabel;
    speDiasVencimiento: TSpinEdit;
    chkAplicarImpuestoServicio: TCheckBox;
    TabSheet2: TRzTabSheet;
    Label5: TLabel;
    cbImpresora1: TComboBoxEx;
    Label6: TLabel;
    cbImpresora2: TComboBoxEx;
    Label7: TLabel;
    cbImpresora3: TComboBoxEx;
    Label8: TLabel;
    cbImpresora4: TComboBoxEx;
    chkImpuestoIncluido: TCheckBox;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    rbWindows: TRadioButton;
    rbClasico: TRadioButton;
    chkSeguridad: TCheckBox;
    TabSheet3: TRzTabSheet;
    chkUsarContabilidad: TCheckBox;
    Label10: TLabel;
    TabSheet4: TRzTabSheet;
    pnlConexionesOpcioes: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    edtConexionesIP: TEdit;
    btnAgregarConexiones: TBitBtn;
    btnEliminarClientes: TBitBtn;
    edtConexionesComentarios: TEdit;
    stbEstadoConexiones: TStatusBar;
    lvLista1: TListView;
    Label13: TLabel;
    GroupBox2: TGroupBox;
    rbServidor: TRadioButton;
    rbCliente: TRadioButton;
    edtConexiuonesBaseDatos: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    cbVendedor: TComboBoxEx;
    chkAplicarBajarInventarioNC: TCheckBox;
    Label16: TLabel;
    edtConexionesUsuario: TEdit;
    Label17: TLabel;
    edtConexionesClave: TEdit;
    Label18: TLabel;
    cbIdioma: TComboBoxEx;
    flbIdiomas: TFileListBox;
    TabSheet5: TRzTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    edtSucursal: TEdit;
    edtTerminal: TEdit;
    Label21: TLabel;
    Label22: TLabel;
    edtCertificadoClave: TEdit;
    Label23: TLabel;
    edtUsuarioToken: TEdit;
    Label24: TLabel;
    edtClaveToken: TEdit;
    edtCertificadoArchivo: TButtonedEdit;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    edtDirectorioRespaldos: TRzButtonEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtDirectorioRespaldosInvokeSearch(Sender: TObject);
    procedure btnAgregarConexionesClick(Sender: TObject);
    procedure btnEliminarClientesClick(Sender: TObject);
    procedure edtCertificadoArchivoRightButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOpciones01: TFormOpciones01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure Modificar_Data;
  procedure LlenarImpresoras;
  procedure BuscarDirectorioRespaldos;
  procedure Agregar_Conexiones;
  procedure Eliminar_Conexiones;
  procedure LlenarListaConexiones;
  procedure LlenarcbVendedores(cb: TComboBoxEx);
  procedure LlenarcbIdiomas(cb: TComboBoxEx);
  procedure Buscar_Certificado;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_SISTEMA, BS_DBConexion, DL_DBGeneral,
  uConfig, uDL_TB_CONEXIONES, uDL_TB_VENDEDORES, udmLenguajes,
  uHacienda;

{$R *.dfm}

var
  Forma01: TFormOpciones01;
  _DL_TB_CONEXIONES: TDL_TB_CONEXIONES;

{$REGION 'Funciones Forma'}
procedure TFormOpciones01.FormShow(Sender: TObject);
begin
  Forma01 := FormOpciones01;

  InicializarForma;
end;

procedure TFormOpciones01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormOpciones01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormOpciones01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormOpciones01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormOpciones01.edtDirectorioRespaldosInvokeSearch(Sender: TObject);
begin
  BuscarDirectorioRespaldos;
end;

procedure TFormOpciones01.btnAgregarConexionesClick(Sender: TObject);
begin
  Agregar_Conexiones;
end;

procedure TFormOpciones01.btnEliminarClientesClick(Sender: TObject);
begin
  Eliminar_Conexiones;
end;

procedure TFormOpciones01.edtCertificadoArchivoRightButtonClick(
  Sender: TObject);
begin
  Buscar_Certificado;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LlenarImpresoras;

      LlenarcbVendedores(cbVendedor);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbIdiomas(cbIdioma);

      LimpiarCampos;
      CargarIdioma;
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
      _DL_TB_CONEXIONES.Destroy;
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
var
  mDL_TB_SISTEMA: TDL_TB_SISTEMA;
  mConfig: TConfig;
  mDL_TB_CONEXIONES: TDL_TB_CONEXIONES;
  mArchivoConfigHacienda: string;
begin
  with Forma01 do
  begin

    pgcCampos.ActivePageIndex := 0;
    edtConexionesIP.Clear;
    edtConexiuonesBaseDatos.Clear;
    edtConexionesComentarios.Clear;
    edtConexionesUsuario.Clear;
    edtConexionesClave.Clear;
    cbImpresoraRecibos.ItemIndex := 0;
    cbImpresoraComandas.ItemIndex := 0;
    chkRedondeoDecimales.Checked := False;
    chkRedondeoFactor5.Checked := False;
    edtImpuestoServicio.Value := 0;
    chkSeguridad.Checked := False;
    chkUsarContabilidad.Checked := False;
    _DL_TB_CONEXIONES := TDL_TB_CONEXIONES.Create;
    rbCliente.Checked := True;
    cbVendedor.ItemIndex := 0;
    chkAplicarBajarInventarioNC.Checked := True;

    mDL_TB_SISTEMA := TDL_TB_SISTEMA.Create;
    mDL_TB_SISTEMA.Consultar(_Resultado, _ErrorM);
    with mDL_TB_SISTEMA.Dataset do
    begin
      if IsEmpty = False then
      begin
        edtImpuestoServicio.Value :=
          FieldByName('ISERVICIO').AsFloat;
        if FieldByName('APLICARREDONDEO').AsInteger = 1 then
          chkRedondeoDecimales.Checked := True;
        if FieldByName('APLICARREDONDEO5').AsInteger = 1 then
          chkRedondeoFactor5.Checked := True;
        if FieldByName('PRODUCTOIMPUESTOINCLUIDO').AsInteger = 1 then
          chkImpuestoIncluido.Checked := True
        else
          chkImpuestoIncluido.Checked := False;
        if FieldByName('USARSEGURIDAD').AsInteger = 1 then
          chkSeguridad.Checked := True;
        if FieldByName('USARCONTABILIDAD').AsInteger = 1 then
          chkUsarContabilidad.Checked := True;
        if FieldByName('TIPOMAQUINA').AsInteger = 1 then
          rbServidor.Checked := True;
        if FieldByName('TIPOMAQUINA').AsInteger = 2 then
          rbCliente.Checked := True;
        cbVendedor.ItemIndex := SetCombo(cbVendedor,
          FieldByName('IdVendedor').AsInteger);
        if FieldByName('AplicarBajarInventarioNC').AsInteger = 1 then
          chkAplicarBajarInventarioNC.Checked := True
        else
          chkAplicarBajarInventarioNC.Checked := False;
      end;
    end;
    mDL_TB_SISTEMA.Destroy;

    mConfig := TConfig.Create;
    mConfig.LeerIni;
    mConfig.Destroy;
    if Global.AplicarImpuestoServicio = 1 then
      chkAplicarImpuestoServicio.Checked := True
    else
      chkAplicarImpuestoServicio.Checked := False;
    if Global.CodigoBarrasDirecto = 1 then
      chkCodigoBarrasDirecto.Checked := True
    else
      chkCodigoBarrasDirecto.Checked := False;
    speDiasVencimiento.Value :=
      Global.DiasVencimientoDefault;
    cbImpresoraRecibos.ItemIndex := cbImpresoraRecibos.Items.IndexOf(Global.ImpresoraRecibos);
    cbImpresoraComandas.ItemIndex := cbImpresoraComandas.Items.IndexOf(Global.ImpresoraComanda);
    cbImpresora1.ItemIndex := cbImpresora1.Items.IndexOf(Global.OrdenesImpresora1);
    cbImpresora2.ItemIndex := cbImpresora2.Items.IndexOf(Global.OrdenesImpresora2);
    cbImpresora3.ItemIndex := cbImpresora3.Items.IndexOf(Global.OrdenesImpresora3);
    cbImpresora4.ItemIndex := cbImpresora4.Items.IndexOf(Global.OrdenesImpresora4);
    if Global.TipoPantalla = 0 then
      rbWindows.Checked := True;
    if Global.TipoPantalla = 1 then
      rbClasico.Checked := True;
    edtDirectorioRespaldos.Text := Global.DirectorioRespaldos;
    stbEstadoConexiones.Panels[0].Text := 'Registros: 0';
    lvLista1.Items.Clear;
    edtSucursal.Text := Global.Sucursal;
    edtTerminal.Text := Global.Terminal;

    _DL_TB_CONEXIONES.Consultar(_Resultado, _ErrorM, '');
    LlenarListaConexiones;

    mArchivoConfigHacienda := Global.PathAplicacion + '\Config_HaciendaLib.xml';
    Leer_OpcionesHacieda(mArchivoConfigHacienda, Global.HModoProduccion,
      Global.HClaveDocumento, Global.HTokenUsuario, Global.HTokenClave,
      Global.HCertificadoArchivo, Global.HCertificadoClave, Global.HAccion,
      Global.HArchivoNombre, Global.HArchivoXMLFirmado,
      Global.HArchivoXMLFirmar, _Resultado, _ErrorM);
    edtCertificadoArchivo.Text :=
      Global.HCertificadoArchivo;
    edtCertificadoClave.Text :=
      Global.HCertificadoClave;
    edtUsuarioToken.Text :=
      Global.HTokenUsuario;
    edtClaveToken.Text :=
      Global.HTokenClave;
  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    Modificar_Data;
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

procedure Modificar_Data;
var
  mDL_TB_SISTEMA: TDL_TB_SISTEMA;
  mConfig: TConfig;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mIdVendedor: Integer;
  mArchivoConfigHacienda: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mIdVendedor := GetCombo(cbVendedor);
      mDL_TB_SISTEMA := TDL_TB_SISTEMA.Create;
      with mDL_TB_SISTEMA.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_SISTEMA.Limpiar_Tag;
        Append;
        FieldByName('ISERVICIO').Tag := 1;
        FieldByName('ISERVICIO').AsFloat :=
          edtImpuestoServicio.Value;
        FieldByName('APLICARREDONDEO').Tag := 1;
        if chkRedondeoDecimales.Checked = True then
          FieldByName('APLICARREDONDEO').AsInteger := 1
        else
          FieldByName('APLICARREDONDEO').AsInteger := 0;
        FieldByName('APLICARREDONDEO5').Tag := 1;
        if chkRedondeoFactor5.Checked = True then
          FieldByName('APLICARREDONDEO5').AsInteger := 1
        else
          FieldByName('APLICARREDONDEO5').AsInteger := 0;
        FieldByName('PRODUCTOIMPUESTOINCLUIDO').Tag := 1;
        if chkImpuestoIncluido.Checked = True then
          FieldByName('PRODUCTOIMPUESTOINCLUIDO').AsInteger := 1
        else
          FieldByName('PRODUCTOIMPUESTOINCLUIDO').AsInteger := 0;
        FieldByName('USARSEGURIDAD').Tag := 1;
        if chkSeguridad.Checked = True then
          FieldByName('USARSEGURIDAD').AsInteger := 1
        else
          FieldByName('USARSEGURIDAD').AsInteger := 0;
        FieldByName('USARCONTABILIDAD').Tag := 1;
        if chkUsarContabilidad.Checked = True then
          FieldByName('USARCONTABILIDAD').AsInteger := 1
        else
          FieldByName('USARCONTABILIDAD').AsInteger := 0;
        FieldByName('TIPOMAQUINA').Tag := 1;
        if rbServidor.Checked = True then
          FieldByName('TIPOMAQUINA').AsInteger := 1
        else
          FieldByName('TIPOMAQUINA').AsInteger := 2;
        FieldByName('IdVendedor').Tag := 1;
        FieldByName('IdVendedor').AsInteger :=
          mIdVendedor;
        FieldByName('AplicarBajarInventarioNC').Tag := 1;
        if chkAplicarBajarInventarioNC.Checked = True then
          FieldByName('AplicarBajarInventarioNC').AsInteger := 1
        else
          FieldByName('AplicarBajarInventarioNC').AsInteger := 0;
        Post;
      end;
      mDL_TB_SISTEMA.Modificar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_SISTEMA.Destroy;

      if chkAplicarImpuestoServicio.Checked = True then
        Global.AplicarImpuestoServicio := 1
      else
        Global.AplicarImpuestoServicio := 0;
      Global.ImpresoraComanda := Trim(cbImpresoraComandas.Text);
      Global.ImpresoraRecibos := Trim(cbImpresoraRecibos.Text);
      if chkCodigoBarrasDirecto.Checked = True then
        Global.CodigoBarrasDirecto := 1
      else
        Global.CodigoBarrasDirecto := 0;
      Global.DiasVencimientoDefault :=
        speDiasVencimiento.Value;
      Global.OrdenesImpresora1 := Trim(cbImpresora1.Text);
      Global.OrdenesImpresora2 := Trim(cbImpresora2.Text);
      Global.OrdenesImpresora3 := Trim(cbImpresora3.Text);
      Global.OrdenesImpresora4 := Trim(cbImpresora4.Text);
      if rbWindows.Checked = True then
        Global.TipoPantalla := 0;
      if rbClasico.Checked = True then
        Global.TipoPantalla := 1;
      Global.DirectorioRespaldos :=
        edtDirectorioRespaldos.Text;
      Global.Idioma := Trim(cbIdioma.Text);
      Global.Sucursal := edtSucursal.Text;
      Global.Terminal := edtTerminal.Text;

      Global.HTokenUsuario :=
        edtUsuarioToken.Text;
      Global.HTokenClave :=
        edtClaveToken.Text;
      Global.HCertificadoArchivo :=
        edtCertificadoArchivo.Text;
      Global.HCertificadoClave :=
        edtCertificadoClave.Text;;
      mArchivoConfigHacienda := Global.PathAplicacion + '\Config_HaciendaLib.xml';
      Escribir_OpcionesHacieda_DatosGenerales(mArchivoConfigHacienda,
        Global.HTokenUsuario, Global.HTokenClave, Global.HCertificadoArchivo,
        Global.HCertificadoClave, _Resultado, _ErrorM);

      mConfig := TConfig.Create;
      mConfig.EscribirIni_Sistema;
      mConfig.EscribirIni_Hacienda;
      mConfig.Destroy;

      case Global.TipoPantalla of
         0: TStyleManager.SetStyle('Windows');
         1: TStyleManager.SetStyle('Slate Classico');
      else
        TStyleManager.SetStyle('Windows');
      end;

      _DL_TB_CONEXIONES.Eliminar('', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      with _DL_TB_CONEXIONES.Dataset do
      begin
        First;
        while not Eof do
        begin
          Edit;
          FieldByName('IP').Tag := 1;
          FieldByName('COMENTARIOS').Tag := 1;
          FieldByName('Driver').Tag := 1;
          FieldByName('BaseDatos').Tag := 1;
          FieldByName('Usuario').Tag := 1;
          FieldByName('Clave').Tag := 1;
          FieldByName('Puerto').Tag := 1;
          Post;
          Next;
        end;
      end;
      _DL_TB_CONEXIONES.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      Global.IdVendedorDefault := GetCombo(cbVendedor);

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

procedure LlenarImpresoras;
var
  mFila: Integer;
begin
  with Forma01 do
  begin

    cbImpresoraRecibos.Items.Clear;
    cbImpresoraComandas.Items.Clear;
    cbImpresora1.Items.Clear;
    cbImpresora2.Items.Clear;
    cbImpresora3.Items.Clear;
    cbImpresora4.Items.Clear;

    cbImpresoraRecibos.Items.Add('Default');
    cbImpresoraComandas.Items.Add('Default');
    cbImpresora1.Items.Add('Default');
    cbImpresora2.Items.Add('Default');
    cbImpresora3.Items.Add('Default');
    cbImpresora4.Items.Add('Default');

    for mFila := 0 to Printer.Printers.Count - 1 do
    begin
      cbImpresoraRecibos.Items.Add(Printer.Printers.strings[mFila]);
      cbImpresoraComandas.Items.Add(Printer.Printers.strings[mFila]);
      cbImpresora1.Items.Add(Printer.Printers.strings[mFila]);
      cbImpresora2.Items.Add(Printer.Printers.strings[mFila]);
      cbImpresora3.Items.Add(Printer.Printers.strings[mFila]);
      cbImpresora4.Items.Add(Printer.Printers.strings[mFila]);
    end;

  end;
end;

procedure BuscarDirectorioRespaldos;
var
  chosenDirectory: string;
begin
  with Forma01 do
  begin

    if selectdirectory('Seleccione un Directorio',
      edtDirectorioRespaldos.Text, chosenDirectory) then
      edtDirectorioRespaldos.Text := chosenDirectory;

  end;
end;

procedure Agregar_Conexiones;
var
  mIP: string;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mIP := edtConexionesIP.Text;
      mEncontrado :=
        _DL_TB_CONEXIONES.Dataset.Locate('IP', mIP, []);
      if mEncontrado = False then
      begin
        with _DL_TB_CONEXIONES.Dataset do
        begin
          Append;
          FieldByName('IP').Tag := 1;
          FieldByName('IP').AsString := mIP;
          FieldByName('COMENTARIOS').Tag := 1;
          FieldByName('COMENTARIOS').AsString := edtConexionesComentarios.Text;
          FieldByName('Driver').Tag := 1;
          FieldByName('Driver').AsString := 'MySQL';
          FieldByName('BaseDatos').Tag := 1;
          FieldByName('BaseDatos').AsString :=
            edtConexiuonesBaseDatos.Text;
          FieldByName('Usuario').Tag := 1;
          FieldByName('Usuario').AsString :=
            edtConexionesUsuario.Text;
          FieldByName('Clave').Tag := 1;
          FieldByName('Clave').AsString :=
            edtConexionesClave.Text;
          FieldByName('Puerto').Tag := 1;
          FieldByName('Puerto').AsInteger := 3306;
          FieldByName('Varios').Tag := 1;
          FieldByName('Varios').AsString := '';
          Post;
        end;
        LlenarListaConexiones;
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

procedure Eliminar_Conexiones;
var
  mLinea: string;
  mFila, mId: Integer;
  mEncontrado: Boolean;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      for mFila := 0 to lvLista1.Items.Count - 1 do
      begin
        if lvLista1.Items[mFila].Checked = True then
        begin
          mLinea := lvLista1.Items[mFila].SubItems[3];
          try
            mId := StrToInt(mLinea);
          except
            mId := 0;
          end;
          mEncontrado :=
            _DL_TB_CONEXIONES.Dataset.Locate('Id', mId, []);
          if mEncontrado = True then
            _DL_TB_CONEXIONES.Dataset.Delete;
        end;
      end;
      LlenarListaConexiones;

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

procedure LlenarListaConexiones;
begin
  with Forma01 do
  begin

    lvLista1.Items.Clear;
    stbEstadoConexiones.Panels[0].Text := 'Registros: 0';

    with _DL_TB_CONEXIONES.Dataset do
    begin
      stbEstadoConexiones.Panels[0].Text := 'Registros: ' +
        FormatFloat('#,##0', RecordCount);
      First;
      while not Eof do
      begin
        with lvLista1.Items.Add do
        begin
          Caption := '';
          SubItems.Add(
            FieldByName('IP').AsString);
          SubItems.Add(
            FieldByName('BaseDatos').AsString);
          SubItems.Add(
            FieldByName('COMENTARIOS').AsString);
          SubItems.Add(
            FieldByName('Id').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure LlenarcbVendedores(cb: TComboBoxEx);
var
  mDL_TB_Vendedores: TDL_TB_VENDEDORES;
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
      mDL_TB_Vendedores := TDL_TB_VENDEDORES.Create;
      mDL_TB_Vendedores.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_Vendedores.Dataset do
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
      mDL_TB_Vendedores.Destroy;

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

procedure LlenarcbIdiomas(cb: TComboBoxEx);
var
  mFila:Integer;
  mId: Integer;
  Aux01: string;
begin
  with Forma01 do
  begin

    try
      cb.Items.Clear;
      cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));
      if DirectoryExists(Global.PathLanguages) = False then
        CreateDir(Global.PathLanguages);
      flbIdiomas.Directory := Global.PathLanguages;
      mId := 0;
      for mFila := 0 to flbIdiomas.Items.Count - 1 do
      begin
        Aux01 := flbIdiomas.Items.Strings[mFila];
        cb.Items.AddObject(Aux01, TObject(mFila + 1));
        if Global.Idioma = Aux01 then
          mId := mFila + 1;
      end;
      cbIdioma.ItemIndex := mId;
    except
    end;

  end;
end;

procedure Buscar_Certificado;
begin
  with Forma01 do
  begin

    if OpenDialog1.Execute = True then
      edtCertificadoArchivo.Text :=
        OpenDialog1.FileName;

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
