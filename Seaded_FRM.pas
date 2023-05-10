unit Seaded_FRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TSeaded_Form = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Seaded_Form: TSeaded_Form;

implementation

uses Main_FRM;
{$R *.dfm}

procedure TSeaded_Form.Button1Click(Sender: TObject);

  function GeneratePersonalCode:String;
  begin
     result:=IntToStr(Random(9)) + FormatDateTime('yymmdd', Now()-(1000+Random(40000)))+FormatFloat('0000',Random(400));
  end;

const aMax=19;
      nimiArray: array  [0..aMax] of string = ('Pelle','Marek','Mati','Andre','Rain','Henry','Agur','Henrik','Kristo','Tarmo','Maris','Jaanika','Angnes','Ketlin','Sirve','Evelin','Mari-Liis','Gerli','Katrin','Kati');
      pereArray: array [0..aMax] of string = ('Niine','Rennit','Valgma','Liivalaid','Karu','Mürk','Kadak','Palmi','Sapas','Seppel','Tammiste','Mikkola','Tilga','Pedanik','Arula','Uibo','Jõgi','Tammet','Pahk','Uusleer');
      linnArray: array [0..4] of string = ('Tallinn','Tartu','Rakvere','Pärnu','Kohila');
var i:Integer;
begin

  Main_Form.Person_Table.AfterInsert:=nil;    // event ära

  with Main_Form.Person_Table do
  for i := 0 to 50 do
     AppendRecord([GeneratePersonalCode
       ,AnsiUppercase(nimiArray[Random(aMax)])
       ,AnsiUpperCase(pereArray[Random(aMax)])
       ,linnArray[Random(4)]]);

   Main_Form.Person_Table.AfterInsert := Main_Form.Person_TableAfterInsert; // event tagasi
end;


procedure TSeaded_Form.Button2Click(Sender: TObject);
begin
   Close;
end;

procedure TSeaded_Form.CheckBox1Click(Sender: TObject);
begin
   Main_Form.Person_Source.AutoEdit:=TCheckBox(Sender).Checked;
end;

end.
