{
Замена одного вхождения в строке другим
}

{$H+}
{$codepage UTF8}

uses
{$IFNDEF WINDOWS}
    cwstring;
{$ENDIF}

var
    s, sSrch, sRepl : UnicodeString;
    p : Integer;
begin
    Writeln('Введите строку: ');
    Readln(s);
    Writeln('Введите искомое вхождение для замены: ');
    Readln(sSrch);
    Writeln('Введите новое вхождение: ');
    Readln(sRepl);
    repeat
        p := Pos(sSrch, s);
        if (p > 0) then begin
            Delete(s, p, Length(sSrch));
            Insert(sRepl, s, p);
        end;
    until p = 0;
    Writeln(s);
end.
