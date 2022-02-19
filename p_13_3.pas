var
    info, res : string;
    a, b, c, d, e, f, g : boolean;
begin
    write('Street ''A''? ');
    readln(info);
    a := info='1';
    write('Street ''B''? ');
    readln(info);
    b := info='1';
    write('Street ''C''? ');
    readln(info);
    c := info='1';
    write('Street ''D''? ');
    readln(info);
    d := info='1';
    write('Street ''E''? ');
    readln(info);
    e := info='1';
    write('Gate ''F''? ');
    readln(info);
    f := info<>'1';
    write('Gate ''G''? ');
    readln(info);
    g := info<>'1';
    if ((a and b and not f) or (c and d) or (e and not g)) then
        res := 'Поезжай на машине!'
    else
        res := 'Топай пешком!';
    writeln(res);
end.
