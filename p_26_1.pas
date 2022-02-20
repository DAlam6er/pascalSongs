{
 заполнение файла числами от 1 до 10
}

var
    myFile : text;
    i : integer;
begin
    assign(myFile, 'p_26_1.txt');
    rewrite(myFile);
    for i := 1 to 10 do
        writeln(myFile, i);
    close(myFile);
end.
