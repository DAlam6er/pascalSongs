{
Подсчет количества фрагментов в строке
}
var
    s, srch : String;
    p, cnt : Integer;
begin
    Writeln('Введите исходную строку:');
    Readln(s);
    Writeln('Введите искомый фрагмент:');
    Readln(srch);
    cnt := 0;
    p := 0;
    repeat
        p := Pos(srch, s);
        if (p > 0) then begin
            Inc(cnt);
            Delete(s, p, Length(srch));
        end;
    until p = 0;
    Writeln('Найдено слов ' + srch + ': ', cnt);
end.
