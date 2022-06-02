{
Вращение массива влево. Напишите процедуру для перемещения 2-го
элемента на 1-е место, 3-го — на 2-е место и т.д. 
При этом первый элемент должен стать последним.
}

const
    ARRSIZE = 10;

type
    TInteger = array[1..ARRSIZE] of Integer;

procedure ShiftLeft(var aArr : TInteger);
var
    tmp, i : Integer;
begin
    tmp := aArr[1];
    for i := 1 to ARRSIZE-1 do begin
        aArr[i] := aArr[i+1];
    end;
    aArr[ARRSIZE] := tmp;
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
    ShiftLeft(arr);
    for i := 1 to ARRSIZE do
        Write(arr[i]:4);
    Writeln;
end.
