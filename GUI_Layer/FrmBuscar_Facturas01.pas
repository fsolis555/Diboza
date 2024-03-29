unit FrmBuscar_Facturas01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, Vcl.ComCtrls,
  RzListVw, RzStatus, Vcl.StdCtrls, Vcl.Buttons,
  System.RegularExpressions, uDL_Skeleton, Vcl.ImgList;

type
  TFormBuscar_Facturas01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnCerrar: TBitBtn;
    btnSeleccionar: TBitBtn;
    pnlFiltro: TRzPanel;
    pnlListaTitulo: TRzPanel;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    lvLista1: TRzListView;
    Label1: TLabel;
    cbCliente: TComboBoxEx;
    Label2: TLabel;
    cbFactura: TComboBoxEx;
    btnBuscar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    FId: Integer;
    FCodigo: string;
    FWhere: string;
  public
    property _Id: Integer read FId write FId;
    property _Codigo: string read FCodigo write FCodigo;
    property _Where: string read FWhere write FWhere;
  end;

var
  FormBuscar_Facturas01: TFormBuscar_Facturas01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Seleccionar;
  procedure Cerrar;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Buscar;
  procedure LlenarcbClientes(cb: TComboBoxEx);
  procedure LlenarcbFacturas(cb: TComboBoxEx);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, BS_DBConexion, udmLenguajes,
  FrmMensaje_Espera01, uDL_TB_FACTURASCLIENTESENCABEZADO,
  uDL_TB_CLIENTES;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_FACTURASCLIENTESENCABEZADO;

const
  lv_Nombre = 0;
  lv_id = 1;

var
  Forma01: TFormBuscar_Facturas01;
  _IdProducto: Integer;

{$REGION 'Funciones Forma'}
procedure TFormBuscar_Facturas01.FormShow(Sender: TObject);
begin
  Forma01 := FormBuscar_Facturas01;

  InicializarForma;
end;

procedure TFormBuscar_Facturas01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormBuscar_Facturas01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormBuscar_Facturas01.btnSeleccionarClick(Sender: TObject);
begin
  Seleccionar;
end;

procedure TFormBuscar_Facturas01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormBuscar_Facturas01.btnBuscarClick(Sender: TObject);
begin
  Buscar;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      _IdProducto := 0;
      lvLista1.Items.Clear;

      LlenarcbClientes(cbCliente);
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarcbFacturas(cbFactura);
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

    cbCliente.ItemIndex := 0;
    cbFactura.ItemIndex := 0;

  end;
end;

procedure Seleccionar;
var
  mLinea: string;
begin
  with Forma01 do
  begin

    if lvLista1.Selected <> nil then
    begin
      mLinea := lvLista1.Selected.SubItems[9];
      try
        _Id := StrToInt(mLinea);
      except
        _Id := 0;
      end;
      if _Id > 0 then
      begin
        Tag := 1;
        Close;
      end;
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
          Caption :=
            FieldByName('NUMERO').AsString;
          SubItems.Add(
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHA').AsDateTime));
          SubItems.Add(
            FieldByName('NOMBRECLIENTE').AsString);
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('SUBTOTAL').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('DESCUENTOM').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('IVAM').AsFloat));
          SubItems.Add(
            FormatFloat('##,#0.00',
            FieldByName('TOTAL').AsFloat));
          SubItems.Add(
            FormatDateTime('dd/MM/yyyy',
            FieldByName('FECHAVENCIMIENTO').AsDateTime));
          SubItems.Add(
            FieldByName('EstadoNombre').AsString);
          if FieldByName('CODIGOFORMAPAGO').AsInteger = 1 then
            SubItems.Add('Contado');
          if FieldByName('CODIGOFORMAPAGO').AsInteger = 5 then
            SubItems.Add('Cr�dito');
          SubItems.Add(
            FieldByName('ID').AsString);
        end;
        Next;
      end;
    end;

  end;
end;

procedure Buscar;
var
  mTexto: string;
  mBS_FacturasEncabezado: Clase_Tipo1;
  mWhere, mOrderBy: TStringList;
  mBuscar, mWhere2: string;
begin
  with Forma01 do
  begin

    lvLista1.Items.Clear;
    RzStatusPane1.Caption := 'Registros: 0';

    mBS_FacturasEncabezado := Clase_Tipo1.Create;
    mWhere := TStringList.Create;
    mOrderBy := TStringList.Create;
    if GetCombo(cbCliente) > 0 then
    begin
      if mWhere.Text <> '' then
        mWhere.Add(' And ');
      mWhere.Add('(A.IdCliente = ' + IntToStr(GetCombo(cbCliente)) + ')');
    end;
    if GetCombo(cbFactura) > 0 then
    begin
      if mWhere.Text <> '' then
        mWhere.Add(' And ');
      mWhere.Add('(A.Id = ' + IntToStr(GetCombo(cbFactura)) + ')');
    end;
    mOrderBy.Add('A.Id');
    mBS_FacturasEncabezado.Consultar(_Resultado, _ErrorM, mWhere.Text, mOrderBy.Text);
    mWhere.Free;
    mOrderBy.Free;
    LlenarlvLista1(lvLista1, mBS_FacturasEncabezado.Dataset);
    mBS_FacturasEncabezado.Destroy;

  end;
end;

procedure LlenarcbClientes(cb: TComboBoxEx);
var
  mDL_TB_Clientes: TDL_TB_CLIENTES;
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
      mDL_TB_Clientes := TDL_TB_CLIENTES.Create;
      mDL_TB_Clientes.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_Clientes.Dataset do
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
      mDL_TB_Clientes.Destroy;

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

procedure LlenarcbFacturas(cb: TComboBoxEx);
var
  mDL_TB_FACTURASCLIENTESENCABEZADO: TDL_TB_FACTURASCLIENTESENCABEZADO;
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
      mOrderBy.Add('A.NUMERO');
      mDL_TB_FACTURASCLIENTESENCABEZADO := TDL_TB_FACTURASCLIENTESENCABEZADO.Create;
      mDL_TB_FACTURASCLIENTESENCABEZADO.Consultar(_Resultado, _ErrorM,
        mWhere.Text, mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      with mDL_TB_FACTURASCLIENTESENCABEZADO.Dataset do
      begin
        First;
        while not Eof do
        begin
          cb.Items.AddObject(
            FieldByName('NUMERO').AsString,
            TObject(FieldByName('Id').AsInteger));
          Next;
        end;
      end;
      if _Resultado = -1 then
        raise Exception.Create('');
      mDL_TB_FACTURASCLIENTESENCABEZADO.Destroy;

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
