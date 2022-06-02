{
Программа "вопрос-ответ" с применением массива
}

const
    CAnswers = 100;
type
    TAnswers = array[1..CAnswers] of String;
var
    answers : TAnswers;
    fact : Integer;
    inFile : Text;
    str : String;

procedure ReadFromFile(var aFile : Text);
var
    i : Integer;
begin
    fact := 0;
    for i := 1 to CAnswers do begin
        if SeekEof(inFile) then break;
        Readln(inFile, Answers[i]);
        Inc(fact);
    end;
end;

{ main program }
begin
    Assign(inFile, 'p_40_01.in');
    Reset(inFile);
    ReadFromFile(inFile);
    Close(inFile);
    Randomize;
    repeat
        Write('Введите вопрос: ');
        Readln(str);
        if (str <> '') then
            Writeln(answers[Random(fact)+1]);
    until (str = '');
end.
