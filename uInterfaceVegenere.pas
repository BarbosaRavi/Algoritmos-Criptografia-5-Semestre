unit uInterfaceVegenere;

interface

uses
  System.SysUtils, System.Character;

type
  IVigenere = interface
    ['{EB614A66-34C9-4D53-9D9D-8C285E0DA1EE}']
    function cript(const strOrg, chaveStr: string): string;
    function decript(const strOrg, chaveStr: string): string;
  end;

  TVigenere = class(TInterfacedObject, IVigenere)
  private
    const alfa = 'abcdefghijklmnopqrstuvwxyz';
  private
    function limparChave(const chaveStr: string): string;
    function idxAlfa(const c: Char): Integer; inline;
  public
    constructor Create;
    destructor Destroy; override;

    class function New: IVigenere; static;

    function cript(const strOrg, chaveStr: string): string;
    function decript(const strOrg, chaveStr: string): string;
  end;

implementation

{ TVigenere }

constructor TVigenere.Create;
begin
end;

destructor TVigenere.Destroy;
begin
  inherited;
end;

class function TVigenere.New: IVigenere;
begin
  Result := TVigenere.Create;
end;

function TVigenere.idxAlfa(const c: Char): Integer;
begin
  Result := Pos(c, alfa);
end;

function TVigenere.limparChave(const chaveStr: string): string;
var
  ch: Char;
begin
  Result := '';
  for ch in chaveStr.ToLower do
    if (ch >= 'a') and (ch <= 'z') then
      Result := Result + ch;

  if Result = '' then
    raise Exception.Create('Chave inválida. Informe ao menos uma letra de A a Z.');
end;


function TVigenere.cript(const strOrg, chaveStr: string): string;
var
  texto, chave: string;
  i, k, iMsg, iKey, novoIdx: Integer;
  c: Char;
begin
  Result := '';
  texto := strOrg.ToLower;
  chave := limparChave(chaveStr);

  k := 1;
  for i := 1 to Length(texto) do
  begin
    c := texto[i];
    iMsg := idxAlfa(c);

    if iMsg > 0 then
    begin
      iKey := idxAlfa(chave[k]);
      novoIdx := ((iMsg - 1 + (iKey - 1)) mod Length(alfa)) + 1;
      Result := Result + alfa[novoIdx];

      Inc(k);
      if k > Length(chave) then
        k := 1;
    end
    else
      Result := Result + strOrg[i];
  end;
end;

function TVigenere.decript(const strOrg, chaveStr: string): string;
var
  texto, chave: string;
  i, k, iMsg, iKey, novoIdx: Integer;
  c: Char;
begin
  Result := '';
  texto := strOrg.ToLower;
  chave := limparChave(chaveStr);

  k := 1;
  for i := 1 to Length(texto) do
  begin
    c := texto[i];
    iMsg := idxAlfa(c);

    if iMsg > 0 then
    begin
      iKey := idxAlfa(chave[k]);
      novoIdx := ((iMsg - 1 - (iKey - 1) + Length(alfa)) mod Length(alfa)) + 1;
      Result := Result + alfa[novoIdx];

      Inc(k);
      if k > Length(chave) then
        k := 1;
    end
    else
      Result := Result + strOrg[i];
  end;
end;

end.

