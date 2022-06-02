{
Вычисление завербованного сотрудника
}

type TSet = Set of Byte;

procedure ReadSetFromFile(var inFile : Text; var aSet : TSet);
var
    el : Byte;
begin
    aSet := [];
    Readln(inFile); // Заголовок лаборатории
    while (not SeekEoln(inFile)) do begin
        Read(inFile, el);
        aSet := aSet + [el];
    end;
    Readln(inFile);
end;

procedure WriteSetToFile(var outFile : Text; const aSet : TSet);
var
    el : Byte;
begin
    for el in aSet do
        Write(outFile, el);
    Writeln(outFile);
end;

var
    inFile, outFile : Text;
    labA, labB, labC, labD, labE, labF, labG, labH, suspectSet : TSet;
begin
    Assign(inFile, 'p_38_2.in');
    Assign(outFile, '');
    Reset(inFile);
    Rewrite(outFile);
    ReadSetFromFile(inFile, labA);
    ReadSetFromFile(inFile, labB);
    ReadSetFromFile(inFile, labC);
    ReadSetFromFile(inFile, labD);
    ReadSetFromFile(inFile, labE);
    ReadSetFromFile(inFile, labF);
    ReadSetFromFile(inFile, labG);
    ReadSetFromFile(inFile, labH);
    suspectSet := (labA * labD * labG * labH) - (labB + labC + labE + labF);
    Writeln(outFile, 'Persons of interest: ');
    WriteSetToFile(outFile, suspectSet);
    Close(inFile);
    Close(outFile);
end.
