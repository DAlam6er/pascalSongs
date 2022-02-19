procedure sumDifference(x, y : integer);
begin
    writeln('x + y = ', x + y);
    writeln('x - y = ', x - y);
end;

var
    a, b : integer;
begin
    write('a = ');
    readln(a);
    write('b = ');
    readln(b);
    sumDifference(a, b);
end.
