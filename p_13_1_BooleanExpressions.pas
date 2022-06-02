var
    s : string;
    b : boolean;
begin
    writeln('Input ''1'' for TRUE, other for FALSE');
    readln(s);
    {if (s = '1') then 
        b := true
    else
        b := false;}
    b := s='1';
    writeln(b);
end.
