{
Напечатайте с тремя знаками после точки 20 случайных чисел 
в диапазоне от 0 до 10 так, чтобы числа следовали по возрастанию.
}
var
    i : Integer;
    curNum, prevNum : Double;
begin
    Randomize;
    prevNum := Random(11) / (Random(9) + 1);
    for i := 1 to 20 do begin
        repeat
            curNum := Trunc(prevNum) /(Random(9) + 1);
        until ((curNum > prevNum) and (curNum < 10));
        prevNum := curNum;
        writeln(curNum:5:3);
    end;
end.
