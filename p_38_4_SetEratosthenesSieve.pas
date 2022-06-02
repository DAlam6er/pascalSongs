{
    Решето Эратосфена
}

var
    simples : Set of Byte;
    n, m : Integer;
    f : Text;
begin
    Assign(f, 'p_38_4.out');
    Rewrite(f);
    Simples := [2..255];
    { цикл вычеркивания составных чисел }
    for n := 2 to Round(Sqrt(255)) do begin
        if (n in Simples) then
            for m := 2*n to 255 do
                if ((m mod n) = 0) then
                    Simples := Simples - [m];
    end;
    for n:= 2 to 255 do
        if (n in Simples) then
            Write(f, n:4);
    Writeln(f);
    Close(f);
end.
