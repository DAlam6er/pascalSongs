{
Напишите функцию, принимающую числовое множество и
возвращающую количество содержащихся в нём элементов.
}

Type TSet = Set of Byte;

function setLength(var aSet : TSet) : Byte;
var
    el, cnt : Byte;
begin
    cnt := 0;
    for el := 0 to 255 do
        if (el in aSet) then
            Inc(cnt);
    setLength := cnt;
end;

var
    bSet : TSet;
begin
    bSet := [4, 8, 15, 16, 21, 42];
    Writeln(setLength(bSet));
    bSet := bSet + [4] + [8] + [17];
    Writeln(setLength(bSet));
end.
