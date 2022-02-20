{
Программа создает файл 'test2.txt', печатает в него несколько строк с числами, а
затем выводит этот файл на экран
}
var
    myFile : text;
    str : string;
    i : integer;
begin
    assign(myFile, 'test2.txt');
    rewrite(myFile);
    for i := 1 to 20 do
        writeln(myFile, i);
    reset(myFile);
    while (not Eof(myFile)) do begin
        readln(myfile, str);
        writeln(str);
    end;
    close(myFile);
end.
