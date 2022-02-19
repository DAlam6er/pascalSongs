function Max(arg1, arg2 : integer) : integer;
begin
    if (arg1 >= arg2) then
        Max := arg1
    else
        Max := arg2;
end;

var
    a, b, c, d : integer;
begin
    write('Input first num: ');
    readln(a);
    write('Input second num: ');
    readln(b);
    write('Input third num: ');
    readln(c);
    write('Input fourth num: ');
    readln(d);
    writeln('Max(', a, ', ', b, ') = ', Max(a, b));
    writeln('Max(Max(', a, ', ', b, '), Max(', c, ', ', d, ')) = ', 
        Max((Max(a, b)), Max(c, d)));
end.
