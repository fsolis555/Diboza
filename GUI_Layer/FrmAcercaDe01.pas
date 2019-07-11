unit FrmAcercaDe01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.GIFImg, Vcl.Imaging.jpeg,
  Winapi.ShellAPI, udmLenguajes;

type
  TFormAcercaDe01 = class(TForm)
    pnlLogo: TPanel;
    btnAceptar: TBitBtn;
    pnlCampos: TPanel;
    Image1: TImage;
    Image2: TImage;
    Bevel1: TBevel;
    Label7: TLabel;
    Image3: TImage;
    lblEmpresa: TLabel;
    lblVersion: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Image4: TImage;
    lblProducto: TLabel;
    lblDesarrollador: TLabel;
    lblEmail: TLabel;
    lblMemoria: TLabel;
    lblDisponible: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure lblEmpresaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAcercaDe01: TFormAcercaDe01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  function Obtener_MemoriaTotal: string;
  function Obtener_MemoriaDisponible: string;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones;

{$R *.dfm}

var
  Forma01: TFormAcercaDe01;

{$REGION 'Funciones Forma'}
procedure TFormAcercaDe01.FormShow(Sender: TObject);
begin
  Forma01 := FormAcercaDe01;

  InicializarForma;
end;

procedure TFormAcercaDe01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormAcercaDe01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormAcercaDe01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormAcercaDe01.lblEmpresaClick(Sender: TObject);
begin
 // WinExec('http://dynamicnetgroup.com/', SW_SHOWNORMAL);
  Winapi.ShellAPI.ShellExecute(0, 'Open', PChar('http://dynamicnetgroup.com/'),
    PChar(''), nil, SW_SHOWNORMAL);
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
    except
      if _Resultado = - 1 then
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

    Caption := 'Acerca de Sisfac';
    lblEmpresa.Caption := 'Dynamic';
    lblProducto.Caption := 'Sisfac';
    lblDesarrollador.Caption := 'Heisenberg';
    lblEmail.Caption := 'dynamicgroupnet@gmail.com';
    lblVersion.Caption := 'versi�n: ' + GetAppVersion;
    lblMemoria.Caption := 'Memoria Total: ' + Obtener_MemoriaTotal;
    lblDisponible.Caption := 'Memoria Disponible: ' + Obtener_MemoriaDisponible;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

function Obtener_MemoriaTotal: string;
var
  memory: TMemoryStatus;
  mResultado: string;
  mKilos: Integer;
  mMegas: Integer;
  mGigas: Integer;
begin
  memory.dwLength := SizeOf(memory);
  GlobalMemoryStatus(memory);
  mKilos := memory.dwTotalPhys div 1024;
  mMegas := mKilos div 1024;
  mGigas := mMegas div 1000;
  mResultado := IntToStr(mGigas) + ' GB';

  Result := mResultado;
end;

function Obtener_MemoriaDisponible: string;
var
  memory: TMemoryStatus;
  mResultado: string;
  mKilos: Integer;
  mMegas: Integer;
  mGigas: Integer;
begin
  memory.dwLength := SizeOf(memory);
  GlobalMemoryStatus(memory);
  mKilos := memory.dwAvailPhys div 1024;
  mMegas := mKilos div 1024;
  mGigas := mMegas div 1000;
  mResultado := IntToStr(mGigas) + ' GB';

  Result := mResultado;
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
      if Forma01.Components[mCount] is TPanel then
      begin
        mValor := TPanel(Forma01.Components[mCount]).Caption;
        mValor := dmLenguajes.GetValue(mValor);
        if Trim(mValor) <> '' then
          TPanel(Forma01.Components[mCount]).Caption := mValor;
      end;
    end;

  end;
end;
{$ENDREGION}

end.