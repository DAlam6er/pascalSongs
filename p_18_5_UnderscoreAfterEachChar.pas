{   Пусть ваша программа напечатает введенную пользователем строку
    вразрядку, добавляя подчёркивание либо пробел после каждого символа
}
const
    res : string = '';
var
    str : string;
    i : integer;
begin
    write('Input string: ');
    readln(str);
    for i := 1 to length(str) - 1 do
        res := res + str[i] + '_';
    res := res + str[length(str)];
    writeln(res);
end.
