unit FmrEmpresas01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzTabs,
  Vcl.StdCtrls, Vcl.Buttons, uDL_Skeleton, Vcl.ComCtrls,
  system.Zip, Data.DB, ShellCtrls;

type
  TFormEmpresas01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    pgcCampos: TRzPageControl;
    TabSheet1: TRzTabSheet;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCedula: TEdit;
    edtNombre: TEdit;
    edtDireccion: TEdit;
    edtTelefono1: TEdit;
    edtTelefono2: TEdit;
    edtEmail: TEdit;
    edtWeb: TEdit;
    edtRazonSocial: TEdit;
    Label9: TLabel;
    edtRedSocial: TEdit;
    Label10: TLabel;
    edtFax: TEdit;
    TabSheet2: TRzTabSheet;
    Label14: TLabel;
    dtpInicioOperaciones: TDateTimePicker;
    btnImportarServidor: TBitBtn;
    ShellListView1: TShellListView;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImportarServidorClick(Sender: TObject);
  private
    FId: Integer;
  public
    property _Id: Integer read FId write FId;
  end;

var
  FormEmpresas01: TFormEmpresas01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure DBToForma(ds1: TDatasetMem);
  procedure Consultar_Data(pId: Integer);
  procedure Modificar_Data(pId: Integer);
  procedure ImportarServidor;
  function UnZipFile(ArchiveName, Path: String): boolean;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_EMPRESAS, BS_DBConexion,
  FrmImportarEmpresaServidor01, udmLenguajes,
  uDL_tb_empresas2, udmObjects, udmConnection, uConfig,
  uHacienda;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_EMPRESAS;

var
  Forma01: TFormEmpresas01;

{$REGION 'Funciones Forma'}
procedure TFormEmpresas01.FormShow(Sender: TObject);
begin
  Forma01 := FormEmpresas01;

  InicializarForma;
end;

procedure TFormEmpresas01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormEmpresas01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormEmpresas01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormEmpresas01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormEmpresas01.btnImportarServidorClick(Sender: TObject);
begin
  ImportarServidor;
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

      Consultar_Data(_Id);
      if _Resultado = -1 then
        raise Exception.Create('');

      CargarIdioma;

      edtCedula.SetFocus;
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

    edtCedula.Clear;
    edtNombre.Clear;
    edtDireccion.Clear;
    edtTelefono1.Clear;
    edtTelefono2.Clear;
    edtFax.Clear;
    edtEmail.Clear;
    edtWeb.Clear;
    edtRazonSocial.Clear;
    edtRedSocial.Clear;
    dtpInicioOperaciones.Date := Date;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    Modificar_Data(_Id);

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
      edtCedula.Text :=
        FieldByName('CEDULA').AsString;
      edtNombre.Text :=
        FieldByName('Nombre').AsString;
      edtDireccion.Text :=
        FieldByName('DIRECCION').AsString;
      edtTelefono1.Text :=
        FieldByName('TELEFONO1').AsString;
      edtTelefono2.Text :=
        FieldByName('TELEFONO2').AsString;
      edtFax.Text :=
        FieldByName('FAX').AsString;
      edtEmail.Text :=
        FieldByName('EMAIL').AsString;
      edtWeb.Text :=
        FieldByName('WEB').AsString;
      edtRazonSocial.Text :=
        FieldByName('NombreJuridico').AsString;
      edtRedSocial.Text :=
        FieldByName('RedSocial').AsString;
      dtpInicioOperaciones.Date :=
        FieldByName('INICIOPERIODOFISCAL').AsDateTime;
    end;

  end;
end;

procedure Consultar_Data(pId: Integer);
var
  mBS_Empresas: Clase_Tipo1;
  mWhere: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Empresas := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Clear;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mBS_Empresas.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToForma(mBS_Empresas.Dataset);
      mBS_Empresas.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
      _Resultado := -1;
    end;

  end;
end;

