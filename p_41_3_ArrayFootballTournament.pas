{
Футбольный чемпионат.
Имитация турнирной таблицы.
Вывод результатов в формате
Место   Команда     Очки
 1      Имя         66
}

{$H+}
{$codepage UTF8}

uses
{$IFNDEF WINDOWS}
    cwstring;
{$ENDIF}

const
    SIZE = 4;
type
    TScores = array [1..SIZE] of Integer;
    TNames = array [1..SIZE] of UnicodeString;
var
    scores : TScores;
    names : TNames;

procedure BubbleSort2(var aScores : TScores; var aNames : TNames);
var
    i, j, tmp : Integer;
    str : UnicodeString;
begin
    for i := 1 to SIZE-1 do
        for j := 1 to SIZE-i do
            if (aScores[j] < aScores[j+1]) then begin
                tmp := aScores[j];
                aScores[j] := aScores[j+1];
                aScores[j+1] := tmp;
                
                str := aNames[j];
                aNames[j] := aNames[j+1];
                aNames[j+1] := str;
            end;
end;

{ main program }
var
    i : Integer;
begin
    for i := 1 to SIZE do begin
        Write('Название команды: ');
        Readln(names[i]);
        Write('Набранные очки: ');
        Readln(scores[i]);
    end;
    BubbleSort2(scores, names);
    Writeln('Итоги чемпионата:');
    Writeln('Место   Команда         Очки');
    for i := 1 to SIZE do
        Writeln(i:3, ' ':3, names[i], scores[i]:20 - Length(names[i]));
end.
