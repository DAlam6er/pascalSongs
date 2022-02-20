{ 
Процедура печати делителей числа 
}
var
    n : integer;

procedure factors(num : integer);
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
    factors(n);
end.
