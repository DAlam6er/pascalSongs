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
