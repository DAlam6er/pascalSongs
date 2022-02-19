{ print text of this program from file to console }
var
    myfile : text;
    str : string;
begin
    assign(myfile, 'p_25_1.pas');
    reset(myfile);
    repeat
        if (Eof(myfile)) then break;
        readln(myfile, str);
        writeln(str);
    until false;
    close(myfile);
end.
