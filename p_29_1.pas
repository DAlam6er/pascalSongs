{ 
Поиск по базе данных угнанных автомобилей,
содержащейся в исходном файле 'police.txt'
}

const
    dbFileName = 'police.txt';

function FindNumber(var dbFile : text; num : string) : boolean;
var
    str : string;
begin
    FindNumber := false;
    while (not Eof(dbFile)) do begin
        readln(dbFile, str);
        if (str = num) then begin
            FindNumber := true;
            break;
        end;
    end;
end;

var
    dbFile : text;
    autoNum : string;
begin
    assign(dbFile, dbFileName);
    {$I-}
        reset(dbFile);
    {$I+}
    if (IOResult = 0) then begin
        writeln('Input vehicle number to search or 0 to exit.');
        repeat
            write('Vehicle number:');
            readln(autoNum);
            if (autoNum = '0') then break;
            reset(dbFile);
            if (FindNumber(dbFile, autoNum) = true) then
                writeln('Vehicle is wanted!')
            else
                writeln('No records found.');
        until (autoNum = '0');
        close(dbFile);
    end else begin
        writeln('File ''police.txt'' not found!');
    end;
end.
