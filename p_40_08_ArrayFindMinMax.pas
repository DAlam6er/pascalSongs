{
Найдите в массиве, сформированном из файла p_40_7.out 
наименьшее и наибольшее числа, напечатайте их, 
а также соответствующие им индексы элементов массива
}

const
    ARRSIZE = 100;

type
    TByte = array[1..ARRSIZE] of Byte;

procedure ReadFromFile(var inFile : Text; var aArray : TByte);
var
    i : Integer;
begin
    for i := 1 to ARRSIZE do begin
        while SeekEoln(inFile) do
            if Eof(inFile) then
                break
            else
                Readln(inFile);

            if (SeekEof(inFile)) then break;
            Read(inFile, aArray[i]);
    end;
end;


procedure FindMinMax(const aArray : TByte; var iMin, iMax, min, max : Byte);
var
    i : Integer;
begin
    iMin := 1;
    iMax := 1;
    min := aArray[iMin];
    max := aArray[iMax];
    for i := 1 to ARRSIZE-1 do begin
        if (aArray[i+1] < min) then begin
            min := aArray[i+1];
            iMin := i + 1;
        end;
        if (aArray[i+1] > max) then begin
            max := aArray[i+1];
            iMax := i + 1;
        end;
    end;
end;

{ main program }
var
    inFile : Text;
    arr : TByte;
    iMin, iMax, min, max : Byte;
begin
    Assign(inFile, 'p_40_07.out');
    Reset(inFile);
    ReadFromFile(inFile, arr);
    Close(inFile);
    FindMinMax(arr, iMin, iMax, min, max);
    Writeln('Min : min[', iMin, '] = ', min);
    Writeln('Max : max[', iMax, '] = ', max);
end.
