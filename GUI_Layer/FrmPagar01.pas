unit FrmPagar01;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RzPanel, RzLabel, Vcl.Mask, RxToolEdit, RxCurrEdit, RzCommon, RzButton,
  RzRadChk;

type
  TFormPagar01 = class(TForm)
    pnlTitulo: TRzPanel;
    pnlOpciones: TRzPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlCampos: TRzPanel;
    pnlTotal: TRzPanel;
    pnlEfectivo: TRzPanel;
    pnlOtros: TRzPanel;
    pnlCredito: TRzPanel;
    pnlPagado: TRzPanel;
    pnlEfectivoTitulo: TRzPanel;
    pnlCreditoTitulo: TRzPanel;
    edtEfectivo: TCurrencyEdit;
    chkTarjeta: TCheckBox;
    chkCheque: TCheckBox;
    chkTransferencia: TCheckBox;
    Label1: TLabel;
    edtPlazo: TCurrencyEdit;
    RzFrameController1: TRzFrameController;
    lblCredito: TLabel;
    lblEfectivo: TLabel;
    lblTotal: TLabel;
    lblPagado: TLabel;
    lblCambio: TLabel;
    chkCredito: TRzCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtEfectivoChange(Sender: TObject);
    procedure chkTarjetaClick(Sender: TObject);
    procedure chkChequeClick(Sender: TObject);
    procedure chkTransferenciaClick(Sender: TObject);
    procedure chkCreditoClick(Sender: TObject);
  private
    FTotal: Double;
    FPagado: Double;
    FCambio: Double;
    FEfectivoTotal: Double;
    FIDFormaPago: Integer;
    FTarjetaTotal: Double;
    FChequeTotal: Double;
    FTransferenciaTotal: Double;
    FCreditoTotal: Double;
    FPlazo: Integer;
    FTipoPago: Integer; //1 Contado 2 Credito
    FPasaForma: Boolean;
    FMedioPago: Integer;
  public
    property _Total: Double  read FTotal write FTotal;
    property _Pagado: Double  read FPagado write FPagado;
    property _Cambio: Double  read FCambio write FCambio;
    property _EfectivoTotal: Double  read FEfectivoTotal write FEfectivoTotal;
    property _IDFormaPago: Integer  read FIDFormaPago write FIDFormaPago;
    property _TarjetaTotal: Double  read FTarjetaTotal write FTarjetaTotal;
    property _ChequeTotal: Double  read FChequeTotal write FChequeTotal;
    property _TransferenciaTotal: Double  read FTransferenciaTotal write FTransferenciaTotal;
    property _CreditoTotal: Double  read FCreditoTotal write FCreditoTotal;
    property _Plazo: Integer  read FPlazo write FPlazo;
    property _TipoPago: Integer  read FTipoPago write FTipoPago Default 1;
    property _PasaForma: Boolean  read FPasaForma write FPasaForma;
    property _MedioPago: Integer  read FMedioPago write FMedioPago Default 1;
  end;

var
  FormPagar01: TFormPagar01;

  procedure InicializarForma;
  procedure FinalizarForma;
  procedure KeyDownForma(var Key: Word; Shift: TShiftState);
  procedure LimpiarCampos;
  procedure Aceptar;
  procedure Cancelar;
  procedure CamposValidos;
  procedure CargarIdioma;

implementation

uses
  uSistema, ufunciones, udmLenguajes;

{$R *.dfm}

var
  Forma01: TFormPagar01;
  _PasaForma: Boolean;

{$REGION 'Funciones Forma'}
procedure TFormPagar01.FormShow(Sender: TObject);
begin
  Forma01 := FormPagar01;

  InicializarForma;
end;

procedure TFormPagar01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarForma;
end;

procedure TFormPagar01.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  KeyDownForma(Key, Shift);
end;

procedure TFormPagar01.btnAceptarClick(Sender: TObject);
begin
  Aceptar;
end;

