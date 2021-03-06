{
Программа переводит секунды, прошедшие с начала суток
в часы, минуты, секунды.
В 1 часе 86 400 с.
}

var
    secPass : LongInt;
    hStr, hMin, hSec : String;
    h, m, s : Byte;
begin
    write('Количество секунд, прошедших с начала суток (<= 86400): ');
    readln(secPass);
    h := secPass div 3600;
    m := (secPass mod 3600) div 60;
    s := (secPass mod 3600) mod 60;
    case h of
        1, 21 : hStr := 'час';
        2..4, 22..24 : hStr := 'часа';
        0, 5..20 : hStr := 'часов';
    end;
    case m of
        1, 21, 31, 41, 51 :
            hMin := 'минута';
        2..4, 22..24, 32..34, 42..44, 52..54 :
            hMin := 'минуты';
        0, 5..20 :
            hMin := 'минут';
    end;
    case s of
        1, 21, 31, 41, 51 :
            hSec := 'секунда';
        2..4, 22..24, 32..34, 42..44, 52..54 :
            hSec := 'секунды';
        0, 5..20 :
            hSec := 'секунд';
    end;
    writeln('Текущее время: ', h, ' ', hStr, ' ', m, ' ', hMin,
        ' ', s, ' ', hSec, '.');
end.
