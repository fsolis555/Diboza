object FormOpcionesIniciales01: TFormOpcionesIniciales01
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Opciones Iniciales'
  ClientHeight = 384
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitulo: TRzPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 25
    Align = alTop
    BorderOuter = fsNone
    Caption = 'OPCIONES INICIALES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    GradientColorStyle = gcsCustom
    GradientColorStart = clBlue
    GradientColorStop = clWhite
    ParentFont = False
    TabOrder = 0
    VisualStyle = vsGradient
  end
  object pnlOpciones: TRzPanel
    Left = 0
    Top = 349
    Width = 457
    Height = 35
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    object btnAceptar: TBitBtn
      Left = 208
      Top = 3
      Width = 110
      Height = 30
      Caption = 'Aceptar'
      Glyph.Data = {
        4A030000424D4A030000000000000A0100002800000018000000180000000100
        08000000000040020000120B0000120B0000350000003500000000000000FFFF
        FF00FF00FF00004B0000035E0600046408000793100008961100089612000997
        130009971400099612000996130007740E000A9915000B991600097411000C9A
        18000D9E1B000FA01D000FA11F000C77170010951F000E7D1A00119620000F81
        1C00118C1F00139823001197220014A727001399250013902400159A2700138F
        2300169D2900169C2800159127001AAF31001BB033001B9F310021B83D001C9C
        340020AA3B0023AD410028C1490028C048002FC954002EC1520035CF5E0036D0
        60003BD768003FD96F0041DC7000020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020203020202020202020202
        02020202020202020202020202031A0302020202020202020202020202020202
        0202020203210623030202020202020202020202020202020202020324130F07
        2003020202020202020202020202020202020319251D1411081E030202020202
        02020202020202020203172D28261F0322091B03020202020202020202020202
        0315302E2C27030203120A1C030202020202020202020202033332312A030202
        0203100E1803020202020202020202020329342B03020202020202030F160302
        020202020202020202032F03020202020202020203110B030202020202020202
        0202030202020202020202020203050C03020202020202020202020202020202
        02020202020202030D0302020202020202020202020202020202020202020202
        0304030202020202020202020202020202020202020202020202030302020202
        0202020202020202020202020202020202020202030202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202}
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnCancelar: TBitBtn
      Left = 324
      Top = 3
      Width = 110
      Height = 30
      Caption = 'Cancelar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FF0005B70005B70005
        B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0005B70005B70005B7FF00FFFF00FFFF00FFFF00FF
        0005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FFFF
        00FFFF00FFFF00FF0005B70005B70005B70005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B700
        05B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006
        F60005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FF0005B700
        05B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF0005B70005B70005B70005B7FF00FFFF00FF0005
        B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B7
        0005B70005B70005B70005B70005B70005B7FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF0005B70005B70006F60005B70006F60005B70005B7FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF0005B70005B70005B70006F60005B7FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F60005B70005
        B70006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0005B70005B70006F6
        0005B70006F60006F60006F60005B70006F6FF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60005B70006F6FF00FFFF00FF0006F60006F60006F60006F6FF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0006F60006F60005B70006F60006F6FF00FFFF00FFFF00FFFF00FF0006F600
        06F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F6FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006F60006F6FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0006F6FF00FFFF00FFFF00FFFF00FFFF00FF0006F60006F60006F60006
        F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0006F6
        0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF0006F60006F60006F6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object pgcCampos: TRzPageControl
    Left = 0
    Top = 25
    Width = 457
    Height = 324
    Hint = ''
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 22
    object TabSheet1: TRzTabSheet
      Caption = 'Info. General'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 17
        Top = 11
        Width = 112
        Height = 16
        Caption = 'Impresora Recibos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 17
        Top = 150
        Width = 121
        Height = 16
        Caption = 'D'#237'as de Vencimiento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 17
        Top = 180
        Width = 77
        Height = 16
        Caption = 'Monto Inicial:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 17
        Top = 210
        Width = 108
        Height = 16
        Caption = 'Tama'#241'o del papel:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkRedondeoDecimales: TCheckBox
        Left = 17
        Top = 39
        Width = 144
        Height = 17
        Caption = 'Redondeo Decimales'
        TabOrder = 1
      end
      object chkRedondeoFactor5: TCheckBox
        Left = 17
        Top = 64
        Width = 144
        Height = 17
        Caption = 'Redondeo Factor 5'
        TabOrder = 2
      end
      object cbImpresoraRecibos: TComboBoxEx
        Left = 172
        Top = 8
        Width = 261
        Height = 25
        ItemsEx = <>
        TabOrder = 0
        Text = 'cbImpresoraRecibos'
      end
      object chkCodigoBarrasDirecto: TCheckBox
        Left = 17
        Top = 91
        Width = 144
        Height = 17
        Caption = 'C'#243'digo Barras Directo'
        TabOrder = 3
      end
      object speDiasVencimiento: TSpinEdit
        Left = 172
        Top = 145
        Width = 121
        Height = 26
        MaxValue = 0
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object edtMontoInicial: TCurrencyEdit
        Left = 172
        Top = 177
        Width = 121
        Height = 24
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 6
      end
      object cbPapelSize: TComboBoxEx
        Left = 172
        Top = 207
        Width = 261
        Height = 25
        ItemsEx = <>
        TabOrder = 7
        Text = 'cbPapelSize'
      end
      object chkImpuestoIncluido: TCheckBox
        Left = 17
        Top = 119
        Width = 160
        Height = 17
        Caption = 'Impuesto Incluido'
        TabOrder = 4
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Consecutivos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 270
      object Label2: TLabel
        Left = 16
        Top = 19
        Width = 54
        Height = 16
        Caption = 'Facturas:'
      end
      object Label6: TLabel
        Left = 16
        Top = 43
        Width = 56
        Height = 16
        Caption = 'Compras:'
      end
      object Label7: TLabel
        Left = 16
        Top = 67
        Width = 64
        Height = 16
        Caption = 'Proformas:'
      end
      object Label8: TLabel
        Left = 16
        Top = 90
        Width = 63
        Height = 16
        Caption = 'Apartados:'
      end
      object Label9: TLabel
        Left = 16
        Top = 114
        Width = 82
        Height = 16
        Caption = 'Notas Cr'#233'dito:'
      end
      object Label10: TLabel
        Left = 16
        Top = 138
        Width = 102
        Height = 16
        Caption = 'Abonos Compras:'
      end
      object Label11: TLabel
        Left = 16
        Top = 162
        Width = 100
        Height = 16
        Caption = 'Abonos Facturas:'
      end
      object Label12: TLabel
        Left = 16
        Top = 186
        Width = 109
        Height = 16
        Caption = 'Abonos Apartados:'
      end
      object speFactura: TSpinEdit
        Left = 125
        Top = 16
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object speCompras: TSpinEdit
        Left = 125
        Top = 40
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object speProformas: TSpinEdit
        Left = 125
        Top = 64
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 2
        Value = 1
      end
      object speApartados: TSpinEdit
        Left = 125
        Top = 87
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 3
        Value = 1
      end
      object speNotasCredito: TSpinEdit
        Left = 125
        Top = 111
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 4
        Value = 1
      end
      object speRecibosCompras: TSpinEdit
        Left = 124
        Top = 135
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 5
        Value = 1
      end
      object speRecibosFacturas: TSpinEdit
        Left = 125
        Top = 159
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 6
        Value = 1
      end
      object speRecibosApartados: TSpinEdit
        Left = 125
        Top = 183
        Width = 97
        Height = 26
        MaxValue = 1000000
        MinValue = 1
        TabOrder = 7
        Value = 1
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Registro'
      ExplicitLeft = 4
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 270
      object Label13: TLabel
        Left = 24
        Top = 14
        Width = 115
        Height = 16
        Caption = 'Factura de Compra:'
      end
      object Label14: TLabel
        Left = 24
        Top = 45
        Width = 69
        Height = 16
        Caption = 'Comprador:'
      end
      object Label15: TLabel
        Left = 24
        Top = 77
        Width = 120
        Height = 16
        Caption = 'Fecha de la Compra:'
      end
      object Label25: TLabel
        Left = 24
        Top = 112
        Width = 37
        Height = 16
        Caption = 'Lugar:'
      end
      object edtFacturaCompra: TEdit
        Left = 180
        Top = 13
        Width = 253
        Height = 24
        TabOrder = 0
        Text = 'edtFacturaCompra'
      end
      object edtComprador: TEdit
        Left = 180
        Top = 43
        Width = 253
        Height = 24
        TabOrder = 1
        Text = 'edtComprador'
      end
      object dtpFechaCompra: TDateTimePicker
        Left = 180
        Top = 77
        Width = 137
        Height = 24
        Date = 42951.479202175930000000
        Time = 42951.479202175930000000
        TabOrder = 2
      end
      object edtLugarCompra: TEdit
        Left = 180
        Top = 110
        Width = 253
        Height = 24
        TabOrder = 3
        Text = 'edtLugarCompra'
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = 'Empresa'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label16: TLabel
        Left = 16
        Top = 11
        Width = 44
        Height = 16
        Caption = 'C'#233'dula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 16
        Top = 40
        Width = 50
        Height = 16
        Caption = 'Nombre:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 16
        Top = 69
        Width = 57
        Height = 16
        Caption = 'Direcci'#243'n:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 16
        Top = 98
        Width = 62
        Height = 16
        Caption = 'Tel'#233'fono1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 16
        Top = 127
        Width = 62
        Height = 16
        Caption = 'Tel'#233'fono2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 16
        Top = 155
        Width = 25
        Height = 16
        Caption = 'Fax:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 16
        Top = 184
        Width = 36
        Height = 16
        Caption = 'Email:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 16
        Top = 212
        Width = 31
        Height = 16
        Caption = 'Web:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 16
        Top = 242
        Width = 78
        Height = 16
        Caption = 'Raz'#243'n Social:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCedula: TEdit
        Left = 120
        Top = 8
        Width = 300
        Height = 24
        MaxLength = 100
        TabOrder = 0
        Text = 'edtCedula'
      end
      object edtNombre: TEdit
        Left = 120
        Top = 37
        Width = 300
        Height = 24
        MaxLength = 200
        TabOrder = 1
        Text = 'edtNombre'
      end
      object edtDireccion: TEdit
        Left = 120
        Top = 66
        Width = 300
        Height = 24
        MaxLength = 255
        TabOrder = 2
        Text = 'edtDireccion'
      end
      object edtTelefono1: TEdit
        Left = 120
        Top = 95
        Width = 300
        Height = 24
        MaxLength = 17
        TabOrder = 3
        Text = 'edtTelefono1'
      end
      object edtTelefono2: TEdit
        Left = 120
        Top = 124
        Width = 300
        Height = 24
        MaxLength = 17
        TabOrder = 4
        Text = 'edtTelefono2'
      end
      object edtEmail: TEdit
        Left = 120
        Top = 181
        Width = 300
        Height = 24
        MaxLength = 100
        TabOrder = 6
        Text = 'edtEmail'
      end
      object edtWeb: TEdit
        Left = 120
        Top = 209
        Width = 300
        Height = 24
        MaxLength = 200
        TabOrder = 7
        Text = 'edtWeb'
      end
      object edtRazonSocial: TEdit
        Left = 120
        Top = 239
        Width = 300
        Height = 24
        MaxLength = 200
        TabOrder = 8
        Text = 'edtRazonSocial'
      end
      object edtFax: TEdit
        Left = 120
        Top = 152
        Width = 300
        Height = 24
        MaxLength = 17
        TabOrder = 5
        Text = 'edtFax'
      end
      object CheckBox1: TCheckBox
        Left = 122
        Top = 273
        Width = 127
        Height = 17
        Caption = 'Usar Contabilidad'
        TabOrder = 9
      end
    end
  end
end
