{   Напишите программу, которая бы запрашивала номер дня недели, и в
    ответ печатала бы название этого дня («понедельник», «вторник» и так далее).
}
var
    numWeek : integer;
    dayWeek : string;
begin
    write('Day of the week number: ');
    readln(numWeek);
    case numWeek of
        1:
            dayWeek := 'Monday';
        2:
            dayWeek := 'Tuesday';
        3:
            dayWeek := 'Wednesday';
        4:
            dayWeek := 'Thursday';
        5:
            dayWeek := 'Friday';
        6:
            dayWeek := 'Saturday';
        7:
            dayWeek := 'Sunday';
        else
            dayWeek := 'Unknown';
    end;
    writeln('Day is ' + dayWeek);
end.
