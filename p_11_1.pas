var
    pwd : string;
begin
    writeln('Password?');
    readln(pwd);
    if (pwd = 'pascal') then begin
        writeln('Open the gates!');
        writeln('Orchestra, music!');
        writeln('You can pass.');
    end else begin
        writeln('Alarm!');
        writeln('Detain him!');
    end;
end.
