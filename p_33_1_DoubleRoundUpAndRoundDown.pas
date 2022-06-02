{
Напишите две функции, округляющие вещественное число:
· до большего значения (например: 3.1 -> 4; 3.9 -> 4);
· до меньшего значения (например: 3.1 -> 3; 3.9 -> 3)
}

function RoundUp(num : double) : LongInt;
var
    tmp : double;
begin
    tmp := num - Trunc(num);
    if (tmp = 0) then
        RoundUp := Trunc(num)
    else
        RoundUp := Trunc(num) + 1;
end;

function RoundDown(num : double) : LongInt;
begin
    RoundDown := Trunc(num);
end;


var
    num : double;
begin
    write('Input double number: ');
    readln(num);
    write('Number rounded up: ');
    writeln(RoundUp(num));
    write('Number rounded down: ');
    writeln(RoundDown(num));
end.
