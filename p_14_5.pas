var
    holeA, holeB, brX, brY, brZ : integer;
begin
    write('Hole side A: ');
    readln(holeA);
    write('Hole side B: ');
    readln(holeB);
    write('Brick size X: ');
    readln(brX);
    write('Brick size Y: ');
    readln(brY);
    write('Brick size Z: ');
    readln(brZ);
    if  ((holeA >= brX) and (holeB >= brY)) or
        ((holeA >= brX) and (holeB >= brZ)) or
        ((holeA >= brY) and (holeB >= brZ)) or
        ((holeA >= brY) and (holeB >= brX)) or
        ((holeA >= brZ) and (holeB >= brX)) or
        ((holeA >= brZ) and (holeB >= brY))
    then
        writeln('Fit')
    else
        writeln('Can''t fit.');
end.
