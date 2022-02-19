const
    res : string = '';
var
    str : string;
    i : integer;
begin
    write('Input string: ');
    readln(str);
    res := str[1] + '_';
    for i := 2 to length(str) - 1 do
        res := res + str[i] + '_';
    res := res + str[length(str)];
    writeln(res);
end.
