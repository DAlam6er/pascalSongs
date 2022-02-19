{ p_16_1.pas - игра "вопрос-ответ" }

function LinInFile(var myFile : text) : integer;
var
    i : integer;
    str : string;
begin
    i := 0;
    reset(myFile);
    while (not Eof(myFile)) do begin
        readln(myFile, str);
        i := i + 1;
    end;
    close(myFile);
    LinInFile := i;
end;

function RandomLine(var myFile : text) : string;
var
    i, numStr : integer;
    str : string;
begin
    Randomize;
    numStr := LinInFile(myFile);
    reset(myFile);
    for i := 1 to random(numStr + 1) do
        readln(myFile, str);
    close(myFile);
    RandomLine := str;
end;

var 
    card : string;
    ansFile : text;
begin
    randomize;
    repeat
        write('Ваш вопрос: ');
        readln(card);
        if (card = '') then break;
        assign(ansFile, 'answers.txt');
        writeln(RandomLine(ansFile));
    until false;
end.
