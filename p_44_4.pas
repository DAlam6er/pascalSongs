{
Напишите процедуру, переводящую все символы строки (латинские
буквы) к верхнему регистру.
}

procedure UpCaseString(var str : String);
var
    i : Integer;
begin
    for i := 1 to Length(str) do
        str[i] := UpCase(str[i]);
end;

var
    str : String;
begin
    Writeln('Введите строку латинскими буквами:');
    Readln(str);
    UpCaseString(str);
    Writeln('Преобразованная строка:');
    Writeln(str);
end.
