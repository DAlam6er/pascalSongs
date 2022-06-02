type
    TMonth = (
        January, February, March, April, May, June,
        July, August, September, October, November, December);

procedure GetMonth(var month : TMonth; var str : String);
begin
    case month of
        January : str := 'January';
        February : str := 'February';
        March : str := 'March';
        April : str := 'April';
        May : str := 'May';
        June : str := 'June';
        July : str := 'July';
        August : str := 'August';
        September : str := 'September';
        October : str := 'October';
        November : str := 'November';
        December : str := 'December';
    end;
end;


var
    month : TMonth;
    str : String;
begin
    month := April;
    GetMonth(month, str);
    writeln('Month is ', str);
end.
