{
Придумайте самый несправедливый способ пиратской дележки по два
слитка и напишите программу для неё.
}

const
    SIZE = 16;
type
    TGolds = array [1..SIZE] of Integer;
var
    Golds : TGolds;

procedure BubbleSort(var arr : TGolds);
var
    i, j, temp : Integer;
begin
    for i := 1 to SIZE-1 do begin
        for j := 1 to SIZE-i do
            if (arr[j] > arr[j+1]) then begin
                temp := arr[j];
                arr[j] := arr[j+1];
                arr[j+1] := temp;
            end;
    end;
end;

{ main program }
var 
    i : Integer;
begin
    Randomize;
    for i := 1 to SIZE do
        Golds[i] := 500 + Random(500);
    for i := 1 to SIZE do
        Write(Golds[i]:4);
    Writeln;
    BubbleSort(Golds);
    Writeln('Несправедливая делёжка по парам:');
    for i := 1 to (SIZE div 2) do begin
        Write(i:2, Golds[SIZE-2*i+2]:5, ' + ', Golds[SIZE-2*i+1]:3, ' = ');
        Writeln(Golds[SIZE-2*i+2] + Golds[SIZE-2*i+1]:4);
    end;
end.
