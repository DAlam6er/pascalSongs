{   Записи телефонных номеров обычно содержат дополнительные символы:
    скобки, черточки, пробелы, например: 8(123)45-67-89. 
    Предположим, что пользователь их так и вводит. 
    Пусть ваша программа удалит из такой строки все символы, кроме цифр. 
    Например, после ввода указанного выше номера она должна напечатать: 8123456789. 
}
const
    res : string = '';
var
    str : string;
    i : integer;
begin
    write('Input string: ');
    readln(str);
    for i := 1 to length(str) do
        case str[i] of
            ' ', '-', '(', ')' : ;
        else
            res := res + str[i];
        end;
    writeln(res);
end.