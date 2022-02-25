{
 Напишите четыре булевы функции, проверяющие, является ли введенная
пользователем строка правильно сформированным паролем согласно условиям:
· символ каждого сорта входит в пароль не менее двух раз, некоторые
символы могут повторяться;
· все символы пароля уникальны (примените множество);
· символы одного сорта не соседствуют, например: «Pa7sCaL5»,
уникальность символов не требуется;
· символы одного сорта не соседствуют и все символы уникальны.
}

Type
    TcSet = Set of Char;

Const
    minPasLength = 8;
    upCaseSet : TcSet = ['A'..'Z'];
    lowCaseSet : TcSet = ['a'..'z'];
    digitSet : TcSet = ['0'..'9'];

function CheckPolicy1(const aStr : String) : Boolean;
var
    tmpSet : TcSet;
    i, cUpCase, cLowCase, cDigit : Integer;
begin
    if (Length(aStr) < minPasLength) then begin
        CheckPolicy1 := false;
        exit;
    end;
    tmpSet := [];
    cUpCase := 0;
    cLowCase := 0;
    cDigit := 0;

    for i := 1 to Length(aStr) do
        tmpSet := tmpSet + [aStr[i]];
    for i := 1 to Length(aStr) do begin
        if (aStr[i] in upCaseSet) then
            Inc(cUpCase)
        else if (aStr[i] in lowCaseSet) then
            Inc(cLowCase)
        else if (aStr[i] in digitSet) then
            Inc(cDigit)
    end;

    if ((cUpCase > 1) and (cLowCase > 1) and (cDigit > 1)) then
        CheckPolicy1 := true
    else
        CheckPolicy1 := false;
end;


function CheckPolicy2(const aStr : String) : Boolean;
var
    tmpSet : TcSet;
    i : Integer;
begin
    if (Length(aStr) < minPasLength) then begin
        CheckPolicy2 := false;
        exit;
    end;
    tmpSet := [];
    CheckPolicy2 := true;
    for i := 1 to Length(aStr) do
        tmpSet := tmpSet + [aStr[i]];
    for i := 1 to Length(aStr) do begin
        if not(aStr[i] in tmpSet) then begin
            CheckPolicy2 := false;
            break;
        end;
        tmpSet := tmpSet - [aStr[i]];
    end;
end;

function CheckPolicy3(const aStr : String) : Boolean;
var
    i : Integer;
    neighSet : TcSet;
begin
    if (Length(aStr) < minPasLength) then begin
        CheckPolicy3 := false;
        exit;
    end;
    CheckPolicy3 := true;
    for i := 1 to Length(aStr) - 1 do begin
        neighSet := [aStr[i]] + [aStr[i+1]];
        if ((neighSet <= lowCaseSet) or (neighSet <= upCaseSet)
            or (neighSet <= digitSet)) then
        begin
            CheckPolicy3 := false;
            break;
        end;
    end;
end;

function CheckPolicy4(const aStr : String) : Boolean;
var
    tmpSet, neighSet : TcSet;
    i : Integer;
begin
    if (Length(aStr) < minPasLength) then begin
        CheckPolicy4 := false;
        exit;
    end;
    CheckPolicy4 := true;
    tmpSet := lowCaseSet + upCaseSet + digitSet;
    for i := 1 to Length(aStr) - 1 do begin
        if not (aStr[i] in tmpSet) then begin
            CheckPolicy4 := false;
            break;
        end;
        neighSet := [aStr[i]] + [aStr[i+1]];
        if ((neighSet <= lowCaseSet) or (neighSet <= upCaseSet)
            or (neighSet <= digitSet)) then
        begin
            CheckPolicy4 := false;
            break;
        end;
        tmpSet := tmpSet - [aStr[i]];
    end;
end;

{ main program }
var
    str : String;
begin
    Write('Введите пароль: ');
    Readln(str);
    Writeln('Символ каждого сорта входит в пароль не менее двух раз,' +
        'некоторые символы могут повторяться - ', CheckPolicy1(str));
    Writeln('Все символы пароля уникальны - ', CheckPolicy2(str));
    Writeln('Символы одного сорта не соседствуют, ' +
        'уникальность символов не требуется - ', CheckPolicy3(str));
    Writeln('Символы одного сорта не соседствуют и все символы уникальны - ',
        CheckPolicy4(str));
end.
