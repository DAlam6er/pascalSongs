{   Сгенерируйте два случайных числа (в диапазоне от 1 до 10) так, 
    чтобы они не совпадали.
}
var
    x, y : integer;
begin
    randomize;
    x := 1 + random(10);
    repeat
        y := 1 + random(10);
    until (y <> x);
    writeln('x = ', x, ' y = ', y);
end.
