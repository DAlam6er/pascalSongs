var
    s : string;
begin
    { warning here! non-initialized}
    {writeln(s);}
    s:= 'Spartac';
    writeln(s);
    s:= s + ' is a champion!';
    writeln(s);
end.
