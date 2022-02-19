var
    a1, a2, b1, b2 : integer;

procedure VacResolution(start1, end1, start2, end2 : integer);

begin
    if ((start2 - end1 > 3) or (start1 - end2 > 3)) then
        writeln('Заявления работников удовлетворяют требованиям.')
    else
        writeln('Отказать в отпуске.');
end;

begin
    write('Дата начала отпуска первого сотрудника: ');
    readln(a1);
    write('Дата окончания отпуска первого сотрудника: ');
    readln(b1);
    write('Дата начала отпуска второго сотрудника: ');
    readln(a2);
    write('Дата окончания отпуска второго сотрудника: ');
    readln(b2);
    VacResolution(a1, b1, a2, b2);
end.
