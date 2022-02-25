{
Каждая строка входного файла перечисляет границы государства
перва строка - государство A, вторая - B и т.д.
Необходимо составить список стран, которые имеют общие границы
с государством A
}
type TBoundSet = Set of Byte;
type TStateSet = Set of Char;

procedure WriteCharSet(var aFile : Text; const aSet : TStateSet);
var
    c : char;
begin
    for c := 'A' to 'Z' do
        if (c in aSet) then
            Write(aFile, c:2);
    Writeln(aFile);
end;

procedure ReadSet(var aFile : Text; var aSet : TBoundSet);
var
    i : Integer;
begin
    While (not SeekEoln(aFile)) do begin
        Read(aFile, i);
        aSet := aSet + [i];
    end;
    Readln(aFile);
end;

var
    inFile, outFile : Text;
    res : TStateSet;
    sA, sCountry : TBoundSet;
    state : Char;
begin
    Assign(inFile, 'p_38_3_in.txt');
    Assign(outFile, '');
    Reset(inFile);
    Rewrite(outFile);
    res := [];
    sA := [];
    state := 'A';
    ReadSet(inFile, sA);
    while not SeekEof(inFile) do begin
        state := Succ(state); { буква следующей страны }
        sCountry := [];
        ReadSet(inFile, sCountry);
        if (sA * sCountry <> []) then
            res := res + [state];
    end;
    WriteCharSet(outFile, res);
    Close(inFile);
    Close(outFile);
end.
