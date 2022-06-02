{
Quick Sorting
Определите количество повторных входов в процедуру QuickSort и
выходов из нее.
}

const
    SIZE = 1000;
type
    TNumbers = Array[1..SIZE] of Integer;
var
    level : Integer;

procedure QuickSort(var arg : TNumbers; aL, aR : Integer);
var
    currLind, currRind : Integer;
    avg, tmp : Integer;
begin
    Inc(level);
    Writeln('Уровень на входе = ', level);
    currLind := aL;
    currRind := aR;
    avg := (arg[aL] + arg[(aL + aR) div 2] + arg[aR]) div 3;
    repeat
        while (arg[currLind] < avg) do
            Inc(currLind);
        while (arg[currRind] > avg) do
            Dec(currRind);
        if (currLind <= currRind) then begin
            if (arg[currLind] > arg[currRind]) then begin
                tmp := arg[currLind];
                arg[currLind] := arg[currRind];
                arg[currRind] := tmp;
            end;
            Inc(currLind);
            Dec(currRind);
        end;
    until currLind > currRind;

    if (currRind > aL) then
        QuickSort(arg, aL, currRind);

    if (currLind < aR) then
        QuickSort(arg, currLind, aR);
    Dec(level);
    Writeln('Уровень на выходе = ', level);
end;

procedure PrintArray(var arg : TNumbers; const header : String);
var
    i : Integer;
begin
    Writeln(header);
    for i := 1 to SIZE do
        Write(arg[i], ' ');
    Writeln;
end;

{ main program }
var
    i : Integer;
    arr : TNumbers;
begin
    Randomize;
    for i := 1 to SIZE do
        arr[i] := 1 + Random(1000);
    Writeln('Размер массива = ', SIZE);
    level := 0;
    QuickSort(arr, 1, SIZE);
end.
