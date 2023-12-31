object TasksGrid: TTasksGrid
  Left = 0
  Top = 0
  Width = 707
  Height = 270
  TabOrder = 0
  object GenerationUnitDescLabel: TLabel
    Left = 3
    Top = 197
    Width = 57
    Height = 13
    Caption = 'Description:'
  end
  object TasksGrid: TNextGrid6
    Left = 10
    Top = 3
    Width = 695
    Height = 188
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    OnDblClick = TasksGridDblClick
    ActiveView = TasksGridView
    ActiveViewIndex = 0
    Caption = 'TasksGrid'
    Options = [goArrowEndEditing, goAutoHideScrollBars, goExitEndEditing, goTabLeaveControl]
    ScrollBars = [sbVertical]
    SelectFullRow = True
    SelectionTextColor = clWindowText
    OnCellClick = TasksGridCellClick
    OnCellChange = TasksGridCellChange
    object TasksGridView: TNxReportGridView6
      ColumnMoving = False
    end
    object CheckColumn: TNxCheckBoxColumn6
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Index = 0
      ParentFont = False
      PlaceholderText = 'True'
      Position = 0
      Width = 23
      InsertString = 'False'
    end
    object GroupColumn: TNxTextColumn6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Caption = 'Group'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.ParentFont = False
      Index = 1
      ParentFont = False
      PlaceholderText = 'Text Text'
      Position = 1
      Width = 100
    end
    object CategoryColumn: TNxTextColumn6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Caption = 'Category'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.ParentFont = False
      Index = 2
      PlaceholderText = 'Text Text'
      Position = 2
      Width = 100
    end
    object PreviewColumn: TNxIconColumn6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Index = 3
      ParentFont = False
      Position = 3
      SortType = stAlphabetic
      Visible = False
      Width = 22
      InsertString = '0'
    end
    object NameColumn: TNxTextColumn6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Caption = 'Template Name'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.ParentFont = False
      Index = 4
      ParentFont = False
      PlaceholderText = 'Text Text'
      Position = 4
      SortType = stCaseInsensitive
      Width = 220
    end
    object DocTypeColumn: TNxTextColumn6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Caption = 'Doc. Type'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.ParentFont = False
      Index = 5
      PlaceholderText = 'Text Text'
      Position = 5
      Width = 120
    end
    object FormatColumn: TNxTextColumn6
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Caption = 'Format'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.ParentFont = False
      Index = 6
      ParentFont = False
      PlaceholderText = 'Text Text'
      Position = 6
      Width = 60
    end
    object TutorialColumn: TNxIconColumn6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Caption = 'Tutorial'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = 14
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Index = 7
      Position = 7
      SortType = stAlphabetic
      Visible = False
      InsertString = '0'
    end
    object ParametersColumn: TNxIconColumn6
      AutoSize = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Footer.Font.Charset = DEFAULT_CHARSET
      Footer.Font.Color = clWindowText
      Footer.Font.Height = 14
      Footer.Font.Name = 'Tahoma'
      Footer.Font.Style = []
      Footer.FormatMask = '#,##0.00'
      Header.Caption = 'Opt.'
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'Tahoma'
      Header.Font.Style = []
      Header.ParentFont = False
      Index = 8
      ParentFont = False
      PlaceholderText = '0'
      Position = 8
      SortType = stAlphabetic
      Width = 70
      Images = CellValueImages
      InsertString = '0'
    end
  end
  object GenerationUnitDescPanel: TFlatPanel
    Left = 10
    Top = 216
    Width = 695
    Height = 52
    TabOrder = 1
    object GenerationUnitDescMemo: TMemo
      Left = 1
      Top = 1
      Width = 693
      Height = 50
      Align = alClient
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = True
      ParentCtl3D = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object CellValueImages: TImageList
    Left = 104
    Top = 202
    Bitmap = {
      494C010103000500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EFEF
      EF00D6D6D600CECECE00CECECE00CECECE00CECECE00CECECE00CECECE00CECE
      CE00CECECE00CECECE00CECECE00D6D6D600A5ADAD0084849400BD9CA500CECE
      D600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C6AD00845221007B42
      0000733900007B420000733900007B420000733900007B420000733900007B42
      00007339000084521800CEBDA500000000000000000000000000DEDEDE009C73
      7300943121008C312100297B8C00297B8C005A636B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B00949494007BA5BD004A7BC600847BA500BD9C
      A500CECED6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6C6AD008C633100BDB5AD00CED6
      DE00CED6DE00C6D6DE00CED6DE00CED6DE00CED6DE00C6D6DE00CED6DE00CED6
      DE00CED6DE00BDBDB5008C633100D6BDAD0000000000DEDEDE00A54A3900B539
      1000C6421800C642180029C6EF0021C6EF0008A5C6005A6B7300946B63009463
      5A008C5A5A008C5A5A00845252006B6B6B0084C6EF0052B5FF004A7BC600847B
      A500BD9CA500CECED60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B4A1000CECEC600EFEFEF00EFF7
      F700EFEFEF00EFF7F700EFEFEF00EFF7F700EFEFEF00EFF7F700EFEFEF00EFF7
      F700EFEFEF00EFF7F700BDBDB50084521800F7F7F700B56B5200C64A1000D673
      3100EFAD8C00E7D6CE00A5E7F70063D6EF0031CEEF0000A5CE00B59C7300FFC6
      8C00FFDECE00FFCEAD00845252006B6B6B00000000007BBDEF0052B5FF004A7B
      C600847BA500BD9CA500CECED600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000EFEFEF00F7F7F700EFF7
      F700F7F7F700EFF7F700F7F7F700EFF7F700F7F7F700EFF7F700F7F7F700EFF7
      F700F7F7F700DEE7E700DEE7EF0073390000DECEC600CE631800DE7B2100EFCE
      AD009C9C9C00D6D6D600FFFFFF00EFFFFF0063D6EF0021C6EF0031849400FFBD
      6300FFDEBD00FFCEAD00845252006B6B6B0000000000000000007BBDEF0052B5
      FF004A7BCE00847BA500C6B5B500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000F7F7F700EFF7F700F7F7
      F700FFFFFF00FFFFFF00FFFFFF00F7F7F700FFFFFF00FFFFFF00FFFFFF00F7F7
      F700EFF7F700E7E7EF00DEE7E7007B420000DEAD8400F77B0000FFB55A00EFF7
      F70031313100181818007B7B7B00E7DED600EFFFFF0039CEF70018A5C600FFBD
      6300FFE7C600FFCEAD00845252006B6B6B000000000000000000000000007BBD
      EF0052B5FF00528CD6009CA5A500C6A59C00CE9C8400CE9C8400CE9C8400CEA5
      8C00C6A59C00CED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000EFF7F700FFFFFF00FFFF
      FF00FFFFFF00F7F7F700FFFFFF00F7F7F700FFFFFF00F7F7F700F7FFFF00FFFF
      FF00F7FFFF00E7E7EF00E7EFEF0073390000AD9CB500DE7B2100FFB55A00EFF7
      F7006B6B6B0021212100000000006B636300F7EFEF0021C6EF0018A5C600FFBD
      6B00FFE7CE00FFCEB5008C5A5A006B6B6B000000000000000000000000000000
      00008CC6EF00BDC6C600BD8C8400D6AD8C00EFD6AD00FFF7CE00FFF7D600EFDE
      BD00DEB5A500C6A59400CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000F7FFFF00F7F7F700FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000F7F7F700E7EFEF00E7EFEF007B4200009CADF700104AFF007394FF00EFF7
      F7006B6B6B00737373009C9C9C00F7EFEF0094CEBD0010845A00215A3900FFBD
      6B00FFEFD600FFCEB500946363006B6B6B000000000000000000000000000000
      000000000000CEADA500DEAD8C00FFF7C600FFF7C600FFFFDE00FFFFEF00FFFF
      FF00FFFFFF00DEB5A500BD9C9400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000F7FFFF00FFFFFF00FFFF
      FF000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000FFFFFF00EFEFF700EFF7F70073390000E7EFF700295AF7005A7BFF009CAD
      F70094949400E7DED600FFEFF700BDE7D60021AD7B00007B5200637B6300FFC6
      7300FFEFDE00FFCEB500946B6B006B6B6B000000000000000000000000000000
      000000000000D6A58C00EFD6AD00FFE7B500FFFFC600FFFFDE00FFFFEF00FFFF
      FF00FFFFF700EFDEBD00CE9C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700EFEFF7007B420000FFFFFF0094ADF7002152FF005A84
      FF008C9CF7008CB5DE005ADEAD0008BD7B0000945A0018735A00DEB58C00FFDE
      B500FFF7E700FFCEBD009C736B006B6B6B000000000000000000000000000000
      000000000000CE9C8400FFEFC600FFDEAD00FFF7BD00FFFFD600FFFFE700FFFF
      EF00FFFFE700FFF7D600CE9C8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B420000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F7F7F700F7FFFF007339000000000000FFFFFF0094A5F7002952
      FF002142FF002142FF0000C6730000A56300318C7300CEBD9400FFD6A500FFF7
      EF00FFF7EF00FFCEBD00A57B73006B6B6B000000000000000000000000000000
      000000000000CE9C8400FFEFC600FFE7BD00FFF7C600FFFFCE00FFFFD600FFFF
      D600FFFFD600FFF7CE00CE9C8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000073390000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7F7F7007B4200000000000000000000FFFFFF00EFBD
      9400949CEF00949CEF0063BD9400ADBDA500EFCEA500FFE7CE00FFFFF700FFFF
      F700FFFFF700FFCEBD00A57B7B00848484000000000000000000000000000000
      000000000000CEA59400EFDEB500FFF7DE00FFE7BD00FFEFBD00FFF7BD00FFF7
      C600FFF7C600EFD6AD00C69C8400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008C5A2900DED6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00E7D6C60084522100000000000000000000000000EFB5
      8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C6B
      6B009C6B6B009C6B6B00AD847B00BDBDBD000000000000000000000000000000
      000000000000CEADAD00D6B59400FFFFFF00FFFFEF00FFF7CE00FFDEA500FFE7
      B500FFF7C600D6AD8C00C6A59C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEBDA500946B3900DECEC600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00EFE7DE0094633100D6BDAD00000000000000000000000000F7BD
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C6B
      6B00FFCEBD00E7944200BDBDBD00EFEFEF000000000000000000000000000000
      000000000000CED6D600CEA59400D6AD9C00EFDEBD00FFF7CE00FFEFC600EFD6
      AD00D6A58C00C69C8C00CED6D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6BDAD008C5A29007339
      00007B420000733900007B420000733900007B420000733900007B4200007339
      00007B4200007B4A1000D6C6AD0000000000000000000000000000000000F7C6
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B584
      7300CEA57300BDBDBD00EFEFEF00000000000000000000000000000000000000
      00000000000000000000CED6D600C6ADA500C69C8C00CE9C8400CE9C8400CEA5
      8C00C6ADA500CED6D60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEAD
      8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400DEAD8C00D6A58400B584
      7300D6D6D600EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFE0000FFF00008001C00007FF0000
      0000800003FF00000000000081FF000000000000C1FF000000000000E0030000
      00000000F001000000000000F801000000000000F801000000000000F8010000
      00008000F80100000000C000F80100000000E000F80100000000E000F8010000
      8001E001FC030000FFFFE003FFFF000000000000000000000000000000000000
      000000000000}
  end
end
