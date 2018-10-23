unit UnitFormat;

interface

uses
  Classes, SysUtils, UnitLib;

function Reformat(st: string; purge: boolean = true): string;

implementation

procedure RemoveTagContent(var List: TStringArray; StartTag, EndTag: string);
var
  l : boolean = false;
  i : integer;
begin
  for i:=Low(List) to High(List) do
    begin
      if List[i] = StartTag then l := true;

      if List[i] = EndTag then
        begin
          List[i] := '';
          l := false;
        end;

      if l then List[i] := '';
    end;
end;

function ExtractMarker(s: string): string;
var
  x1, x2 : integer;
begin
  Result := s;
  x1 := Pos('=',s); if x1 = 0 then Exit;
  x2 := Pos('>',s); if x2 = 0 then Exit;
  Result := Copy(s,x1+1,x2-x1-1);
end;

procedure RemakeFootnotes(var List: TStringArray; p: boolean);
var
  marker : string = '';
  l : boolean = false;
  i : integer;
begin
  for i:=Low(List) to High(List) do
    begin
      if List[i] = '<RF>' then
        begin
          if not p then marker := '*';
          if p then List[i] := '';
          l := true;
          Continue;
        end;

      if Prefix('<RF ', List[i]) then
        begin
          if not p then marker := ExtractMarker(List[i]);
          if p then List[i] := '' else List[i] := '<RF>';
          l := true;
          Continue;
        end;

      if l and (List[i] = '<Rf>') then
        begin
          if p then List[i] := '';
          l := false;
          Continue;
        end;

      if marker <> '' then
        begin
          List[i] := ' ' + marker;
          marker := '';
          Continue;
        end;

      if l then List[i] := '';
    end;
end;

procedure Remake(var List: TStringArray; purge: boolean);
begin
  RemoveTagContent(List,'<TS>','<Ts>'); // Prologue
  RemakeFootnotes(List, purge);
  if purge then RemoveTagContent(List, '<f>','</f>');
end;

function Reformat(st: string; purge: boolean = true): string;
var
  List : TStringArray;
begin
  Replace(st,'</S><S>','</S> <S>');
  List := XmlToList(st);
  Remake(List, purge);
  Result := Trim(ListToString(List));
end;


end.
