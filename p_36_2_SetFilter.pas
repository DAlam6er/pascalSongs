{
Напечатайте 20 случайных чисел в диапазоне от 1 до 50 так, чтобы каждое
число встретилось в распечатке лишь по разу.
}

var
    Sb : Set of Byte;
    i, num : Byte;
begin
    Sb := [];
    randomize;
    for i := 1 to 20 do begin
        repeat
            num := Random(50) + 1;
        until not (num in Sb);
        write(num, ' ');
        Sb := Sb + [num];
    end;
    writeln();
end.
