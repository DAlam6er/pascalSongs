{
Выясните код ошибки, возвращаемый функцией IOResult при попытке
открыть для чтения несуществующий файл 'not_existing.txt'.
Сделайте то же самое, когда программа пытается открыть для записи файл
с установленным атрибутом «только чтение» 'read-only.txt'.
IOResult сбрасывается в ноль при первом обращении к ней!
}

var
    myFile : text;
    error : integer;
begin
    assign(myFile, 'not_existing.txt');
    {$I-}
        reset(myFile);
    {$I+}
    error := IOResult;
    if (error <> 0) then
        writeln('File not exists! IOResult returned ', error)
    else
        close(myFile);
    assign(myFile, 'read-only.txt');
    {$I-}
        rewrite(myFile);
    {$I+}
    error := IOResult;
    if (error <> 0) then
        writeln('Read-only file! IOResult returned ', error)
    else
        close(myFile);
end.
