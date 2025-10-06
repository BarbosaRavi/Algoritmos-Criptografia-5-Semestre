unit uProcedures;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

procedure cesarcript;
procedure cesardecript;
procedure permutacript;
procedure permutadecript;
procedure vegenerecript;
procedure vegeneredecript;

implementation

//Criptografar Cesar


uses uForm, uInterfaceCesar, uInterfacePermuta, uInterfaceVegenere;

procedure cesarcript;
var
cript: ICesar;
begin
  cript:= TCesar.New;

  if (formPrincipal.edtEntrada.Text <> '') or (formPrincipal.edtChave.Text <> '') then
    formPrincipal.edtSaida.Text:= cript.cript(LowerCase(formPrincipal.edtEntrada.Text), StrToInt(formPrincipal.edtChave.Text))


end;

//Decriptografar Cesar
procedure cesardecript;
var
decript: ICesar;
begin
  decript:= TCesar.New;

  if (formPrincipal.edtEntrada.Text <> '') or (formPrincipal.edtChave.Text <> '') then
    formPrincipal.edtSaida.Text:= decript.decript(LowerCase(formPrincipal.edtEntrada.Text), StrToInt(formPrincipal.edtChave.Text))
  else
    ShowMessage('Entrada e Chave não podem estar vazios');

end;

//Criptografar Permuta
procedure permutacript;
var
cript: IPermuta;
begin
  cript:= TPermuta.New;

  formPrincipal.edtSaida.Text := cript.cript(LowerCase(formPrincipal.edtEntrada.Text), formPrincipal.edtChave.Text);
end;

//Decriptografar Permuta
procedure permutadecript;
var
decript: IPermuta;
begin
  decript:= TPermuta.New;

  formPrincipal.edtSaida.Text := decript.decript(LowerCase(formPrincipal.edtEntrada.Text), formPrincipal.edtChave.Text);
end;

//Cripografar Vegenere
procedure vegenerecript;
var
cript: IVigenere;
begin
  cript:= TVigenere.New;

  formPrincipal.edtSaida.Text:= cript.cript(LowerCase(formPrincipal.edtEntrada.Text), formPrincipal.edtChave.Text);
end;

//Decriptografar Vegenere
procedure vegeneredecript;
var
decript: IVigenere;
begin
  decript:= TVigenere.New;

  formPrincipal.edtSaida.Text:= decript.decript(LowerCase(formPrincipal.edtEntrada.Text), formPrincipal.edtChave.Text);
end;


end.
