type TSet = Set of 1..250;

procedure WriteSet(var outFile : Text; const aSet : TSet);
var
    el : Byte;
begin
    for el in aSet do
        Write(outFile, el:4);
    Writeln;
end;


var
    s1, s2, s3, res : TSet;
    inFile, outFile : Text;
begin
    Assign(inFile, '');
    Assign(outFile, '');
    Reset(inFile);
    Rewrite(outFile);
    s1 := [2, 11, 4, 13];
    s2 := [9, 17, 12, 11, 3, 5, 18, 2, 13];
    s3 := [14, 2, 13, 15, 20];
    res := s1 * s2 + s1 * s3 + s2 * s3;
    Writeln('Состоящие более, чем в 1 кружке:');
    WriteSet(outFile, res);
    Writeln('Состоящие во всех 3 кружках:');
    res := s1 * s2 * s3;
    WriteSet(outFile, res);
    Writeln('Состоящие в 2 кружках и не более:');
    res := (s1 * s2 + s1 * s3 + s2 * s3) - (s1 * s2 * s3);
    WriteSet(outFile, res);
    Writeln('Состоящие только в 1 из кружков:');
    res := (s1 + s2 + s3) - res - (s1 * s2 * s3);
    WriteSet(outFile, res);
    Close(outFile);
    Close(inFile);
end.
