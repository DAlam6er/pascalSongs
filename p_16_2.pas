var
    numWeek : integer;
    dayWeek : string;
begin
    write('Number of week: ');
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
