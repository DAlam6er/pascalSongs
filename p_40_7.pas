{
Заполните массив из 100 случайных чисел в диапазоне от 0 до 255
так, чтобы ни одно из них не повторялось. Воспользуйтесь вспомогательным
множеством чисел, где будут запоминаться сгенерированные ранее числа.
}

const
    ARRSIZE = 100;

type
    TByte = array[1..ARRSIZE] of Byte;
    TSet = set of Byte;
var
    bytes : TByte;
    i, tmpNum : Byte;
    tmpSet : TSet;
    outFile : Text;
begin
    Randomize;
    tmpSet := [];
    Assign(outFile, 'p_40_7.out');
    Rewrite(outFile);
    for i := 1 to ARRSIZE do begin
        repeat
            tmpNum := random(256);
        until not (tmpNum in tmpSet);
        tmpSet := tmpSet + [tmpNum];
        bytes[i] := tmpNum;
    end;
    for i := 1 to ARRSIZE do
        Write(outFile, bytes[i]:4);
    Writeln(outFile);
    Close(outFile);
end.
