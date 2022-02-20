{
Сигнал от контактов поступает в микропроцессор с
периодичностью, скажем, 100 раз в секунду. Если контакт постоянно разомкнут,
микропроцессор принимает «0», а если замкнут — «1». При замыкании-размыкании контакт неустойчив, и процессор получает пачки чередующихся нулей и единиц, — надо отфильтровать эти ложные срабатывания.
Программа будет моделировать поведение микропроцессора. Входной
файл содержит последовательность нулей и единиц (по одному символу в строке).
Первый символ примите как исходное значение сигнала, а дальше сигнал на
выходе программы формируется так: если три подряд идущие значения совпадают,
то берется это новое значение, а иначе сохраняется текущее.
На входе На выходе
    0       0
    1       0
    0       0
    1       0
    1       0
    1       1
    0       1
В выходной файл запишите в две колонки входной и выходной сигналы.
Имя входного файла: 'input_mpu.txt'
}
procedure GetOutput(const inFileName : string);
const
    outFileName = 'output_mpu.txt';
    threshold = 3;
var
    inFile, outFile : text;
    inStr, prevStr, outStr : string;
    cnt0 : integer;
    cnt1 : integer;
begin
    assign(inFile, inFileName);
    {$I-}
        reset(inFile);
    {$I+}
    if (IOResult = 0) then begin
        assign(outFile, outFileName);
        rewrite(outFile);
        if(not Eof(inFile)) then begin
            readln(inFile, inStr);
            outStr := inStr;
            prevStr := inStr;
            writeln(outFile, instr + ''#9 + outStr);
        end;
        cnt0 := 0;
        cnt1 := 0;
        while(not Eof(inFile)) do begin
            readln(inFile, inStr);
            if(inStr = '0') then begin
                if (prevStr = inStr) then
                    cnt0 := cnt0 + 1
                else begin
                    cnt0 := 1;
                    cnt1 := 0;
                end;
            end else if (inStr = '1') then begin
                if (prevStr = inStr) then
                    cnt1 := cnt1 + 1
                else begin
                    cnt1 := 1;
                    cnt0 := 0;
                end;
            end;
            prevStr := inStr;
            if ((cnt0 = threshold) or (cnt1 = threshold)) then begin
                cnt0 := 0;
                cnt1 := 0;
                outStr := inStr;
            end;
            writeln(outFile, instr + ''#9 + outStr);
        end;
        close(inFile);
        close(outFile);
    end else begin
        writeln('Input file not found!');
    end;
end;

{ main program }
begin
    GetOutput('input_mpu.txt');
end.
