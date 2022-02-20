{
Обработка журнала v.1
Входные данные: файл 'scores.txt'
Выходные данные: файл 'scores_output.txt'
Содержание входного файла:
набор строк, содержащих ТОЛЬКО оценки - 
числа, разделенные пробелом.
Содержание выходного файла:
Таблица с заголовком и следующим содержанием
Номер   Количество оценок   Сумма баллов    Средний балл
1       число оценок        сумма оценок    среднее арифм.
...
}

const
    inFileName = 'scores.txt';
    outFileName = 'scores_output.txt';

procedure HandleString(var inFile, outFile : text; lineCnt : integer);
var
    score, scoreCnt, scoreSum : integer;
    scoreRating : real;
begin
    scoreSum := 0;
    scoreCnt := 0;
    while (not Eoln(inFile)) do begin
        Read(inFile, score);
        scoreSum := scoreSum + score;
        scoreCnt := scoreCnt + 1;
    end;
    if (scoreCnt > 0) then begin
        scoreRating := scoreSum / scoreCnt;
        writeln(outFile, lineCnt:3, scoreCnt:13, scoreSum:14, 
            scoreRating:12:1);
    end else begin
        writeln(outFile, lineCnt : 3, ' Ученик не аттестован');
    end;
end;

{ main }
const
    f = '';
var
    lineCnt : integer;
    inFile, outFile : text;
begin
    lineCnt := 0;
    assign(inFile, inFileName);
    reset(inFile);
    assign(outFile, outFileName);
    rewrite(outFile);
    { header }
    writeln(outFile,'Номер', f:5, 'Количество',f:6, 'Сумма',f:7, 'Средний');
    writeln(outFile,'ученика', f:5, 'оценок', f:8, 'баллов',f:7, 'балл');
    while (not Eof(inFile)) do begin
        lineCnt := lineCnt + 1;
        HandleString(inFile, outFile, lineCnt);
        Readln(inFile); // переход на новую строку после обработки
    end;
    Close(inFile);
    Close(outFile);
end.
