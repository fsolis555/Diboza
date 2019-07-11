unit RptListadoClientes01;

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
  TReptListadoClientes01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlCampos: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    GroupBox1: TGroupBox;
    cbOrden: TComboBoxEx;
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
  ReptListadoClientes01: TReptListadoClientes01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure Construir_Reporte;
  procedure LlenarcbOrden(cb: TComboBoxEx);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_CLIENTES, BS_DBConexion, DL_DBGeneral,
  udmLenguajes, FrmVerReporte01;

{$R *.dfm}

var
  Forma01: TReptListadoClientes01;

{$REGION 'Funciones Forma'}
procedure TReptListadoClientes01.FormShow(Sender: TObject);
begin
  Forma01 := ReptListadoClientes01;

  InicializarForma;
end;

procedure TReptListadoClientes01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TReptListadoClientes01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TReptListadoClientes01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TReptListadoClientes01.btnCancelarClick(Sender: TObject);
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
  mDL_TB_CLIENTES: TDL_TB_CLIENTES;
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
        mOrderBy.Add('NOMBRECOMPLETO');
      mDL_TB_CLIENTES := TDL_TB_CLIENTES.Create;
      mDL_TB_CLIENTES.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');
      with mDL_TB_CLIENTES.Dataset do
      begin
        First;
        while not Eof do
        begin
          FDMemTable1.Append;
          FDMemTable1.FieldByName('ID').AsInteger :=
            FieldByName('ID').AsInteger;
          FDMemTable1.FieldByName('CODIGO').AsString :=
            FieldByName('CODIGO').AsString;
          FDMemTable1.FieldByName('NOMBRECOMPLETO').AsString :=
            FieldByName('NOMBRECOMPLETO').AsString;
          FDMemTable1.FieldByName('DIRECCION').AsString :=
            FieldByName('DIRECCION').AsString;
          FDMemTable1.FieldByName('EMAIL').AsString :=
            FieldByName('EMAIL').AsString;
          FDMemTable1.FieldByName('TELEFONO1').AsString :=
            FieldByName('TELEFONO1').AsString;
          FDMemTable1.FieldByName('TELEFONO2').AsString :=
            FieldByName('TELEFONO2').AsString;
          FDMemTable1.FieldByName('WEB').AsString :=
            FieldByName('WEB').AsString;
          FDMemTable1.FieldByName('CONTACTONOMBRE').AsString :=
            FieldByName('CONTACTONOMBRE').AsString;
          if FieldByName('TIPOPAGO').AsInteger = 1 then
            FDMemTable1.FieldByName('TIPOPAGO').AsString := 'Contado';
          if FieldByName('TIPOPAGO').AsInteger = 2 then
            FDMemTable1.FieldByName('TIPOPAGO').AsString := 'Cr�dito';
          FDMemTable1.FieldByName('PLAZO').AsInteger :=
            FieldByName('PLAZO').AsInteger;
          FDMemTable1.Post;

          Next;
        end;
      end;
      mDL_TB_CLIENTES.Destroy;

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
