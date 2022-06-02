{
Сформируйте файл «p_30_2.in», поместив в него 100 случайных чисел
в диапазоне от 0 до 999 (некоторые числа могут повторяться). 
Затем найдите в этом файле: 
1) максимальное и минимальное число; 
2) сумму всех чисел; 
3) среднее арифметическое — напечатайте его с двумя знаками после точки.
}

const
    srcFileName = 'p_30_2.in';

procedure GenerateData(const srcFileName : string);
var
    srcFile : text;
    i : integer;
begin
    Assign(srcFile, srcFileName);
    Rewrite(srcFile);
    Randomize;
    for i := 1 to 100 do
        writeln(srcFile, Random(1000));
    Close(srcFile);
end;

procedure GetMinMax(var fileName : text; var min, max : integer);
var
    num : integer;
begin
    Reset(fileName);
    if (not Eof(fileName)) then begin
        readln(fileName, num);
        min := num;
        max := num;
    end;
    while (not Eof(fileName)) do begin
        readln(fileName, num);
        if (min > num) then
            min := num;
        if (max < num) then
            max := num;
    end;
    Close(fileName);
end;

function GetSum(var fileName : text) : longint;
var
    num : integer;
    sum : longint;
begin
    Reset(fileName);
    sum := 0;
    while (not Eof(fileName)) do begin
        readln(fileName, num);
        sum := sum + num;
    end;
    GetSum := sum;
    Close(fileName);
end;

function GetAverage(var fileName : text) : real;
var
    cnt : integer;
begin
    Reset(fileName);
    cnt := 0;
    while (not Eof(fileName)) do begin
        readln(fileName);
        cnt := cnt + 1;
    end;
    Close(fileName);
    GetAverage := GetSum(fileName) / cnt;
end;


var
    srcFile : text;
    min, max : integer;
    sum : longint;
    aver : real;
begin
    GenerateData(srcFileName);
    Assign(srcFile, srcFileName);
    {$I-}
        reset(srcFile);
    {$I+}
    if (IOResult = 0 ) then begin
        Close(srcFile);
        GetMinMax(srcFile, min, max);
        writeln('Minimum : ', min);
        writeln('Maximum : ', max);
        sum := GetSum(srcFile);
        writeln('Sum of all numbers: ', sum);
        aver := GetAverage(srcFile);
        writeln('Average : ', aver:5:2);
    end else
        writeln(srcFileName + ' not found!');
end.
