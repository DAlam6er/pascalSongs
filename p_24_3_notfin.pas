uses
    SysUtils;

function PosStr(var str : string; var num : integer; ch : char) : integer;
const
    found : boolean = false;
var
    i : integer;
begin
    PosStr := -1;
    num := 0;
    for i := 1 to length(str) do
        if (str[i] = ch) then begin
            if (not found) then begin
                PosStr := i;
                found := true;
            end;
            num := num + 1;
        end;
end;

function QuickSort(var str : string) : string;
var
    i, pivot : integer;
    less, greater : string;
begin
    if (length(str) > 1) then begin
        { в качестве опорного будем выбирать средний элемент строки }
        pivot := Ord(str[length(str) div 2]);
        less := '';
        greater := '';
        for i := 1 to length(str) do
            if (Ord(str[i]) < pivot) then
                less := less + str[i];
        for i := 1 to length(str) do
            if (Ord(str[i]) > pivot) then
                greater := greater + str[i];
        QuickSort := QuickSort(less) + Chr(pivot) + QuickSort(greater);
    end else begin
        QuickSort := str;
    end;
end;

{ ANSI only! }
procedure ToLowCase(var str : string);
var
    i : integer;
begin
    for i := 1 to length(str) do begin
        { writeln('Current char: ', str[i], ' value: ', Ord(str[i])); }
        if ((Ord(str[i]) > 64) or (Ord(str[i]) < 91)) then
            str[i] := Chr(Ord(str[i]) + 32);
    end; 
end;

function FindSmallest(var str : string) : integer;
var
    i, smallestIndex : integer;
    smallest : char;
begin
    smallest := str[1];
    smallestIndex := 1;
    for i := 2 to length(str) do
        if (str[i] < smallest) then begin
            smallestIndex := i;
            smallest := str[i];
        end;
    FindSmallest := smallestIndex;
end;

procedure SelectionSort(var str : string);
var
    i : integer;
    newStr : string;
    smallest : integer;
begin
    ToLowCase(str);
    newStr := '';
    for i := 1 to length(str) do begin
        smallest := FindSmallest(str);
        newStr := newStr + str[smallest];
        Delete(str, smallest, 1);
    end;
    str := newStr;
end;


var
    s : string;
begin
    writeln('Input string:');
    readln(s);
    SelectionSort(s);
    writeln(s);
end.
