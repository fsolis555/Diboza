unit RptFacturasProveedores01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxDBSet, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  RzPanel;

type
  TReptFacturasProveedores01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlCampos: TRzPanel;
    GroupBox1: TGroupBox;
    cbOrden: TComboBoxEx;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpFechaDesde: TDateTimePicker;
    dtpFechaHasta: TDateTimePicker;
    chkFecha: TCheckBox;
    GroupBox4: TGroupBox;
    cbProveedor: TComboBoxEx;
    GroupBox3: TGroupBox;
    rbPagoTodos: TRadioButton;
    rbPagoContado: TRadioButton;
    rbPagoCredito: TRadioButton;
    GroupBox5: TGroupBox;
    rbEstadoTodos: TRadioButton;
    rbEstadoPagado: TRadioButton;
    rbEstadoAnulado: TRadioButton;
    rbEstadoPendiente: TRadioButton;
    FDMemTable1: TFDMemTable;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReptFacturasProveedores01: TReptFacturasProveedores01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure Construir_Reporte;
  procedure LlenarcbOrden(cb: TComboBoxEx);
  procedure LlenarcbProveedores(cb: TComboBoxEx);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_ENTRADASENCABEZADO, BS_DBConexion, DL_DBGeneral,
  uDL_TB_PROVEEDORES, udmLenguajes, FrmVerReporte01;

{$R *.dfm}

var
  Forma01: TReptFacturasProveedores01;

{$REGION 'Funciones Forma'}
procedure TReptFacturasProveedores01.FormShow(Sender: TObject);
begin
  Forma01 := ReptFacturasProveedores01;

  InicializarForma;
end;

procedure TReptFacturasProveedores01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TReptFacturasProveedores01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TReptFacturasProveedores01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TReptFacturasProveedores01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LlenarcbOrden(cbOrden);

      LlenarcbProveedores(cbProveedor);
      if _Resultado = -1 then
        raise Exception.Create('');

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

    FDMemTable1.Open;
    cbOrden.ItemIndex := 1;
    chkFecha.Checked := True;
    dtpFechaDesde.Date := Date;
    dtpFechaHasta.Date := Date;
    cbProveedor.ItemIndex := 0;
    rbPagoTodos.Checked := True;
    rbEstadoTodos.Checked := True;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    Construir_Reporte;
    if _Resultado = 1 then
    begin
      frxDBDataset1.Enabled := True;
      frxReport1.Preview := FormVerReporte01.frxPreview1;
      frxReport1.ShowReport();
      FormVerReporte01.WindowState := wsMaximized;
      FormVerReporte01.ShowModal;

      frxDBDataset1.Enabled := False;
    end
    else
      Application.MessageBox(PChar('Ha ocurrido un error' + #13+#10 + _ErrorM),
        'Error', MB_ICONERROR);

  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure Construir_Reporte;
var
  mDL_TB_ENTRADASENCABEZADO: TDL_TB_ENTRADASENCABEZADO;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      FDMemTable1.Open;
      FDMemTable1.EmptyDataSet;

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      if cbOrden.ItemIndex = 0 then
        mOrderBy.Add('Fecha');
      if cbOrden.ItemIndex = 1 then
        mOrderBy.Add('Numero');
      if chkFecha.Checked = True then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.Fecha >= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFechaDesde.Date)));
        mWhere.Add(' And ');
        mWhere.Add('A.Fecha <= ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dtpFechaHasta.Date)) + ')');
      end;
      if GetCombo(cbProveedor) > 0 then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.IDProveedor = ' + IntToStr(GetCombo(cbProveedor)) + ')');
      end;
      if rbPagoContado.Checked = True then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.CODIGOFORMAPAGO = 1)');
      end;
      if rbPagoCredito.Checked = True then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.CODIGOFORMAPAGO = 5)');
      end;
      if rbEstadoPagado.Checked = True then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.CODIGOESTADO = 2)');
      end;
      if rbEstadoAnulado.Checked = True then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.CODIGOESTADO = 3)');
      end;
      if rbEstadoPendiente.Checked = True then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.CODIGOESTADO = 4)');
      end;
      mDL_TB_ENTRADASENCABEZADO := TDL_TB_ENTRADASENCABEZADO.Create;
      mDL_TB_ENTRADASENCABEZADO.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_ENTRADASENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('ID').AsInteger :=
            FieldByName('ID').AsInteger;
          FDMemTable1.FieldByName('NUMERO').AsInteger :=
            FieldByName('NUMERO').AsInteger;
          FDMemTable1.FieldByName('FECHA').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHA').AsDateTime);
          FDMemTable1.FieldByName('HORA').AsString :=
            FieldByName('HORA').AsString;
          FDMemTable1.FieldByName('NOMBREPROVEEDOR').AsString :=
            FieldByName('NOMBREPROVEEDOR').AsString;
          FDMemTable1.FieldByName('SUBTOTAL').AsFloat :=
            FieldByName('SUBTOTAL').AsFloat;
          FDMemTable1.FieldByName('DESCUENTOM').AsFloat :=
            FieldByName('DESCUENTOM').AsFloat;
          FDMemTable1.FieldByName('IVAM').AsFloat :=
            FieldByName('IVAM').AsFloat;
          FDMemTable1.FieldByName('ISM').AsFloat :=
            FieldByName('ISM').AsFloat;
          FDMemTable1.FieldByName('TOTAL').AsFloat :=
            FieldByName('TOTAL').AsFloat;
          FDMemTable1.FieldByName('FECHAVENCIMIENTO').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHAVENCIMIENTO').AsDateTime);
          FDMemTable1.FieldByName('SALDO').AsFloat :=
            FieldByName('SALDO').AsFloat;
          FDMemTable1.FieldByName('EstadoNombre').AsString :=
            FieldByName('EstadoNombre').AsString;
          if FieldByName('CODIGOFORMAPAGO').AsInteger = 1 then
            FDMemTable1.FieldByName('FORMAPAGONombre').AsString := 'Contado';
          if FieldByName('CODIGOFORMAPAGO').AsInteger = 5 then
            FDMemTable1.FieldByName('FORMAPAGONombre').AsString := 'Cr�dito';
          FDMemTable1.Post;

          Next;
        end;
      end;
      mDL_TB_ENTRADASENCABEZADO.Destroy;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarcbOrden(cb: TComboBoxEx);
begin
  with Forma01 do
  begin

    cb.Items.Clear;
    cb.Items.AddObject('Fecha', TObject(0));
    cb.Items.AddObject('Numero', TObject(1));

  end;
end;

procedure LlenarcbProveedores(cb: TComboBoxEx);
var
  mDL_TB_PROVEEDORES: TDL_TB_PROVEEDORES;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      cb.Items.Clear;
      cb.Items.AddObject('[TODOS]', TObject(0));

      mWhere := TStringList.Create;
      mOrderBy := TStringList.Create;
      mOrderBy.Add('A.NOMBRECOMPLETO');
      mDL_TB_PROVEEDORES := TDL_TB_PROVEEDORES.Create;
      mDL_TB_PROVEEDORES.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_PROVEEDORES.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(FieldByName('NOMBRECOMPLETO').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_PROVEEDORES.Destroy;

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
      if Forma01.Components[mCount] is TGroupBox then
      begin
        mValor := TGroupBox(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TGroupBox(Forma01.Components[mCount]).Caption := mValor;
      end;
      if Forma01.Components[mCount] is TCheckBox then
      begin
        mValor := TCheckBox(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TCheckBox(Forma01.Components[mCount]).Caption := mValor;
      end;
    end;

  end;
end;
{$ENDREGION}

end.
