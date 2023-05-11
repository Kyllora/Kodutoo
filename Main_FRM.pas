unit Main_FRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.VCLUI.Error,
  FireDAC.Comp.UI, Vcl.Mask, frxClass, frxDBSet, Vcl.BaseImageCollection,
  Vcl.ImageCollection, Datasnap.DBClient, Vcl.TitleBarCtrls,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnList, Vcl.ActnMan,
  FireDAC.Phys.SQLiteVDataSet;

type
  TMain_Form = class(TForm)
    Person_DBGrid: TDBGrid;
    StatusBar1: TStatusBar;
    Person_Source: TDataSource;
    Cities_Table: TFDMemTable;
    Cities_Source: TDataSource;
    Person_frxReport: TfrxReport;
    Person_frxDBDataset: TfrxDBDataset;
    Cities_TableLinna_Nimi: TStringField;
    Person_Table: TFDMemTable;
    Person_TableIsikukood: TStringField;
    Person_TableNimi: TStringField;
    Person_TablePerenimi: TStringField;
    Person_TableLinn: TStringField;
    Person_TableLinn_Lookup: TStringField;
    Panel1: TPanel;
    SearchBox: TSearchBox;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    Button2: TButton;
    FDLocalSQL1: TFDLocalSQL;
    FDConnection1: TFDConnection;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    procedure FormShow(Sender: TObject);
    procedure SearchBoxInvokeSearch(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Person_TableBeforeScroll(DataSet: TDataSet);
    procedure Person_TableAfterInsert(DataSet: TDataSet);
    procedure Person_TableBeforeDelete(DataSet: TDataSet);
    procedure Person_DBGridTitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure Person_SourceDataChange(Sender: TObject; Field: TField);
    procedure Person_TableNimiSetText(Sender: TField; const Text: string);
    procedure Person_TablePerenimiSetText(Sender: TField; const Text: string);
    procedure Person_TablePerenimiValidate(Sender: TField);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses Person_FRM,Seaded_FRM;

{$R *.dfm}


procedure TMain_Form.Button1Click(Sender: TObject);
begin
  // ava raport
  Person_frxDBDataset.Open;
  Person_frxReport.ShowReport(true);

end;

procedure TMain_Form.Button2Click(Sender: TObject);
begin
  Person_Table.Filtered:=False;
  Seaded_Form.ShowModal;
end;

procedure TMain_Form.FormShow(Sender: TObject);
begin

  with Cities_Table do begin
    Active:=True;
    AppendRecord(['Tallinn']);
    AppendRecord(['Tartu']);
    AppendRecord(['Rakvere']);
    AppendRecord(['Pärnu']);
    AppendRecord(['Kohila']);
  end;

  with Person_Table do begin
    Active:=True;
    Main_Form.Person_Table.AfterInsert := nil;   // ei taha et isikulisamine läheb lahti
    try
      AppendRecord(['36903130444', 'RAMI','KYLLÖNEN','Tallinn']);
    finally
      Main_Form.Person_Table.AfterInsert := Main_Form.Person_TableAfterInsert;
    end;
  end;


end;

procedure TMain_Form.Person_DBGridTitleClick(Column: TColumn);
begin
  // gridi järjekorra muutmine
  if Column.Field.FieldKind = fkLookup then
    Person_Table.IndexFieldNames :=Column.Field.KeyFields;

  if Column.Field.FieldKind = fkData then
    Person_Table.IndexFieldNames :=Column.Field.FieldName;
end;

procedure TMain_Form.Person_SourceDataChange(Sender: TObject; Field: TField);
begin
  StatusBar1.SimpleText:=' '+Person_Table.RecordCount.ToString+' persons';
end;

procedure TMain_Form.Person_TableAfterInsert(DataSet: TDataSet);
begin
   Person_Form.ShowModal;
end;

procedure TMain_Form.Person_TableBeforeDelete(DataSet: TDataSet);
begin
   if MessageDlg('Kas olete kindel, et soovite personi kustutada ? ', mtWarning,[mbOk,mbCancel],0,mbOk) <> mrOk then Abort;
end;

procedure TMain_Form.Person_TableBeforeScroll(DataSet: TDataSet);
begin

  if DataSet.State in [dsEdit] then
    if MessageDlg('Andmeid on muudetud, kas nad tuleks salvestada ?', mtWarning,[mbOk,mbCancel],0,mbOk) = mrOk then
      DataSet.Post
    else
      DataSet.Cancel;
end;

procedure TMain_Form.Person_TableNimiSetText(Sender: TField;
  const Text: string);
begin
   Sender.AsString:=Trim(AnsiUpperCase(Text)); // suured tähed
end;

procedure TMain_Form.Person_TablePerenimiSetText(Sender: TField;
  const Text: string);
begin
  Sender.AsString:=Trim(AnsiUpperCase(Text));
end;

procedure TMain_Form.Person_TablePerenimiValidate(Sender: TField);
begin
{
  // EI TÖÖTA ILMSELET MEMORY TABLE JÄRGI
  if Trim(Sender.AsString)='' then
     raise Exception.Create(Sender.DisplayName + ' on tühi !');
 }
end;

procedure TMain_Form.SearchBoxInvokeSearch(Sender: TObject);
var stext:String;
begin
  // otsimine köigide fieldide järgi

  stext:=QuotedStr(TSearchBox(Sender).Text+'%');  // otsingu text

  if stext <> QuotedStr('%') then  // kui otsing text on tühi
  with Person_Table do begin
    Filtered:=False;
    Filter:='Nimi LIKE '+stext+' OR Perenimi LIKE '+stext+' OR Isikukood LIKE '+stext+' OR Linn LIKE '+stext;
    Filtered:=True;
  end else
    Person_Table.Filtered:=False;

end;




end.
