var
    age : integer;
    year : string;
begin
    write('Ваш возраст: ');
    readln(age);
    case (age mod 100) of
        11, 12, 13, 14:
            year := 'лет';
        else
            case (age mod 10) of
                1:
                    year := 'год';
                2, 3, 4:
                    year := 'года';
                else
                    year := 'лет';
            end;
    end;
    writeln('Вам ', age, ' ', year);
end.
