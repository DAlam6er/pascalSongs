{ p_12_1.pas - программа-часовой с циклом }
var
    pwd : string;
begin
    repeat
        writeln('Password?');
        readln(pwd);
        if (pwd = 'pascal') then
            writeln('You can pass.')
        else
            writeln('Stop!');
    until (pwd = '');
end.
