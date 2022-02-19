var
    s : string;
    i : integer;
    oldCh, newCh : char;

procedure Scan(var arg : string; ch1, ch2 : char);
var
    i : integer;
begin
    for i := 1 to Length(arg) do
        if (arg[i] = ch1) then
            arg[i] := ch2;
end;

begin
    for i := 1 to 100 do
        writeln();
    for i := 1 to 3 do begin
        write('Input string: ');
        readln(s);
        write('Input character to be replaced: ');
        readln(oldCh);
        write('Input character to be replaced with: ');
        readln(newCh); 
        Scan(s, oldCh, newCh);
        writeln(s);
    end;
end.
