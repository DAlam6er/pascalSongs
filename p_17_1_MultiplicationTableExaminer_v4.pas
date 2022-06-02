{ p_17_1.pas - программа-экзаменатор ver.4 }

var
    a, b, c : integer;
    qst, err : integer;
    res: string;
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
        case err of
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
end.
