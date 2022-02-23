{
Напишите две функции, принимающие строку и возвращающие:
· строку, в которой символы исходной строки встречаются лишь по разу и
следуют в алфавитном порядке, например «PASCAL» -> «ACLPS»;
· то же, но порядок следования символов такой же, как в исходной строке,
например «PASCAL» -> «PASCL».
}

type TChar = Set of Char;

procedure ReadSetFromFile(var inFile : Text; var acSet : TChar);
var
    ch : Char;
begin
    while (not SeekEoln(inFile)) do begin
        Read(inFile, ch);
        acSet := acSet + [ch];
    end;
    Readln(inFile);
end;

procedure ReadSetFromString(const aStr : String; var acSet : TChar);
var
    i : Integer;
begin
    for i := 1 to length(aStr) do
        acSet := acSet + [aStr[i]];
end;

function DecimateStringFromFile(
    var inFile : Text; sorted : Boolean) : String;
var
    ch : Char;
    str, tmpStr : String;
    cSet : TChar;
    i : Integer;
begin
    cSet := [];
    str := '';
    if (sorted) then begin
        ReadSetFromFile(inFile, cSet);
        for ch in cSet do
            str := str + ch;
        DecimateStringFromFile := str;
    end else begin
        Readln(inFile, str);
        ReadSetFromString(str, cSet);
        tmpStr := '';
        i := 1;
        while (cSet <> []) do begin
            if (str[i] in cSet) then begin
                tmpStr := tmpStr + str[i];
                cSet := cSet - [str[i]];
            end;
            Inc(i);
        end;
        DecimateStringFromFile := tmpStr;
    end;
end;

procedure WriteSet(var outFile : Text; const acSet : TChar);
var
    ch : Char;
begin
    for ch := Chr(32) to Chr(255) do
        if (ch in acSet) then
            Write(outFile, ch:2);
    Writeln(outFile);
end;

var
    inFile, outFile : Text;
    str : String;
begin
    Assign(inFile, '');
    Assign(outFile, '');
    Reset(inFile);
    Rewrite(outFile);
    str := DecimateStringFromFile(inFile, true);
    Writeln(outFile, 'sorted string: ');
    Writeln(outFile, str);

    Reset(inFile);
    str := DecimateStringFromFile(inFile, false);
    Writeln(outFile, 'non sorted string: ');
    Writeln(outFile, str);

    close(outFile);
    close(inFile);
end.
