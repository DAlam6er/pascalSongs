{
Напишите программу для сортировки фамилий учеников в алфавитном
порядке (фамилии берутся из файла p_41_4.in). 
Программа должна сортировать их как по возрастанию, 
так и по убыванию фамилий, — на выбор пользователя.
}
const
    SIZE = 256;
type
    TString = array[1..SIZE] of String;

procedure ReadFromFile(
    var inFile : Text; var arr : TString; var fact : Integer);
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
        if SeekEof(inFile) then break;
        Read(inFile, arr[i]);
        Inc(fact);
    end;
end;

procedure Sort(var arr : TString; fact, mode : Integer);
var
    i, j : Integer;
    tmp : String;
begin
    for i := 1 to fact-1 do
        for j := 1 to fact-i do begin
            if (mode = 0) then begin
                if (arr[j] > arr[j+1]) then begin
                    tmp := arr[j];
                    arr[j] := arr[j+1];
                    arr[j+1] := tmp;
                end;
            end else if (mode = 1) then begin
                if (arr[j] < arr[j+1]) then begin
                    tmp := arr[j];
                    arr[j] := arr[j+1];
                    arr[j+1] := tmp;
                end;
            end;
        end;
end;

{ main program }
var
    mode, fact, i : Integer;
    arr : TString;
    inFile : Text;
begin
    Assign(inFile, 'p_41_4.in');
    Reset(inFile);
    ReadFromFile(inFile, arr, fact);
    for i := 1 to fact do
        Write(arr[i], ' ');
    Writeln;
    Writeln('Выберите режим сортировки'#10 +
        '0 - по возрастанию, 1 - по убыванию.');
    Readln(mode);
    Sort(arr, fact, mode);
    for i := 1 to fact do
        Write(arr[i], ' ');
    Writeln;
end.
