{
    Процедура обмена значений двух переменных через третью и программа её проверки 
}

procedure Swap(var x, y : integer);
var
    temp : integer;
begin
    temp := x;
    x := y;
    y := temp;
end;

var 
    a, b : integer;
begin
    a := 10;
    b := 20;
    writeln ('a = ', a, ' b = ', b);
    Swap(a, b);
    writeln ('a = ', a, ' b = ', b);
end.
