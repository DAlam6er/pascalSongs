{
Напишите три функции для подсчета:
    строк в файле;
    видимых символов в файле;
    всех символов файла (фактический объём файла).
Имя входного файла задаётся с клавиатуры.
}
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

function VisCharInFile(var myFile : text) : integer;
var
    i, j : integer;
    str : string;
begin
    j := 0;
    reset(myFile);
    while (not Eof(myFile)) do begin
        readln(myFile, str);
        for i := 1 to length(str) do
            if (Ord(str[i]) > 31) then
                j := j + 1;
    end;
    close(myFile);
    VisCharInFile := j;
end;

function AllCharInFile(var myFile : text) : integer;
var
    i : integer;
    str : string;
begin
    i := 0;
    reset(myFile);
    while (not Eof(myFile)) do begin
        readln(myFile, str);
        i := i + length(str);
    end;
    close(myFile);
    AllCharInFile := i + LinInFile(myFile);
end;

var
    selFile : text;
    myFileName : string;
begin
    writeln('Input file name:');
    readln(myFileName);
    assign(selFile, myFileName);
    writeln('This file contains:');
    writeln(#9#9, LinInFile(selFile), ' lines.');
    writeln(#9#9, VisCharInFile(selFile),' visible characters.');
    writeln(#9#9, AllCharInFile(selFile), ' characters.');
end.
