{
s1, s2, s3 - кружки
1..250 - все студенты
res - множество, не состоящее в кружках
}

var
    res, s1, s2, s3 : Set of 1..250;
begin
    s1 := [2, 11, 4, 13];
    s2 := [9, 17, 12, 11, 3, 5, 18];
    s3 := [14, 2, 13, 15, 20];
    res := [1..250] - (s1 + s2 + s3);
end.
