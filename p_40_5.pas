{
Объявите массив из сотни целых чисел, заполните его случайными
числами в диапазоне от 0 до 255 и распечатайте этот массив.
}

type
    TByte = array[0..255] of Byte;
var
    bytes : TByte;
    i : Byte;
    outFile : Text;
begin
    Randomize;
    Assign(outFile, 'p_40_5.out');
    Rewrite(outFile);
    for i := 0 to 255 do
        bytes[i] := random(256);
    for i := 0 to 255 do
        Write(outFile, bytes[i]:4);
    Writeln(outFile);
    Close(outFile);
end.
