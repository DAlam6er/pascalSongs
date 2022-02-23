{
Напечатайте с тремя знаками после точки 20 случайных вещественных
чисел в диапазоне от 0 до 10.
}
var
    i : integer;
begin
    randomize;
    for i := 1 to 20 do
        writeln((random(11) / (random(9) + 1)):5:3);
end.
