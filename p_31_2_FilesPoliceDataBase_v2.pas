{
v.2
Поиск по базе данных угнанных автомобилей,
содержащейся в исходном файле 'p_31_2.in',
с выводом информации об автомобиле, в случае, если автомобиль найден.
Исходный файл содержит 3 поля в строке:
номер автомобиля    марка автомобиля    регион
Исходный файл содержит Unicode-символы.
}

{$H+}
{$codepage UTF8}

uses
{$IFNDEF WINDOWS}
    cwstring;
{$ENDIF}

const
    dbFileName = 'p_31_2.in';

function FindNumber(var dbFile : text; var num : UnicodeString) : boolean;
var
    str : UnicodeString;
    ch : UnicodeChar;
    i : integer;
begin
    str := '';
    FindNumber := false;
    reset(dbFile);
    while (not SeekEof(dbFile)) do begin
        for i := 1 to 8 do
            if (not SeekEoln(dbFile)) then begin
                read(dbFile, ch);
                str := str + ch;
            end;
        read(dbFile, ch);
        if ((Ord(ch) > 47) and (Ord(ch) < 58)) then
            str := str + ch;
        if (str = num) then begin
            FindNumber := true;
            break;
        end else if (not SeekEof(dbFile)) then begin
            readln(dbFile);
            str := '';
        end;
    end;
end;

procedure GetAdditInfo(
    var dbFile : text;
    var wantedNum, wantedModel, wantedArea  : UnicodeString
);
var
    tempStr : UnicodeString;
    i, j : integer;
begin
    wantedModel := '';
    wantedArea := '';
    if (FindNumber(dbFile, wantedNum)) then begin
        if (not SeekEoln(dbFile)) then
            readln(dbFile, tempStr);

        for i := 1 to length(tempStr) do begin 
            if (Ord(tempStr[i]) = 32) then break;
            wantedModel := wantedModel + tempStr[i];
        end;
        
        for j := i + 1 to length(tempStr) do
            wantedArea := wantedArea + tempStr[j];
    end;
end;

{ main }
var
    dbFile : text;
    autoNum, model, area : UnicodeString;
begin
    assign(dbFile, dbFileName);
    {$I-}
        reset(dbFile);
    {$I+}
    if (IOResult = 0) then begin
        writeln('Input vehicle number to search or 0 to exit.');
        repeat
            write('Vehicle number: ');
            readln(autoNum);
            if (autoNum = '0') then break;
            reset(dbFile);
            if (FindNumber(dbFile, autoNum) = true) then begin
                writeln('Vehicle is wanted! ');
                GetAdditInfo(dbFile, autoNum, model, area);
                writeln(#9'Марка: ', model);
                writeln(#9'Регион: ', area);
            end else begin
                writeln('No records found.');
            end
        until (autoNum = '0');
        close(dbFile);
    end else begin
        writeln('File ', dbFileName,' not found!');
    end;
end.
