{
Генерация пароля длиной не менее восьми символов. В пароль входят
символы трёх сортов: цифры, заглавные и строчные латинские буквы, например:
«7UpJ7rsT», «PasCal701». Сделайте четыре варианта так, чтобы соблюдались
следующие условия:
· символ каждого сорта входит в пароль не менее двух раз, некоторые
символы могут повторяться;
· все символы пароля уникальны (примените множество);
· символы одного сорта не соседствуют, например: «Pa7sCaL5»,
уникальность символов не требуется;
· символы одного сорта не соседствуют и все символы уникальны.
}

uses
    SysUtils;

Type
    TcSet = Set of Char;

Const
    pasLength = 8;
    upCaseSet : TcSet = ['A'..'Z'];
    lowCaseSet : TcSet = ['a'..'z'];
    digitSet : TcSet = ['0'..'9'];

procedure GenBaseSet(var cSet : TcSet);
var
    ch : Char;
begin
    cSet := [];
    for ch := '0' to '9' do
        cSet := cSet + [ch];
    for ch := 'A' to 'Z' do
        cSet := cSet + [ch];
    for ch := 'a' to 'z' do
        cSet := cSet + [ch];
end;

function GetRandomChar(const aSet : TcSet) : Char;
var
    ch : Char;
begin
    GetRandomChar := Chr(32);
    repeat
        ch := Chr(Random(95) + 33);
        if (ch in aSet) then
            GetRandomChar := ch;
    until (GetRandomChar <> Chr(32));
end;

function GenPwd1 : String;
var
    ch : Char;
    str : String;
    tmpSet : TcSet;
    strSet : Set of Byte;
    i, j, strLength : Integer;
begin
    str := '';
    tmpSet := upCaseSet + lowCaseSet + digitSet;
    strLength := random(pasLength) + pasLength;
    for i := 1 to strLength do begin
        ch := GetRandomChar(tmpSet);
        str := str + ch;
    end;
    tmpSet := upCaseSet;
    strSet := [0..strLength];
    for i := 1 to 6 do begin
        repeat
            j := random(strLength) + 1;
        until (j in strSet);
        str[j] := GetRandomChar(tmpSet);
        strSet := strSet - [j];
        if (i = 2) then tmpSet := lowCaseSet;
        if (i = 4) then tmpSet := digitSet;
    end;

    GenPwd1 := str;
end;

function GenPwd2 : String;
var
    ch : Char;
    str : String;
    tmpSet : TcSet;
    i : Integer;
begin
    str := '';
    tmpSet := upCaseSet + lowCaseSet + digitSet;
    for i := 1 to (random(pasLength) + pasLength) do begin
        ch := GetRandomChar(tmpSet);
        tmpSet := tmpSet - [ch];
        str := str + ch;
    end;
    GenPwd2 := str;
end;

function GenPwd3 : String;
var
    ch : Char;
    str : String;
    i : Integer;
begin
    str := GetRandomChar(upCaseSet + lowCaseSet + digitSet);
    for i:= 2 to random(pasLength) + pasLength do begin
        if (str[i-1] in upCaseSet) then begin
            ch := GetRandomChar(lowCaseSet + digitSet);
        end else if (str[i-1] in lowCaseSet) then begin
            ch := GetRandomChar(upCaseSet + digitSet);
        end else begin
            ch := GetRandomChar(upCaseSet + lowCaseSet);
        end;
        str := str + ch;
    end;
    GenPwd3 := str;
end;

function GenPwd4 : String;
var
    ch : Char;
    str : String;
    i : Integer;
    tmpSet : TcSet;
begin
    tmpSet := upCaseSet + lowCaseSet + digitSet;
    ch := GetRandomChar(tmpSet);
    tmpSet := tmpSet - [ch];
    str := ch;
    for i:= 2 to random(pasLength) + pasLength do begin
        if (str[i-1] in upCaseSet) then begin
            ch := GetRandomChar(tmpSet - upCaseSet);
            tmpSet := tmpSet - [ch];
        end else if (str[i-1] in lowCaseSet) then begin
            ch := GetRandomChar(tmpSet - lowCaseSet);
            tmpSet := tmpSet - [ch];
        end else begin
            ch := GetRandomChar(tmpSet - digitSet);
            tmpSet := tmpSet - [ch];
        end;
        str := str + ch;
    end;
    GenPwd4 := str;
end;

{ main program }
begin
    Randomize;
    Writeln('символ каждого сорта входит в пароль не менее двух раз,' +
        'некоторые символы могут повторяться:');
    Writeln(GenPwd1);
    Writeln('все символы пароля уникальны:');
    Writeln(GenPwd2);
    Writeln('символы одного сорта не соседствуют:');
    Writeln(GenPwd3);
    Writeln('символы одного сорта не соседствуют и все символы уникальны:');
    Writeln(GenPwd4);
end.
