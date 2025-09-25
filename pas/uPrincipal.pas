unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormPrincipal = class(TForm)
    gbColaborador: TGroupBox;
    lblColaborador: TLabel;
    lblDataInicio: TLabel;
    lblDataFim: TLabel;
    dtpDataInicio: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    btnTrocarColaborador: TButton;
    btnFiltrar: TButton;
    lblColaboradorSelecionado: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnTrocarColaboradorClick(Sender: TObject);
  private
    { Private declarations }
    FnomeVendedor: string;
  public
    { Public declarations }
    property NomeVendedor: string read FnomeVendedor write FNomeVendedor;
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses uLogin;

{$R *.dfm}

procedure TFormPrincipal.btnTrocarColaboradorClick(Sender: TObject);
var
  loginForm: TForm2;
  nomeVendedor: string;
  posTraco: Integer;
begin
  Close;

  loginForm := TForm2.Create(nil);
  try
    if loginForm.ShowModal = mrOk then
    begin
      posTraco := Pos(' - ', loginForm.cbbCodigo.Text);
      if posTraco > 0 then
        nomeVendedor := Copy(loginForm.cbbCodigo.Text, posTraco + 3, Length(loginForm.cbbCodigo.Text))
      else
      nomeVendedor := loginForm.cbbCodigo.Text;

      Application.CreateForm(TFormPrincipal, FormPrincipal);
      FormPrincipal.NomeVendedor := nomeVendedor;
      FormPrincipal.Show;
    end
    else
      Application.Terminate;
  finally
    loginForm.Free;
  end;
end;

procedure TFormPrincipal.FormShow(Sender: TObject);
begin
  if NomeVendedor <> '' then
  begin
//    Caption := 'Relatório de Vendas - ' + NomeVendedor;
    lblColaboradorSelecionado.Caption := NomeVendedor;
  end
  else
  begin
//    Caption := 'Relatório de Vendas';
    lblColaboradorSelecionado.Caption := 'Nenhum colaborador selecionado';
  end;
end;

end.
