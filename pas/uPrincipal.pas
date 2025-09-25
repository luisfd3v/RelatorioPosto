unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFormPrincipal = class(TForm)
    gbColaborador: TGroupBox;
    lblColaborador: TLabel;
    lbl: TLabel;
    Label3: TLabel;
    dtpDataInicio: TDateTimePicker;
    dtpDataFim: TDateTimePicker;
    btnTrocarColaborador: TButton;
    btnFiltrar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

end.
