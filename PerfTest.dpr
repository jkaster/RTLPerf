program PerfTest;

uses
  Vcl.Forms,
  fPerfTest in 'fPerfTest.pas' {FormPerfTest};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPerfTest, FormPerfTest);
  Application.Run;
end.
