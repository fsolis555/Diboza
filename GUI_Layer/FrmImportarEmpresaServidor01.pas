unit FrmImportarEmpresaServidor01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit,
  RxCurrEdit, Vcl.Buttons, Vcl.ExtCtrls, RzPanel, Vcl.ComCtrls, RzLabel;

type
  TFormImportarEmpresaServidor01 = class(TForm)
    Label2: TLabel;
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    cbImpoartar: TComboBoxEx;
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    cbSucursal: TComboBoxEx;
    cbTerminal: TComboBoxEx;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cbImpoartarChange(Sender: TObject);
    procedure cbSucursalChange(Sender: TObject);
    procedure RzGroupBox1CheckBoxClick(Sender: TObject);
  private
    FIdEmpresa: Integer;
    FSucursal: string;
    FTerminal: string;
  public
    property _IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;
    property _Sucursal: string read FSucursal write FSucursal;
    property _Terminal: string read FTerminal write FTerminal;
  end;

var
  FormImportarEmpresaServidor01: TFormImportarEmpresaServidor01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure LlenarcbEmpresa(cb: TComboBoxEx);
  procedure LlenarcbSucursal(cb: TComboBoxEx);
  procedure LlenarcbTerminales(cb: TComboBoxEx);
  procedure MarcarDesmarcarSucursalesTerminales;
  procedure CargarIdioma;

implementation
uses
  uSistema, ufunciones, udmLenguajes, udmObjects, uConfig;

{$R *.dfm}

var
  Forma01: TFormImportarEmpresaServidor01;
  _PasaForma: Boolean;

{$REGION 'Funciones Forma'}
procedure TFormImportarEmpresaServidor01.FormShow(Sender: TObject);
begin
  _PasaForma := False;

  Forma01 := FormImportarEmpresaServidor01;

  InicializarForma;
end;

procedure TFormImportarEmpresaServidor01.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormImportarEmpresaServidor01.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormImportarEmpresaServidor01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormImportarEmpresaServidor01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormImportarEmpresaServidor01.cbImpoartarChange(Sender: TObject);
begin
  if _PasaForma = True  then
  begin
    LlenarcbSucursal(cbSucursal);
    LlenarcbTerminales(cbTerminal);
  end;
end;

procedure TFormImportarEmpresaServidor01.cbSucursalChange(Sender: TObject);
begin
  if _PasaForma = True  then
    LlenarcbTerminales(cbTerminal);
end;

procedure TFormImportarEmpresaServidor01.RzGroupBox1CheckBoxClick(
  Sender: TObject);
begin
  MarcarDesmarcarSucursalesTerminales;
end;
{$ENDREGION}

{$REGION 'Funciones Generales'}
procedure InicializarForma;
begin
  with Forma01 do
  begin

    try
      Tag := 0;

      LlenarcbEmpresa(cbImpoartar);
      LimpiarCampos;
      CargarIdioma;
      cbImpoartar.SetFocus;
      _PasaForma := True;
    except
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

    cbImpoartar.ItemIndex := 0;
    RzGroupBox1.Checked := True;
    LlenarcbSucursal(cbSucursal);
    LlenarcbTerminales(cbTerminal);
    cbSucursal.ItemIndex := 0;
    cbTerminal.ItemIndex := 0;

  end;
end;

procedure Aceptar;
var
  mConfig: TConfig;
begin
  with Forma01 do
  begin

    _IdEmpresa := GetCombo(cbImpoartar);

    if RzGroupBox1.Checked = True then
    begin
      _Sucursal := cbSucursal.Text;
      _Terminal := cbTerminal.Text;
      Global.Sucursal := cbSucursal.Text;
      Global.Terminal := cbTerminal.Text;
      mConfig :=  TConfig.Create;
      mConfig.EscribirIni_Hacienda;
      mConfig.Destroy;
    end;

    Tag := 1;
    Close;

  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure LlenarcbEmpresa(cb: TComboBoxEx);
begin
  with Forma01 do
  begin

    cb.Items.Clear;
    cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

    with dmObjects.FDQuery1Servidor do
    begin
      SQL.Clear;
      SQL.Add('Select *');
      SQL.Add('From tb_empresas ');
      SQL.Add('Order By Nombre');
      Open();
      First;
      while not Eof do
      begin
        cb.Items.AddObject(FieldByName('Nombre').AsString,
          TObject(FieldByName('Id').AsInteger));

        Next;
      end;
      Close;
    end;

  end;
end;

procedure LlenarcbSucursal(cb: TComboBoxEx);
var
  mIdEmpresa: Integer;
begin
  with Forma01 do
  begin

    cb.Items.Clear;
    cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

    mIdEmpresa := GetCombo(cbImpoartar);

    with dmObjects.FDQuery1Servidor do
    begin
      SQL.Clear;
      SQL.Add('Select *');
      SQL.Add('From tb_sucursalesterminales ');
      SQL.Add('Where IdEmpresa =:Param0');
      SQL.Add('Order By Sucursal');
      Params.Items[0].AsInteger := mIdEmpresa;
      Open();
      First;
      while not Eof do
      begin
        cb.Items.AddObject(FieldByName('Sucursal').AsString,
          TObject(FieldByName('Id').AsInteger));

        Next;
      end;
      Close;
    end;

  end;
end;

procedure LlenarcbTerminales(cb: TComboBoxEx);
var
  mIdEmpresa: Integer;
  mIdSucursal: Integer;
  mTerminales: Integer;
  mFila: Integer;
begin
  with Forma01 do
  begin

    cb.Items.Clear;
    cb.Items.AddObject('[SIN SELECCIONAR]', TObject(0));

    mIdEmpresa := GetCombo(cbImpoartar);
    mIdSucursal := GetCombo(cbSucursal);

    mTerminales := 0;
    with dmObjects.FDQuery1Servidor do
    begin
      SQL.Clear;
      SQL.Add('Select Terminales');
      SQL.Add('From tb_sucursalesterminales ');
      SQL.Add('Where IdEmpresa =:Param0');
      SQL.Add('And Sucursal =:Param1 ');
      Params.Items[0].AsInteger := mIdEmpresa;
      Params.Items[1].AsInteger := mIdSucursal;
      Open();
      if Fields[0].IsNull = False then
        mTerminales := Fields[0].AsInteger;
      Close;
    end;
    for mFila := 1 to mTerminales do
      cb.Items.AddObject(IntToStr(mFila),
        TObject(mFila));

  end;
end;

procedure MarcarDesmarcarSucursalesTerminales;
begin
  with Forma01 do
  begin

    if RzGroupBox1.Checked = True then
    begin
      cbSucursal.Enabled := True;
      cbTerminal.Enabled := True;
    end
    else begin
      cbSucursal.Enabled := False;
      cbTerminal.Enabled := False;
      cbTerminal.ItemIndex := 0;
      cbSucursal.ItemIndex := 0;
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
