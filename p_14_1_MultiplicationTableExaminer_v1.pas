{ p_14_1.pas -  экзаменатор таблицы умножения, вариант 1 }
var
    a, b, c : integer;
    res : boolean;
    msg : string;
begin
    repeat
        write('First multiplier: ');
        readln(a);
        write('Second multiplier: ');
        readln(b);
        write('Product of a*b = ');
        readln(c);
        if (c = 0) then break;
        res := a * b = c;
        if (res) then
            msg := 'Well done!'
        else
            msg := 'Error, try again!';
        writeln(msg);
    until false;
end.
