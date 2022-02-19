var
    pwd : string;
begin
    repeat
        writeln('Password?');
        readln(pwd);
        if (pwd = '') then break;
        if (pwd = 'pascal') then begin
            writeln('Open the gates!');
            writeln('Orchestra, music!');
            writeln('You can pass.');
        end else begin
            writeln('Alarm!');
            writeln('Detain him!');
        end;
    until (pwd = '')
end.
