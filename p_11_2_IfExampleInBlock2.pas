var
    answer : string;
begin
    writeln('Что дождь? Всё ещё идёт?');
    readln(answer);
    if (answer = 'ага') then begin
        writeln('А зонтик ты так и не купил!');
        writeln('Сколько раз напоминать?');
    end else begin
        writeln('На этот раз тебе повезло!');
    end;
end.
