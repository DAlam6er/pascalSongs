{
Сравнение алгоритмов сортировки
Подсчет числа сравнений (c1) и перестановок (c2).
Сравниваются две разновидности пузырьковой сортировки
(BubbleSort и FarmSort), а также быстрая сортировка.
}

const
    SIZE = 10000;
type
    TNumbers = Array[1..SIZE] of Integer;
var
    c1, c2 : Extended;

procedure BubbleSort(var arg : TNumbers);
var
    i, j, tmp : Integer;
begin
    c1 := 0;
    c2 := 0;
    for i := 1 to SIZE-1 do
        for j := 1 to SIZE-i do begin
            c1 := c1 + 1;
            if (arg[j] > arg[j+1]) then begin
                c2 := c2 + 1;
                tmp := arg[j];
                arg[j] := arg[j+1];
                arg[j+1] := tmp;
            end;
        end;
end;

procedure FarmSort(var arg : TNumbers);
var
    i, j, tmp : Integer;
begin
    c1 := 0;
    c2 := 0;
    for i := 1 to SIZE-1 do
        for j := SIZE downto i+1 do begin
            c1 := c1 + 1;
            if (arg[i] > arg[j]) then begin
                c2 := c2 + 1;
                tmp := arg[i];
                arg[i] := arg[j];
                arg[j] := tmp;
            end;
        end;
end;

procedure QuickSort(var arg : TNumbers; aL, aR : Integer);
var
    currLind, currRind, avg, tmp : Integer;
begin
    currLind := aL;
    currRind := aR;
    avg := (arg[aL] + arg[(aL + aR) div 2] + arg[aR]) div 3;
    repeat
        while (arg[currLind] < avg) do begin
            Inc(currLind);
            c1 := c1 + 1;
        end;
        while(arg[currRind] > avg) do begin
            Dec(currRind);
            c1 := c1 + 1;
        end;
        if (currLind <= currRind) then begin
            if (arg[currLind] > arg[currRind]) then begin
                tmp := arg[currLind];
                arg[currLind] := arg[currRind];
                arg[currRind] := tmp;
                c2 := c2 + 1;
            end;
            Inc(currLind);
            Dec(currRind);
        end;
    until (currLind > currRind);

    if (currRind > aL) then
        QuickSort(arg, aL, currRind);

    if (currLind < aR) then
        QuickSort(arg, currLind, aR);
end;

const outFileName = 'p_43_3.out';
var
    i : Integer;
    outFile : Text;
    unSortedArr, SortedArr : TNumbers;
begin
    Randomize;
    Assign(outFile, outFileName);
    Rewrite(outFile);
    
    for i := 1 to SIZE do
        unSortedArr[i] := 1 + Random(10000);
    
    Writeln(outFile, 'Размер массива = ', SIZE);
    Writeln(outFile, 'Алгоритм      Количество      Количество');
    Writeln(outFile, 'сортировки    сравнений       перестановок');
    
    SortedArr := unSortedArr;
    BubbleSort(SortedArr);
    Writeln(outFile, 'Пузырьковая:', c1:12:0, c2:14:0);

    SortedArr := unSortedArr;
    FarmSort(SortedArr);
    Writeln(outFile, '"Фермерская":', c1:11:0, c2:14:0);

    SortedArr := unSortedArr;
    c1 := 0;
    c2 := 0;
    QuickSort(SortedArr, 1, SIZE);
    Writeln(outFile, 'Быстрая:', c1:16:0, c2:14:0);

    Close(outFile);
end.
