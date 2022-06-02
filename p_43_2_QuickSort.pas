{
Quick Sorting
}

const
    SIZE = 10;
type
    TNumbers = Array[1..SIZE] of Integer;

{ aL, aR - левая и правая границы сортируемой части массива
 для вычисления значения опорного элемента
}
procedure QuickSort(var arg : TNumbers; aL, aR : Integer);
var
    currLind, currRind : Integer;
    avg, tmp : Integer;
begin
    currLind := aL;
    currRind := aR;
    { вычисляем значение опорного элемента для сравнения }
    avg := (arg[currLind] + arg[(currLind+currRind) div 2] + arg[currRind]) div 3;
    { цикл встречного движения }
    repeat
        { пока левый элемент меньше среднего, двигаем левый индекс вправо }
        while (arg[currLind] < avg) do
            Inc(currLind);
        { пока правый элемент больше среднего, двигаем правый индекс влево }
        while (arg[currRind] > avg) do
            Dec(currRind);
        { после остановки сравниваем индексы }
        if (currLind <= currRind) then begin
            { обмен значениями, сортировка по возрастанию }
            if (arg[currLind] > arg[currRind]) then begin
                tmp := arg[currLind];
                arg[currLind] := arg[currRind];
                arg[currRind] := tmp;
            end;
            { индексы делают шаг навстречу друг другу }
            Inc(currLind);
            Dec(currRind);
        end;
    until currLind > currRind; { пока индексы не "встретятся" }

    { если левая часть не отсортирована, сортируем её }
    if (currRind > aL) then
        QuickSort(arg, aL, currRind);

    { если правая часть не отсортирована, сортируем её }
    if (currLind < aR) then
        QuickSort(arg, currLind, aR);
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
    PrintArray(arr, 'До сортировки:');
    { 1 - левая граница, SIZE - правая граница сортировки }
    QuickSort(arr, 1, SIZE);
    PrintArray(arr, 'После сортировки:');
end.
