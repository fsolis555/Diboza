unit RptMovimientosInventario01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RzPanel, frxClass, frxDBSet, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxExportCSV, frxExportImage, frxExportRTF, frxExportHTML, frxExportPDF,
  Vcl.ComCtrls;

type
  TReptMovimientosInventario01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlCampos: TRzPanel;
    GroupBox4: TGroupBox;
    cbProducto: TComboBoxEx;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
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
  ReptMovimientosInventario01: TReptMovimientosInventario01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure Construir_Reporte;
  procedure LlenarcbProductos(cb: TComboBoxEx);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_PRODUCTOS, BS_DBConexion, DL_DBGeneral,
  uDL_TB_INVENTARIOM, udmLenguajes, FrmVerReporte01;

{$R *.dfm}

var
  Forma01: TReptMovimientosInventario01;

{$REGION 'Funciones Forma'}
procedure TReptMovimientosInventario01.FormShow(Sender: TObject);
begin
  Forma01 := ReptMovimientosInventario01;

  InicializarForma;
end;

procedure TReptMovimientosInventario01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TReptMovimientosInventario01.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TReptMovimientosInventario01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TReptMovimientosInventario01.btnCancelarClick(Sender: TObject);
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

      LlenarcbProductos(cbProducto);
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
    cbProducto.ItemIndex := 0;

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
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
  mDL_TB_INVENTARIOM: TDL_TB_INVENTARIOM;
  mWhere, mOrderBy: TStringList;
begin
  with Forma01 do
  begin

    try
      _Resultado := 1;

      if GetCombo(cbProducto) <= 0 then
      begin
        Application.MessageBox('Debe seleccionar un producto',
          'Advertencia', MB_ICONWARNING);
        _Resultado := 0;
        raise Exception.Create('');
      end;
      FDMemTable1.Open;
      FDMemTable1.EmptyDataSet;

      mOrderBy := TStringList.Create;
      mWhere := TStringList.Create;
      if GetCombo(cbProducto) > 0 then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.IDPRODUCTO = ' + IntToStr(GetCombo(cbProducto)) + ')');
      end;

      mDL_TB_INVENTARIOM := TDL_TB_INVENTARIOM.Create;
      mDL_TB_INVENTARIOM.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_INVENTARIOM.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('IDPRODUCTO').AsInteger :=
            FieldByName('IDPRODUCTO').AsInteger;
          FDMemTable1.FieldByName('FECHA').AsString :=
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHA').AsDateTime);
          FDMemTable1.FieldByName('CANTIDAD').AsFloat :=
            FieldByName('CANTIDAD').AsFloat;
          FDMemTable1.FieldByName('TIPO').AsInteger :=
            FieldByName('TIPO').AsInteger;
          if FieldByName('TIPO').AsInteger = 1 then
            FDMemTable1.FieldByName('MOTIVO').AsString := 'Sobrante';
          if FieldByName('TIPO').AsInteger = 2 then
            FDMemTable1.FieldByName('MOTIVO').AsString := 'Faltante';
          FDMemTable1.FieldByName('ProductoNOMBRE').AsString :=
            FieldByName('ProductoNOMBRE').AsString;
          FDMemTable1.FieldByName('ProductoCODIGO').AsString :=
            FieldByName('ProductoCODIGO').AsString;
          FDMemTable1.FieldByName('ProductoEXISTENCIA').AsFloat :=
            FieldByName('ProductoEXISTENCIA').AsFloat;
          FDMemTable1.Post;

          Next;
        end;
      end;
      mDL_TB_INVENTARIOM.Destroy;

      _Resultado := 1;
    except
      _Resultado := -1;
    end;

  end;
end;

procedure LlenarcbProductos(cb: TComboBoxEx);
var
  mDL_TB_PRODUCTOS: TDL_TB_PRODUCTOS;
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
      mOrderBy.Add('A.NOMBRE');
      mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
      mDL_TB_PRODUCTOS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_PRODUCTOS.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(FieldByName('NOMBRE').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_PRODUCTOS.Destroy;

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
    end;

  end;
end;
{$ENDREGION}

end.
