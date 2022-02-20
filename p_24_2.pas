{ 
Шифрование и дешифрование строки по ключу Цезаря 
Ключ задается внутри процедур шифрования/дешифрования строки.
Строка вводится с клавиатуры.
}

{ Шифрование отдельного символа }
function Encrypt(arg : char; Ckey : integer) : char;
var
    x : integer;
begin
    x := Ord(arg) + Ckey;
    if (x > 255) then
        x := x - 256 + 32;
    Encrypt := Chr(x);
end;

{ Дешифрование отдельного символа }
function Decrypt(arg : char; Ckey : integer) : char;
var
    x : integer;
begin
    x := Ord(arg) - Ckey;
    if (x < 32) then
        x := x + 256 - 32;
    Decrypt := Chr(x);
end;

{ Шифрование строки }
procedure EncryptStr(var arg : string);
var
    i, key : integer;
begin
    write('Input Caesar key: ');
    readln(key);
    for i := 1 to length(arg) do
        arg[i] := Encrypt(arg[i], key);
end;

{ Дешифрование строки }
procedure DecryptStr(var arg : string);
var
    i, key : integer;
begin
    write('Input Caesar key: ');
    readln(key);
    for i := 1 to length(arg) do
        arg[i] := Decrypt(arg[i], key);
end;

{ Main program }
var
    s : string;
    oper : integer;
begin
    repeat
        write('Input string: ');
        readln(s);
        writeln('Specify operation: 1 - to encrypt, 2 - to decrypt, ' +
            'any other digit - to exit');
        readln(oper);
        case oper of
            1:
                EncryptStr(s);
            2:
                DecryptStr(s);
            else
                break;
        end;
        writeln(s);
    until false;
end.
