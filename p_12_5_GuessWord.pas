{ Программа для угадывания слова }
const
    guess = 'Макрон';
var 
    guessTry : string;
begin
    writeln('Какое слово было загадано?');
    repeat
        readln(guessTry);
        if (guessTry <> guess) then
            writeln('Неправильно! Попробуй ещё раз!');
    until (guessTry = guess);
    writeln('Угадал!');
end.
