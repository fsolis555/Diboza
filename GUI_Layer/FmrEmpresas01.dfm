object FormEmpresas01: TFormEmpresas01
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Empresa'
  ClientHeight = 380
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
    Caption = 'EMPRESA'
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
    Top = 345
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
    object btnImportarServidor: TBitBtn
      Left = 64
      Top = 3
      Width = 138
      Height = 30
      Caption = 'Importar del Servidor'
      TabOrder = 2
      OnClick = btnImportarServidorClick
    end
  end
  object pgcCampos: TRzPageControl
    Left = 0
    Top = 25
    Width = 457
    Height = 320
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
      object Label1: TLabel
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
      object Label2: TLabel
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
      object Label3: TLabel
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
      object Label4: TLabel
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
      object Label5: TLabel
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
      object Label6: TLabel
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
      object Label7: TLabel
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
      object Label8: TLabel
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
      object Label9: TLabel
        Left = 16
        Top = 241
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
      object Label10: TLabel
        Left = 16
        Top = 271
        Width = 65
        Height = 16
        Caption = 'Red Social:'
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
        Top = 65
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
        Top = 238
        Width = 300
        Height = 24
        MaxLength = 200
        TabOrder = 8
        Text = 'edtRazonSocial'
      end
      object edtRedSocial: TEdit
        Left = 120
        Top = 266
        Width = 300
        Height = 24
        MaxLength = 200
        TabOrder = 9
        Text = 'edtRedSocial'
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
      object ShellListView1: TShellListView
        Left = 144
        Top = 110
        Width = 250
        Height = 150
        ObjectTypes = [otNonFolders]
        Root = 'rfDesktop'
        Sorted = True
        ReadOnly = False
        HideSelection = False
        TabOrder = 10
        Visible = False
        ViewStyle = vsReport
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Varios'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label14: TLabel
        Left = 17
        Top = 22
        Width = 128
        Height = 16
        Caption = 'Inicio de Operaciones:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dtpInicioOperaciones: TDateTimePicker
        Left = 151
        Top = 19
        Width = 121
        Height = 24
        Date = 42905.591539687500000000
        Time = 42905.591539687500000000
        TabOrder = 0
      end
    end
  end
end