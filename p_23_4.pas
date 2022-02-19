function SearchChar(var str : string; ch : char) : boolean;
var
    i : integer;
begin
    SearchChar := false;
    for i := 1 to length(str) do
        if (str[i] = ch) then begin
            SearchChar := true;
            break
        end;
end;

var
    s : string;
    ch : char;
begin
    write('Input string to analyze: ');
    readln(s);
    write('Input char to find: ');
    readln(ch);
    if (SearchChar(s, ch)) then
        writeln('Specified char was found!')
    else
        writeln('No specified char was found');
end.
