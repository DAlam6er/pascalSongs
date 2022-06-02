{
Напишите функцию для приведения любой буквы к верхнему регистру
(включая и русские).
}

function cUpCase (aCh : UnicodeChar) : UnicodeChar;
begin
    if ((aCh < 123) and (aCh > 96)) then
        cUpCase := aCh - 32;
    if ((aCh < 1104) and (aCh > 1071 )) then
        cUpCase := aCh - 32;
end;

{ main }
var
    ch : UnicodeChar;
begin
    Writeln('Введите символ:');
    Readln(ch);
    Writeln('Символ, приведённый к верхнему регистру:');
    Writeln(cUpCase(ch));
end.
