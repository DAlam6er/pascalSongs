{
    В начале учебного года директор школы распорядился, чтобы все ученики вступили в
    какой-либо кружок или спортивную секцию — по желанию. А теперь, спустя пару
    месяцев, он проверяет исполнение приказа. Директор намерен наказать тех, кто не
    исполнил распоряжения, и поощрить состоящих в нескольких кружках или секциях. 
    
    s1, s2, s3 - кружки
    1..MAX - все студенты
    res - искомое множество студентов, не состоящее в кружках
}

const MAX = 20;
type TSet = Set of 1..MAX;

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
    res, s1, s2, s3 : TSet;
    inFile, outFile : Text;
begin
    Assign(inFile, 'p_37_4.in');
    Reset(inFile);
    Assign(outFile, 'p_37_4.out');
    Rewrite(outFile);
    s1 := [];
    s2 := [];
    s3 := [];
    ReadSet(inFile, s1);
    ReadSet(inFile, s2);
    ReadSet(inFile, s3);
    res := [1..MAX] - (s1 + s2 + s3);
    WriteSet(outFile, res);
    Close(outFile);
    Close(inFile);
end.
