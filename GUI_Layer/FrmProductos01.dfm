object FormProductos01: TFormProductos01
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Productos'
  ClientHeight = 548
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
  object Label17: TLabel
    Left = 25
    Top = 34
    Width = 116
    Height = 16
    Caption = 'Cuenta de Ingresos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object pnlTitulo: TRzPanel
    Left = 0
    Top = 0
    Width = 457
    Height = 25
    Align = alTop
    BorderOuter = fsNone
    Caption = 'PRODUCTOS'
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
    Top = 513
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
    Height = 463
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 17
        Top = 11
        Width = 44
        Height = 16
        Caption = 'C'#243'digo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 17
        Top = 39
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
      object Label3: TLabel
        Left = 17
        Top = 68
        Width = 85
        Height = 16
        Caption = 'C'#243'digo Barras:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 17
        Top = 192
        Width = 63
        Height = 16
        Caption = 'Utilidad %:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 17
        Top = 223
        Width = 50
        Height = 16
        Caption = 'Compra:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 17
        Top = 253
        Width = 38
        Height = 16
        Caption = 'Venta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 17
        Top = 313
        Width = 60
        Height = 16
        Caption = 'Mayorista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 17
        Top = 98
        Width = 63
        Height = 16
        Caption = 'Proveedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 17
        Top = 160
        Width = 58
        Height = 16
        Caption = 'Impuesto:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 260
        Top = 192
        Width = 61
        Height = 16
        Caption = 'Existencia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 260
        Top = 223
        Width = 46
        Height = 16
        Caption = 'M'#237'nimo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label12: TLabel
        Left = 17
        Top = 282
        Width = 39
        Height = 16
        Caption = '+ Imp:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 17
        Top = 129
        Width = 46
        Height = 16
        Caption = 'Familia:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 17
        Top = 345
        Width = 75
        Height = 16
        Caption = 'Vencimiento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 17
        Top = 373
        Width = 32
        Height = 16
        Caption = 'Peso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 191
        Top = 412
        Width = 59
        Height = 16
        Caption = 'Comanda:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtCodigo: TEdit
        Left = 127
        Top = 8
        Width = 300
        Height = 24
        MaxLength = 100
        TabOrder = 0
        Text = 'edtCodigo'
        OnKeyPress = edtCodigoKeyPress
      end
      object edtNombre: TEdit
        Left = 127
        Top = 36
        Width = 300
        Height = 24
        MaxLength = 100
        TabOrder = 1
        Text = 'edtNombre'
      end
      object edtCodigoBarras: TEdit
        Left = 127
        Top = 65
        Width = 300
        Height = 24
        MaxLength = 100
        TabOrder = 2
        Text = 'edtCodigoBarras'
      end
      object edtUtilidad: TCurrencyEdit
        Left = 127
        Top = 189
        Width = 121
        Height = 24
        DisplayFormat = ',0.000;-,0.000'
        TabOrder = 8
        OnExit = edtUtilidadExit
      end
      object edtCosto: TCurrencyEdit
        Left = 127
        Top = 220
        Width = 121
        Height = 24
        DecimalPlaces = 3
        DisplayFormat = ',0.000;-,0.000'
        TabOrder = 11
      end
      object edtVenta: TCurrencyEdit
        Left = 127
        Top = 250
        Width = 121
        Height = 24
        DecimalPlaces = 3
        DisplayFormat = ',0.000;-,0.000'
        TabOrder = 13
        OnChange = edtVentaChange
      end
      object edtMayorista: TCurrencyEdit
        Left = 127
        Top = 310
        Width = 121
        Height = 24
        DecimalPlaces = 3
        DisplayFormat = ',0.000;-,0.000'
        TabOrder = 17
      end
      object cbProveedor: TComboBoxEx
        Left = 127
        Top = 95
        Width = 266
        Height = 25
        ItemsEx = <>
        TabOrder = 3
        Text = 'cbProveedor'
      end
      object cbImpuesto: TComboBoxEx
        Left = 127
        Top = 157
        Width = 145
        Height = 25
        ItemsEx = <>
        TabOrder = 7
        Text = 'cbImpuesto'
        OnChange = cbImpuestoChange
      end
      object edtExistencia: TCurrencyEdit
        Left = 327
        Top = 189
        Width = 97
        Height = 24
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 9
      end
      object edtMinimo: TCurrencyEdit
        Left = 327
        Top = 220
        Width = 97
        Height = 24
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 12
      end
      object edtVentaIVA: TCurrencyEdit
        Left = 127
        Top = 280
        Width = 121
        Height = 24
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 14
        OnChange = edtVentaIVAChange
      end
      object cbFamilia: TComboBoxEx
        Left = 127
        Top = 126
        Width = 266
        Height = 25
        ItemsEx = <>
        TabOrder = 5
        Text = 'cbFamilia'
      end
      object dtpVencimiento: TDateTimePicker
        Left = 127
        Top = 341
        Width = 121
        Height = 24
        Date = 42905.591539687500000000
        Time = 42905.591539687500000000
        TabOrder = 19
      end
      object rbFisico: TRadioButton
        Left = 320
        Top = 309
        Width = 113
        Height = 17
        Caption = 'F'#237'sico'
        TabOrder = 16
      end
      object rbServicio: TRadioButton
        Left = 320
        Top = 332
        Width = 113
        Height = 17
        Caption = 'Servicio'
        TabOrder = 18
      end
      object chkImpuestoIncluido: TCheckBox
        Left = 254
        Top = 284
        Width = 80
        Height = 17
        Caption = 'Imp. Inc.'
        TabOrder = 15
        OnClick = chkImpuestoIncluidoClick
      end
      object btnBuscar_Proveedores: TBitBtn
        Left = 399
        Top = 96
        Width = 25
        Height = 21
        Glyph.Data = {
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
        TabOrder = 4
        OnClick = btnBuscar_ProveedoresClick
      end
      object btnBuscar_Familias: TBitBtn
        Left = 399
        Top = 128
        Width = 25
        Height = 21
        Glyph.Data = {
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
        TabOrder = 6
        OnClick = btnBuscar_FamiliasClick
      end
      object btnMovimientoExistencias: TBitBtn
        Left = 423
        Top = 190
        Width = 25
        Height = 21
        Glyph.Data = {
          4A060000424D4A060000000000000A0400002800000018000000180000000100
          08000000000040020000120B0000120B0000F5000000F5000000FF00FF00F5F2
          F400B37E7F00C6979800E6C2C3009A6666009B6767009E6A6A00A06C6C009C69
          6900A36F6F00A5717100A77373009E6D6D00AA767600AC787800AE7A7A00A574
          7400A0707000B17D7D00B07C7C00A2727200A8777700A6767600B6828200B581
          8100B8848400B5828200AF7E7E00B6848400A7797900B3838300C6959500B388
          8800E6B0B000C0949400D9A8A800CD9F9F00B38B8B00B48D8D00B38C8C00C097
          9700F9C6C600E6B8B800C39C9C00C7A0A000C69F9F00F2C3C300C9A2A200BA96
          9600BB989800E6BCBC00C3A0A000D9B5B500C5A4A400CCABAB00CAAAAA00C9A9
          A900C6A7A700D9B8B800D3B3B300F2CFCF00C6A9A900D4B6B600D8BABA00D7B9
          B900D3B6B600D7BABA00CDB3B300D3B9B900E6CBCB00D8BEBE00D3BBBB00D9C1
          C100D7C1C100D3BDBD00E6D0D000DDC9C900D9C6C600E6D3D300E3D3D300F2E2
          E200E6D7D700E6D8D800EBDEDE00E8DBDB00E6D9D900F2E8E800EEE4E400EDE3
          E300EDE4E400F9F2F200F6EFEF00F4EDED00F3EDED00F9F5F500996665009B69
          67009D6C6B009E6D6B009C6B6700976A6600815E5B00C7AEAC00986B6600996C
          6700BC878200B7847F00A67A7500A277720099706C008B666200A67B7600A57A
          75009A6D67009A6E6800B3817500A57B6E00C9948200CA907800B7988A00CA8C
          6E00CFA08800C99B8500FDF9F700FFFDFC00D8A78B00D3A38900D5A68B00DAA4
          8200DCAB8D00DAAA8C00A9846D00FDFAF800F8F5F300F7F4F200DED0C600D7C8
          B900FCF5EE00F1EBE500FCF7F200FBF6F100FAF5F000F9F6F300F6EEE500F7E5
          CF00F9E8D300F6E5D100FAEEE000F9EFE300FCF6EF00F1BB7200F8DEBC00F5DE
          BF00E5D0B500F5E0C400F7E2C600F6E3CA00F8E5CD00F9EBD900FBF4EB00FBD3
          9800C2A77F00F2D2A400F0D1A300F1D3A600F3D4A900F7DAAF00F2D7AF00F1D6
          AF00F3D9B300F1D7B300ECD4B000E9D1AD00F4DCB800EED7B600F5DEBC00D6C2
          A400F6E0C100C5B6A000F7E4C900F7E5CB00EDDCC300DFD0BB00EEE1CE00F6EB
          DB00F8F0E400FBF3E800F9F1E600FBF6EF00FFBA4A00FCC56D00E9C89200F3D1
          9900F1CF9800EFCD9700EAC99400DFBF8D00D4B68600C9AC7F00F1CE9900EECC
          9700EBCA9500DBBC8B00F0CE9A00E9CA9700F1D19D00EFCF9B00F0D1A100F0D2
          A100EFD1A000C0A88100F1D3A500ECCFA200C1AA8400F1D4A700F1D4A800DDC3
          9A00F2D6AB00F1D6AA00EED3A800F1D6AD00E2CAA300CCB79600E2D0B400F0E7
          D900F9F0E200F6D59A00F4D29900BEA47800DABE8F00EACD9B00DAC09400C4AF
          8C00F7ECD900DCD2BF00F8EED800C4BCAB00FFF7E300F8F5EE00B7B1A100FDFB
          F500FFFFFD00FFFFFF0000000000000000000005050505050500000000000000
          0000000000000000000505213B04332402050500000000000000000000000000
          051E4F513C2923252F220C60666F6E6D716C6C6C706800051E5B450505050505
          05202A0C61E5C6C0C2C1C1E4E372000553480505050505050505032B0584C7C5
          CAC3C3C3C27205285E07324E120548280505053D1F64A2CBC4C9C3C3C272054E
          4A0A175959123EF33105052E3505D3E6CDC9C3C3C2720556390C0B165A4B063E
          5F1205214605D6E8E7CFCCC3C2720556370F1C50555E1144F32805264C05E9D9
          D5D2CECFC272054E47142CF3F35D4DF3F327053A4905DFDEDCD8D4D1C2720528
          5C1B0242F33834F3580807522663B1ADA9DAA5A4C87200055641181D13100F0E
          0C0B36530578E0AFABDDA5D0CE7200051E5F401A190214100F395F1E62B7B69C
          AEDBD0D0A3720000051E565743302D3F54561E0989B8939EB2AAD7D0A6720000
          000505284E56564E28050D88E1B9EA92B4B0A8A4A77300000000000505050505
          15678B90BCBAE2929D9B9998AC730000000000007BEF8787868F8D8E8AA0BB9F
          91B59B9AB3690000000000007AF17C7C7C85857C8C96BD94EEECEBEDF0650000
          000000007FF3F3F3F3F3F3857C7C7C9574747474747500000000000080F3F3F3
          F3F3F38585857D0174A19797976B0000000000007EF3F3F3F3F3F3858585F201
          74A197BE790000000000000083F3F3F3F3F3F37C7C7C7D0174A1BF7700000000
          0000000082F3F3F3F3F3F37C7C7C7C0174A17600000000000000000082818181
          8181818181818181746A00000000}
        TabOrder = 10
        OnClick = btnMovimientoExistenciasClick
      end
      object edtPeso: TCurrencyEdit
        Left = 127
        Top = 370
        Width = 121
        Height = 24
        DisplayFormat = ',0.00;-,0.00'
        TabOrder = 20
        OnChange = edtVentaChange
      end
      object chkPermitirDescuentos: TCheckBox
        Left = 17
        Top = 413
        Width = 168
        Height = 17
        Caption = 'Permitir Descuentos'
        TabOrder = 22
        OnClick = chkImpuestoIncluidoClick
      end
      object cbComanda: TComboBoxEx
        Left = 256
        Top = 407
        Width = 177
        Height = 25
        ItemsEx = <>
        TabOrder = 21
        Text = 'cbComanda'
        OnChange = cbImpuestoChange
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Varios'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object GroupBox1: TGroupBox
        Left = 24
        Top = 16
        Width = 201
        Height = 241
        Caption = 'M'#237'nimos'
        TabOrder = 0
        object Label21: TLabel
          Left = 16
          Top = 32
          Width = 38
          Height = 16
          Caption = 'Lunes:'
        end
        object Label22: TLabel
          Left = 16
          Top = 62
          Width = 44
          Height = 16
          Caption = 'Martes:'
        end
        object Label23: TLabel
          Left = 16
          Top = 92
          Width = 59
          Height = 16
          Caption = 'Miercoles:'
        end
        object Label24: TLabel
          Left = 16
          Top = 122
          Width = 43
          Height = 16
          Caption = 'Jueves:'
        end
        object Label25: TLabel
          Left = 16
          Top = 152
          Width = 48
          Height = 16
          Caption = 'Viernes:'
        end
        object Label26: TLabel
          Left = 16
          Top = 182
          Width = 48
          Height = 16
          Caption = 'Sabado:'
        end
        object Label27: TLabel
          Left = 16
          Top = 212
          Width = 55
          Height = 16
          Caption = 'Domingo:'
        end
        object edtMinimoLunes: TCurrencyEdit
          Left = 93
          Top = 29
          Width = 97
          Height = 24
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 0
        end
        object edtMinimoMartes: TCurrencyEdit
          Left = 93
          Top = 59
          Width = 97
          Height = 24
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 1
        end
        object edtMinimoMiercoles: TCurrencyEdit
          Left = 93
          Top = 89
          Width = 97
          Height = 24
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 2
        end
        object edtMinimoJueves: TCurrencyEdit
          Left = 93
          Top = 119
          Width = 97
          Height = 24
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 3
        end
        object edtMinimoViernes: TCurrencyEdit
          Left = 93
          Top = 149
          Width = 97
          Height = 24
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 4
        end
        object edtMinimoSabado: TCurrencyEdit
          Left = 93
          Top = 179
          Width = 97
          Height = 24
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 5
        end
        object edtMinimoDomingo: TCurrencyEdit
          Left = 93
          Top = 209
          Width = 97
          Height = 24
          DisplayFormat = ',0.00;-,0.00'
          TabOrder = 6
        end
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Otros'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label15: TLabel
        Left = 17
        Top = 69
        Width = 116
        Height = 16
        Caption = 'Cuenta de Ingresos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 17
        Top = 93
        Width = 105
        Height = 16
        Caption = 'Cuenta de Gastos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 17
        Top = 117
        Width = 104
        Height = 16
        Caption = 'Cuenta del Activo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 17
        Top = 143
        Width = 136
        Height = 16
        Caption = 'Cuenta de Desembolso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cbCuentaIngresos: TComboBoxEx
        Left = 159
        Top = 66
        Width = 266
        Height = 25
        ItemsEx = <>
        TabOrder = 0
        Text = 'cbCuentaIngresos'
      end
      object cbCuentaGastos: TComboBoxEx
        Left = 159
        Top = 90
        Width = 266
        Height = 25
        ItemsEx = <>
        TabOrder = 1
        Text = 'cbCuentaGastos'
      end
      object cbCuentaActivos: TComboBoxEx
        Left = 159
        Top = 114
        Width = 266
        Height = 25
        ItemsEx = <>
        TabOrder = 2
        Text = 'cbCuentaActivos'
      end
      object cbCuentaDesembolso: TComboBoxEx
        Left = 159
        Top = 140
        Width = 266
        Height = 25
        ItemsEx = <>
        TabOrder = 3
        Text = 'cbCuentaActivos'
      end
    end
  end
end
