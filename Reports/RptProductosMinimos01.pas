unit RptProductosMinimos01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxDBSet, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls,
  RzPanel;

type
  TReptProductosMinimos01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlCampos: TRzPanel;
    GroupBox1: TGroupBox;
    cbOrden: TComboBoxEx;
    GroupBox4: TGroupBox;
    cbProveedor: TComboBoxEx;
    GroupBox5: TGroupBox;
    cbFamilia: TComboBoxEx;
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
  ReptProductosMinimos01: TReptProductosMinimos01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure Construir_Reporte;
  procedure LlenarcbOrden(cb: TComboBoxEx);
  procedure LlenarcbProveedores(cb: TComboBoxEx);
  procedure LlenarcbFamilias(cb: TComboBoxEx);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_PRODUCTOS, BS_DBConexion, DL_DBGeneral,
  uDL_TB_PROVEEDORES, uDL_TB_FAMILIAS, udmLenguajes,
  FrmVerReporte01;

{$R *.dfm}

var
  Forma01: TReptProductosMinimos01;

{$REGION 'Funciones Forma'}
procedure TReptProductosMinimos01.FormShow(Sender: TObject);
begin
  Forma01 := ReptProductosMinimos01;

  InicializarForma;
end;

procedure TReptProductosMinimos01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TReptProductosMinimos01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TReptProductosMinimos01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TReptProductosMinimos01.btnCancelarClick(Sender: TObject);
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

      LlenarcbFamilias(cbFamilia);
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
    cbOrden.ItemIndex := 0;
    cbProveedor.ItemIndex := 0;
    cbFamilia.ItemIndex := 0;

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
        mOrderBy.Add('Codigo');
      if cbOrden.ItemIndex = 1 then
        mOrderBy.Add('Nombre');
      if GetCombo(cbProveedor) > 0 then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.IDProveedor = ' + IntToStr(GetCombo(cbProveedor)) + ')');
      end;
      if GetCombo(cbFamilia) > 0 then
      begin
        if mWhere.Text <> '' then
          mWhere.Add(' And ');
        mWhere.Add('(A.CODIGOFAMILIA = ' + IntToStr(GetCombo(cbFamilia)) + ')');
      end;

      mDL_TB_PRODUCTOS := TDL_TB_PRODUCTOS.Create;
      mDL_TB_PRODUCTOS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_PRODUCTOS.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('ID').AsInteger :=
            FieldByName('ID').AsInteger;
          FDMemTable1.FieldByName('CODIGO').AsString :=
            FieldByName('CODIGO').AsString;
          FDMemTable1.FieldByName('NOMBRE').AsString :=
            FieldByName('NOMBRE').AsString;
          FDMemTable1.FieldByName('MINIMOLUNES').AsFloat :=
            FieldByName('MINIMOLUNES').AsFloat;
          FDMemTable1.FieldByName('MINIMOMARTES').AsFloat :=
            FieldByName('MINIMOMARTES').AsFloat;
          FDMemTable1.FieldByName('MINIMOMIERCOLES').AsFloat :=
            FieldByName('MINIMOMIERCOLES').AsFloat;
          FDMemTable1.FieldByName('MINIMOJUEVES').AsFloat :=
            FieldByName('MINIMOJUEVES').AsFloat;
          FDMemTable1.FieldByName('MINIMOVIERNES').AsFloat :=
            FieldByName('MINIMOVIERNES').AsFloat;
          FDMemTable1.FieldByName('MINIMOSABADO').AsFloat :=
            FieldByName('MINIMOSABADO').AsFloat;
          FDMemTable1.FieldByName('MINIMODOMINGO').AsFloat :=
            FieldByName('MINIMODOMINGO').AsFloat;
          FDMemTable1.FieldByName('EXISTENCIA').AsFloat :=
            FieldByName('EXISTENCIA').AsFloat;
          FDMemTable1.Post;

          Next;
        end;
      end;
      mDL_TB_PRODUCTOS.Destroy;

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
    cb.Items.AddObject('C�digo', TObject(0));
    cb.Items.AddObject('Nombre', TObject(1));

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

procedure LlenarcbFamilias(cb: TComboBoxEx);
var
  mDL_TB_FAMILIAS: TDL_TB_FAMILIAS;
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
      mOrderBy.Add('A.NOMBRE');
      mDL_TB_FAMILIAS := TDL_TB_FAMILIAS.Create;
      mDL_TB_FAMILIAS.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_FAMILIAS.Dataset do
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
      mDL_TB_FAMILIAS.Destroy;

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
