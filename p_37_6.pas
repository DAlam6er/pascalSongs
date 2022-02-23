{
Напишите процедуры для ввода и вывода множества символов.
}

type TChar = Set of Char;

procedure ReadSet(var inFile : Text; var acSet : TChar);
var
    i : Char;
begin
    while (not SeekEoln(inFile)) do begin
        Read(inFile, i);
        acSet := acSet + [i];
    end;
    Readln(inFile);
end;

procedure WriteSet(var outFile : Text; const acSet : TChar);
var
    i : Char;
begin
    for i := Chr(32) to Chr(255) do
        if (i in acSet) then
            Write(outFile, i:2);
    Writeln(outFile);
end;

var
    inFile, outFile : Text;
    cSet : TChar;
begin
    Assign(inFile, '');
    Assign(outFile, '');
    Reset(inFile);
    Rewrite(outFile);
    cSet := [];
    ReadSet(inFile, cSet);
    WriteSet(outFile, cSet);
    close(outFile);
    close(inFile);
end.
