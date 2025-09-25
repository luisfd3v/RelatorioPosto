unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TForm2 = class(TForm)
    gbIdentificacaoColaborador: TGroupBox;
    lblRelatorioDeVendas: TLabel;
    lblCodigoColaborador: TLabel;
    lblSenhaColaborador: TLabel;
    cbbCodigo: TComboBox;
    edtSenha: TEdit;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    ADOQueryLogin: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure cbbCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses uDataModule, IdHashMessageDigest, uPrincipal;

{$R *.dfm}

function GerarMD5(const Texto: string): string;
var
  MD5: TIdHashMessageDigest5;
begin
  MD5 := TIdHashMessageDigest5.Create;
  try
    Result := MD5.HashStringAsHex(Texto);
  finally
    MD5.Free;
  end;
end;

procedure TForm2.btnConfirmarClick(Sender: TObject);
var
  codigo: string;
  senhaMD5: string;
  posTraco: Integer;
begin
  posTraco := Pos(' - ', cbbCodigo.Text);
  if posTraco > 0 then
  codigo := Copy(cbbCodigo.Text, 1, posTraco -1)
  else
    codigo := cbbCodigo.Text;

  senhaMD5 := GerarMD5(edtSenha.Text);

  ADOQueryLogin.Close;
  ADOQueryLogin.SQL.Text :=
    'SELECT COUNT(*) AS Total FROM AVENDEGE WHERE CODIGO_VEN = :codigo AND AP_VEN = :senha';
  ADOQueryLogin.Parameters.ParamByName('codigo').Value := Format('%.3d', [StrToInt(codigo)]);
  ADOQueryLogin.Parameters.ParamByName('senha').Value := senhaMD5;
  ADOQueryLogin.Open;

  if ADOQueryLogin.FieldByName('Total').AsInteger > 0 then
  begin
    Close;
  end
  else
    ShowMessage('Codigo ou senha inválidos.');
end;

procedure TForm2.cbbCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    edtSenha.SetFocus;
    Key := 0;
  end;
end;

procedure TForm2.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    btnConfirmar.SetFocus;
    Key := 0;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  ADOQueryLogin.Connection := DataModule1.ADOConnection1;
  ADOQueryLogin.SQL.Text := 'SELECT CODIGO_VEN, NOME_VEN FROM AVENDEGE ORDER BY CODIGO_VEN';
  ADOQueryLogin.Open;
  cbbCodigo.Items.Clear;
  while not ADOQueryLogin.Eof do
  begin
    cbbCodigo.Items.Add(IntToStr(ADOQueryLogin.FieldByName('codigo_ven').AsInteger)
    + ' - ' +
    ADOQueryLogin.FieldByName('nome_ven').AsString);
    ADOQueryLogin.Next;
  end;
  ADOQueryLogin.Close;
end;

end.
