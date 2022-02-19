var
    x : integer;
begin
    randomize;
    repeat
    x := random(20);
    writeln(x);
    until (x = 1);
end.
