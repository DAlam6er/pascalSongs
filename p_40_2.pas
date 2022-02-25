{
Полицейская база данных с применением массива
}

const
    CNumbers = 1000;
type
    TNumbers = array[1..CNumbers] of Integer;
var
    numbers : TNumbers;
    fact, autoNum : Integer;
    inFile : Text;

procedure ReadFromFile(var aFile : Text);
var
    i : Integer;
begin
    fact := 0;
    for i := 1 to CNumbers do begin
        { skip empty strings if exist }
        while SeekEoln(aFile) do
            if (Eof(aFile)) then
                break
            else
                Readln(aFile);
        if (SeekEof(aFile)) then break;
        Read(aFile, numbers[i]);
        Inc(fact);
    end;
end;

function FindNumber(aNum : Integer) : boolean;
var
    i : Integer;
begin
    FindNumber := false;
    for i := 1 to fact do
        if (aNum = numbers[i]) then begin
            FindNumber := true;
            break;
        end;
end;

{ main program }
begin
    Assign(inFile, 'p_40_2.in');
    Reset(inFile);
    ReadFromFile(inFile);
    Close(inFile);
    repeat
        Write('Укажите номер автомобиля: ');
        Readln(autoNum);
        if (autoNum <> 0) then
            if (FindNumber(autoNum)) then
                Writeln('Автомобиль найден в базе!')
            else
                Writeln('Нет записей в базе по данному автомобилю.');
    until (autoNum = 0);
end.
