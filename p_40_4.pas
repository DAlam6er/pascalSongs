{
Подсчет цифр в файле
}

type
    TDigits = array['0'..'9'] of Integer;
var
    digits : TDigits;
    i : Char;
    inFile, outFile : Text;
begin
    Assign(inFile, 'p_40_2.in');
    Reset(inFile);
    for i := '0' to '9' do
        digits[i] := 0;
    while not SeekEof(inFile) do begin
        while SeekEoln(inFile) do
            if Eof(inFile) then
                break
            else
                Readln(inFile);
        if (SeekEof(inFile)) then break;
        while not SeekEoln(inFile) do begin
            Read(inFile, i);
            if (i in ['0'..'9']) then
                Inc(digits[i]);
        end;
    end;
    Assign(outFile, '');
    Rewrite(outFile);
    for i := '0' to '9' do
        writeln(outFile, i, digits[i]:6);
    Close(inFile);
end.
