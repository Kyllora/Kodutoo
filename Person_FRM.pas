unit Person_FRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB;

type
  TPerson_Form = class(TForm)
    OK_Button: TButton;
    Button2: TButton;
    Isikukood_Edit: TDBLabeledEdit;
    DBLabeledEdit2: TDBLabeledEdit;
    DBLabeledEdit3: TDBLabeledEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure Isikukood_EditChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OK_ButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    labelDefColor:TColor;
  public
    { Public declarations }
  end;

var
  Person_Form: TPerson_Form;

implementation

uses Main_FRM;

{$R *.dfm}

procedure TPerson_Form.Button2Click(Sender: TObject);
begin
   Isikukood_Edit.DataSource.DataSet.Cancel;
end;

procedure TPerson_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // suletakse kui on post läinud läpi
  // CanClose:= not (Isikukood_Edit.DataSource.State in [dsInsert]);
end;

procedure TPerson_Form.FormCreate(Sender: TObject);
begin
   labelDefColor:=Isikukood_Edit.EditLabel.Font.Color
end;

procedure TPerson_Form.Isikukood_EditChange(Sender: TObject);
begin
   // värvida label kui isikukood pole korras
   with Isikukood_Edit do begin
     if not Main_Form.ValidatePersonlaCodeEE(Text) then begin
        EditLabel.Font.Color:=clRed;
        OK_Button.Enabled:=False;
     end else begin
        EditLabel.Font.Color:=labelDefColor;
        OK_Button.Enabled:=True;
     end;

   end;
end;

procedure TPerson_Form.OK_ButtonClick(Sender: TObject);
begin
   try
     Isikukood_Edit.DataSource.DataSet.Post;
   finally
     Close;
   end;
end;

end.
