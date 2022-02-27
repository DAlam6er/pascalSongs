{
Напишите функцию, проверяющую, упорядочен ли числовой массив.
Функция должна вернуть TRUE, если массив упорядочен по возрастанию. Массив
внутрь функции передайте параметром по ссылке.
}
const
    SIZE = 10;
type
    TInteger = Array[1..SIZE] of Integer;

function isIncreasing(const aArr : TInteger) : Boolean;
var
    i : Integer;
begin
    isIncreasing := true;
    for i := 1 to SIZE-1 do
        if (aArr[i] >= aArr[i+1]) then begin
            isIncreasing := false;
            break;
        end;
end;

var
    arr : TInteger;
    i : Integer;
begin
    Writeln('Введите элементы массива:');
    for i := 1 to SIZE do
        readln(arr[i]);
    if (isIncreasing(arr)) then
        Writeln('Массив упорядочен по возрастанию')
    else
        Writeln('Массив не упорядочен по возрастанию');
end.
