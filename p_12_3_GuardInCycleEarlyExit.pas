{ p_12_3.pas - программа-часовой с циклом }
var
    pwd : string;
begin
    repeat
        writeln('Password?');
        readln(pwd);
        if (pwd = '') then break;
        if (pwd = 'pascal') then
            writeln('You can pass.')
        else
            writeln('Stop!');
    until (pwd = '');
end.
