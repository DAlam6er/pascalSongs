var
    myfile : text;
    str : string;
    myfilename : string;
begin
    writeln('Input file name:');
    readln(myfilename);
    assign(myfile, myfilename);
    reset(myfile);
    while (not Eof(myfile)) do begin
        readln(myfile, str);
        writeln(str);
    end;
    close(myfile);
end.
