{
Обработка журнала v.2
Входные данные: файл 'scores2.txt'
Выходные данные: файл 'scores2_output.txt'
Содержание входного файла:
набор строк, содержащих фамилию ученика - строка
и оценки - числа. Разделителем является пробел.
Eoln() и Eof() заменены на SeekEoln() и SeekEof()
для решения проблемы концевых пробелов во входном файле
Содержание выходного файла:
Таблица с заголовком и следующим содержанием
Номер   Фамилия     Количество оценок   Сумма баллов    Средний балл
1       Акулова     число оценок        сумма оценок    среднее арифм.
...
}

// This is the same mode as FPC mode, 
// but it also includes classes, interfaces and exceptions.
//{$mode objfpc}

//interprets the reserved word String as an AnsiString
{$H+}

//sets the codepage of the rest of the source file. 
//The codepage is only taken into account when interpreting literal strings, 
//the actual code must be in US-ASCII. 
//The argument to this switch is the name of the code page to be used.
{$codepage UTF8}

uses
{$IFNDEF WINDOWS}
     cwstring;
{$ENDIF}

const
    inFileName = 'scores2.txt';
    outFileName = 'scores2_output.txt';

function ReadFam(var inFile : TextFile) : UnicodeString;
var
    str : UnicodeString;
    ch : UnicodeChar;
begin
    str := '';
    while (not SeekEof(inFile)) do begin
        // read пропускает пробелы
        read(inFile, ch);
        // если не цифра
        if (Ord(ch) > 65) then
            str := str + ch
        else
            break;
    end;
    ReadFam := str;
end;

procedure HandleString(var inFile, outFile : TextFile; lineCnt : integer);
var
    score, scoreCnt, scoreSum : integer;
    scoreRating : real;
    studentFam : UnicodeString;
begin
    studentFam := ReadFam(inFile);
    scoreSum := 0;
    scoreCnt := 0;
    while (not SeekEoln(inFile)) do begin
        Read(inFile, score);
        scoreSum := scoreSum + score;
        scoreCnt := scoreCnt + 1;
    end;
    if (scoreCnt > 0) then begin
        scoreRating := scoreSum / scoreCnt;
        writeln(outFile, lineCnt:-3, studentFam:17, scoreCnt:6,
                scoreSum:14, scoreRating:11:1);
    end else begin
        writeln(outFile, lineCnt : 3, ' Ученик не аттестован');
    end;
end;

{ main }
const
    f = '';
var
    lineCnt : integer;
    inFile, outFile : TextFile;
begin
    lineCnt := 0;
    assign(inFile, inFileName);
    reset(inFile);
    assign(outFile, outFileName);
    rewrite(outFile);
    { header }
    writeln(outFile,'Номер', f:6, 'Фамилия', f:5, 'Количество',f:4,
        'Сумма',f:4, 'Средний');
    writeln(outFile,'ученика', f:16, 'оценок', f:8, 'баллов',f:3, 'балл');
    while (not SeekEof(inFile)) do begin
        lineCnt := lineCnt + 1;
        HandleString(inFile, outFile, lineCnt);
        Readln(inFile); // переход на новую строку после обработки
    end;
    Close(inFile);
    Close(outFile);
end.
