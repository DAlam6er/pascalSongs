{
Файл с физическими данными старшеклассников содержит три колонки:
фамилия, рост и вес ученика. 
Создайте программы для решения следующих задач:
· отбор кандидатов для занятий баскетболом, – рост кандидата должен
составлять не менее 175 см;
· поиск учеников с избыточным весом, для которых разница между ростом
ученика (см) и его весом (кг) составляет менее 100.
Ваши программы должны сформировать соответствующие файлы с
фамилиями и данными учеников.
Имя исходного файла: 'p_31_3.in'
}

{$mode objfpc}
{$H+}
{$codepage UTF8}

uses
{$IFNDEF WINDOWS}
    cwstring, 
{$ENDIF}
    SysUtils;

const
    inFileName = 'p_31_3.in';
    outFileNameCand = 'p_31_3_1.out';
    outFileNameHealth = 'p_31_3_2.out';

procedure SplitStr(
    var inStr, outFam : UnicodeString;
    var outHeight, outWeight : integer
);
var
    i : integer;
    tempStr : UnicodeString;
begin
    tempStr := '';
    outFam := '';
    outHeight := 0;
    outWeight := 0;
    for i := 1 to length(inStr) do begin
        if (Ord(inStr[i]) = 32) then
            if (outFam = '') then continue
            else break;
        outFam := outFam + inStr[i];
    end;

    for i := i to length(inStr) do begin
        if (Ord(inStr[i]) = 32) then
            if (tempStr = '') then continue
            else break;
        if ((Ord(inStr[i]) > 47) and (Ord(inStr[i]) < 58)) then
            tempStr := tempStr + inStr[i];
    end;
    if (tempStr <> '') then
        outHeight := StrToInt(tempStr);
    tempStr := '';

    for i := i to length(inStr) do begin
        if (Ord(inStr[i]) = 32) then
            if (tempStr = '') then continue
            else break;
        if ((Ord(inStr[i]) > 47) and (Ord(inStr[i]) < 58)) then
            tempStr := tempStr + inStr[i];
    end;
    if (tempStr <> '') then
        outWeight := StrToInt(tempStr);
end;


procedure GetCandidates(const inFileName, outFileName : string);
var
    inFile, outFile : text;
    str, stFam : UnicodeString;
    stHeight, stWeight : integer;
begin
    assign(inFile, inFileName);
    {$I-}
        reset(inFile);
    {$I+}
    If (IOResult = 0) then begin
        assign(outFile, outFileName);
        rewrite(outFile);
        { title }
        if (not SeekEof(inFile)) then begin
            writeln(outFile, 'Ученики с ростом не менее 175 см');
            readln(inFile, str);
            writeln(outFile, str);
        end;
        while (not SeekEof(inFile)) do begin
            readln(inFile, str);
            SplitStr(str, stFam, stHeight, stWeight);
            if (stHeight >= 175) then
                writeln(outFile, str);
        end;
        close(inFile);
        close(outFile);
    end else
        writeln('Error! File ', inFileName, ' not found!');
end;

procedure GetHealth(const inFileName, outFileName : string);
var
    inFile, outFile : text;
    str, stFam : UnicodeString;
    stHeight, stWeight : integer;
begin
    assign(inFile, inFileName);
    {$I-}
        reset(inFile);
    {$I+}
    If (IOResult = 0) then begin
        assign(outFile, outFileName);
        rewrite(outFile);
        { title }
        if (not SeekEof(inFile)) then begin
            writeln(outFile, 'Ученики с избыточным весом');
            readln(inFile, str);
            writeln(outFile, str);
        end;
        while (not SeekEof(inFile)) do begin
            readln(inFile, str);
            SplitStr(str, StFam, stHeight, stWeight);
            if ((stHeight - stWeight) < 100) then
                writeln(outFile, str);
        end;
        close(inFile);
        close(outFile);
    end else
        writeln('Error! File ', inFileName, ' not found!');
end;

{ main }
begin
    GetCandidates(inFileName, outFileNameCand);
    GetHealth(inFileName, outFileNameHealth);
end.