procedure Modificar_Data(pId: Integer);
var
  mBS_Empresas: Clase_Tipo1;
  mWhere: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mBS_Empresas := Clase_Tipo1.Create;
      with mBS_Empresas.Dataset do
      begin
        EmptyDataSet;
        mBS_Empresas.Limpiar_Tag;
        Append;
        FieldByName('Nombre').Tag := 1;
        FieldByName('Nombre').AsString :=
          edtNombre.Text;
        FieldByName('CEDULA').Tag := 1;
        FieldByName('CEDULA').AsString :=
          edtCedula.Text;
        FieldByName('DIRECCION').Tag := 1;
        FieldByName('DIRECCION').AsString :=
          edtDireccion.Text;
        FieldByName('TELEFONO1').Tag := 1;
        FieldByName('TELEFONO1').AsString :=
          edtTelefono1.Text;
        FieldByName('TELEFONO2').Tag := 1;
        FieldByName('TELEFONO2').AsString :=
          edtTelefono2.Text;
        FieldByName('FAX').Tag := 1;
        FieldByName('FAX').AsString :=
          edtFax.Text;
        FieldByName('EMAIL').Tag := 1;
        FieldByName('EMAIL').AsString :=
          edtEmail.Text;
        FieldByName('WEB').Tag := 1;
        FieldByName('WEB').AsString :=
          edtWeb.Text;
        FieldByName('NombreJuridico').Tag := 1;
        FieldByName('NombreJuridico').AsString :=
          edtRazonSocial.Text;
        FieldByName('RedSocial').Tag := 1;
        FieldByName('RedSocial').AsString :=
          edtRedSocial.Text;
        FieldByName('INICIOPERIODOFISCAL').Tag := 1;
        FieldByName('INICIOPERIODOFISCAL').AsString :=
          FormatDateTime('dd/MM/yyyy',
          dtpInicioOperaciones.Date);
        Post;
      end;

      mBS_Empresas.Modificar('Id=' + IntToStr(pId), _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mBS_Empresas.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      _Resultado := 1;
    except
      _MainConexion.Rechazar_Transaccion(_Resultado, _ErrorM);
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

procedure ImportarServidor;
var
  mtb_empresasHacienda:  TDL_tb_empresas2;
  mConfig: TConfig;
  mSucursal, mTerminal, Aux01: string;
  mArchivoConfig, mClaveDocumento: string;
  mModoProduccion, mAccion: Integer;
  mTokenUsuario, mTokenClave, mCertificadoArchivo: string;
  mCertificadoClave, mArchivoNombre, mArchivoXMLFirmado, mArchivoXMLFirmar: string;
  mImagen1: TMemoryStream;
  mFila, mIdEmpresa: Integer;
begin
  with Forma01 do
  begin

    try
      FormImportarEmpresaServidor01.ShowModal;
      if FormImportarEmpresaServidor01.Tag = 1 then
      begin
        mSucursal :=
          FormImportarEmpresaServidor01._Sucursal;
        mTerminal :=
          FormImportarEmpresaServidor01._Terminal;
        mIdEmpresa :=
          FormImportarEmpresaServidor01._IdEmpresa;

        mtb_empresasHacienda := TDL_tb_empresas2.Create;
        dmObjects.DB_HaciendaEmpresas_Consultar(dmConnection.FDHaciendaConnection,
          mtb_empresasHacienda.Dataset, '', 0,
          _Resultado, _ErrorM);
        if _Resultado = -1 then
          raise Exception.Create('');

        with mtb_empresasHacienda.Dataset do
        begin
          First;
          if IsEmpty = False then
          begin
            edtCedula.Text :=
              FieldByName('Identificacion').AsString;
            edtNombre.Text :=
              FieldByName('Nombre').AsString;
            edtDireccion.Text :=
              FieldByName('Direccion').AsString;
            edtTelefono1.Text :=
              FieldByName('Telefono').AsString;
            edtFax.Text :=
              FieldByName('Fax').AsString;
            edtEmail.Text :=
              FieldByName('Email').AsString;
            edtRazonSocial.Text :=
              FieldByName('Nombre').AsString;
          end;

          Global.IdSucursal :=
            StrToInt(mSucursal);
          Global.IdTerminal :=
            StrToInt(mTerminal);
          Global.Sucursal :=
            IntToStr(Global.IdSucursal);
          Global.Terminal :=
            IntToStr(Global.IdTerminal);
          Global.EmpresaCodigo :=
            mIdEmpresa;
          mConfig := TConfig.Create;
          mConfig.EscribirIni_Hacienda;
          mConfig.EscribirIni_Empresa;
          mConfig.Destroy;

          mArchivoConfig := Global.PathAplicacion + '\Config_HaciendaLib.xml';
          Leer_OpcionesHacieda(mArchivoConfig, mModoProduccion,
            mClaveDocumento, mTokenUsuario, mTokenClave,
            mCertificadoArchivo, mCertificadoClave, mAccion,
            mArchivoNombre, mArchivoXMLFirmado, mArchivoXMLFirmar,
            _Resultado, _ErrorM);

          if Trim(mTokenUsuario) = '' then
            mTokenUsuario :=
              FieldByName('TokenUsuario').AsString;
          if Trim(mTokenClave) = '' then
            mTokenClave :=
              FieldByName('TokenClave').AsString;
          if Trim(mCertificadoArchivo) = '' then
            mCertificadoArchivo :=
              FieldByName('CertificadoArchivoExtension').AsString;
          if Trim(mCertificadoClave) = '' then
            mCertificadoClave :=
              FieldByName('CertificadoClave').AsString;
          if Trim(FieldByName('CertificadoArchivoExtension').AsString) <> '' then
          begin
            mImagen1 := TMemoryStream.Create;
            (FieldByName('CertificadoArchivo') as TBlobField).SaveToStream(mImagen1);
            mImagen1.Position := 0;
            mImagen1.SaveToFile(Global.PathAplicacion + '\1.zip');
            mImagen1.Free;
            UnZipFile(Global.PathAplicacion + '\1.zip', Global.PathAplicacion);
            Sleep(1000);
          //  if FileExists(Global.PathAplicacion + '\1.zip') then
          //    DeleteFile(Global.PathAplicacion + '\1.zip');
          end;

          ShellListView1.Root := Global.PathAplicacion;
          for mFila := 0 to ShellListView1.Items.Count - 1 do
          begin
            Aux01 := Trim(ShellListView1.Items[mFila].Caption);
            if ExtractFilePath(Aux01) = '.p12' then
              Break;
          end;

          Escribir_OpcionesHacieda_DatosGenerales(mArchivoConfig,
            mTokenUsuario, mTokenClave, Global.PathAplicacion + '\' + Aux01, mCertificadoClave,
            _Resultado, _ErrorM);
        end;
        mtb_empresasHacienda.Destroy;
      end;

    except
    end;

  end;
end;

function UnZipFile(ArchiveName, Path: String): boolean;
  var Zip:TZipFile;
begin
  Zip:=TZipFile.Create;
  try
  zip.Open(ArchiveName,zmRead);
  zip.ExtractAll(Path);
  zip.Close;
  result:=true;
  except
   result:=false;
  end;
  zip.Free;
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
