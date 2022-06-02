{ Напишите программу для подсчета букв «А» во введенной пользователем строке. }
const
    cnt : integer = 0;
var
    str : string;
    i : integer;
begin
    write('Input string: ');
    readln(str);
    for i :=1 to length(str) do
        if ((str[i] = 'A') or (str[i] = 'a')) then
            cnt := cnt + 1;
    writeln('Number of ''A(a)'' is ', cnt);
end.
