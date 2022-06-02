{
Укороченные строки
}

var
    s1 : String;
    s2 : String[5];
begin
    s1 := 'abc';
    s2 := 'abcdefgh';
    Writeln('Строка s1: Размер = ', SizeOf(s1):4, ' Длина = ', Length(s1):4, ' Значение = ' + s1);
    Writeln('Строка s2: Размер = ', SizeOf(s2):4, ' Длина = ', Length(s2):4, ' Значение = ' + s2);
    Writeln('Нулевой байт строки s1 = ', Byte(s1[0]));
    Writeln('Нулевой байт строки s2 = ', Byte(s2[0]));
end.
