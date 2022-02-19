var
    a1, b1, a2, b2 : integer;
begin
    write('input ''a'' of the first piece: ');
    readln(a1);
    write('input ''b'' of the first piece: ');
    readln(b1);
    write('input ''a'' of the second piece: ');
    readln(a2);
    write('input ''b'' of the second piece: ');
    readln(b2);
    if ((a1 * b1) > (a2 * b2)) then
        writeln('The biggest one is ', a1, 'x', b1)
    else if ((a2 * b2) > (a1 * b1)) then
        writeln('The biggest one is ', a2, 'x', b2)
    else
        writeln('Both have the same square.');
end.
