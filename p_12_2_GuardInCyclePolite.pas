{ p_12_2.pas - программа "вежливый" часовой с циклом }
var
    pwd : string;
begin
    repeat
        writeln('Password?');
        readln(pwd);
        if (pwd <> '') then
            if (pwd = 'pascal') then
                writeln('You can pass.')
            else
                writeln('Stop!');
    until (pwd = '');
end.
