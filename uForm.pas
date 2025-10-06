unit uForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TformPrincipal = class(TForm)
    edtEntrada: TLabeledEdit;
    edtSaida: TLabeledEdit;
    edtChave: TLabeledEdit;
    btnCriptografar: TButton;
    btnDescriptografar: TButton;
    rgpMetodo: TRadioGroup;
    lblBreve: TLabel;
    procedure btnCriptografarClick(Sender: TObject);
    procedure btnDescriptografarClick(Sender: TObject);
    procedure rgpMetodoClick(Sender: TObject);
  private
    alfa: String;

  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;


implementation

{$R *.dfm}

uses uInterfaceCesar, uInterfacePermuta, uProcedures, uInterfaceVegenere;

//Click Criptografar
procedure TformPrincipal.btnCriptografarClick(Sender: TObject);
begin
  case rgpMetodo.ItemIndex of
    0: uProcedures.cesarcript;

    1: uProcedures.permutacript;

    2: uProcedures.vegenerecript;
  end;
end;

//Click descriptografar
procedure TformPrincipal.btnDescriptografarClick(Sender: TObject);
begin
  case rgpMetodo.ItemIndex of
    0: uProcedures.cesardecript;

    1: uProcedures.permutadecript;

    2: uProcedures.vegeneredecript;
  end;
end;

//Ajuste regra ao trocar metodo
procedure TformPrincipal.rgpMetodoClick(Sender: TObject);
begin
  case rgpMetodo.ItemIndex of
    0:
    begin
      edtChave.EditLabel.Caption:= 'Chave (Inteiro):';
      edtChave.NumbersOnly:= True;
    end;

    1:
    begin
      edtChave.EditLabel.Caption:= 'Chave (Inteiro):';
      edtChave.NumbersOnly:= True;
    end;

    2:
    begin
      edtChave.EditLabel.Caption:= 'Chave (Caracter/String):';
      edtChave.NumbersOnly:= False;
    end;
  end;
end;

end.
