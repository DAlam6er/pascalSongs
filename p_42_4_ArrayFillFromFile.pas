{
Напишите полицейскую базу данных, содержащую номера автомобилей и
сведения о владельцах. Данные должны вводиться из файла, каждая строка
которого содержит номер автомобиля и сведения о владельце
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

{ main program }
var
    inFile : Text;
    Nums : TNumbers;
    Data : TData;
    i, fact : Integer;
begin
    Assign(inFile, fileName);
    {$I-}
        Reset(inFile);
    {$I+}
    if (IOResult = 0) then begin
        ReadFromFile(inFile, Nums, Data, fact);
        for i := 1 to fact do begin
            Writeln(Nums[i]);
            Writeln(Data[i]);
        end;
        Close(inFile);
    end else begin
        Writeln('Ошибка. Файл ', fileName, ' не найден!');
    end;
end.
