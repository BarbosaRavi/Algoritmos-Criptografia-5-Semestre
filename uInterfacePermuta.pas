unit uInterfacePermuta;

interface

uses
  System.SysUtils, System.Character, System.Generics.Collections;

type
  IPermuta = interface
  ['{B7A438E2-DC8B-4BC8-8055-8B860EFDA310}']
    function cript(const textoOriginal, chaveStr: string): string;
    function decript(const textoCript, chaveStr: string): string;
  end;

  TPermuta = class(TInterfacedObject, IPermuta)
  private
    function removerEspacos(const s: string): string;
    function lerChave(const chaveStr: string): TArray<Integer>;
  public
    class function New: IPermuta; static;
    function cript(const textoOriginal, chaveStr: string): string;
    function decript(const textoCript, chaveStr: string): string;
  end;

implementation

{ TPermuta }

class function TPermuta.New: IPermuta;
begin
  Result := TPermuta.Create;
end;

function TPermuta.removerEspacos(const s: string): string;
var
  ch: Char;
begin
  Result := '';
  for ch in s do
    if not ch.IsWhiteSpace then
      Result := Result + ch;
end;

function TPermuta.lerChave(const chaveStr: string): TArray<Integer>;
var
  partes: TArray<string>;
  limpo: string;
  i, v, N: Integer;
  usado: TDictionary<Integer, Boolean>;
begin
  if chaveStr.Trim = '' then
    raise Exception.Create('Chave vazia.');

  limpo := chaveStr.Trim.Replace(',', ' ').Replace(';', ' ');
  if Pos(' ', limpo) = 0 then
  begin
    N := limpo.Length;
    if N = 0 then
      raise Exception.Create('Chave inválida.');
    SetLength(Result, N);
    usado := TDictionary<Integer, Boolean>.Create;
    try
      for i := 1 to N do
      begin
        if not CharInSet(limpo[i], ['0'..'9']) then
          raise Exception.Create('Chave deve conter apenas números.');
        v := Ord(limpo[i]) - Ord('0');
        if (v < 1) or (v > N) then
          raise Exception.Create(Format('Cada posição deve estar entre 1 e %d.', [N]));
        if usado.ContainsKey(v) then
          raise Exception.Create('Números repetidos na chave.');
        usado.Add(v, True);
        Result[i-1] := v;
      end;
    finally
      usado.Free;
    end;
    Exit;
  end;

  partes := limpo.Split([' '], TStringSplitOptions.ExcludeEmpty);
  N := Length(partes);
  if N = 0 then
    raise Exception.Create('Chave inválida.');

  SetLength(Result, N);
  usado := TDictionary<Integer, Boolean>.Create;
  try
    for i := 0 to N-1 do
    begin
      if not TryStrToInt(partes[i], v) then
        raise Exception.Create('Chave deve conter apenas números.');
      if (v < 1) or (v > N) then
        raise Exception.Create(Format('Cada posição deve estar entre 1 e %d.', [N]));
      if usado.ContainsKey(v) then
        raise Exception.Create('Números repetidos na chave.');
      usado.Add(v, True);
      Result[i] := v;
    end;
  finally
    usado.Free;
  end;
end;

function TPermuta.cript(const textoOriginal, chaveStr: string): string;
var
  texto, bloco, blocoSaida: string;
  chave: TArray<Integer>;
  N, inicio, L, j, posOrig: Integer;
begin
  Result := '';
  texto := removerEspacos(textoOriginal);
  if texto = '' then Exit;

  chave := lerChave(chaveStr);
  N := Length(chave);
  if N = 0 then Exit;

  inicio := 1;
  while inicio <= Length(texto) do
  begin
    bloco := Copy(texto, inicio, N);
    L := Length(bloco);
    SetLength(blocoSaida, L);

    for j := 1 to L do
    begin
      posOrig := chave[j - 1];
      if posOrig <= L then
        blocoSaida[j] := bloco[posOrig]
      else
        blocoSaida[j] := bloco[j];
    end;

    Result := Result + blocoSaida;
    Inc(inicio, N);
  end;
end;

function TPermuta.decript(const textoCript, chaveStr: string): string;
var
  texto, bloco, blocoSaida: string;
  chave: TArray<Integer>;
  N, inicio, L, j, posDest: Integer;
begin
  Result := '';
  texto := textoCript;
  if texto = '' then Exit;

  chave := lerChave(chaveStr);
  N := Length(chave);
  if N = 0 then Exit;

  inicio := 1;
  while inicio <= Length(texto) do
  begin
    bloco := Copy(texto, inicio, N);
    L := Length(bloco);
    SetLength(blocoSaida, L);

    for j := 1 to L do
    begin
      posDest := chave[j - 1];
      if posDest <= L then
        blocoSaida[posDest] := bloco[j]
      else
        blocoSaida[j] := bloco[j];
    end;

    Result := Result + blocoSaida;
    Inc(inicio, N);
  end;
end;

end.

