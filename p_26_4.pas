function LinInFile(var myFile : text) : integer;
var
    i : integer;
    str : string;
begin
    i := 0;
    reset(myFile);
    while (not Eof(myFile)) do begin
        readln(myFile, str);
        i := i + 1;
    end;
    close(myFile);
    LinInFile := i;
end;

procedure EnumerateFile (const fileName : string);
var
    myFile : text;
    finFile : text;
    i : integer;
    str : string;
begin
    assign(myFile, fileName);
    reset(myFile);
    assign(finFile, 'test_enumerated.txt');
    rewrite(finFile);
    i := 1;
    while (not Eof(myFile)) do begin
        writeln(finFile, i);
        i := i + 1;
        readln(myFile, str);
        writeln(finFile, str);
    end;
    close(finFile);
    close(myFile);
end;

{ main program }
begin
    EnumerateFile('test.txt');
end.
