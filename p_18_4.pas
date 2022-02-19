{ 8(495)194-25-72 -> 84951942573 }
const
    res : string = '';
var
    str : string;
    i : integer;
begin
    write('Input string: ');
    readln(str);
    for i := 1 to length(str) do
        case str[i] of
            ' ', '-', '(', ')' : ;
        else
            res := res + str[i];
        end;
    writeln(res);
end.
