{
Подсчет символов в строке
}
function CharCount(const str : string; ch : char) : integer;
var
    i, res : integer;
begin
    res := 0;
    for i := 1 to length(str) do
        if (str[i] = ch) then
            res := res + 1;
    CharCount := res;
end;

var
    s : string;
begin
    s := 'PASCAL';
    writeln(CharCount(s, 'A'));
    writeln(CharCount('BANANA', 'N') + CharCount('BANANA', 'B'));
end.
