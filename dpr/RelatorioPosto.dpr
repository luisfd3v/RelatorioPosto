program RelatorioPosto;

uses
  Vcl.Forms,
  uDataModule in '..\pas\uDataModule.pas' {DataModule1: TDataModule},
  uLogin in '..\pas\uLogin.pas' {Form2},
  uPrincipal in '..\pas\uPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Form2 := TForm2.Create(nil);
  try
    Form2.ShowModal;
  finally
    Form2.Free;
  end;
  Application.Run;
end.
