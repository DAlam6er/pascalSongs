{
Для извлечения корня в Паскале есть функция SQRT. 
Напишите собственную функцию MySQRT, 
прибегнув к методу последовательных приближений. 
В грубом, нулевом приближении примем D0=1. Последующее, более точные значения D
будем вычислять по формуле
Di+1 = (Di + S/Di)/2
Так, при S=9 получим D1=(1+9/1)/2= 5, D2=(5+9/5)/2= 3.4 и так далее,
пока абсолютная разность между двумя последовательными значениями D станет
пренебрежимо мала. Функция MySQRT должна принять число и вычислить его
корень с точностью 0.0001. Внутри функции напечатайте промежуточные
значения D. 
}

function MySQRT(num, prec : Double) : Double;
var
    dPrev, dNext : Double;
begin
    if (num >= 0) then begin
        dNext := 1;
        repeat
            dPrev := dNext;
            dNext := (dPrev + num / dPrev) / 2;
        until (Abs(dPrev - dNext) <= prec);
        MySQRT := dNext;
    end else
        MySQRT := -1;
end;

var
    num, prec : Double;
begin
    write('Input number: ');
    readln(num);
    write('Input precision: ');
    readln(prec);
    writeln(MySQRT(num, prec):1:3);
end.
