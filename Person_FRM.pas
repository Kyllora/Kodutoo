unit Person_FRM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, Data.DB, FireDAC.Stan.Error;

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

   CanClose:=True;

   try

     with  Isikukood_Edit.DataSource.DataSet do
     if State in [dsEdit,dsInsert] then
       Post;

   except

       on E:EFDException do begin
        if E.FDCode = 15 then      //  [FireDAC][DatS]-15. Duplicate row found on unique index. Constraint [_FD_UC_View]
           if MessageDlg('Isikukood on juba registris: '+Isikukood_Edit.Text+#13+#13+'Tahad parandada isikukoodi ?', mtWarning,[mbOk,mbCancel],0,mbOk) = mrCancel then begin
              CanClose:=True;
              Isikukood_Edit.DataSource.DataSet.Cancel;
           end else begin
              CanClose:=False;
              Isikukood_Edit.SetFocus;
           end
        else
           MessageDlg(E.Message+#13+E.FDCode.ToString, mtError,[mbOk],0,mbOk);
     end;

     on E:Exception do begin
         Isikukood_Edit.DataSource.DataSet.Cancel;
         CanClose:=True;
         MessageDlg(E.Message, mtError,[mbOk],0,mbOk);
     end;


   end;

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

  Close;
end;

end.
