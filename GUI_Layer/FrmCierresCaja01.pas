unit FrmCierresCaja01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, RzListVw, RzStatus, Vcl.Mask, RxToolEdit,
  RxCurrEdit, Vcl.ImgList,
  System.RegularExpressions, uDL_Skeleton, Vcl.Menus, RzButton,
  System.DateUtils,
  FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, frxClass, frxDBSet, RzEdit;

type
  TFormCierresCaja01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlTitulo1: TRzPanel;
    pnlTitulo2: TRzPanel;
    pnlOpciones: TRzPanel;
    pnlOpciones1: TRzPanel;
    btnImprimir: TRzToolButton;
    btnPagar: TBitBtn;
    btnNuevo: TBitBtn;
    btnCerrar: TBitBtn;
    pnlTotal: TRzPanel;
    pnlCampos: TRzPanel;
    ImageList1: TImageList;
    popImprimir: TPopupMenu;
    Imprimir1: TMenuItem;
    VistaPrevia1: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtMontoInicial: TCurrencyEdit;
    edtEfectivo: TCurrencyEdit;
    edtTarjeta: TCurrencyEdit;
    edtCheque: TCurrencyEdit;
    edtTransferencia: TCurrencyEdit;
    pnlEstado: TRzPanel;
    pnlEstado1: TRzPanel;
    pnlEstado2: TRzPanel;
    btnVerDetalle: TBitBtn;
    FDMemTable1: TFDMemTable;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Label6: TLabel;
    edtNotasCredito: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtDescuentos: TCurrencyEdit;
    Label9: TLabel;
    edtKilos: TCurrencyEdit;
    dtpFecha: TRzDateTimeEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure VistaPrevia1Click(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure edtMontoInicialChange(Sender: TObject);
    procedure dtpFechaChange(Sender: TObject);
    procedure btnVerDetalleClick(Sender: TObject);
  private
    FIdDocumento: Integer;
    FIdEstado: Integer;
    FIdFormaPago: Integer;
    FNumero: Integer;
  public
    property _IdDocumento: Integer read FIdDocumento write FIdDocumento;
    property _IdEstado: Integer read FIdEstado write FIdEstado;
    property _IdFormaPago: Integer read FIdFormaPago write FIdFormaPago;
    property _Numero: Integer read FNumero write FNumero;
  end;

var
  FormCierresCaja01: TFormCierresCaja01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure ActualizarTotales;
  procedure Nuevo;
  procedure Pagar_Data;
  procedure Imprimir_Data;
  procedure VistaPrevia;
  procedure Cerrar;
  procedure Consultar_Encabezado(pId: Integer);
  procedure DBToFormaEncabezado(ds1: TDatasetMem);
  procedure CamposValidos_Pagar1;
  procedure CamposValidos_Pagar2;
  procedure CalcularCierre;
  procedure VerDetalle;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones,BS_DBConexion, udmLenguajes,
  FrmMensaje_Espera01, uDL_TB_CIERRESCAJAENCABEZADO,
  uDL_TB_CONSECUTIVOS, uDL_TB_PLANTILLAS, uDL_TB_FACTURASCLIENTESENCABEZADO,
  FrmPagar01, udmReports, uDL_TB_EMPRESAS, uDL_TB_RECIBOSCLIENTESENCABEZADO,
  uDL_TB_RECIBOSAPARTADOSENCABEZADO, DL_DBGeneral, uDL_TB_SISTEMA,
  uDL_TB_NOTASCREDITOENCABEZADO;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_CIERRESCAJAENCABEZADO;

const
  lv_Nombre = 0;
  lv_id = 1;

var
  Forma01: TFormCierresCaja01;
  _Total: Double;

{$REGION 'Funciones Forma'}
procedure TFormCierresCaja01.FormShow(Sender: TObject);
begin
  Forma01 := FormCierresCaja01;

  InicializarForma;
end;

procedure TFormCierresCaja01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormCierresCaja01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormCierresCaja01.btnNuevoClick(Sender: TObject);
begin
  Nuevo;
end;

procedure TFormCierresCaja01.btnPagarClick(Sender: TObject);
begin
  Pagar_Data;
end;

procedure TFormCierresCaja01.Imprimir1Click(Sender: TObject);
begin
  Imprimir_Data;
end;

procedure TFormCierresCaja01.VistaPrevia1Click(Sender: TObject);
begin
  VistaPrevia;
end;

procedure TFormCierresCaja01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormCierresCaja01.edtMontoInicialChange(Sender: TObject);
begin
  ActualizarTotales;
end;

procedure TFormCierresCaja01.dtpFechaChange(Sender: TObject);
begin
  CalcularCierre;
  ActualizarTotales;
end;

procedure TFormCierresCaja01.btnVerDetalleClick(Sender: TObject);
begin
  VerDetalle;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
var
  mDL_TB_SISTEMA: TDL_TB_SISTEMA;
  mMontoInicial: Double;
  mWhere: TStringList;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LimpiarCampos;
      CargarIdioma;

      if _IdEstado = 1 then
      begin
        btnImprimir.Enabled := False;
        pnlEstado.Enabled := True;
        pnlEstado1.Caption := '';
        if Global.Instalado = 0 then
        begin
          mWhere := TStringList.Create;
          mDL_TB_SISTEMA := TDL_TB_SISTEMA.Create;
          mMontoInicial :=
            mDL_TB_SISTEMA.Obtener_Valor(mWhere.Text,
              'MontoInicial', _Resultado, _ErrorM);
          mWhere.Free;
          mDL_TB_SISTEMA.Destroy;

          edtMontoInicial.Value := mMontoInicial;
        end;
        CalcularCierre;
        ActualizarTotales;
      end;
      if _IdEstado = 2 then
      begin
        btnPagar.Enabled := False;
        btnImprimir.Enabled := True;
        Consultar_Encabezado(_IdDocumento);
        pnlEstado.Enabled := False;
        pnlEstado1.Caption := 'N�mero: ' + IntToStr(_Numero);
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
   { if Key = VK_F2 then
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
      btnRefrescar.Click;
    end;
    if (Key = (ord('T') Or ord('t'))) and (Shift = [ssCtrl]) then
    begin
      Key := 0;
      lvLista1.SetFocus;
    end;
           }
  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    edtMontoInicial.Value := 0;
    edtEfectivo.Value := 0;
    edtTarjeta.Value := 0;
    edtCheque.Value := 0;
    edtTransferencia.Value := 0;
    pnlTotal.Caption := FormatFloat('#,##0.00', 0);
    pnlEstado1.Caption := '';
    dtpFecha.Date := Date;
    edtDescuentos.Value := 0;
    edtNotasCredito.Value := 0;
    edtKilos.Value := 0;

  end;
end;

procedure ActualizarTotales;
var
  mTotal: Double;
begin
  with Forma01 do
  begin

    mTotal := edtMontoInicial.Value +
      edtEfectivo.Value + edtTarjeta.Value +
      edtCheque.Value + edtTransferencia.Value;

    _Total := mTotal;

    pnlTotal.Caption := FormatFloat('#,##0.00', mTotal);

  end;
end;

procedure Nuevo;
begin
  with Forma01 do
  begin

    InicializarForma;

  end;
end;

procedure Pagar_Data;
var
  mDL_TB_CIERRESCAJAENCABEZADO: Clase_Tipo1;
  mbs_DBGeneral: tbs_DBGeneral;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      CamposValidos_Pagar1;
      if _Resultado = 0 then
        raise Exception.Create('');

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      CamposValidos_Pagar2;
      if _Resultado = 0 then
        raise Exception.Create('');

      // Encabezado
      mDL_TB_CIERRESCAJAENCABEZADO := Clase_Tipo1.Create;
      with mDL_TB_CIERRESCAJAENCABEZADO.Dataset do
      begin
        EmptyDataSet;
        mDL_TB_CIERRESCAJAENCABEZADO.Limpiar_Tag;
        Append;
        FieldByName('FECHADE').Tag := 1;
        FieldByName('FECHADE').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
        FieldByName('FECHAHASTA').Tag := 1;
        FieldByName('FECHAHASTA').AsString :=
          FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
        FieldByName('HORADE').Tag := 1;
        FieldByName('HORADE').AsString :=
          FormatDateTime('HH:mm:ss', Time);
        FieldByName('HORAHASTA').Tag := 1;
        FieldByName('HORAHASTA').AsString :=
          FormatDateTime('HH:mm:ss', Time);
        FieldByName('MONTOINICIAL').Tag := 1;
        FieldByName('MONTOINICIAL').AsFloat :=
          edtMontoInicial.Value;
        FieldByName('MONTOFINAL').Tag := 1;
        FieldByName('MONTOFINAL').AsFloat :=
          _Total;
        FieldByName('TOTALMONTOEFECTIVO').Tag := 1;
        FieldByName('TOTALMONTOEFECTIVO').AsFloat :=
          edtEfectivo.Value;
        FieldByName('TOTALMONTOTARJETA').Tag := 1;
        FieldByName('TOTALMONTOTARJETA').AsFloat :=
          edtTarjeta.Value;
        FieldByName('TOTALMONTOTRANSFERENCIA').Tag := 1;
        FieldByName('TOTALMONTOTRANSFERENCIA').AsFloat :=
          edtTransferencia.Value;
        FieldByName('TOTALMONTOCHEQUE').Tag := 1;
        FieldByName('TOTALMONTOCHEQUE').AsFloat :=
          edtCheque.Value;
        FieldByName('TOTALNOTASCREDITO').Tag := 1;
        FieldByName('TOTALNOTASCREDITO').AsFloat :=
          edtNotasCredito.Value;
        FieldByName('TOTALDESCUENTOS').Tag := 1;
        FieldByName('TOTALDESCUENTOS').AsFloat :=
          edtDescuentos.Value;
        FieldByName('TOTALKILOS').Tag := 1;
        FieldByName('TOTALKILOS').AsFloat :=
          edtKilos.Value;
        Post;
      end;
      mDL_TB_CIERRESCAJAENCABEZADO.Insertar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_CIERRESCAJAENCABEZADO.Destroy;

      mbs_DBGeneral := tbs_DBGeneral.Create;
      _Numero :=
        mbs_DBGeneral.Obtener_Ultimo('TB_CIERRESCAJAENCABEZADO', _Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');
      mbs_DBGeneral.Destroy;

      _MainConexion.Aceptar_Transaccion(_Resultado, _ErrorM);

      if Application.MessageBox('Desea Imprimir el documento?',
        'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDYES then
        Imprimir_Data;

      _Resultado := 1;

      _IdEstado := 1;
      _IdFormaPago := 0;
      _IdDocumento := 0;
      _Numero := 0;

      Nuevo;
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

procedure Imprimir_Data;
var
  DL_TB_PLANTILLAS: TDL_TB_PLANTILLAS;
  mDL_TB_CIERRESCAJAENCABEZADO: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mArchivo: TStringList;
  mNombreArchivo: string;
  mDL_TB_EMPRESAS: TDL_TB_EMPRESAS;
  mBS_Cierrecajaencabezado: TFDMemTable;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mBS_Cierrecajaencabezado := TFDMemTable.Create(nil);
      with mBS_Cierrecajaencabezado do
      begin
        FieldDefs.Clear;
        FieldDefs.Add('Codigo', ftInteger, 0);
        FieldDefs.Add('FechaDe', ftDateTime, 0);
        FieldDefs.Add('FechaHasta', ftDateTime, 0);
        FieldDefs.Add('HoraDe', ftString, 20);
        FieldDefs.Add('HoraHasta', ftString, 20);
        FieldDefs.Add('TotalMontoEfectivo', ftFloat, 0);
        FieldDefs.Add('TotalMontoTarjeta', ftFloat, 0);
        FieldDefs.Add('TotalMontoCheque', ftFloat, 0);
        FieldDefs.Add('TotalMontoTransferencia', ftFloat, 0);
        FieldDefs.Add('TotalMontoFinal', ftFloat, 0);
        FieldDefs.Add('TOTALNOTASCREDITO', ftFloat, 0);
        FieldDefs.Add('TOTALDESCUENTOS', ftFloat, 0);
        FieldDefs.Add('TOTALKILOS', ftFloat, 0);
        FieldDefs.Add('MontoInicial', ftFloat, 0);
        CreateDataSet;
        Open;
      end;

      mDL_TB_EMPRESAS := TDL_TB_EMPRESAS.Create;
      mDL_TB_EMPRESAS.Consultar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(_Numero));
      mDL_TB_CIERRESCAJAENCABEZADO := Clase_Tipo1.Create;
      mDL_TB_CIERRESCAJAENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_CIERRESCAJAENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          mBS_Cierrecajaencabezado.Append;
          mBS_Cierrecajaencabezado.FieldByName('Codigo').AsInteger :=
            FieldByName('ID').AsInteger;
          mBS_Cierrecajaencabezado.FieldByName('FechaDe').AsString :=
            FormatDateTime('dd/MM/yyyy', FieldByName('FECHADE').AsDateTime);
          mBS_Cierrecajaencabezado.FieldByName('HoraDe').AsString :=
            FieldByName('HORADE').AsString;
          mBS_Cierrecajaencabezado.FieldByName('TotalMontoEfectivo').AsFloat :=
            FieldByName('TOTALMONTOEFECTIVO').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('TotalMontoTarjeta').AsFloat :=
            FieldByName('TOTALMONTOTARJETA').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('TotalMontoCheque').AsFloat :=
            FieldByName('TOTALMONTOCHEQUE').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('TotalMontoTransferencia').AsFloat :=
            FieldByName('TOTALMONTOTRANSFERENCIA').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('TotalMontoFinal').AsFloat :=
            FieldByName('MONTOFINAL').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('TOTALNOTASCREDITO').AsFloat :=
            FieldByName('TOTALNOTASCREDITO').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('TOTALDESCUENTOS').AsFloat :=
            FieldByName('TOTALDESCUENTOS').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('TOTALKILOS').AsFloat :=
            FieldByName('TOTALKILOS').AsFloat;
          mBS_Cierrecajaencabezado.FieldByName('MontoInicial').AsFloat :=
            FieldByName('MontoInicial').AsFloat;
          mBS_Cierrecajaencabezado.Post;

          Next;
        end;
      end;
      mDL_TB_CIERRESCAJAENCABEZADO.Destroy;

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      mWhere.Add('Id=' + IntToStr(13));
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

      dmReports.frxDBDataset1.DataSet := mBS_Cierrecajaencabezado;
      dmReports.frxDBDataset2.DataSet := mDL_TB_EMPRESAS.Dataset;
      dmReports.frxDBDataset1.Enabled := True;
      dmReports.frxDBDataset2.Enabled := True;

      dmReports.frxReport1.LoadFromFile(mNombreArchivo);
      dmReports.frxReport1.PrepareReport();
      dmReports.frxReport1.PrintOptions.Printer :=
        Global.ImpresoraRecibos;
  //    dmReports.frxReport1.ShowReport();
      dmReports.frxReport1.PrintOptions.ShowDialog := False;
      dmReports.frxReport1.Print;
      dmReports.frxDBDataset1.Enabled := False;
      dmReports.frxDBDataset2.Enabled := False;

      mDL_TB_EMPRESAS.Destroy;

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

procedure VistaPrevia;
var
  DL_TB_PLANTILLAS: TDL_TB_PLANTILLAS;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
  mArchivo: TStringList;
  mNombreArchivo: string;
  mDL_TB_EMPRESAS: TDL_TB_EMPRESAS;
  mBS_Cierrecajaencabezado: TFDMemTable;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mBS_Cierrecajaencabezado := TFDMemTable.Create(nil);
      with mBS_Cierrecajaencabezado do
      begin
        FieldDefs.Clear;
        FieldDefs.Add('Codigo', ftInteger, 0);
        FieldDefs.Add('FechaDe', ftDateTime, 0);
        FieldDefs.Add('FechaHasta', ftDateTime, 0);
        FieldDefs.Add('HoraDe', ftString, 20);
        FieldDefs.Add('HoraHasta', ftString, 20);
        FieldDefs.Add('TotalMontoEfectivo', ftFloat, 0);
        FieldDefs.Add('TotalMontoTarjeta', ftFloat, 0);
        FieldDefs.Add('TotalMontoCheque', ftFloat, 0);
        FieldDefs.Add('TotalMontoTransferencia', ftFloat, 0);
        FieldDefs.Add('TotalMontoFinal', ftFloat, 0);
        CreateDataSet;
        Open;
      end;

      mDL_TB_EMPRESAS := TDL_TB_EMPRESAS.Create;
      mDL_TB_EMPRESAS.Consultar(_Resultado, _ErrorM);
      if _Resultado = -1 then
        raise Exception.Create('');

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);
                            {
      mBS_facturasclientesencabezado.Append;
      mBS_facturasclientesencabezado.FieldByName('Factura_Numero').AsInteger :=
        _Numero;
      mBS_facturasclientesencabezado.FieldByName('Fecha').AsString :=
        FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
      mBS_facturasclientesencabezado.FieldByName('Hora').AsString :=
        FormatDateTime('HH:mm:ss', Time);
      if Trim(cbCliente.Text) <> '[SIN SELECCIONAR]' then
        mNombrecliente := Trim(cbCliente.Text)
      else
        mNombrecliente := '';
      mBS_facturasclientesencabezado.FieldByName('NombreCliente').AsString :=
        mNombrecliente;
      mBS_facturasclientesencabezado.FieldByName('SubTotal').AsFloat :=
        _SubTotal;
      mBS_facturasclientesencabezado.FieldByName('DescuentoMonto').AsFloat :=
        _DescuentoM;
      mBS_facturasclientesencabezado.FieldByName('IVAMonto').AsFloat :=
        _IVAM;
      mBS_facturasclientesencabezado.FieldByName('Total').AsFloat :=
        _Total;
     // mBS_facturasclientesencabezado.FieldByName('FechaVencimiento').AsString :=
     //   FormatDateTime('dd/MM/yyyy', FieldByName('FECHAVENCIMIENTO').AsDateTime);
      if Trim(cbVendedor.Text) <> '[SIN SELECCIONAR]' then
        mNombreVendedor := Trim(cbVendedor.Text)
      else
        mNombreVendedor := '';
      mBS_facturasclientesencabezado.FieldByName('NombreVendedor').AsString :=
        mNombreVendedor;
      mBS_facturasclientesencabezado.FieldByName('ServicioMonto').AsFloat :=
        _ISM;
      mBS_facturasclientesencabezado.Post;
                                  }

      mArchivo := TStringList.Create;

      mWhere := TStringList.Create;
      if _IdFormaPago = 1 then
        mWhere.Add('Id=' + IntToStr(1));
      if _IdFormaPago = 5 then
        mWhere.Add('Id=' + IntToStr(2));
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

      dmReports.frxDBDataset1.DataSet := mBS_Cierrecajaencabezado;
      dmReports.frxDBDataset2.DataSet := mDL_TB_EMPRESAS.Dataset;
      dmReports.frxDBDataset1.Enabled := True;
      dmReports.frxDBDataset2.Enabled := True;

      dmReports.frxReport1.LoadFromFile(mNombreArchivo);
      dmReports.frxReport1.PrepareReport();
      dmReports.frxReport1.ShowReport();
//      dmReports.frxReport1.PrintOptions.ShowDialog := False;
 //     dmReports.frxReport1.Print;
      dmReports.frxDBDataset1.Enabled := False;
      dmReports.frxDBDataset2.Enabled := False;

      mDL_TB_EMPRESAS.Destroy;

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

procedure Cerrar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure Consultar_Encabezado(pId: Integer);
var
  mDL_TB_FACTURASCLIENTESENCABEZADO: Clase_Tipo1;
  mWhere: TStringList;
  mResultado: Integer;
  mErrorM: string;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      _MainConexion.Iniciar_Transaccion(_Resultado, _ErrorM);

      mDL_TB_FACTURASCLIENTESENCABEZADO := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Add('A.Id=' + IntToStr(pId));
      mDL_TB_FACTURASCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      if _Resultado = -1 then
        raise Exception.Create('');
      mWhere.Free;
      DBToFormaEncabezado(mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset);
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

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

procedure DBToFormaEncabezado(ds1: TDatasetMem);
begin
  with Forma01 do
  begin

    with ds1 do
    begin
      dtpFecha.Date :=
        FieldByName('FECHADE').AsDateTime;
      pnlTotal.Caption :=
        FormatFloat('#,##0.00',
        FieldByName('MONTOFINAL').AsFloat);
      edtMontoInicial.Value :=
        FieldByName('MONTOINICIAL').AsFloat;
      edtEfectivo.Value :=
        FieldByName('TOTALMONTOEFECTIVO').AsFloat;
      edtTarjeta.Value :=
        FieldByName('TOTALMONTOTARJETA').AsFloat;
      edtCheque.Value :=
        FieldByName('TOTALMONTOCHEQUE').AsFloat;
      edtTransferencia.Value :=
        FieldByName('TOTALMONTOTRANSFERENCIA').AsFloat;
      edtNotasCredito.Value :=
        FieldByName('TOTALNOTASCREDITO').AsFloat;
      edtDescuentos.Value :=
        FieldByName('TOTALDESCUENTOS').AsFloat;
      edtKilos.Value :=
        FieldByName('TOTALKILOS').AsFloat;
    end;

  end;
end;

procedure CamposValidos_Pagar1;
var
  mValido: Boolean;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;
     {
    if (mValido = True) and (_DL_TB_FACTURASDETALLEActual.Dataset.RecordCount = 0) then
    begin
      mValido := False;
      _ErrorM := 'Debe tener detalles';
    end;
            }
    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure CamposValidos_Pagar2;
var
  mValido: Boolean;
  mWhere: TStringList;
  mAPLICARLIMITECREDITO: Integer;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    if mValido = False then
      _Resultado := 0;

  end;
end;

procedure CalcularCierre;
var
  mWhere: TStringList;
  mEfectivo_FacturasClientes: Double;
  mTarjeta_FacturasClientes: Double;
  mCheque_FacturasClientes: Double;
  mTransferencia_FacturasClientes: Double;
  mEfectivo_RecibosClientes: Double;
  mTarjeta_RecibosClientes: Double;
  mCheque_RecibosClientes: Double;
  mTransferencia_RecibosClientes: Double;
  mEfectivo_RecibosApartados: Double;
  mTarjeta_RecibosApartados: Double;
  mCheque_RecibosApartados: Double;
  mTransferencia_RecibosApartados: Double;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_FACTURASCLIENTESENCABEZADO;
  mDL_TB_RECIBOSCLIENTESENCABEZADO: TDL_TB_RECIBOSCLIENTESENCABEZADO;
  mDL_TB_RECIBOSAPARTADOSENCABEZADO: TDL_TB_RECIBOSAPARTADOSENCABEZADO;
  mEfectivo, mTarjeta, mCheques, mTransferencia: Double;
  mDL_TB_NOTASCREDITOENCABEZADO: TDL_TB_NOTASCREDITOENCABEZADO;
  mEfectivo_NotasCredito, mTarjeta_NotasCredito, mCheque_NotasCredito, mTransferencia_NotasCredito: Double;
  mTotalDescuento, mTotalKilos: Double;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      // Facturas Clientes
      mWhere := TStringList.Create;
  //    mWhere.Add('CODIGOESTADO=2');
  //    mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_TotalesPago(mWhere.Text,
        mEfectivo_FacturasClientes, mTarjeta_FacturasClientes,
        mCheque_FacturasClientes, mTransferencia_FacturasClientes,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      // Descuentos
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
  //    mWhere.Add(' And ');
//      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mTotalDescuento :=
        mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_TotalDescuentos(mWhere.Text,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      // Kilos
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
  //    mWhere.Add(' And ');
//      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mTotalKilos :=
        mDL_TB_FACTURASCLIENTESENCABEZADO.Obtener_TotalKilos(mWhere.Text,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      // Recibos Clientes
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
      mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_RECIBOSCLIENTESENCABEZADO := TDL_TB_RECIBOSCLIENTESENCABEZADO.Create;
      mDL_TB_RECIBOSCLIENTESENCABEZADO.Obtener_TotalesPago(mWhere.Text,
        mEfectivo_RecibosClientes, mTarjeta_RecibosClientes,
        mCheque_RecibosClientes, mTransferencia_RecibosClientes,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_RECIBOSCLIENTESENCABEZADO.Destroy;

      // Recibos Apartados
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
      mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_RECIBOSAPARTADOSENCABEZADO := TDL_TB_RECIBOSAPARTADOSENCABEZADO.Create;
      mDL_TB_RECIBOSAPARTADOSENCABEZADO.Obtener_TotalesPago(mWhere.Text,
        mEfectivo_RecibosApartados, mTarjeta_RecibosApartados,
        mCheque_RecibosApartados, mTransferencia_RecibosApartados,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_RECIBOSAPARTADOSENCABEZADO.Destroy;

      // Notas Credito
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
      mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_NOTASCREDITOENCABEZADO := TDL_TB_NOTASCREDITOENCABEZADO.Create;
      mDL_TB_NOTASCREDITOENCABEZADO.Obtener_TotalesPago(mWhere.Text,
        mEfectivo_NotasCredito, mTarjeta_NotasCredito,
        mCheque_NotasCredito, mTransferencia_NotasCredito,
        _Resultado, _ErrorM);
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_NOTASCREDITOENCABEZADO.Destroy;

      mEfectivo := (mEfectivo_FacturasClientes + mEfectivo_RecibosClientes +
        mEfectivo_RecibosApartados) - mEfectivo_NotasCredito;
      mTarjeta := (mTarjeta_FacturasClientes + mTarjeta_RecibosClientes +
        mTarjeta_RecibosApartados) - mTarjeta_NotasCredito;
      mCheques := (mCheque_FacturasClientes + mCheque_RecibosClientes +
        mCheque_RecibosApartados) - mCheque_NotasCredito;
      mTransferencia := (mTransferencia_FacturasClientes + mTransferencia_RecibosClientes +
        mTransferencia_RecibosApartados) - mTransferencia_NotasCredito;

      edtEfectivo.Value := mEfectivo;
      edtTarjeta.Value := mTarjeta;
      edtCheque.Value := mCheques;
      edtTransferencia.Value := mTransferencia;
      edtNotasCredito.Value := mEfectivo_NotasCredito;
      edtDescuentos.Value := mTotalDescuento;
      edtKilos.Value := mTotalKilos;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure VerDetalle;
var
  mWhere: TStringList;
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_FACTURASCLIENTESENCABEZADO;
  mDL_TB_RECIBOSCLIENTESENCABEZADO: TDL_TB_RECIBOSCLIENTESENCABEZADO;
  mDL_TB_RECIBOSAPARTADOSENCABEZADO: TDL_TB_RECIBOSAPARTADOSENCABEZADO;
  mEfectivo, mTarjeta, mCheques, mTransferencia, mTotal: Double;
  mDL_TB_NOTASCREDITOENCABEZADO: TDL_TB_NOTASCREDITOENCABEZADO;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      mEfectivo := edtEfectivo.Value;
      mTarjeta := edtTarjeta.Value;
      mCheques := edtCheque.Value;
      mTransferencia := edtTransferencia.Value;
      mTotal := _Total;

      FDMemTable1.Open;
      FDMemTable1.EmptyDataSet;

      // Facturas Clientes
      mWhere := TStringList.Create;
  //    mWhere.Add('CODIGOESTADO=2');
  //    mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          FDMemTable1.FieldByName('TipoDoc').AsInteger := 1;
          FDMemTable1.FieldByName('Fecha').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('Fecha').AsDateTime);
          FDMemTable1.FieldByName('Hora').AsString :=
            FieldByName('Hora').AsString;
          FDMemTable1.FieldByName('Total').AsFloat :=
            FieldByName('Total').AsFloat;
          FDMemTable1.FieldByName('Efectivo').AsFloat :=
            FieldByName('Efectivo').AsFloat;
          FDMemTable1.FieldByName('Transferencia').AsFloat :=
            FieldByName('Transferencia').AsFloat;
          FDMemTable1.FieldByName('Cheque').AsFloat :=
            FieldByName('Cheque').AsFloat;
          FDMemTable1.FieldByName('Tarjeta').AsFloat :=
            FieldByName('Tarjeta').AsFloat;
          FDMemTable1.FieldByName('TotalEfectivo').AsFloat :=
            mEfectivo;
          FDMemTable1.FieldByName('TotalTarjeta').AsFloat :=
            mTarjeta;
          FDMemTable1.FieldByName('TotalCheques').AsFloat :=
            mCheques;
          FDMemTable1.FieldByName('TotalTransferencia').AsFloat :=
            mTransferencia;
          FDMemTable1.FieldByName('TotalCierre').AsFloat :=
            mTotal;
          FDMemTable1.FieldByName('FechaCierre').AsString :=
            FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
          FDMemTable1.FieldByName('TipoNombre').AsString := 'Factura';
          FDMemTable1.FieldByName('Numero').AsInteger :=
            FieldByName('Numero').AsInteger;
          FDMemTable1.FieldByName('MontoInicial').AsFloat :=
            edtMontoInicial.Value;
          FDMemTable1.FieldByName('TotalotasCredito').AsFloat :=
            edtNotasCredito.Value;
          FDMemTable1.FieldByName('TotalDescuentos').AsFloat :=
            edtDescuentos.Value;
          FDMemTable1.FieldByName('TotalKilos').AsFloat :=
            edtKilos.Value;
          FDMemTable1.Post;
          Next;
        end;
      end;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

      // Recibos Clientes
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
      mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_RECIBOSCLIENTESENCABEZADO := TDL_TB_RECIBOSCLIENTESENCABEZADO.Create;
      mDL_TB_RECIBOSCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_RECIBOSCLIENTESENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          FDMemTable1.FieldByName('TipoDoc').AsInteger := 1;
          FDMemTable1.FieldByName('Fecha').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('Fecha').AsDateTime);
          FDMemTable1.FieldByName('Hora').AsString :=
            FieldByName('Hora').AsString;
          FDMemTable1.FieldByName('Total').AsFloat :=
            FieldByName('TOTALFINAL').AsFloat;
          FDMemTable1.FieldByName('Efectivo').AsFloat :=
            FieldByName('Efectivo').AsFloat;
          FDMemTable1.FieldByName('Transferencia').AsFloat :=
            FieldByName('Transferencia').AsFloat;
          FDMemTable1.FieldByName('Cheque').AsFloat :=
            FieldByName('Cheque').AsFloat;
          FDMemTable1.FieldByName('Tarjeta').AsFloat :=
            FieldByName('Tarjeta').AsFloat;
          FDMemTable1.FieldByName('TotalEfectivo').AsFloat :=
            mEfectivo;
          FDMemTable1.FieldByName('TotalTarjeta').AsFloat :=
            mTarjeta;
          FDMemTable1.FieldByName('TotalCheques').AsFloat :=
            mCheques;
          FDMemTable1.FieldByName('TotalTransferencia').AsFloat :=
            mTransferencia;
          FDMemTable1.FieldByName('TotalCierre').AsFloat :=
            mTotal;
          FDMemTable1.FieldByName('FechaCierre').AsString :=
            FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
          FDMemTable1.FieldByName('TipoNombre').AsString := 'Recibos Facturas';
          FDMemTable1.FieldByName('Numero').AsInteger :=
            FieldByName('Numero').AsInteger;
          FDMemTable1.Post;
          Next;
        end;
      end;
      mDL_TB_RECIBOSCLIENTESENCABEZADO.Destroy;

      // Recibos Apartados
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
      mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_RECIBOSAPARTADOSENCABEZADO := TDL_TB_RECIBOSAPARTADOSENCABEZADO.Create;
      mDL_TB_RECIBOSAPARTADOSENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_RECIBOSAPARTADOSENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          FDMemTable1.FieldByName('TipoDoc').AsInteger := 1;
          FDMemTable1.FieldByName('Fecha').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('Fecha').AsDateTime);
          FDMemTable1.FieldByName('Hora').AsString :=
            FieldByName('Hora').AsString;
          FDMemTable1.FieldByName('Total').AsFloat :=
            FieldByName('TOTALFINAL').AsFloat;
          FDMemTable1.FieldByName('Efectivo').AsFloat :=
            FieldByName('Efectivo').AsFloat;
          FDMemTable1.FieldByName('Transferencia').AsFloat :=
            FieldByName('Transferencia').AsFloat;
          FDMemTable1.FieldByName('Cheque').AsFloat :=
            FieldByName('Cheque').AsFloat;
          FDMemTable1.FieldByName('Tarjeta').AsFloat :=
            FieldByName('Tarjeta').AsFloat;
          FDMemTable1.FieldByName('TotalEfectivo').AsFloat :=
            mEfectivo;
          FDMemTable1.FieldByName('TotalTarjeta').AsFloat :=
            mTarjeta;
          FDMemTable1.FieldByName('TotalCheques').AsFloat :=
            mCheques;
          FDMemTable1.FieldByName('TotalTransferencia').AsFloat :=
            mTransferencia;
          FDMemTable1.FieldByName('TotalCierre').AsFloat :=
            mTotal;
          FDMemTable1.FieldByName('FechaCierre').AsString :=
            FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
          FDMemTable1.FieldByName('TipoNombre').AsString := 'Recibos Apartados';
          FDMemTable1.FieldByName('Numero').AsInteger :=
            FieldByName('Numero').AsInteger;
          FDMemTable1.Post;
          Next;
        end;
      end;
      mDL_TB_RECIBOSAPARTADOSENCABEZADO.Destroy;

      // Notas Credito
      mWhere := TStringList.Create;
      mWhere.Add('CODIGOESTADO=2');
      mWhere.Add(' And ');
      mWhere.Add('CODIGOFORMAPAGO=1');
      mWhere.Add(' And ');
      mWhere.Add('(Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)));
      mWhere.Add(' And ');
      mWhere.Add('Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFecha.Date)) + ')');
      mDL_TB_NOTASCREDITOENCABEZADO := TDL_TB_NOTASCREDITOENCABEZADO.Create;
      mDL_TB_NOTASCREDITOENCABEZADO.Consultar(_Resultado, _ErrorM, mWhere.Text, '');
      mWhere.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_NOTASCREDITOENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('Id').AsInteger :=
            FieldByName('Id').AsInteger;
          FDMemTable1.FieldByName('TipoDoc').AsInteger := 1;
          FDMemTable1.FieldByName('Fecha').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('Fecha').AsDateTime);
          FDMemTable1.FieldByName('Hora').AsString :=
            FieldByName('Hora').AsString;
          FDMemTable1.FieldByName('Total').AsFloat :=
            FieldByName('Total').AsFloat;
          FDMemTable1.FieldByName('Efectivo').AsFloat :=
            FieldByName('Efectivo').AsFloat;
          FDMemTable1.FieldByName('Transferencia').AsFloat :=
            FieldByName('Transferencia').AsFloat;
          FDMemTable1.FieldByName('Cheque').AsFloat :=
            FieldByName('Cheque').AsFloat;
          FDMemTable1.FieldByName('Tarjeta').AsFloat :=
            FieldByName('Tarjeta').AsFloat;
          FDMemTable1.FieldByName('TotalEfectivo').AsFloat :=
            mEfectivo;
          FDMemTable1.FieldByName('TotalTarjeta').AsFloat :=
            mTarjeta;
          FDMemTable1.FieldByName('TotalCheques').AsFloat :=
            mCheques;
          FDMemTable1.FieldByName('TotalTransferencia').AsFloat :=
            mTransferencia;
          FDMemTable1.FieldByName('TotalCierre').AsFloat :=
            mTotal;
          FDMemTable1.FieldByName('FechaCierre').AsString :=
            FormatDateTime('dd/MM/yyyy', dtpFecha.Date);
          FDMemTable1.FieldByName('TipoNombre').AsString := 'Nota de Cr�dito';
          FDMemTable1.FieldByName('Numero').AsInteger :=
            FieldByName('Numero').AsInteger;
          FDMemTable1.Post;
          Next;
        end;
      end;
      mDL_TB_NOTASCREDITOENCABEZADO.Destroy;

      frxDBDataset1.Enabled := True;
      frxReport1.ShowReport();
      frxDBDataset1.Enabled := False;

      _Resultado := 1;
    except
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
    end;

  end;
end;
{$ENDREGION}

end.
