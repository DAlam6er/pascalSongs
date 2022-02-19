function Swap(var a1, a2 : integer) : boolean;
var
    temp : integer;
begin
    if (a1 > a2) then begin
        temp := a1;
        a1 := a2;
        a2 := temp;
        Swap := true;
    end else
        Swap := false;
end;

var
    n1, n2, n3 : integer;
begin
    write('Input first num: ');
    readln(n1);
    write('Input second num: ');
    readln(n2);
    write('Input third num: ');
    readln(n3);
    Swap(n1, n2);
    if (Swap(n2, n3)) then
        Swap(n1, n2);
    writeln('n1 < n2 < n3 ', n1, ' < ', n2, ' < ', n3);
end.
