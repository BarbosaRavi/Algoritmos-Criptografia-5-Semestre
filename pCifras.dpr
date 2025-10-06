program pCifras;

uses
  Vcl.Forms,
  uForm in 'uForm.pas' {formPrincipal},
  uInterfaceCesar in 'uInterfaceCesar.pas',
  uInterfacePermuta in 'uInterfacePermuta.pas',
  uProcedures in 'uProcedures.pas',
  uInterfaceVegenere in 'uInterfaceVegenere.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.Run;
end.
