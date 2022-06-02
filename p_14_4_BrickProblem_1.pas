{   В стене прорублено прямоугольное сквозное отверстие со сторонами A и B.
    Пусть ваши программы разберутся, пройдет ли в него кирпич с ребрами X, Y, Z.
    Известно, что A<B и X<Y<Z.
}
var
    holeA, holeB, brX, brY, brZ : integer;
begin
    write('Hole side A (A < B): ');
    readln(holeA);
    write('Hole side B (A < B): ');
    readln(holeB);
    write('Brick size X (X < Y < Z): ');
    readln(brX);
    write('Brick size Y (X < Y < Z): ');
    readln(brY);
    write('Brick size Z (X < Y < Z): ');
    readln(brZ);
    if ((brX <= holeA) and (brY <= holeB)) then
        writeln('Fit')
    else
        writeln('Can''t fit.');
end.
