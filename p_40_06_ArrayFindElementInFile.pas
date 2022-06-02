{
Найдите в массиве, сформированного из файла p_40_05.out,
все элементы, хранящие число 7 (если таковые найдутся). 
Напечатайте индексы элементов, которые содержат это число.
}

type
    TByte = array[0..255] of Byte;

procedure ReadFromFile(var inFile : Text; var aArray : TByte);
var
    i, num : Byte;
begin
    i := 0;
    while not SeekEof(inFile) do begin
        while SeekEoln(inFile) do
            if (Eof(inFile)) then
                break
            else
                Readln(inFile);
        if (SeekEof(inFile)) then break;
        while not SeekEoln(inFile) do begin
            read(inFile, num);
            aArray[i] := num;
            Inc(i);
        end;
    end;
end;

var
    bytes : TByte;
    inFile : Text;
    i : Integer;
begin
    Assign(inFile, 'p_40_05.out');
    Reset(inFile);
    ReadFromFile(inFile, bytes);
    Writeln('indices: ');
    for i := 0 to 255 do
        if (bytes[i] = 7) then
            write(i:4);
    Writeln;
    Close(inFile);
end.
