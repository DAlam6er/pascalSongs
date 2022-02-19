{ p_15_3 - программа-экзаменатор ver.2 }

var
    a, b, c : integer;
begin
    randomize;
    repeat
        a := 1 + random(10);
        b := 1 + random(10);
        write(a, '*', b, ' = ');
        readln(c);
        if (c = 0) then break;
        if (a * b = c) then
            writeln('Correct!')
        else
            writeln('Error. Try again!');
    until false;
end.
