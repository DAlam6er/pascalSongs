{ sum of arithmetical progression }

const
    res : integer = 0;
var
    n, i : integer;
begin
    write('Enter n: ');
    readln(n);
    for i := 1 to n do
        res := res + i;
    writeln('sum from 1 to ', n, ' equals ', res);
end.
