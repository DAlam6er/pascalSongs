{
Фермерская сортировка
}

const
    SIZE = 10;
type
    TNumbers = Array[1..SIZE] of Integer;

procedure FarmSort(var arg : TNumbers);
var
    lInd, rInd, tmp : Integer;
begin
    for lInd := 1 to SIZE-1 do
        for rInd := SIZE downto lInd + 1 do
            if (arg[lInd] > arg[rInd]) then begin
                tmp := arg[lInd];
                arg[lInd] := arg[rInd];
                arg[rInd] := tmp;
            end;
end;

procedure PrintArray(var arr : TNumbers; const header : String);
var
    i : Integer;
begin
    Writeln(header);
    for i := 1 to SIZE do
        Write(arr[i], ' ');
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
    PrintArray(arr, 'До сортировки:');
    FarmSort(arr);
    PrintArray(arr, 'После сортировки:');
end.
