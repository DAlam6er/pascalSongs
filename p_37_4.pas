{
s1, s2, s3 - кружки
1..250 - все студенты
res - множество, не состоящее в кружках
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
    Assign(inFile, 'p_37_4_in.txt');
    Reset(inFile);
    Assign(outFile, 'p_37_4_out.txt');
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
