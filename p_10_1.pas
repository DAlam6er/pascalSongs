var
    pwd : string;
begin
    writeln('Password?');
    readln(pwd);
    if (pwd = 'pascal') then
        writeln('You can pass')
    else
        writeln('Stop!');
end.
