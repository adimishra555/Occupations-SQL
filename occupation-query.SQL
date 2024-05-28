// Occupations-SQL HackerRank

SELECT
    D.Name AS Doctor,
    P.Name AS Professor,
    S.Name AS Singer,
    A.Name AS Actor
FROM
    (SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS rn FROM OCCUPATIONS WHERE Occupation = 'Doctor') AS D
    FULL JOIN (SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS rn FROM OCCUPATIONS WHERE Occupation = 'Professor') AS P
    ON D.rn = P.rn
    FULL JOIN (SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS rn FROM OCCUPATIONS WHERE Occupation = 'Singer') AS S
    ON D.rn = S.rn
    FULL JOIN (SELECT Name, ROW_NUMBER() OVER (ORDER BY Name) AS rn FROM OCCUPATIONS WHERE Occupation = 'Actor') AS A
    ON D.rn = A.rn
ORDER BY COALESCE(D.rn, P.rn, S.rn, A.rn);

