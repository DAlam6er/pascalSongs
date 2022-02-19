const
    res : integer = 0;
var
    a, b, i : integer;
begin
    write('a = ');
    readln(a);
    write('b = ');
    readln(b);
    for i := 1 to b do
        res := res + a;
    writeln(a, 'x', b, ' = ', res);
end.
