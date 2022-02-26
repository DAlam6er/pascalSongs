{
Вращение массива вправо. Объявите массив из 10 чисел и заполните его
случайным образом. Напишите процедуру, перемещающую 1-й элемент на 2-е
место, 2-й — на 3-е место и т.д. 
Последний элемент должен занять 1-е место.
}

const
    ARRSIZE = 10;

type
    TInteger = array[1..ARRSIZE] of Integer;

procedure ShiftRight(var aArr : TInteger);
var
    tmp, i : Integer;
begin
    tmp := aArr[ARRSIZE];
    for i := ARRSIZE downto 2 do begin
        aArr[i] := aArr[i-1];
    end;
    aArr[1] := tmp;
end;

var
    arr : TInteger;
    i : Integer;
begin
    Randomize;
    for i := 1 to ARRSIZE do
        arr[i] := Random(100);
    for i := 1 to ARRSIZE do
        Write(arr[i]:4);
    Writeln;
    ShiftRight(arr);
    for i := 1 to ARRSIZE do
        Write(arr[i]:4);
    Writeln;
end.
