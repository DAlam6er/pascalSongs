{
Отсортируйте полицейскую базу данных и напишите программу для
двоичного поиска в ней.
}

const
    SIZE = 256;
    fileName = 'p_42_4.in';
type
    TNumbers = Array[1..SIZE] of Integer;
    TData = Array[1..SIZE] of String;

procedure ReadFromFile(
    var inFile : Text; var aNums : TNumbers; var aData : TData;
    var fact : Integer);
var
    i : Integer;
begin
    fact := 0;
    for i := 1 to SIZE do begin
        while SeekEoln(inFile) do
            if (Eof(inFile)) then
                break
            else
                Readln(inFile);
        if (Eof(inFile)) then break;
        Read(inFile, aNums[i]);
        Read(inFile, aData[i]);
        Inc(fact);
    end;
end;

procedure BubbleSort
    (var aNums : TNumbers; var aData : TData; var fact : Integer);
var
    i, j, tmp : Integer;
    str : String;
begin
    for i := 1 to fact-1 do
        for j := 1 to fact-i do
            if (aNums[j] > aNums[j+1]) then begin
                tmp := aNums[j];
                aNums[j] := aNums[j+1];
                aNums[j+1] := tmp;

                str := aData[j];
                aData[j] := aData[j+1];
                aData[j+1] := str;
            end;
end;

function BinSearch
    (num : Integer; var aNums : TNumbers; var fact : Integer) : Integer;
var
    lInd, rInd, mInd : Integer;
begin
    BinSearch := -1;
    lInd := 1;
    rInd := fact;
    repeat
        mInd := (lInd + rInd) div 2;
        if (num = aNums[mInd]) then begin
            BinSearch := mInd;
            break;
        end;
        if (num > aNums[mInd]) then
            lInd := mInd + 1
        else
            rInd := mInd - 1;
    until (lInd > rInd);
end;

{ main program }
var
    inFile : Text;
    Nums : TNumbers;
    Data : TData;
    fact, pos, n : Integer;
begin
    Assign(inFile, fileName);
    {$I-}
        Reset(inFile);
    {$I+}
    if (IOResult = 0) then begin
        ReadFromFile(inFile, Nums, Data, fact);
        BubbleSort(Nums, Data, fact);
        repeat
            write('Введите искомый номер, 0 для выхода: ');
            readln(n);
            if (n = 0) then break;
            pos := BinSearch(n, Nums, fact);
            if (pos <> -1) then
                Writeln(Data[pos])
            else
                Writeln('Информация по данному номеру не найдена!');
        until false;
        Close(inFile);
    end else begin
        Writeln('Ошибка. Файл ', fileName, ' не найден!');
    end;
end.
