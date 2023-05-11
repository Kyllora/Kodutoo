object Person_Form: TPerson_Form
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Isikuandme lis'#228'mine'
  ClientHeight = 218
  ClientWidth = 367
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 15
  object Label3: TLabel
    Left = 16
    Top = 117
    Width = 26
    Height = 15
    Caption = 'Linn:'
  end
  object OK_Button: TButton
    Left = 74
    Top = 184
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 4
    OnClick = OK_ButtonClick
  end
  object Button2: TButton
    Left = 208
    Top = 184
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'T'#252'hista'
    ModalResult = 2
    TabOrder = 5
    OnClick = Button2Click
  end
  object Isikukood_Edit: TDBLabeledEdit
    Left = 74
    Top = 19
    Width = 92
    Height = 23
    DataField = 'Isikukood'
    DataSource = Main_Form.Person_Source
    TabOrder = 0
    OnChange = Isikukood_EditChange
    EditLabel.Width = 54
    EditLabel.Height = 23
    EditLabel.Caption = 'Isikukood:'
    EditLabel.Layout = tlCenter
    LabelPosition = lpLeft
    LabelSpacing = 6
  end
  object DBLabeledEdit2: TDBLabeledEdit
    Left = 16
    Top = 80
    Width = 150
    Height = 23
    CharCase = ecUpperCase
    DataField = 'Nimi'
    DataSource = Main_Form.Person_Source
    TabOrder = 1
    EditLabel.Width = 29
    EditLabel.Height = 15
    EditLabel.Caption = 'Nimi:'
    EditLabel.Layout = tlCenter
  end
  object DBLabeledEdit3: TDBLabeledEdit
    Left = 192
    Top = 80
    Width = 150
    Height = 23
    CharCase = ecUpperCase
    DataField = 'Perenimi'
    DataSource = Main_Form.Person_Source
    TabOrder = 2
    EditLabel.Width = 50
    EditLabel.Height = 15
    EditLabel.Caption = 'Perenimi:'
    EditLabel.Layout = tlCenter
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 16
    Top = 138
    Width = 326
    Height = 23
    DataField = 'Linn_Lookup'
    DataSource = Main_Form.Person_Source
    TabOrder = 3
  end
end
