{
    Вариант 2 решения проблемы пересекающихся множеств
    1-я строка входного файла содержит мощность множества
    S - множество студентов, состоящих в любом кружке
    res - множество студентов, не состоящих в кружке
}

type TSet = Set of Byte;

procedure WriteSet(var aFile : text; const aSet : TSet);
var
    i : Byte;
begin
    for i := 1 to 255 do
        if (i in aSet) then
            Write(aFile, i:4);
    Writeln(aFile);
end;

procedure ReadSet(var aFile : Text; var aSet : TSet);
var
    i : Byte;
begin
    while (not SeekEoln(aFile)) do begin
        read(aFile, i);
        aSet := aSet + [i];
    end;
    Readln(aFile);
end;

var
    res, s : TSet;
    inFile, outFile : Text;
    stNumber : Byte;
begin
    Assign(inFile, 'p_37_5.in');
    Reset(inFile);
    Assign(outFile, 'p_37_5.out');
    Rewrite(outFile);
    Readln(inFile, stNumber);
    s := [];
    while (not SeekEof(inFile)) do
        ReadSet(inFile, s);
    res := [1..stNumber] - s;
    WriteSet(outFile, res);
    Close(outFile);
    Close(inFile);
end.
