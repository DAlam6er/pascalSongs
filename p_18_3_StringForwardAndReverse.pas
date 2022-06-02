{ Вывод строки в прямом и обратном порядке }
var
    i : integer;
    str : string;
begin
    write('Input string: ');
    readln(str);
    for i := 1 to length(str) do
        str := str + str[i];
    writeln(str);
    for i := length(str) downto 1 do
        str := str + str[i];
    writeln(str);
end.
