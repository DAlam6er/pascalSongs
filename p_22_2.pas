{ подсчет символов в строке. Строка объявлена как const str для совместимости }

procedure CharCalc(const str : string; ch : char; var res: integer);
var
    i : integer;
begin
    res := 0;
    for i := 1 to length(str) do
        if (str[i] = ch) then
            res := res + 1;
end;

const
    cnt : integer = 0;
var
    s : string;
    c : char;
begin
    writeln('Input string:');
    readln(s);
    write('Input char to count: ');
    readln(c);
    Charcalc(s, c, cnt);
    writeln('Number of ''', c, ''' in ''', s, ''' = ', cnt); 
end.
