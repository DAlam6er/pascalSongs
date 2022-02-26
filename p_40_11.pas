{
Напишите функцию для подсчета количества номеров в полицейской БД
при условии, что одна строка может содержать несколько номеров, 
а некоторые строки (в т.ч. в конце файла) могут быть пустыми.
}

function CountNumbers(var inFile : Text) : Integer;
var
    cnt, num : Integer;
begin
    cnt := 0;
    while not SeekEof(inFile) do begin
        while SeekEoln(inFile) do
            if Eof(inFile) then
                break
            else
                Readln(inFile);

            if SeekEof(inFile) then break;
            Read(inFile, num);
            Inc(cnt);
    end;
    CountNumbers := cnt;
end;

var
    inFile : Text;
begin
    Assign(inFile, 'p_40_11.out');
    Reset(inFile);
    Writeln(CountNumbers(inFile));
    Close(inFile);
end.
