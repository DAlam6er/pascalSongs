{
Вывод множества в файл
}

type
    TSet = set of 1..255;

procedure WriteSet(var aFile : text; const aSet : TSet);
var
    i : Integer;
begin
    for i := 1 to 255 do
        if (i in aSet) then
            Write(aFile, i:4);
    writeln(aFile);
end;

var
    s1 : TSet;
    f : text;
begin
    Assign(f, '');      { связываем файл с экраном - пустое имя файла }
    Rewrite(f);
    s1 := [3, 10, 25];
    WriteSet(f, s1);
    Close(f);
end.
