unit FrmMantenimientoPlantillas01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  RzListVw, RzStatus, RzPanel, Vcl.ExtCtrls,
  System.RegularExpressions, uDL_Skeleton;

type
  TFormMantenimientoPlantillas01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnModificar: TBitBtn;
    btnCerrar: TBitBtn;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    pnlListaTitulo: TRzPanel;
    lvLista1: TRzListView;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnModificarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMantenimientoPlantillas01: TFormMantenimientoPlantillas01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Modificar(lv: TRzListView);
  procedure Refrescar(lv: TRzListView);
  procedure Cerrar;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, uDL_TB_PLANTILLAS, BS_DBConexion,
  FrmPlantillas01, FrmMensaje_Espera01, udmLenguajes;

{$R *.dfm}

type
  Clase_Tipo1 = TDL_TB_PLANTILLAS;

const
  lv_id = 0;

var
  Forma01: TFormMantenimientoPlantillas01;

{$REGION 'Funciones Forma'}
procedure TFormMantenimientoPlantillas01.FormShow(Sender: TObject);
begin
  Forma01 := FormMantenimientoPlantillas01;

  InicializarForma;
end;

procedure TFormMantenimientoPlantillas01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormMantenimientoPlantillas01.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormMantenimientoPlantillas01.btnModificarClick(Sender: TObject);
begin
  Modificar(lvLista1);
end;

procedure TFormMantenimientoPlantillas01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
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
    if Key = VK_F3 then
    begin
      Key := 0;
      btnModificar.Click;
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
        FormPlantillas01._Id := mId;
        FormPlantillas01.ShowModal;
      end;
    end;

  end;
end;

procedure Refrescar(lv: TRzListView);
var
  mBS_Plantillas: Clase_Tipo1;
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

      mBS_Plantillas := Clase_Tipo1.Create;
      mWhere := TStringList.Create;
      mWhere.Clear;
      mWhere.Add('A.Id in (1,2,3,4,9,11,12,13,17)');
      mOrderBy := TStringList.Create;
      mOrderBy.Clear;
      mOrderBy.Add('A.Id');
      mBS_Plantillas.Consultar(_Resultado, _ErrorM, mWhere.Text,
        mOrderBy.Text);
      mWhere.Free;
      mOrderBy.Free;
      if _Resultado = -1 then
        raise Exception.Create('');

      LlenarlvLista1(lv, mBS_Plantillas.Dataset);
      mBS_Plantillas.Destroy;

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
          Caption :=
            FieldByName('DESCRIPCION').AsString;
          SubItems.Add(
            FieldByName('ID').AsString);
        end;
        Next;
      end;
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
