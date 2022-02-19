var
    man : string;

procedure Pause;
begin
    write('Press Enter...');
    readln;
end;

{ объявление процедуры с формальным параметром }
procedure Pause(msg : string);
begin
    write(msg);
    readln;
end;

begin
    writeln('What is your name?');
    readln(man);
    writeln('Hello, ' + man);
    Pause;
    Pause('Once again...');
    Pause('and again...');
    Pause('and again!');
end.
