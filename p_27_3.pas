{
Дан файл, строки которого содержат круглые скобки (это может быть
программа или математические выкладки — неважно). Ваша программа должна
распечатать строки, где скобки расставлены неверно
2+3 – правильно, хотя скобок нет;
(2+3 – ошибка – здесь нет закрывающей скобки;
()2+3() – это правильно (хоть и лишено смысла);
))2+3(( – ошибка – скобки закрываются до открытия.
(()))(2+3 - ошибка

Входной файл: 'calculations.txt'
}

function Check(var str : string) : boolean;
var
    i : integer;
    openBr, closeBr : boolean;
    openCnt, closeCnt : integer;
begin
    Check := false;
    openBr := false;
    closeBr := false;
    openCnt := 0;
    closeCnt := 0;
    for i := 1 to length(str) do begin
        if (Ord(str[i]) = 40) then begin
            openBr := true;
            openCnt := openCnt + 1;
        end else if (Ord(str[i]) = 41) then begin
            if (openBr = false) then begin
                closeBr := true;
                closeCnt := closeCnt + 1;
                break;
            end else begin
                closeBr := true;
                closeCnt := closeCnt + 1;
            end;
            if (openCnt = closeCnt) then begin
                openBr := false;
                closeBr := false;
            end;
        end;
    end;
    if (openCnt = closeCnt) then
        Check := true;
end;

var
    myFile : text;
    str : string;
begin
    assign(myFile, 'calculations.txt');
    {$I-}
        reset(myFile);
    {$I+}
    if (IOResult = 0) then begin
        writeln('The following strings contain errors:');
        while (not Eof(myFile)) do begin
            readln(myFile, str);
            if (not Check(str)) then
                writeln(str);
        end;
    end;
end.
