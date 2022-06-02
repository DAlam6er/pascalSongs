{
Ввод и вывод числового множества
}

type
    TSet = set of 1..255;

procedure ReadSet(var aFile : Text; var aSet : TSet);
var
    i : Byte;
begin
    while (not SeekEoln(aFile)) do begin
        Read(aFile, i);
        aSet := aSet + [i];
    end;
    readln(aFile);
end;

procedure WriteSet(var aFile : Text; const aSet : TSet);
var
    i : Byte;
begin
    for i := 1 to 255 do
        if (i in aSet) then
            write(aFile, i:4);
    writeln(aFile);
end;

var
    s1 : TSet;
    inFile, outFile : Text;
begin
    Assign(outFile, '');
    Rewrite(outFile);
    Assign(inFile, '');
    Reset(inFile);
    s1 := [];
    ReadSet(inFile, s1);
    WriteSet(outFile, s1);
    Close(inFile);
    Close(outFile);
end.
