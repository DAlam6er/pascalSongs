const
    LINE = '*****************';
var
    name : string;
begin
    writeln(LINE);
    writeln('What is your name?');
    writeln(LINE);
    readln(name);
    writeln('Hello, ', name);
    writeln('Press ENTER');
    readln;
end.
