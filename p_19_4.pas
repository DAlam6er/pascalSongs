{   имитация работы почтальона, разносящего письма по домам.
    чётные и нечётные дома располагаются по разные стороны от дороги. }
var
    n, i : integer;
begin
    write('Number of houses: ');
    readln(n);
    i := 1;
    while i <= n do begin 
        write(i, ' ');
        i := i + 2;
    end;
    if (n mod 2 = 0) then
        i := n
    else
        i := n - 1;
    while i > 0  do begin
        write(i, ' ');
        i := i - 2;
    end;
    writeln();

    i := n;
    while i > 0 do begin
        write(i, ' ');
        i := i - 2;
    end;
    if (n mod 2 <>  0) then
        i := 2
    else
        i := 1;
    while i <= n do begin
        write(i, ' ');
        i := i + 2;
    end;
    writeln();
end.
