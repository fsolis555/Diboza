object FormMantenimientoProductos01: TFormMantenimientoProductos01
  Left = 0
  Top = 0
  Caption = 'Productos'
  ClientHeight = 362
  ClientWidth = 584
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
    Width = 584
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
  object pnlOpciones: TRzPanel
    Left = 0
    Top = 25
    Width = 584
    Height = 64
    Align = alTop
    BorderOuter = fsFlat
    TabOrder = 1
    object btnInsertar: TBitBtn
      Left = 8
      Top = 6
      Width = 80
      Height = 50
      Caption = 'Nuevo'
      Glyph.Data = {
        76060000424D7606000000000000360400002800000018000000180000000100
        08000000000040020000220B0000220B00000001000000010000EFA53900EFA5
        5200FFB55200E7AD6B00F7BD6B00AD7B7300AD847300B5847300AD7B7B00AD73
        84009C7B8400A57B8400AD7B8400B57B8400B5848400BD848400E7B58400BD84
        8C00C68C8C00CE948C00DEA58C00EFC68C00F7C68C00D6949400D69C9400DE9C
        9400DEA59400E7A59400B5AD9400EFCE9400B5AD9C00EFCE9C00F7CE9C00F7D6
        9C00CEADA500BDB5A500DEC6A500EFCEA500F7CEA500F7D6A500CEBDAD00D6C6
        AD00F7D6AD00F7D6B500F7DEB500DEC6BD00E7CEBD00EFD6BD00F7DEBD00E7CE
        C600EFCEC600EFD6C600EFDEC600F7DEC600F7E7C600FFE7C600E7D6CE00E7DE
        CE00F7DECE00F7E7CE00FFE7CE00E7D6D600EFDED600F7E7D600FFE7D600FFEF
        D600EFDEDE00F7E7DE00F7EFDE00FFEFDE00F7EFE700FFEFE700FFF7E700F7EF
        EF00FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004D4D4D080E0E
        0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E4D4D4D4D4D093436302C2B2A271F1F1D
        1D1D1D1D1D1D1D0E4D4D4D4D4D09343635302B2A2A251F1F1D1D1D1D1D1D1D0E
        4D4D4D4D4D093A3B3535302B2A2A251F1F1D1D1D1D1D1D0E4D4D4D4D4D093B3F
        3B3530302B2A2A251F1F1D1D1D1D1D0E4D4D4D4D4D093F443F3B3535302B2A2A
        251F1F1D1D1D1D0E4D4D4D4D4D0C43443F3B3B3535302B2A2A251F1F1D1D1D0E
        4D4D4D4D4D0D4646443F3B3B3530302B2A2A251F1F1D1D0E4D4D4D4D4D0E464A
        46443F3F3B3530302B2A2A251F1F1D0E4D4D4D4D4D0F494A4646443F3B3B3530
        302B2A2A251F1D0E4D4D4D4D4D114B4C4A4646443F3B3B3535302B2A2A251F0E
        4D4D4D4D4D124B4E4B4A4646443F3B3B3530302B2A2A250E4D4D4D4D4D124B4E
        4E4B4A4646443F3B3B3530302B2A250E4D4D4D4D4D124B4E4E4E4B4A4646443F
        3B3B3530302B2A0E4D4D4D4D4D134B4E4E4E4E4B4A4646443F3B3B353030240B
        4D4D4D4D4D134B4E4E4E4E4E4B4A4646443F3B3B2F281C0A4D4D4D4D4D184B4E
        4E4E4E4E4E4B4A464444443928231E0A4D4D4D4D4D184B4E4E4E4E4E4E4E4B4A
        483E0706050505054D4D4D4D4D1A4B4E4E4E4E4E4E4E4C4B4A3107100301000E
        4D4D4D4D4D1A4B4E4E4E4E4E4E4E4E4E4C31071504020E4D4D4D4D4D4D1A4B4E
        4E4E4E4E4E4E4E4E4E380715040E4D4D4D4D4D4D4D1A4E4E4E4E4E4E4E4E4E4E
        4E3D07150E4D4D4D4D4D4D4D4D142E2F2F322E2E2E2E2D2D2D22070E4D4D4D4D
        4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D4D}
      TabOrder = 0
      OnClick = btnInsertarClick
    end
    object btnModificar: TBitBtn
      Left = 94
      Top = 6
      Width = 80
      Height = 50
      Caption = 'Modificar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000A87D78B78183
        B78183B78183B78183B78183B78183B78183B78183B78183B78183B78183B781
        83B78183B78183B78183B78183B78183B78183FF00FFFF00FFFF00FFFF00FFFF
        00FFA97F79F3DDC4F8E3C6F6DFBFF4DBB7F2D7B1F1D5ABF1D2A6F0D09FEFCE99
        F0CE98F0CE98F0CE98F0CE98F0CE98F0CE98F1CF98EFCD97B3897BFF00FFFF00
        FFFF00FFFF00FFFF00FFA97F7AF2DEC8F7E3CAF5DFC2F1D9BAECD4B1E8CEA9E6
        CAA3E8CA9FEBCB9CEDCB99EDCB96EECC97EECC97EECC97EECC97EFCD97EDCB96
        B3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF2E0CEF7E6CEF4E1C7EED8
        BDE2CCAED5BFA0CFB897D3B996DCC097E3C497E8C795EAC995EDCB96EECC97EE
        CC97EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF00FFA97F7AF3E3D2
        F8E8D3F4E2CBECD9C038373958534EA3927BB19E81BCA585C8AF89D4B78DDCBD
        8EE6C592EBCA95EDCB96EFCD97EDCB96B3897BFF00FFFF00FFFF00FFFF00FFFF
        00FFA97F7BF4E6D8F9EBD9F7E6D2EFDEC656524F3535372C424C4D5E5F9B8971
        A49074B29B7AC3A882D4B689E2C28FEAC995EDCB96EDCB96B3897BFF00FFFF00
        FFFF00FFFF00FFFF00FFAA807BF5E9DDFBEFE0F8EAD9F4E3D0BEB1A12255690C
        82AF106A8E1A566D546463907E67A08B6EB79D7ACBAE83DCBD8CE8C792EAC994
        B3897BFF00FFFF00FFFF00FFFF00FFFF00FFAD837DF5ECE3FBF2E6F9EDDEF7E8
        D6F0E1CC2E58680A84B10D81AD2F6B88424D5A5B4E5284705D968367AD9573C3
        A77DD8B988E3C290B1877AFF00FFFF00FFFF00FFFF00FFFF00FFB2887EF7EFE8
        FCF5ECFAEFE4F9ECDDF6E7D68D9D9D0B749B4A6B7FAA7B7BBC8888AB78787E55
        547F6D5A8F7D62A48D6CBBA078CEB083AB8375FF00FFFF00FFFF00FFFF00FFFF
        00FFB68B80F8F2EEFDF8F1FAF3EAF9EFE3F9ECDDF4E5D5185B74A37676D8A4A4
        CA9696BC8888AB77777E55547E6C5889785E9A8666AF96709D786CFF00FFFF00
        FFFF00FFFF00FFFF00FFBA8E82FAF6F4FEFCF8FCF6F0FAF2EAFAF0E4F8ECDC69
        868FB08383E5B1B1D7A3A3C99595BB8787A77474754E4D7C6B5784735B948063
        8C6B61FF00FFFF00FFFF00FFFF00FFFF00FFBE9283FBF8F7FFFFFEFEFAF6FCF5
        EFFAF2EAFAF0E3F7EADB946B6AE9B7B7E4B1B1D6A3A3C99595BB8787A3727275
        4E4D7B6A5786745C7C5F56FF00FFFF00FFFF00FFFF00FFFF00FFC29685FBF8F7
        FFFFFFFFFEFCFEF9F4FCF6EFFBF3EAFAEFE3E8D8CA946B6AE9B6B6E4B0B0D6A2
        A2C89494BA8686A37171754E4E806D59735951FF00FFFF00FFFF00FFFF00FFFF
        00FFC69986FBF8F7FFFFFFFFFFFFFFFDFCFEF9F5FCF6F0FAF2EAFAF0E4E8D8CA
        8C6362E8B6B6E3B0B0D5A2A2C89494BA8686A271717852506E564FFF00FFFF00
        FFFF00FFFF00FFFF00FFCA9C88FBF8F7FFFFFFFFFFFFFFFFFFFFFEFCFEF9F5FC
        F6EFFBF2EAFAEFE3CAB5AB8C6362E8B5B5E3AFAFD5A1A1C79393B98585A27070
        754F4EFF00FFFF00FFFF00FFFF00FFFF00FFCEA089FCF9F7FFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFCFEF9F5FCF5EFFBF2E9FAF0E3CAB5AB8C6362E7B5B5E2AFAFD4
        A1A1C79393B98585A17070764E4EFF00FFFF00FFFF00FFFF00FFD2A38AFCF9F7
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFDFAF5FCF6EFFAF2E9FAEFE2CBB5
        ABA77B7BF0BCBCE2AEAED4A0A0C692929869695C63704F6271FF00FFFF00FFFF
        00FFD7A78CFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFDF9F4
        FCF5EEFCF5EBEEDDD19C6F67A77B7BEFBCBCE1AEAE6E697207A1D100BCEF00B9
        EC009ED1FF00FFFF00FFDAAB8DFCF9F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFBFDF9F4FFFBF3E3CEC6B38176BC9171A67B7BD0A0A01594BD
        00CCFF00CCFF00B9EC0130B100009AFF00FFDEAD8EFDFAF8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFEF9E5D1CBB38176EFC48DC7
        95618C626200B3E600CCFF00A3DC0130B1041CB10316AC00009ADEAD8EFDFAF8
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D4
        D0B38176EFC38CF3BA6C93646500A9DC00C2F50443BA113CE40C36C80732C203
        16ACDEAD8EFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE9DBD9B38176F1C58BB88285FF00FFFF00FF019CCF1A37CD456A
        F81E47D80833C2020EA5DAA482DAA482DAA482DAA482DAA482DAA482DAA482DA
        A482DAA482DAA482DAA482DAA482DAA482B38176B88285FF00FFFF00FFFF00FF
        FF00FF293BCD6D8AFD2B53EA0515ACFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF2538CC0E1BB8FF00FFFF00FF}
      TabOrder = 1
      OnClick = btnModificarClick
    end
    object btnEliminar: TBitBtn
      Left = 180
      Top = 6
      Width = 80
      Height = 50
      Caption = 'Eliminar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF2BC85F4C490F4C997F4C794
        F3C38FF4BF88F2BE87F3C089F2BE87F2BE87F2BE87FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF8D9ACFBE9C2FB
        E9C2FAE0B6F7D6A8F4CB99F3C18CF3C089F5C793F6CE9DF7D2A2F5CD9CF3C08B
        F2BE87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFBE9
        C2FFFDDEFEF9D9FCEBC6FAE0B6F6D5A7F9CD9DF7C28EF4BF88FFCDA2FFD8B3FF
        E2BFFFE9C4FCEBC6F6CF9EF2BE87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFDF5D3FFFFE1FEF6D5FCEBC5FAE0B6FAD7AADBD09CE9CFA1F7CE
        A596BF7073B85C9AC77DEEE8C4FFF9DAFFF8D6F5CB9AF2BE87FF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFF8DBAFFFFFE2FEF9D9FBEBC6F9E0B7FFD9B0
        B7CA894AAE4056B04600940000920000910034A92FDDEBC4FFFFE7FAE3BBF2BE
        87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF2BD86F2BB83F7D6A8FEF5D3FD
        F3D0F9E3B9FFD7ACC9CE940398060094000397030C990A1BA018008F004CB447
        FCFDE7FBDEB4F2BE87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF2BD86F2BC
        85F1B981F3C48FF8DDB2FBE9C2FFE6C1D5D9A70F9B0E009400169D14C2E3BDF0
        F8EEF2BE87079908AECF8DFEC799F2BE87F2BE87FF00FFFF00FFFF00FFFF00FF
        FF00FFF2BF89F3C08BF2BF89F2BC85F2BB83F3C089FACC9DDDD8A90799080091
        0000920087CC84FCFEFBFFFFFF95D29265AF48FBC596F2BC85F2BE87FF00FFFF
        00FFFF00FFFF00FFFF00FFF5C593F6C798F5C696F5C594F5C391F4C28FF7BF8B
        EACB9E60BA5B60BB5D6AC06781C77BEDF6E9FFFFFFFFFFFFC2D8AAEBC28DF2BC
        85F2BE87FF00FFFF00FFFF00FFFF00FFF2BE87F8CEA3F9CFA6F9CEA4F8CDA2F8
        CCA0F7CB9EF9CA9CE9D3A9FBF8F1FFFFFFFFFFFFF2F7EED6ECD2CEE9CBC2E4BF
        D4DDB6F6C695F2BD86F2BE87FF00FFFF00FFFF00FFFF00FFF5C391FCD7B5FCD7
        B5FCD5B2FBD5B0FBD3AEFAD2ADFFD3ADD7D1A27CC676FFFFFFFFFFFFB6DFB21C
        9F190998080094005DB149FED0AAF4C18CF4C18CFF00FFFF00FFFF00FFFF00FF
        F7CEA2FEE1C3FDDEBFFDDDBDFDDBBBFDDBBBFDDBBBFFD9B9F9DFC337A82E80C9
        7DFFFFFFFFFFFF9BD39600940000940051B044FED8B7F7C595F7C595FF00FFFF
        00FFFF00FFFF00FFFBDCB6FFE9CBFEE6C7FEE5C6FEE4C5FEE3C4FEE2C3FEE0C0
        FFE6D0A2CD8B00920052B54D7CC77935AA3305960400940048AE3EFDDFC4FACC
        A1FACCA1F2BE87FF00FFFF00FFF3C38DFEEDCDFEF1D2FEEFD0FEEECEFEEDCDFE
        EBCCFEEBCCFEEACAFFE9CBFCEED753B44A008C00008F00009400009400179E15
        3DAC37FAE5CBFDD5AFFDD5AFF2BE87FF00FFFF00FFF6CD9CFFF9DAFFF9DAFFF8
        D8FFF5D6FFF5D5FFF4D4FFF3D4FFF2D3FEF1D1FFF1D6EEEED06DBF6324A22114
        9D1359B750D6E6C296CD86F2E9C9FFE0BDFFE0BDF2BE87FF00FFFF00FFF8DBAF
        FFFFE2FFFCDDFFFCDDFFFCDDFFFCDDFFFADCFFFADBFFFADBFFF9DAFFF8D8FFFA
        DCFFFAE3F4F4D8EFF2D3FFF6DEFFF5DBFFF5DBFDF1D4FDECCAFDECCAF2BE87FF
        00FFFF00FFFBE9C2FFFFE2FFFCDDFFFCDDFFFCDDFFFCDDFFFCDDFFFCDDFFFCDD
        FFFCDDFFFDDEFFFEDFFFFFE2FFFFE4FFFFE2FFFFE2FFFDDEFFFADBFFF9DAFEF6
        D5FEF6D5F5C793FF00FFFF00FFFCEFCCFFFFE2FFFCDDFFFCDDFFFCDDFFFCDDFF
        FDDEFFFDDEFFFEDFFFFFE2FFFFE2FDF5D3F9DEAEF7D199F7D199F8DBAAFCECC6
        FFF8D8FFFFE1FFFEDFFFFEDFF6CE9DFF00FFFF00FFF7D6A8FEFCDDFFFFE2FFFF
        E1FFFEDFFFFDDEFFFCDDFEF9D9FCF0CAFAE2B5F6CE96F2BA77F0B169F0B169F0
        B169F0B574F3C089FACF9FFDE2BAFFF5D5FFF5D5F6D5A7FF00FFFF00FFFF00FF
        F4C997F8D9ACF7D7AAF7D3A5F6D0A1F5CC9BF3C38DF2BB7FF1B777F1B473F1B5
        70F1B56FF1B56FF1B674F2BC83F6C592FACC9DFBCB9CFCD1A3F9CD9DFACC9DFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFF1B670F2BA7CF4C18CFACB9BFBCEA0FBCE9FFBCD
        9EFBCD9EFACC9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF7C693FBCE9F
        FBCE9FFBCE9FFBCE9FFBCE9FFBCEA0FF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFBCE9FFBCE9FFBCE9FFBCE9FFF00FFFF00FF}
      TabOrder = 2
      OnClick = btnEliminarClick
    end
    object btnRefrescar: TBitBtn
      Left = 266
      Top = 6
      Width = 80
      Height = 50
      Caption = 'Refrescar'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF004EAB004EAB004EAB004E
        AB004EAB004EABFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0077F1006DE40063D8
        005FCD0060C8005CC10054B7004EAB004794003A76FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007DFD0077F800
        75F32988ED67A9EC91C1F0A3CAF1A2C9F18BBCEC5C9DE01C73CD0053B3004797
        003D7CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF007C
        FF0078FF3597FDAAD3FCF4F9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA
        F3FD93BFED2274CB004CA7003C7BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF027FFF0982FF8EC5FFF5FAFFFFFFFFFFFFFFD8E8FBD8E8FBC2DCFACEE2
        FAD8E7FBD8E7FBFFFFFFFFFFFFE7F1FC6CA5E00054B1003D7EFF00FFFF00FFFF
        00FFFF00FFFF00FF0A84FF0A84FFA6D2FFFFFFFFFFFFFFE1EDFDB0D3FA1577EB
        086DE8076CE7056AE70469E61876E8C2DCFAFFFFFFFFFFFFFFFFFF72A8E1004E
        AB003E7EFF00FFFF00FFFF00FFFF00FF0380FF7CBDFFFFFFFFFFFFFFE2EEFD5A
        A4F70F75EC0D72EB0C70EA1375EA086DE8076CE7056AE7056AE66EABF2E0ECFC
        FFFFFFF3F8FC2F7DCC004DA5FF00FFFF00FFFF00FF0F86FF2390FFE6F3FFFFFF
        FFE2EFFD52A0F7167AEF1378EE6FACF5D2E5FBF4F8FEF3F8FECEE2FB67A5F006
        6BE70569E661A4F1E0ECFCFFFFFFB6D2EE025ABA0053A9FF00FFFF00FF0A84FF
        79BBFFFFFFFFFFFFFF8CC2FB1B80F31C80F2B0D3FAFFFFFFA4CBF861A3F267A7
        F2A4CAF7FFFFFFA1C7F6076CE8056AE7A4CBF7FFFFFFFDFDFD3F89D40058BEFF
        00FF1B8CFF188BFFC5E1FFFFFFFFFEFFFF2287F61F84F57DB8F9FFFFFF5DA4F4
        157BF01478EE1176ED1176EC569DF0FFFFFF67A5F1076DE8247FEBE0ECFCFFFF
        FF91BDE90061CF0053A91B8CFF3097FFF1F8FFFFFFFFC4E1FE268AF7278AF6D6
        E9FDAAD0FB1C80F23E94F52384F2147AEF1679EF1075EDA7CCF8D2E5FB0A6FEA
        086EE9CAE1FBFFFFFFC9DFF60470DE0069D71D8DFF52A7FFFCFDFFFFFFFF83BF
        FE298EF92F91F8F4F9FF67ADF92A8BF61D82F41B80F2187DF1167BEF1379EE60
        A4F3EBF4FD0D72EB0B70EA96C3F6FFFFFFEAF3FD0E7CEC0073ED2591FF70B7FF
        FEFFFFFFFFFF7FBDFE2C91FC298FFAF7FBFF6BB0FA2388F74198F61D83F61C81
        F31B80F2197FF11E7FF03A8DF11075EC0E73EC89BBF6FFFFFFF1F8FF1081F400
        77F12E95FF82C0FFFFFFFFFFFFFF94C8FF2F94FD2D92FCDFEEFE9FCCFD278CF9
        D4E8FDA9D1FC3892F61E82F31B80F3187EF1177CF01479EF1277ED9FCAF8FFFF
        FFE8F4FF0D82F70078F53297FF86C2FFFAFDFFFFFFFFD8EBFF3196FD3095FD8D
        C4FEF8FCFF5BA9FCD6E9FEFFFFFFE4F1FE7AB6FA2788F41E83F41A7FF2187DF1
        177BF0D3E6FCFFFFFFC7E3FF047DFA0079F757AAFF75BAFFEEF7FFFFFFFFFFFF
        FF45A1FF3297FE389AFDCAE4FEF8FBFFF1F8FFFFFFFFFFFFFFFFFFFFD3E7FE60
        A8F91E83F41B81F24297F6FFFFFFFFFFFF8CC5FF0076FD0079F7FF00FF58ABFF
        D9ECFFFFFFFFFFFFFFC1E0FF3398FF3298FE3D9DFEA5D1FEFBFDFFFFFFFFFFFF
        FFF9FCFFA6CFFD479CF92287F62185F6C3DEFDFFFFFFFCFEFF389BFF007AFFFF
        00FFFF00FF5DADFFACD5FFFEFFFFFFFFFFFFFFFF8EC6FF3398FF3398FF3297FF
        E4F1FFFFFFFFC2DFFE56A7FC298FFA288CF9288CF7CAE5FFFFFFFFFFFFFFACD5
        FF017FFF017FFFFF00FFFF00FFFF00FF6FB7FFE8F4FFFFFFFFFFFFFFFFFFFFA5
        D1FF3599FF3C9CFFBDDDFF7ABBFE3095FE2F93FD2C92FB2F92FBB9DAFEFFFFFF
        FFFFFFEDF6FF2A94FF027FFFFF00FFFF00FFFF00FFFF00FF77BAFFA3D0FFFAFD
        FFFFFFFFFFFFFFFFFFFFFAFDFF92C8FF56AAFF46A2FF46A1FE5BACFEA1CFFEFF
        FFFFFFFFFFFFFFFFFCFEFF64B1FF017FFF0A84FFFF00FFFF00FFFF00FFFF00FF
        FF00FF76B9FFAFD7FFF5FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDCEDFF60AFFF0782FF0F86FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF79BBFF91C8FFDBEDFFFAFDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDF6FFA1CFFF3599FF0E85FF1489FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF97CAFF75B9FF9E
        CEFFCAE5FFE3F1FFEDF6FFEDF6FFE6F3FFD4E9FFABD4FF6DB5FF3097FF1D8DFF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FF95C9FF75B9FF75B9FF7BBCFF7BBCFF6DB5FF58ABFF44A1FF2D
        95FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 3
      OnClick = btnRefrescarClick
    end
    object btnCerrar: TBitBtn
      Left = 352
      Top = 6
      Width = 80
      Height = 50
      Caption = 'Cerrar'
      Glyph.Data = {
        3E040000424D3E04000000000000FE0100002800000018000000180000000100
        08000000000040020000120B0000120B0000720000007200000000000000FFFF
        FF00FF00FF0069333400CD676800CC666700CF696A00CE686900D06A6B00D26C
        6D00D16B6C00C6666700D46E6F00D36D6E00D6707100D56F7000D7717200D973
        7400D8727300D26F7000DB757600DA747500DD777800DC767700DF797A00DE78
        7900E17B7C00E07A7B00E37D7E00E27C7D00C0696A00E57F8000E47E7F00E781
        8200E6808100E9838400E8828300EB858600EA848500ED878800EC868700B366
        6700EF898A00EE888900B4676800F18B8C00F08A8B00B6696A00F48E8F00F38D
        8E00F28C8D00B0666700F6909100F58F9000E7878800B96C6D00F8929300F791
        9200BB6E6F00FB959600FA949500F9939400FD979800FC969700BE717200AF68
        6900FF999A00FE989900C0737400F9969700C3767700F2939400DF898A00C87B
        7C00C67C7D00C0797A00FEA2A300A76C6D00FDA8A900F3A6A700FCAFB000ECA6
        A700F0AAAB00FBB6B700FABCBD00F5BBBC00F2B9BA00F9C5C600B86B6B00AE66
        6600BD707000C2757500C5787800C77A7A00A7666600CA7D7D00CD808000CC7F
        7F00A3666600A0666600B3737300AD7070009A666600F0B0B000F9C2C200F2D9
        C000FFFFDD00E2F8CC00C7F0BC0073B8760059B2670079DD900060D6810033CB
        6700020202020202020202020266030202020202020202020202020202020202
        02026666625E0302020202020202020202020202020202666663330B05290302
        020202020202020202020202026666411E060704042903596666666666666666
        020202020266130F0C0D090A082C034C4E505354685757660202020202661112
        100E0F0C0D2F036E71717171717157660202020202661714151112100E58036E
        71717171717157660202020202661818191617141537036E7171717171715766
        0202020202661C1D1A1B1819163A036E7171717171715766020202020266221F
        201C1D1A1B5A036E71717171717157660202020202662324212236512040036D
        7171717171715766020202020266272825265601674403696C6F6F7070705766
        0202020202662E2A2B275501525B03696A6A6A6A6B6B57660202020202663132
        2D2E2A4F274603696A6A6A6A6A6A57660202020202663434353031322D5C0369
        6A6A6A6A6A6A57660202020202663C3D38393435305D03696A6A6A6A6A6A5766
        0202020202663E3F3B3C3D38394903696A6A6A6A6A6A57660202020202664242
        433E3E3F3B5F03696A6A6A6A6A6A576602020202026642424242424343610369
        6A6A6A6A6A6A5766020202020266454242424242426003696A6A6A6A6A6A5766
        020202020266664B48424242426003696A6A6A6A6A6A57660202020202020266
        664D4A474260035E666666666666666602020202020202020202666665640302
        0202020202020202020202020202020202020202026603020202020202020202
        0202}
      TabOrder = 4
      OnClick = btnCerrarClick
    end
  end
  object stbEstado1: TRzStatusBar
    Left = 0
    Top = 343
    Width = 584
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 5
    object RzStatusPane1: TRzStatusPane
      Left = 0
      Top = 0
      Width = 465
      Height = 19
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Caption = ''
    end
  end
  object pnlFiltro: TRzPanel
    Left = 0
    Top = 89
    Width = 584
    Height = 58
    Align = alTop
    BorderOuter = fsFlat
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label2: TLabel
      Left = 310
      Top = 8
      Width = 50
      Height = 16
      Caption = 'Nombre:'
    end
    object Label1: TLabel
      Left = 10
      Top = 8
      Width = 44
      Height = 16
      Caption = 'C'#243'digo:'
    end
    object Label3: TLabel
      Left = 10
      Top = 34
      Width = 85
      Height = 16
      Caption = 'C'#243'digo Barras:'
    end
    object edtBuscar_Nombre: TRzButtonEdit
      Left = 366
      Top = 6
      Width = 150
      Height = 24
      Text = ''
      TabOrder = 0
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
      OnButtonClick = edtBuscar_NombreInvokeSearch
    end
    object edtBuscar_Codigo: TRzButtonEdit
      Left = 110
      Top = 6
      Width = 150
      Height = 24
      Text = ''
      TabOrder = 1
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
      OnButtonClick = edtBuscar_CodigoInvokeSearch
    end
    object edtBuscar_CodigoBarras: TRzButtonEdit
      Left = 110
      Top = 31
      Width = 150
      Height = 24
      Text = ''
      TabOrder = 2
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
      OnButtonClick = edtBuscar_CodigoBarrasInvokeSearch
    end
  end
  object pnlListaTitulo: TRzPanel
    Left = 0
    Top = 147
    Width = 584
    Height = 22
    Align = alTop
    BorderOuter = fsFlat
    Caption = 'Lista'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object chkTodoLista1: TCheckBox
      Left = 8
      Top = 6
      Width = 14
      Height = 17
      TabOrder = 0
      OnClick = chkTodoLista1Click
    end
  end
  object lvLista1: TRzListView
    Left = 0
    Top = 169
    Width = 584
    Height = 174
    Align = alClient
    Checkboxes = True
    Columns = <
      item
        MaxWidth = 25
        Width = 25
      end
      item
        Caption = 'C'#243'digo'
        Width = 100
      end
      item
        Caption = 'Nombre'
        Width = 130
      end
      item
        Alignment = taRightJustify
        Caption = 'Costo'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = 'Venta'
        Width = 100
      end
      item
        Alignment = taRightJustify
        Caption = 'Existencia'
        Width = 100
      end
      item
        Caption = 'Id'
        MaxWidth = 1
        Width = 1
      end
      item
        Caption = 'C.Barras'
        Width = 7
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 4
    ViewStyle = vsReport
  end
end
