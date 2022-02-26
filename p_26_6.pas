{
Для передачи по интернету секретного текстового файла разбейте его на
два других: в первый запишите нечетные строки исходного файла, а во второй —
четные.
Имя исходного файла: 'p_26_5.in'
Имя первого конечного файла: 'p_26_6_1.out',
Имя второго конечного файла: 'p_26_6_2.out'
}

procedure SplitToFiles(const src, dst1, dst2 : string);
var
    srcFile, dst1File, dst2File : text;
    str : string;
begin
    assign(srcFile, src);
    assign(dst1File, dst1);
    assign(dst2File, dst2);
    reset(srcFile);
    rewrite(dst1File);
    rewrite(dst2File);
    while (not Eof(srcFile)) do begin
        readln(srcFile, str);
        writeln(dst1File, str);
        if (not Eof(srcFile)) then begin
            readln(srcFile, str);
            writeln(dst2File, str);
        end;
    end;
    close(srcFile);
    close(dst1File);
    close(dst2file);
end;

{ main program }
var
    src, dest1, dest2 : string;
begin
    src := 'p_26_5.in';
    dest1 := 'p_26_6_1.out';
    dest2 := 'p_26_6_2.out';
    SplitToFiles(src,dest1, dest2);
end.
