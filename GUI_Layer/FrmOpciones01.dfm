object FormOpciones01: TFormOpciones01
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Opciones'
  ClientHeight = 468
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
    Caption = 'OPCIONES'
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
  object pnlAccion: TRzPanel
    Left = 0
    Top = 25
    Width = 457
    Height = 25
    Align = alTop
    BorderOuter = fsFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object pnlOpciones: TRzPanel
    Left = 0
    Top = 433
    Width = 457
    Height = 35
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 3
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
    Top = 50
    Width = 457
    Height = 383
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
    TabOrder = 2
    FixedDimension = 22
    object TabSheet1: TRzTabSheet
      Caption = 'Info. General'
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
      object Label2: TLabel
        Left = 273
        Top = 75
        Width = 128
        Height = 16
        Caption = 'Impresora Comandas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object Label3: TLabel
        Left = 273
        Top = 98
        Width = 107
        Height = 16
        Caption = 'Impuesto Servicio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 17
        Top = 224
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
      object Label9: TLabel
        Left = 17
        Top = 263
        Width = 40
        Height = 16
        Caption = 'Estilo::'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 17
        Top = 40
        Width = 122
        Height = 16
        Caption = 'Directorio Respaldos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 17
        Top = 302
        Width = 30
        Height = 16
        Caption = 'Tipo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 17
        Top = 334
        Width = 60
        Height = 16
        Caption = 'Vendedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 273
        Top = 153
        Width = 44
        Height = 16
        Caption = 'Idioma:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object chkRedondeoDecimales: TCheckBox
        Left = 17
        Top = 76
        Width = 144
        Height = 17
        Caption = 'Redondeo Decimales'
        TabOrder = 2
      end
      object chkRedondeoFactor5: TCheckBox
        Left = 17
        Top = 99
        Width = 144
        Height = 17
        Caption = 'Redondeo Factor 5'
        TabOrder = 3
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
      object cbImpresoraComandas: TComboBoxEx
        Left = 288
        Top = 67
        Width = 145
        Height = 25
        ItemsEx = <>
        TabOrder = 1
        Text = 'cbImpresoraComandas'
        Visible = False
      end
      object edtImpuestoServicio: TCurrencyEdit
        Left = 267
        Top = 120
        Width = 121
        Height = 24
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 4
      end
      object chkCodigoBarrasDirecto: TCheckBox
        Left = 17
        Top = 146
        Width = 144
        Height = 17
        Caption = 'C'#243'digo Barras Directo'
        TabOrder = 7
      end
      object speDiasVencimiento: TSpinEdit
        Left = 172
        Top = 221
        Width = 121
        Height = 26
        MaxValue = 0
        MinValue = 0
        TabOrder = 12
        Value = 0
      end
      object chkAplicarImpuestoServicio: TCheckBox
        Left = 403
        Top = 122
        Width = 18
        Height = 17
        TabOrder = 6
      end
      object chkImpuestoIncluido: TCheckBox
        Left = 17
        Top = 122
        Width = 160
        Height = 17
        Caption = 'Impuesto Incluido'
        TabOrder = 5
      end
      object GroupBox1: TGroupBox
        Left = 172
        Top = 253
        Width = 261
        Height = 35
        TabOrder = 13
        object rbWindows: TRadioButton
          Left = 16
          Top = 11
          Width = 89
          Height = 17
          Caption = 'Windows'
          TabOrder = 1
        end
        object rbClasico: TRadioButton
          Left = 127
          Top = 10
          Width = 89
          Height = 17
          Caption = 'Clasico'
          TabOrder = 0
        end
      end
      object chkSeguridad: TCheckBox
        Left = 17
        Top = 169
        Width = 144
        Height = 17
        Caption = 'Usar Seguridad'
        TabOrder = 9
      end
      object GroupBox2: TGroupBox
        Left = 172
        Top = 292
        Width = 261
        Height = 35
        TabOrder = 15
        object rbServidor: TRadioButton
          Left = 16
          Top = 11
          Width = 89
          Height = 17
          Caption = 'Servidor'
          TabOrder = 1
        end
        object rbCliente: TRadioButton
          Left = 127
          Top = 10
          Width = 89
          Height = 17
          Caption = 'Cliente'
          TabOrder = 0
        end
      end
      object cbVendedor: TComboBoxEx
        Left = 172
        Top = 331
        Width = 261
        Height = 25
        ItemsEx = <>
        TabOrder = 14
        Text = 'cbVendedor'
      end
      object chkAplicarBajarInventarioNC: TCheckBox
        Left = 17
        Top = 192
        Width = 248
        Height = 17
        Caption = 'Rebajar Inventario de Notas de Cr'#233'dito'
        TabOrder = 11
      end
      object cbIdioma: TComboBoxEx
        Left = 323
        Top = 150
        Width = 110
        Height = 25
        ItemsEx = <>
        TabOrder = 8
        Text = 'cbIdioma'
      end
      object flbIdiomas: TFileListBox
        Left = 315
        Top = 182
        Width = 106
        Height = 75
        Mask = '*.txt'
        TabOrder = 10
        Visible = False
      end
      object edtDirectorioRespaldos: TRzButtonEdit
        Left = 172
        Top = 37
        Width = 261
        Height = 24
        Text = ''
        TabOrder = 16
        ButtonGlyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
          9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
          E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
          FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
          B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
          FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
          DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
          B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
          BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
          D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
          6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
        ButtonNumGlyphs = 1
        ButtonKind = bkCustom
        AltBtnWidth = 15
        ButtonWidth = 15
        OnButtonClick = edtDirectorioRespaldosInvokeSearch
      end
    end
    object TabSheet5: TRzTabSheet
      Caption = 'Hacienda'
      object Label19: TLabel
        Left = 9
        Top = 16
        Width = 54
        Height = 16
        Caption = 'Sucursal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 9
        Top = 48
        Width = 56
        Height = 16
        Caption = 'Terminal:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 9
        Top = 78
        Width = 112
        Height = 16
        Caption = 'Certificado Archivo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label22: TLabel
        Left = 9
        Top = 110
        Width = 101
        Height = 16
        Caption = 'Certificado Clave:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label23: TLabel
        Left = 9
        Top = 142
        Width = 87
        Height = 16
        Caption = 'Usuario Token:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label24: TLabel
        Left = 9
        Top = 174
        Width = 75
        Height = 16
        Caption = 'Clave Token:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtSucursal: TEdit
        Left = 127
        Top = 13
        Width = 121
        Height = 24
        TabOrder = 0
        Text = 'edtSucursal'
      end
      object edtTerminal: TEdit
        Left = 127
        Top = 43
        Width = 121
        Height = 24
        TabOrder = 1
        Text = 'edtTerminal'
      end
      object edtCertificadoClave: TEdit
        Left = 127
        Top = 106
        Width = 300
        Height = 24
        TabOrder = 3
        Text = 'edtCertificadoClave'
      end
      object edtUsuarioToken: TEdit
        Left = 125
        Top = 137
        Width = 300
        Height = 24
        TabOrder = 4
        Text = 'edtUsuarioToken'
      end
      object edtClaveToken: TEdit
        Left = 125
        Top = 169
        Width = 300
        Height = 24
        TabOrder = 5
        Text = 'edtClaveToken'
      end
      object edtCertificadoArchivo: TButtonedEdit
        Left = 127
        Top = 73
        Width = 300
        Height = 24
        Images = ImageList1
        RightButton.ImageIndex = 0
        RightButton.Visible = True
        TabOrder = 2
        Text = 'edtCertificadoArchivo'
        OnRightButtonClick = edtCertificadoArchivoRightButtonClick
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Ordenes'
      object Label5: TLabel
        Left = 17
        Top = 26
        Width = 75
        Height = 16
        Caption = 'Impresora 1:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 17
        Top = 57
        Width = 75
        Height = 16
        Caption = 'Impresora 2:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 17
        Top = 88
        Width = 75
        Height = 16
        Caption = 'Impresora 3:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 17
        Top = 119
        Width = 75
        Height = 16
        Caption = 'Impresora 4:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cbImpresora1: TComboBoxEx
        Left = 172
        Top = 23
        Width = 261
        Height = 25
        ItemsEx = <>
        TabOrder = 0
        Text = 'cbImpresora1'
      end
      object cbImpresora2: TComboBoxEx
        Left = 172
        Top = 54
        Width = 261
        Height = 25
        ItemsEx = <>
        TabOrder = 1
        Text = 'cbImpresora2'
      end
      object cbImpresora3: TComboBoxEx
        Left = 172
        Top = 85
        Width = 261
        Height = 25
        ItemsEx = <>
        TabOrder = 2
        Text = 'cbImpresora3'
      end
      object cbImpresora4: TComboBoxEx
        Left = 172
        Top = 116
        Width = 261
        Height = 25
        ItemsEx = <>
        TabOrder = 3
        Text = 'cbImpresora4'
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Contabilidad'
      object chkUsarContabilidad: TCheckBox
        Left = 17
        Top = 17
        Width = 144
        Height = 17
        Caption = 'Usar Contabilidad'
        TabOrder = 0
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = 'Conexiones'
      object pnlConexionesOpcioes: TPanel
        Left = 0
        Top = 0
        Width = 453
        Height = 105
        Align = alTop
        TabOrder = 0
        object Label11: TLabel
          Left = 16
          Top = 11
          Width = 16
          Height = 16
          Caption = 'IP:'
        end
        object Label12: TLabel
          Left = 16
          Top = 57
          Width = 71
          Height = 16
          Caption = 'Comentario:'
        end
        object Label14: TLabel
          Left = 16
          Top = 35
          Width = 86
          Height = 16
          Caption = 'Base de Datos:'
        end
        object Label16: TLabel
          Left = 16
          Top = 81
          Width = 48
          Height = 16
          Caption = 'Usuario:'
        end
        object Label17: TLabel
          Left = 224
          Top = 81
          Width = 36
          Height = 16
          Caption = 'Clave:'
        end
        object edtConexionesIP: TEdit
          Left = 104
          Top = 8
          Width = 182
          Height = 24
          TabOrder = 1
          Text = 'edtConexionesIP'
        end
        object btnAgregarConexiones: TBitBtn
          Left = 292
          Top = 6
          Width = 75
          Height = 30
          Caption = 'Agregar'
          TabOrder = 0
          OnClick = btnAgregarConexionesClick
        end
        object btnEliminarClientes: TBitBtn
          Left = 292
          Top = 42
          Width = 75
          Height = 30
          Caption = 'Eliminar'
          TabOrder = 3
          OnClick = btnEliminarClientesClick
        end
        object edtConexionesComentarios: TEdit
          Left = 104
          Top = 54
          Width = 182
          Height = 24
          TabOrder = 4
          Text = 'edtConexionesComentarios'
        end
        object edtConexiuonesBaseDatos: TEdit
          Left = 104
          Top = 30
          Width = 182
          Height = 24
          TabOrder = 2
          Text = 'edtConexiuonesBaseDatos'
        end
        object edtConexionesUsuario: TEdit
          Left = 104
          Top = 78
          Width = 113
          Height = 24
          TabOrder = 5
          Text = 'edtConexionesUsuario'
        end
        object edtConexionesClave: TEdit
          Left = 312
          Top = 78
          Width = 113
          Height = 24
          TabOrder = 6
          Text = 'edtConexionesClave'
        end
      end
      object stbEstadoConexiones: TStatusBar
        Left = 0
        Top = 338
        Width = 453
        Height = 19
        Panels = <
          item
            Width = 50
          end>
      end
      object lvLista1: TListView
        Left = 0
        Top = 105
        Width = 453
        Height = 233
        Align = alClient
        Checkboxes = True
        Columns = <
          item
            MaxWidth = 25
            MinWidth = 25
            Width = 25
          end
          item
            Caption = 'IP'
            Width = 100
          end
          item
            Caption = 'Base de Datos'
            Width = 100
          end
          item
            Caption = 'Comentario'
            Width = 195
          end
          item
            Caption = 'Id'
            MaxWidth = 1
            Width = 0
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
      end
    end
  end
  object ImageList1: TImageList
    Left = 321
    Top = 65
    Bitmap = {
      494C0101010008001C0010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000000000FF314B6200AC7D7E000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005084B2000F6FE100325F8C00B87E
      7A00000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000032A0FE0037A1FF00106FE200325F
      8B00B67D7900000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF37A4FE00379FFF000E6D
      DE00355F8900BB7F7900000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF37A4FE00359E
      FF000F6FDE0035608B00A67B7F00000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF38A5
      FE00329DFF00156DCE00444F5B00000000FF9C6B6500AF887B00AF887E00AA80
      7500000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF3BABFF00A1CAE700AD867900A9837300E0CFB100FFFFDA00FFFFDD00FCF8
      CF00CCB29F00A1746B00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFC0917D00FCE9AC00FFFFCC00FFFFCF00FFFFD000FFFF
      DE00FFFFFA00E3D3D10099696500000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFB0897800FAD19200FEF4C200FFFFD000FFFFDA00FFFF
      F600FFFFFC00FFFFFC00B6938400000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFB0897800FEDA9700EDB47800FBEEBB00FFFFD300FFFFDC00FFFF
      F400FFFFF400FFFFE200E9DDBC00A67B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFB18A7800FFDE9900E9A16700F4D19900FEFCCC00FFFFD500FFFF
      DA00FFFFDC00FFFFD700EFE6C500A97E75000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFAA7F7300FAE0A400F0B77800EEBA7B00F6DDA600FEFBCC00FFFF
      D300FFFFD100FFFFD700D9C5A700A3756C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFCEB29300FFFEDD00F4D1A500EEBA7B00F2C78F00F8E1
      AB00FCF0BA00FCFACA00A3776F00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFA1746B00E1D4D300FFFEEE00F7CC8C00F0B47300F7C7
      8800FCE3A500C2A08800A5776C00000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF98686500BA958700EAD7A400EAD59E00E0C0
      9700A5776C00A5776C00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFA77E7000A9807300A478
      6E00000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF009FFF0000000000000FFF000000000000
      07FF00000000000083FF000000000000C1FF000000000000E10F000000000000
      F003000000000000FC01000000000000FC01000000000000F800000000000000
      F800000000000000F800000000000000FC01000000000000FC01000000000000
      FE03000000000000FF8F00000000000000000000000000000000000000000000
      000000000000}
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Certificado|*.p12'
    Title = 'Buscar Certificado'
    Left = 281
    Top = 73
  end
end
