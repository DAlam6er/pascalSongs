var
    f1, f2 : text;
    str : string;
begin
    assign(f1, 'p_25_3.pas');
    assign(f2, 'p_25_3.pas');
    reset(f1);
    reset(f2);
    while (not Eof(f1)) do begin
        readln(f1, str);
        writeln(str);
    end;
    writeln('---------------------');
    while(not Eof(f2)) do begin
        readln(f2, str);
        writeln(str);
    end;
    close(f2);
    close(f1);
end.
