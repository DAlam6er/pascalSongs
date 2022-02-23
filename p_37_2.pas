{
Вывод множества в файл. Способ с перебором.
}

type
    TSet = set of 1..255;

procedure WriteSet(var aFile : text; const aSet : TSet);
var
    el : Byte;
begin
    for el in aSet do
        Write(aFile, el:4);
    writeln(aFile);
end;

var
    s1 : TSet;
    f : text;
begin
    Assign(f, '');
    Rewrite(f);
    s1 := [3, 10, 25];
    WriteSet(f, s1);
    Close(f);
end.
