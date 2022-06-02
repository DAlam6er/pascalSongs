{   Программа-экзаменатор ver.5 
    Переработка p_17_1. Оценка выставляется в отдельной процедуре.
}
var
    a, b, c : integer;
    qst, err : integer;

procedure Score(errNum : integer);
var
    res: string;
begin
    case errNum of
        0:
            res := 'Отлично!';
        1, 2:
            res := 'Хорошо.';
        3..5:
            res := 'Удовлетворительно.';
        else
            res := 'Очень плохо!';
    end;
    writeln(res);
end;

begin
    randomize;
    err := 0;
    for qst := 1 to 15 do begin
        a := 1 + random(10);
        b := 1 + random(10);
        write(qst, ') Сколько будет ', a, 'x', b, '? ');
        readln(c);
        if (c = 0) then
            break
        else
            if (a * b <> c) then
                err := err + 1;
    end;
    if (c <> 0) then
        Score(err);
end.
