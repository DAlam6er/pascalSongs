{
Сортировка массива целых чисел
методом "пузырька"
}

const
    SIZE = 10;
type
    TGolds = array [1..SIZE] of Integer;
var
    Golds : TGolds;

procedure BubbleSort(var arr : TGolds);
var
    i, j, temp : Integer;
begin
    for i := 1 to SIZE-1 do begin
        for j := 1 to SIZE-i do
            if (arr[j] > arr[j+1]) then begin
                temp := arr[j];
                arr[j] := arr[j+1];
                arr[j+1] := temp;
            end;
    end;
end;

{ main program }
var 
    i : Integer;
begin
    Randomize;
    for i := 1 to SIZE do
        Golds[i] := 1 + Random(1000);
    Writeln('До сортировки:');
    for i := 1 to SIZE do
        Write(Golds[i]:4);
    Writeln;
    BubbleSort(Golds);
    Writeln('После сортировки:');
    for i := 1 to SIZE do
        Write(Golds[i]:4);
    Writeln;
end.
