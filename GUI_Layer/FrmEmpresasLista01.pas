unit FrmEmpresasLista01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  RzListVw, RzStatus, RzPanel, Vcl.ExtCtrls, FireDAC.Comp.Client,
  System.RegularExpressions, uDL_Skeleton, Data.DB, Vcl.Mask, RzEdit, RzBtnEdt;

type
  TFormEmpresasLista01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnCerrar: TBitBtn;
    stbEstado1: TRzStatusBar;
    RzStatusPane1: TRzStatusPane;
    pnlFiltro: TRzPanel;
    Label2: TLabel;
    pnlListaTitulo: TRzPanel;
    lvLista1: TRzListView;
    OpenDialog1: TOpenDialog;
    btnAgregar: TBitBtn;
    btnQuitar: TBitBtn;
    edtArchivo: TRzButtonEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCerrarClick(Sender: TObject);
    procedure edtArchivoInvokeSearch(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnQuitarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEmpresasLista01: TFormEmpresasLista01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Refrescar(lv: TRzListView);
  procedure Cerrar;
  procedure LlenarlvLista1(lv: TRzListView; ds1: TDatasetMem);
  procedure Buscar_Archivo;
  procedure Agegar_Archivo;
  procedure Quitar_Archivo;
  function ExisteEmpresa(pNombre: string): Boolean;
  procedure CargarIdioma;

implementation
uses
  uSistema, ufunciones, FrmMensaje_Espera01, udmLenguajes, uConfig;

{$R *.dfm}

var
  Forma01: TFormEmpresasLista01;

{$REGION 'Funciones Forma'}
procedure TFormEmpresasLista01.FormShow(Sender: TObject);
begin
  Forma01 := FormEmpresasLista01;

  InicializarForma;
end;

procedure TFormEmpresasLista01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormEmpresasLista01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormEmpresasLista01.btnCerrarClick(Sender: TObject);
begin
  Cerrar;
end;

procedure TFormEmpresasLista01.edtArchivoInvokeSearch(Sender: TObject);
begin
  Buscar_Archivo;
end;

procedure TFormEmpresasLista01.btnAgregarClick(Sender: TObject);
begin
  Agegar_Archivo;
end;

procedure TFormEmpresasLista01.btnQuitarClick(Sender: TObject);
begin
  Quitar_Archivo;
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

  end;
end;

procedure LimpiarCampos;
begin
  with Forma01 do
  begin

    edtArchivo.Clear;

  end;
end;

procedure Refrescar(lv: TRzListView);
var
  mConfig: TConfig;
  mLista, mValores: TStringList;
  memLista: TFDMemTable;
  mFila: Integer;
  mNombre, mDirectorio: string;
begin
  with Forma01 do
  begin

    mConfig := TConfig.Create;
    mLista := TStringList.Create;
    mConfig.LeerEmpresas(mLista);
    mConfig.Free;

    memLista := TFDMemTable.Create(nil);
    memLista.FieldDefs.Clear;
    memLista.FieldDefs.Add('ID', ftInteger, 0);
    memLista.FieldDefs.Add('Nombre', ftString, 200);
    memLista.FieldDefs.Add('Directorio', ftMemo, 0);
    memLista.CreateDataSet;
    memLista.Open;

    for mFila := 0 to mLista.Count - 1 do
    begin
      mValores := TStringList.Create;
      ExtractStrings(['='], ['='], PChar(mLista.Strings[mFila]), mValores);
      mNombre := Extractfilename(mValores.Strings[1]);
      mNombre := Copy(mNombre, 1, Pos('.', mNombre) - 1);
      mDirectorio := ExtractFileDir(mValores.Strings[1]);
      memLista.Append;
      memLista.FieldByName('Nombre').AsString := mNombre;
      memLista.FieldByName('Directorio').AsString := mDirectorio;
      memLista.Post;
      mValores.Free;
    end;
    LlenarlvLista1(lv, memLista);
    memLista.Close;
    memLista.Free;
    mLista.Free;

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
            FieldByName('Nombre').AsString);
          SubItems.Add(
            FieldByName('Directorio').AsString);
        end;

        Next;
      end;
    end;

  end;
end;

procedure Buscar_Archivo;
begin
  with Forma01 do
  begin

    if OpenDialog1.Execute = True then
      edtArchivo.Text := OpenDialog1.FileName;

  end;
end;

procedure Agegar_Archivo;
var
  mConfig: TConfig;
  mNombre: string;
begin
  with Forma01 do
  begin

    if edtArchivo.Text <> '' then
    begin
      mNombre := Extractfilename(edtArchivo.Text);
      mNombre := Copy(mNombre, 1, Pos('.', mNombre) - 1);

      if ExisteEmpresa(mNombre) = True then
      begin
        if Application.MessageBox('Ya existe esta empresa. Desea actualizarla?', 'Confirmar', MB_ICONQUESTION + MB_YESNO) = ID_YES then
        begin
          mConfig := TConfig.Create;
          mConfig.EscribirIni_EmpresaLista(mNombre, edtArchivo.Text);
          mConfig.Free;
          Refrescar(lvLista1);
          edtArchivo.Clear;
        end;
      end
      else begin
        mConfig := TConfig.Create;
        mConfig.EscribirIni_EmpresaLista(mNombre, edtArchivo.Text);
        mConfig.Free;
        Refrescar(lvLista1);
        edtArchivo.Clear;
      end;
    end;

  end;
end;

procedure Quitar_Archivo;
var
  mConfig: TConfig;
  mNombre: string;
begin
  with Forma01 do
  begin

    if lvLista1.Selected <> nil then
    begin
      if Application.MessageBox('Desea quitar el archivo?', 'Confirmar', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin
        mNombre := Trim(lvLista1.Selected.SubItems[0]);
        mConfig := TConfig.Create;
        mConfig.EliminarIni_EmpresaLista(mNombre);
        mConfig.Free;
        Refrescar(lvLista1);
      end;
    end;

  end;
end;

function ExisteEmpresa(pNombre: string): Boolean;
var
  mFila: Integer;
  mResultado: Boolean;
begin
  with Forma01 do
  begin

    mResultado := False;

    for mFila := 0 to lvLista1.Items.Count - 1 do
    begin
      if Trim(lvLista1.Items[mFila].SubItems[0]) = pNombre then
      begin
        mResultado := True;
        Break;
      end;
    end;

    Result := mResultado;

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
