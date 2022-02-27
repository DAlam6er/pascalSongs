{
Сравнение скорости работы в отсортированном и неотсортированном массиве
с применением линейного поиска
}
const
    SIZE = 1000;
type
    TNumbers = Array[1..SIZE] of Integer;

procedure BubbleSort(var aArr : TNumbers);
var
    i, j, tmp : Integer;
begin
    for i := 1 to SIZE-1 do
        for j := 1 to SIZE-i do
            if (aArr[j] > aArr[j+1]) then begin
                tmp := aArr[j];
                aArr[j] := aArr[j+1];
                aArr[j+1] := tmp;
            end;
end;

{ линейный последовательный поиск }
function FindSeq
    (aNum : Integer; var aArrRand : TNumbers; var steps : Integer) : Integer;
var
    i : Integer;
begin
    steps := 0;
    FindSeq := -1;
    for i := 1 to SIZE do begin
        Inc(steps);
        if (aArrRand[i] = aNum) then begin
            FindSeq := i;
            break;
        end;
    end;
end;

{ бинарный поиск }
function FindBin 
    (aNum : Integer; var aArrSort : TNumbers; var steps : Integer) : Integer;
var
    lInd, rInd, mInd : Integer;
begin
    steps := 0;
    FindBin := -1;
    lInd := 1;
    rInd := SIZE;
    repeat
        Inc(steps);
        mInd := (lInd + rInd) div 2;
        if (aArrSort[mInd] = aNum) then begin
            FindBin := mInd;
            break;
        end;
        if (aArrSort[mInd] > aNum) then
            rInd := mInd - 1
        else
            lInd := mInd + 1;
    until lInd > rInd;
end;

{ main program }
var
    outFile : Text;
    i, n, pos, steps : Integer;
    ArrRand, ArrSort : TNumbers;
begin
    Randomize;
    Assign(outFile, 'p_42_1.out');
    Rewrite(outFile);
    for i := 1 to SIZE do
        arrRand[i] := 1 + Random(10000);
    ArrSort := ArrRand; 
    BubbleSort(ArrSort);
    repeat
        i := 1 + Random(SIZE);
        n := ArrRand[i];

        Writeln(outFile, 'Искомое число = ', n);
        pos := FindSeq(n, ArrRand, steps);
        Writeln
            (outFile, 'Последовательный поиск: ',
            'Позиция = ', pos:3, ' Шагов = ', steps);
        
        pos := FindSeq(n, ArrSort, steps);
        Writeln
            (outFile, 'Последовательный поиск: ',
            'Позиция = ', pos:3, ' Шагов = ', steps);
        
        pos := FindBin(n, ArrSort, steps);
        Writeln(outFile, 'Двоичный поиск: ',
            'Позиция = ', pos:3, ' Шагов = ', steps);
        Writeln('Введите 0 для выхода из цикла.');
        Readln(n);
    until (n = 0);
    Close(outFile);
end.