procedure TFormPagar01.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TFormPagar01.edtEfectivoChange(Sender: TObject);
begin
  if _PasaForma = True then
  begin
    lblEfectivo.Font.Color := clRed;
    lblCredito.Font.Color := clBlack;
    chkTarjeta.Font.Color := clBlack;
    chkCheque.Font.Color := clBlack;
    chkTransferencia.Font.Color := clBlack;

    chkTarjeta.Checked := False;
    chkCheque.Checked := False;
    chkTransferencia.Checked := False;
    chkCredito.Checked := False;
    _Pagado := edtEfectivo.Value;
    _Cambio := _Pagado - _Total;
    lblPagado.Caption := 'Pagado: ' +
      FormatFloat('#,##0.00', _Pagado);
    lblCambio.Caption := 'Vuelto: ' +
      FormatFloat('#,##0.00', _Cambio);
    _EfectivoTotal := _Pagado - _Cambio;
  end;
end;

procedure TFormPagar01.chkTarjetaClick(Sender: TObject);
begin
  if chkTarjeta.Checked = True then
  begin
    lblEfectivo.Font.Color := clBlack;
    lblCredito.Font.Color := clBlack;
    chkTarjeta.Font.Color := clRed;
    chkCheque.Font.Color := clBlack;
    chkTransferencia.Font.Color := clBlack;

    edtEfectivo.Value := 0;
    chkCheque.Checked := False;
    chkTransferencia.Checked := False;
    chkCredito.Checked := False;
    _Pagado := _Total;
    _Cambio := 0;
    lblPagado.Caption := 'Pagado: ' +
      FormatFloat('#,##0.00', _Pagado);
    lblCambio.Caption := 'Vuelto: ' +
      FormatFloat('#,##0.00', _Cambio);
    _EfectivoTotal := 0;
  end;
end;

procedure TFormPagar01.chkChequeClick(Sender: TObject);
begin
  if chkCheque.Checked = True then
  begin
    lblEfectivo.Font.Color := clBlack;
    lblCredito.Font.Color := clBlack;
    chkTarjeta.Font.Color := clBlack;
    chkCheque.Font.Color := clRed;
    chkTransferencia.Font.Color := clBlack;

    edtEfectivo.Value := 0;
    chkTarjeta.Checked := False;
    chkTransferencia.Checked := False;
    chkCredito.Checked := False;
    _Pagado := _Total;
    _Cambio := 0;
    lblPagado.Caption := 'Pagado: ' +
      FormatFloat('#,##0.00', _Pagado);
    lblCambio.Caption := 'Vuelto: ' +
      FormatFloat('#,##0.00', _Cambio);
    _EfectivoTotal := 0;
  end;
end;

procedure TFormPagar01.chkTransferenciaClick(Sender: TObject);
begin
  if chkTransferencia.Checked = True then
  begin
    lblEfectivo.Font.Color := clBlack;
    lblCredito.Font.Color := clBlack;
    chkTarjeta.Font.Color := clBlack;
    chkCheque.Font.Color := clBlack;
    chkTransferencia.Font.Color := clRed;

    edtEfectivo.Value := 0;
    chkTarjeta.Checked := False;
    chkCheque.Checked := False;
    chkCredito.Checked := False;
    _Pagado := _Total;
    _Cambio := 0;
    lblPagado.Caption := 'Pagado: ' +
      FormatFloat('#,##0.00', _Pagado);
    lblCambio.Caption := 'Vuelto: ' +
      FormatFloat('#,##0.00', _Cambio);
    _EfectivoTotal := 0;
  end;
end;

