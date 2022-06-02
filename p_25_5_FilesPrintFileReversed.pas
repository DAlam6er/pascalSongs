{
Напишите процедуру для вывода на экран N-й строки файла, 
где N —параметр процедуры. 
Воспользовавшись этой процедурой, 
напишите программу для распечатки строк файла в обратном порядке.
Имя файла задается с клавиатуры.
Печать файла осуществляется на экран.
}

uses
    SysUtils; {for using IntToStr() function}

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

function GetLine(var myFile : text; strToGet : integer) : string;
var
    i, numStr : integer;
    str : string;
begin
    numStr := LinInFile(myFile);
    if (strToGet <= numStr) then begin
        reset(myFile);
        for i := 1 to strToGet do
            readln(myFile, str);
        close(myFile);
        GetLine := str;
    end else begin
        GetLine := 'The last line in this file is ' + IntToStr(numStr);
    end;
end;

procedure printBackwards(var myFile : text);
var
    i, num : integer;
    str : string;
begin
    num := LinInFile(myFile);
    reset(myFile);
    while (num <> 0) do begin
        for i := 1 to num do begin
        { читает всегда в прямом порядке }
            readln(myFile, str);
        end;
        writeln(str);
        num := num - 1;
        reset(myFile);
    end;
    close(myFile);
end;

var 
    myFile : text;
    myFileName : string;
    strNum : integer;
begin
    writeln('Input file name:');
    readln(myFileName);
    write('Input string number to get: ');
    readln(strNum);
    assign(myFile, myFileName);
    writeln(GetLine(myFile, strNum));
    writeln('PRINTING BACKWARDS:');
    printBackwards(myFile);
end.
