{ p_18_1.pas - распечатка отдельных символов строки }
{ работает только с латиницей }
var
    str : string;
    i, len : integer;
begin
    repeat
        write('Input string: ');
        readln(str);
        len := length(str);
        for i := 1 to len do
            writeln(str[i]);
    until (len=0);
    writeln('Программа завершена!');
end.
