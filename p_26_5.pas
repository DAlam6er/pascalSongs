{
Скопировать один файл в другой:
    с перестановкой местами четных и нечетных строк;
    с перестановкой строк в обратном порядке.
Имя исходного файла: 'src.txt'
Имя конечного файла: 'dest.txt'
}

procedure printReverseLines(const src, dest : string);
var
    srcFile, destFile : text;
    str, buf : string;
begin
    assign(srcFile, src);
    reset(srcFile);
    assign(destFile, dest);
    rewrite(destFile);
    while (not Eof(srcFile)) do begin
        readln(srcFile, str);
        buf := str;
        if (not Eof(srcFile)) then begin
            readln(srcFile, str);
            writeln(destFile, str);
        end;
        writeln(destfile, buf);
    end;
    close(destFile);
    close(srcFile);
end;

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

procedure printBackwards(const src, dest : string);
var
    i, num : integer;
    str : string;
    srcFile, destFile : text;
begin
    assign(srcFile, src);
    num := LinInFile(srcFile);
    assign(destFile, dest);
    rewrite(destFile);
    reset(srcFile);
    while (num <> 0) do begin
        for i := 1 to num do
            readln(srcFile, str);

        writeln(destFile, str);
        num := num - 1;
        reset(srcFile);
    end;
    close(srcFile);
    close(destFile);
end;

{ main program }
var
    mode : integer;
begin
    writeln('Copying ''src.txt'' to ''dest.txt''. Select mode: ' +
        sLineBreak + '1 - to copy with even lines and odd lines swapping;' +
        sLineBreak + '2 - to copy lines in reverse order; 0 - to exit.');
    readln(mode);
    if (mode = 1) then
        printReverseLines('src.txt', 'dest.txt')
    else if (mode = 2) then
        printBackwards('src.txt', 'dest.txt');
end.
