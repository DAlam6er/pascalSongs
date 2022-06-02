{ p_16_1.pas - игра "вопрос-ответ" }

var 
    card : string;
begin
    randomize;
    repeat
        write('Ваш вопрос: ');
        readln(card);
        if (card = '') then break;
        case random(5) of
            0:
                card := 'Когда рак на горе свистнет.';
            1:
                card := 'После дождика в четверг';
            2:
                card := 'За углом налево';
            3:
                card := 'Это элементарно, Ватсон';
            else
                card := 'Не знаю, я не местный';
        end;
        writeln(card);
    until false;
end.
