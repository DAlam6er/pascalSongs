{
Подсчет количества различных букв в файле.
Тип массива из целых чисел, индекс - символьный.
}

type
    TCounts = array ['a'..'z'] of integer;

var
    counts : TCounts;
    i : Char;
    inFile, outFile : Text;
begin
    for i := 'a' to 'z' do
        counts[i] := 0;
    Assign(inFile, 'p_40_3.pas');
    Reset(inFile);
    while not SeekEof(inFile) do begin
        Read(inFile, i);
        if i in ['a'..'z'] then
            Inc(counts[i]);
    end;
    Close(inFile);

    Assign(outFile, 'p_40_3.out');
    Rewrite(outFile);
    for i := 'a' to 'z' do
        Writeln(outFile, i, counts[i]:6);
    Close(outFile);
end.
