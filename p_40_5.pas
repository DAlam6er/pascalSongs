{
Объявите массив из сотни целых чисел, заполните его случайными
числами в диапазоне от 0 до 255 и распечатайте этот массив.
}

const
    ARRSIZE = 100;

type
    TByte = array[1..ARRSIZE] of Byte;
var
    bytes : TByte;
    i : Byte;
    outFile : Text;
begin
    Randomize;
    Assign(outFile, 'p_40_5.out');
    Rewrite(outFile);
    for i := 1 to ARRSIZE do
        bytes[i] := random(256);
    for i := 1 to ARRSIZE do
        Write(outFile, bytes[i]:4);
    Writeln(outFile);
    Close(outFile);
end.
