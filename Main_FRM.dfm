object Main_Form: TMain_Form
  Left = 0
  Top = 0
  Caption = 'Isikuregister'
  ClientHeight = 372
  ClientWidth = 606
  Color = clBtnFace
  Constraints.MinHeight = 370
  Constraints.MinWidth = 606
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnShow = FormShow
  TextHeight = 15
  object Person_DBGrid: TDBGrid
    Left = 0
    Top = 41
    Width = 606
    Height = 312
    Align = alClient
    DataSource = Person_Source
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnTitleClick = Person_DBGridTitleClick
    Columns = <
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'Isikukood'
        ReadOnly = True
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nimi'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Perenimi'
        Width = 150
        Visible = True
      end
      item
        DropDownRows = 5
        Expanded = False
        FieldName = 'Linn_Lookup'
        PickList.Strings = (
          'Tallinn'
          'Rakvere')
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 353
    Width = 606
    Height = 19
    Panels = <
      item
        Text = 'Rekordi'
        Width = 50
      end>
    SimplePanel = True
    SimpleText = 'Isiku '
    ExplicitTop = 352
    ExplicitWidth = 602
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 606
    Height = 41
    Align = alTop
    BevelEdges = []
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = 'Panel1'
    Ctl3D = False
    ParentCtl3D = False
    ShowCaption = False
    TabOrder = 2
    ExplicitWidth = 602
    object SearchBox: TSearchBox
      Left = 238
      Top = 11
      Width = 144
      Height = 21
      HideSelection = False
      TabOrder = 0
      TextHint = 'Otsi'
      OnInvokeSearch = SearchBoxInvokeSearch
    end
    object DBNavigator1: TDBNavigator
      Left = 8
      Top = 8
      Width = 216
      Height = 25
      DataSource = Person_Source
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      ConfirmDelete = False
      TabOrder = 1
    end
    object Button1: TButton
      Left = 400
      Top = 11
      Width = 75
      Height = 21
      Caption = 'Tr'#252'ki'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 489
      Top = 11
      Width = 75
      Height = 21
      Caption = 'Seaded'
      TabOrder = 3
      OnClick = Button2Click
    end
  end
  object Person_Source: TDataSource
    DataSet = Person_Table
    OnDataChange = Person_SourceDataChange
    Left = 96
    Top = 280
  end
  object Cities_Table: TFDMemTable
    Active = True
    Constraints = <
      item
        FromDictionary = False
      end>
    FieldDefs = <
      item
        Name = 'Linna_Nimi'
        DataType = ftString
        Size = 25
      end>
    IndexDefs = <
      item
        Name = 'Cities_TableIndex1'
        CaseInsFields = 'Linna_Nimi'
        Fields = 'Linna_Nimi'
        Options = [ixUnique, ixCaseInsensitive]
      end>
    Indexes = <
      item
        Active = True
        Name = 'Cities_TableIndex1'
        Fields = 'Linna_Nimi'
        CaseInsFields = 'Linna_Nimi'
        Options = [soNoCase, soUnique]
      end>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired]
    UpdateOptions.CheckRequired = False
    LocalSQL = FDLocalSQL1
    StoreDefs = True
    Left = 184
    Top = 224
    object Cities_TableLinna_Nimi: TStringField
      DisplayLabel = 'Linna Nimi'
      DisplayWidth = 30
      FieldName = 'Linna_Nimi'
      KeyFields = 'Linna_Nimi'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Size = 25
    end
  end
  object Cities_Source: TDataSource
    DataSet = Cities_Table
    Left = 184
    Top = 280
  end
  object Person_frxReport: TfrxReport
    Version = '2022.2.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45055.893816064820000000
    ReportOptions.LastChange = 45055.902015266210000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 432
    Top = 224
    Datasets = <
      item
        DataSet = Person_frxDBDataset
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Frame.Typ = []
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8W = (
            'Isiku raport')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220472400000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Width = 83.601220540000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Isikukood')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 94.939810540000000000
          Width = 199.526375470000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nimi')
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 302.025246010000000000
          Width = 205.293644700000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Perenimi')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 507.318890720000000000
          Width = 210.791345500000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Linn')
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = Person_frxDBDataset
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 83.601220541632650000
          Height = 18.897650000000000000
          DataField = 'Isikukood'
          DataSet = Person_frxDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Isikukood"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 94.939810540000000000
          Width = 199.526375470000000000
          Height = 18.897650000000000000
          DataField = 'Nimi'
          DataSet = Person_frxDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Nimi"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 302.025246010000000000
          Width = 205.293644700000000000
          Height = 18.897650000000000000
          DataField = 'Perenimi'
          DataSet = Person_frxDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Perenimi"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 507.318890718625000000
          Width = 210.791345501847400000
          Height = 18.897650000000000000
          DataField = 'Linn'
          DataSet = Person_frxDBDataset
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."Linn"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date] [Time]')
        end
        object Memo13: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 642.520100000000000000
          Top = 1.000000000000000000
          Width = 75.590600000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Page [Page#]')
        end
      end
    end
  end
  object Person_frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = Person_Source
    BCDToCurrency = False
    DataSetOptions = []
    Left = 432
    Top = 280
  end
  object Person_Table: TFDMemTable
    Active = True
    AfterInsert = Person_TableAfterInsert
    BeforeDelete = Person_TableBeforeDelete
    BeforeScroll = Person_TableBeforeScroll
    FilterOptions = [foCaseInsensitive]
    FieldDefs = <
      item
        Name = 'Isikukood'
        Attributes = [faRequired]
        DataType = ftString
        Size = 11
      end
      item
        Name = 'Nimi'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Perenimi'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'Linn'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'Isikukood_Index'
        Fields = 'Isikukood'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'Nimi_Index'
        Options = [ixNonMaintained]
      end
      item
        Name = 'Perenimi_Index'
        Options = [ixNonMaintained]
      end>
    Indexes = <
      item
        Active = True
        Name = 'Isikukood_Index'
        Fields = 'Isikukood'
        Options = [soUnique, soPrimary]
      end
      item
        Name = 'Nimi_Index'
      end
      item
        Name = 'Perenimi_Index'
      end>
    IndexFieldNames = 'Perenimi;Nimi'
    ConstraintsEnabled = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    LocalSQL = FDLocalSQL1
    StoreDefs = True
    Left = 96
    Top = 224
    object Person_TableIsikukood: TStringField
      FieldName = 'Isikukood'
      Required = True
      Size = 11
    end
    object Person_TableNimi: TStringField
      FieldName = 'Nimi'
      Required = True
      OnSetText = Person_TableNimiSetText
      Size = 30
    end
    object Person_TablePerenimi: TStringField
      FieldName = 'Perenimi'
      Required = True
      OnSetText = Person_TablePerenimiSetText
      OnValidate = Person_TablePerenimiValidate
      Size = 30
    end
    object Person_TableLinn: TStringField
      FieldName = 'Linn'
      Required = True
      Size = 30
    end
    object Person_TableLinn_Lookup: TStringField
      DisplayLabel = 'Linn'
      FieldKind = fkLookup
      FieldName = 'Linn_Lookup'
      LookupDataSet = Cities_Table
      LookupKeyFields = 'Linna_Nimi'
      LookupResultField = 'Linna_Nimi'
      KeyFields = 'Linn'
      Size = 30
      Lookup = True
    end
  end
  object FDLocalSQL1: TFDLocalSQL
    Connection = FDConnection1
    Active = True
    DataSets = <>
    Left = 96
    Top = 144
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    Left = 184
    Top = 144
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Caption = 'FireDAC Executor Error'
    Left = 288
    Top = 280
  end
end
