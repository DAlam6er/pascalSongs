var
    p1, p2, r1, r2 : integer;
begin
    write('Начало платного участка: ');
    readln(p1);
    write('Конец платного участка: ');
    readln(p2);
    write('Начало ремонтного участка: ');
    readln(r1);
    write('Конец ремонтного участка: ');
    readln(r2);
    if ((p1 = r1) and (p2 = r2)) then
        writeln('Будут ремонтировать весь платный участок ', 
            p1, ' - ', p2, ' длиной ', p2 - p1)
    else if ((r2 <= p1) or (r1 >= p2)) then
        writeln('Будут ремонтировать только бесплатный участок ', 
            r1, ' - ', r2, ' длиной ', r2 - r1)
    else if ((r1 >= p1) and (r2 <= p2)) then
        writeln('Длина ремонтируемой платной части ', r2 - r1)
    else if ((r1 <= p1) and (r2 <= p2)) then
    begin
        writeln('Длина ремонтируемой платной части ', r2 - p1);
        writeln('Длина ремонтируемой бесплатной части ', p1 - r1);
    end
    else if ((r1 <= p1) and (r2 >= p2)) then
    begin
        writeln('Длина ремонтируемой платной части ', p2 - p1);
        writeln('Длина ремонтируемой бесплатной части ', (p1 - r1) + (r2 - p2));
    end
    else if ((r1 >= p1) and (r2 >= p2)) then
    begin
        writeln('Длина ремонтируемой платной части ', p2 - r1);
        writeln('Длина ремонтируемой бесплатной части ', r2 - p2);
    end;
end.
