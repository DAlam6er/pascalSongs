{   Почтальон разносит газеты по улице, состоящей из N домов. Четные и
    нечетные номера расположены по разные стороны улицы. В здравом уме
    почтальон не рискует лишний раз переходить её. Ваша программа должна
    напечатать последовательность номеров, по которым будут разнесена почта, когда
    почтальон начинает работу:
        с первого дома;
        с N-го (последнего дома)
}
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
