unit uInterfaceCesar;

interface

uses
  System.SysUtils;

type
  ICesar = interface
    ['{9E9B8F50-2D8F-4E7B-8C77-8C6E4F7A8E51}']
    function cript(const strOrg: string; const Chave: Integer): string;
    function decript(const strOrg: string; const Chave: Integer): string;
    function alfaTr(const chave: Integer): string;
  end;

  TCesar = class(TInterfacedObject, ICesar)
  private
    const alfa = 'abcdefghijklmnopqrstuvwxyz';
  public
    constructor Create;
    destructor Destroy; override;

    class function New: ICesar; static;

    function cript(const strOrg: string; const Chave: Integer): string;
    function decript(const strOrg: string; const Chave: Integer): string;
    function alfaTr(const chave: Integer): string;
    end;

implementation

{ TCifraCaesar }

constructor TCesar.Create;
begin
end;

destructor TCesar.Destroy;
begin
  inherited;
end;

class function TCesar.New: ICesar;
begin
  Result := TCesar.Create;
end;

function TCesar.alfaTr(const chave: Integer): String;
var
  i, idx: Integer;
begin
  Result := '';

  for i := 1 to Length(alfa) do
  begin
    idx := ((i - 1 + chave) mod Length(alfa)) + 1;
    Result := Result + alfa[idx];
  end;
end;

function TCesar.cript(const strOrg: String; const chave: Integer): String;
var
  i, idx: Integer;
  c: Char;
  trans: String;
begin
  Result := '';
  trans := alfaTr(chave);

  for i := 1 to Length(strOrg) do
  begin
    c := (strOrg[i]);
    idx := Pos(c, alfa);
    if idx > 0 then
      Result := Result + trans[idx]
    else
      Result := Result + strOrg[i];
  end;
end;

function TCesar.decript(const strOrg: string; const Chave: Integer): string;
var
  i, idx, nvIdx: Integer;
  c: Char;
begin
  Result:= '';

  for i:= 1 to Length(strOrg) do
  begin
    c:= (strOrg[i]);
    idx:= Pos (c, alfa);
    if idx > 0 then
    begin
      nvIdx := ((idx - 1 - chave + Length(alfa)) mod Length(alfa)) + 1;
      Result := Result + alfa[nvIdx];
    end
    else Result := Result + strOrg[i];
  end;
end;
end.

