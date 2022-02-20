{
Для передачи по интернету секретного текстового файла разбейте его на
два других: в первый запишите нечетные строки исходного файла, а во второй —
четные.
Имя исходного файла: 'src.txt'
Имя первого конечного файла: 'dest1.txt',
Имя второго конечного файла: 'dest2.txt'
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
    src := 'src.txt';
    dest1 := 'dest1.txt';
    dest2 := 'dest2.txt';
    SplitToFiles(src,dest1, dest2);
end.
