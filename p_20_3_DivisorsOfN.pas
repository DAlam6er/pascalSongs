{ 
    Создайте процедуру, печатающую все числа, кроме единицы, на которые
    без остатка делится число N, где N — параметр процедуры. Напишите программу
    для проверки этой процедуры.
}
var
    n : integer;

procedure divisors(num : integer);
var
    i : integer;
begin
    for i := 2 to (num div 2) do
        if (n mod i = 0) then
            write(i, ' ');
    writeln();
end;

begin
    write('Input n: ');
    readln(n);
    divisors(n);
end.
