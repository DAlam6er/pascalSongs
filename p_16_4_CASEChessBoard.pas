{   Программа запрашивает в цикле два числа: вертикаль и горизонталь
    шахматной доски (числа от 1 до 8), а затем печатает цвет клетки на их пересечении.
    Если хотя бы одно из чисел равно нулю, цикл завершается. Если числа выходят за
    указанные пределы, сообщает об ошибке и повторяет запрос чисел.
}
var
    color : string;
    numHor, numVer : integer;
begin
    repeat
        write('number on horizontal: ');
        readln(numHor);
        write('number on vertical: ');
        readln(numVer);
        if ((numHor < 1) or (numHor > 8)) or ((numVer < 1) or (numVer > 8))
        then begin
            writeln('Error! Numbers out of range!');
            break;
        end;
        case (numHor mod 2) of
            0:
                case (numVer mod 2) of
                    0:
                        color := 'black';
                    else
                        color := 'white';
                end;
            else
                case (numVer mod 2) of
                    0:
                        color := 'white';
                    else
                        color := 'black';
                end;
        end;
        writeln(color);
    until false;
end.