procedure TFormPagar01.chkCreditoClick(Sender: TObject);
begin
  if chkCredito.Checked = True then
  begin
    lblEfectivo.Font.Color := clBlack;
    lblCredito.Font.Color := clRed;
    chkTarjeta.Font.Color := clBlack;
    chkCheque.Font.Color := clBlack;
    chkTransferencia.Font.Color := clBlack;

    edtEfectivo.Value := 0;
    chkTarjeta.Checked := False;
    chkCheque.Checked := False;
    chkTransferencia.Checked := False;
    _Pagado := 0;
    _Cambio := 0;
    lblPagado.Caption := 'Pagado: ' +
      FormatFloat('#,##0.00', _Pagado);
    lblCambio.Caption := 'Vuelto: ' +
      FormatFloat('#,##0.00', _Cambio);
    _EfectivoTotal := 0;
  end;
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

    lblEfectivo.Font.Color := clBlack;
    lblCredito.Font.Color := clBlack;
    chkTarjeta.Font.Color := clBlack;
    chkCheque.Font.Color := clBlack;
    chkTransferencia.Font.Color := clBlack;

    _MedioPago := 1;
    _Pagado := 0;
    _Cambio := 0;
    _EfectivoTotal := 0;
    _TarjetaTotal := 0;
    _ChequeTotal := 0;
    _TransferenciaTotal := 0;
    _CreditoTotal := 0;
    chkCredito.Checked := False;
    edtEfectivo.Value :=_Total;
    lblPagado.Caption := 'Pagado: ' +
      FormatFloat('#,##0.00', 0);
    lblCambio.Caption := 'Vuelto: ' +
      FormatFloat('#,##0.00', 0);
    edtPlazo.Value := _Plazo;

    if _TipoPago = 1 then
    begin
      _Pagado := _Total;
      _Cambio := 0;
      _EfectivoTotal := _Total;
      lblEfectivo.Font.Color := clRed;
      edtEfectivo.Value :=_Total;
      edtEfectivo.SetFocus;
    end;
    if _TipoPago = 2 then
    begin
      _Pagado := 0;
      _Cambio := 0;
      _CreditoTotal := _Total;
      chkCredito.Checked := True;
      lblCredito.Font.Color := clRed;
      edtPlazo.SetFocus;
    end;

    lblTotal.Caption := 'Total: ' +
      FormatFloat('#,##0.00', _Total);
    chkTarjeta.Checked := False;
    chkCheque.Checked := False;
    chkTransferencia.Checked := False;
    lblPagado.Caption := 'Pagado: ' +
      FormatFloat('#,##0.00', _Pagado);
    lblCambio.Caption := 'Vuelto: ' +
      FormatFloat('#,##0.00', _Cambio);

    _PasaForma := True;

  end;
end;

procedure Aceptar;
begin
  with Forma01 do
  begin

    CamposValidos;
    if _Resultado = 1 then
    begin
      if chkCredito.Checked = True then
        _IDFormaPago := 5
      else
        _IDFormaPago := 1;
      if chkTarjeta.Checked = True then
        _TarjetaTotal := _Total;
      if chkCheque.Checked = True then
        _ChequeTotal := _Total;
      if chkTransferencia.Checked = True then
        _TransferenciaTotal := _Total;
      if chkCredito.Checked = True then
        _CreditoTotal := _Total;
      _Plazo := StrToInt(edtPlazo.Text);
      if edtEfectivo.Value > 0 then
        _MedioPago := 1;
      if chkTarjeta.Checked = True then
        _MedioPago := 2;
      if chkCheque.Checked = True then
        _MedioPago := 3;
      if chkTransferencia.Checked = True then
        _MedioPago := 4;

      Tag := 1;
      Close;
    end;

  end;
end;

procedure Cancelar;
begin
  with Forma01 do
  begin

    Close;

  end;
end;

procedure CamposValidos;
var
  mValido: Boolean;
  mEfectivo: Double;
  mPasa: Boolean;
begin
  with Forma01 do
  begin

    _Resultado := 1;
    mValido := True;

    mEfectivo := edtEfectivo.Value;
    if (mEfectivo <= 0) and (chkTarjeta.Checked = False)
      and (chkCheque.Checked = False) and
      (chkTransferencia.Checked = False) and
      (chkCredito.Checked = False) then
      mPasa := False
    else
      mPasa := True;
    if (mValido = True) and (mPasa = False) then
    begin
      mValido := False;
      _ErrorM := 'Debe seleccionar una opci�n de pago';
    end;

    if (mValido = True) and (edtEfectivo.Value > 0) then
    begin
      if _Pagado < _Total then
      begin
        mValido := False;
        _ErrorM := 'El efectivo no puede ser menor al total';
      end;
    end;

    if mValido = False then
      _Resultado := 0;

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
