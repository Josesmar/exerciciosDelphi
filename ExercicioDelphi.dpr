program ExercicioDelphi;

uses
  Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmVeiculo},
  uVeiculo in 'uVeiculo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVeiculo, frmVeiculo);
  Application.Run;
end.
