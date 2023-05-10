object Seaded_Form: TSeaded_Form
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Seaded'
  ClientHeight = 265
  ClientWidth = 441
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 220
    Height = 249
    Caption = 'Linnad'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 2
      Top = 17
      Width = 216
      Height = 230
      Align = alClient
      DataSource = Main_Form.Cities_Source
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Linna_Nimi'
          Visible = True
        end>
    end
  end
  object Button1: TButton
    Left = 248
    Top = 8
    Width = 161
    Height = 48
    Caption = 'Genereeri demo data'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 334
    Top = 230
    Width = 75
    Height = 25
    Caption = 'Sulge'
    TabOrder = 2
    OnClick = Button2Click
  end
  object CheckBox1: TCheckBox
    Left = 248
    Top = 88
    Width = 185
    Height = 17
    Hint = 'Dataset AutoEdit'
    Caption = 'Automaatne redigeerimine'
    Checked = True
    ParentShowHint = False
    ShowHint = True
    State = cbChecked
    TabOrder = 3
    OnClick = CheckBox1Click
  end
end
