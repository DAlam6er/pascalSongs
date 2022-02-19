var
    a, b, c, max : integer;
begin
    write('a = ');
    readln(a);
    write('b = ');
    readln(b);
    write('c = ');
    readln(c);
    if (a > b) and (a > c) then
        max := a
    else if (b > a) and (b > c) then
        max := b
    else if (c > a) and (c > b) then
        max := c;
    if (a = b) or (a = c) or (b = c) then
    begin
        writeln('Matching values found!');
        exit;
    end;
    writeln('Max number is ', max);
end.
