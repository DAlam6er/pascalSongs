{ p_14_2.pas -  экзаменатор таблицы умножения, вариант 2 }
var
    a, b, c : integer;
begin
    repeat
        write('First multiplier: ');
        readln(a);
        write('Second multiplier: ');
        readln(b);
        write('Product of a*b = ');
        readln(c);
        if (c <> 0) then
            if (a * b = c) then
                writeln('Well done!')
            else
                writeln('Error, try again!');
    until (c = 0);
end.
