{
Объявление массива
}
var
    A : array['a'..'z'] of integer;
    C : Char;
begin
    A['s'] := 10;
    { A['R'] := 10; } {error, out of range 97..122}
    C := 'd';
    A[C] := 10;
    Write('C = ');
    Readln(C);
    {$R+} { possible out of range }
        A[C] := 10;
    {$R-}
end.
