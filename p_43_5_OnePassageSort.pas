{
В одном ряду вперемежку лежат дыни и арбузы.
Отсортировать их за один проход ряда так, чтобы 
в начале оказались все дыни (0), а 
в конце ряда — все арбузы (1).
}

const
    SIZE = 20;
type
    TNumbers = array[1..SIZE] of Byte;
    TCounters = array[0..1] of Byte;

procedure OnePassageSort(var arg : TNumbers);
var
    currLind, currRind : Integer;
begin
    currLind := 1;
    currRind := SIZE;
    repeat
        while (arg[currLind] = 0) do
            Inc(currLind);
        while (arg[currRind] = 1) do
            Dec(currRind);
        if (currLind <= currRind) then begin
            if (arg[currLind] > arg[currRind]) then begin
                arg[currLind] := 0;
                arg[currRind] := 1;
            end;
            Inc(currLind);
            Dec(currRind);
        end;
    until currLind > currRind;
end;

procedure PrintArray(var arg : TNumbers; const str : String);
var
    i : Integer;
begin
    Writeln(str);
    for i := 1 to SIZE do
        Write(arg[i], ' ');
    Writeln;
end;

var
    arr : TNumbers;
    i : Integer;
begin
    Randomize;
    for i := 1 to SIZE do
        arr[i] := Random(2);
    PrintArray(arr, 'До сортировки:');
    OnePassageSort(arr);
    PrintArray(arr, 'После сортировки:');
end.
