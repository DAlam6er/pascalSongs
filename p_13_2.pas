{ p_13_2.pas - первый маршрут проезда }
var
    a, b : boolean;
    info, res : string;
begin
    { ввод данных со спутника }
    write('Улица A: ');
    readln(info);
    a := info = '1';
    write('Улица B: ');
    readln(info);
    b := info = '1';
    if (a and b) then
        res := 'Поезжай на машине'
    else
        res := 'Топай пешком';
    writeln(res);
end.
