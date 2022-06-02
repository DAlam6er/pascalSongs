var
    pwd, res : string;
begin
    writeln('Password?');
    readln(pwd);
    res := 'Stop!';
    if (pwd = 'pascal') then
        res := 'You can pass.';
    writeln(res);
end.
