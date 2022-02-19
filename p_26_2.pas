{ Encrypting/decrypting file }
const
    encrFileName = 'CRYPT.txt';

function EncryptChar(arg : char; Ckey : integer) : char;
var
    x : integer;
begin
    x := Ord(arg);
    if (x > 32) then begin
        x := x + Ckey;
        if (x > 255) then
            x := x - 256 + 32;
    end;
    EncryptChar := Chr(x);
end;

function DecryptChar(arg : char; Ckey : integer) : char;
var
    x : integer;
begin
    x := Ord(arg);
    if (x > 32) then begin
        x := x - Ckey;
        if (x < 32) then
            x := x + 256 - 32;
    end;
    DecryptChar := Chr(x);
end;

function EncryptStr(var arg : string; key : integer) : string;
var
    i : integer;
    str : string;
begin
    str := '';
    for i := 1 to length(arg) do begin
        str[i] := EncryptChar(arg[i], key);
        str := str + str[i];
    end; 
    EncryptStr := str;
end;

function DecryptStr(var arg : string; key : integer) : string;
var
    i : integer;
    str : string;
begin
    str := '';
    for i := 1 to length(arg) do begin
        str[i] := DecryptChar(arg[i], key);
        str := str + str[i];
    end;
    DecryptStr := str;
end;

procedure EncryptFile(const inFileName : string; key : integer);
var
    str : string;
    encrFile : text;
    inFile : text;
begin
    assign(inFile, inFileName);
    reset(inFile);
    assign(encrFile, encrFileName);
    rewrite(encrFile);
    while (not Eof(inFile)) do begin
        readln(inFile, str);
        writeln(encrFile, EncryptStr(str, key));
    end;
    close(inFile);
    close(encrFile);
end;

procedure DecryptFile(const outFileName : string; key : integer);
var
    str : string;
    encrFile : text;
    outFile : text;
begin
    assign(encrFile, encrFileName);
    reset(encrFile);
    assign(outFile, outFileName);
    rewrite(outFile);
    while (not Eof(encrFile)) do begin
        readln(encrFile, str);
        writeln(outFile, DecryptStr(str, key));
    end;
    close(encrFile);
    close(outFile);
end;

var
    fileName : string;
    oper, key : integer;
begin
    writeln('Specify operation: 1 - to encrypt file, 2 - to decrypt file, ' +
            'any other digit - to exit');
        readln(oper);
        if ((oper = 1) or (oper = 2)) then begin
            write('Input key: ');
            readln(key);
        end;
        case oper of
            1:
                begin
                    writeln('Input file name to encrypt:');
                    readln(fileName);
                    EncryptFile(fileName, key);
                end;
            2:
                begin
                    writeln('Input file name for decrypt output:');
                    readln(fileName);
                    DecryptFile(fileName, key);
                end;
        end;
end.
