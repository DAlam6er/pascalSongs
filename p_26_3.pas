{
Программа создает файл 'p_26_3.out', печатает в него несколько строк с числами, а
затем выводит этот файл на экран
}
var
    myFile : text;
    str : string;
    i : integer;
begin
    assign(myFile, 'p_26_3.out');
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
