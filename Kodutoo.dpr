program Kodutoo;

uses
  Vcl.Forms,
  Person_FRM in 'Person_FRM.pas' {Person_Form},
  Main_FRM in 'Main_FRM.pas' {Main_Form},
  Seaded_FRM in 'Seaded_FRM.pas' {Seaded_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TPerson_Form, Person_Form);
  Application.CreateForm(TSeaded_Form, Seaded_Form);
  Application.Run;
end.
