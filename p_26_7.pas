{
Создайте программу для объединения двух файлов.
Из первого составьте нечетные строки конечного файла, 
а из второго — четные.
Имя первого исходного файла: 'p_26_6_1.out'
Имя второго исходного файла: 'p_26_6_2.out'
Имя конечного файла: 'p_26_7.out' 
}

procedure ConcatFiles(const dest, src1, src2 : string);
var
    concFile, src1File, src2File : text;
    str : string;
begin
    assign(concFile, dest);
    assign(src1File, src1);
    assign(src2File, src2);
    rewrite(concFile);
    reset(src1File);
    reset(src2File);
    repeat
        if (not Eof(src1File)) then begin
            readln(src1File, str);
            writeln(concFile, str);
        end;
        if (not Eof(src2File)) then begin
            readln(src2File, str);
            writeln(concFile, str);
        end;
    until (Eof(src1File) and Eof(src2File));
    close(concFile);
    close(src1File);
    close(src2file);
end;

{ main program }
var
    dest, src1, src2 : string;
begin
    dest := 'p_26_7.out';
    src1 := 'p_26_6_1.out';
    src2 := 'p_26_6_2.out';
    ConcatFiles(dest, src1, src2);
end.
