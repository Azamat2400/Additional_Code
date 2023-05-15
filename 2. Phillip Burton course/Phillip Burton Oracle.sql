SELECT OBJ#, TS#
FROM TAB$;

SELECT ts#
FROM tab$;
    
SELECT COL# Column_name
FROM COL$;

SELECT COL# AS "COLUMN NUMBER" , NAME, TYPE#
FROM COL$
WHERE COL# = 1;

SELECT col# "2Column Number", NAME, TYPE# 
FROM COL$
WHERE col# = 1;

SELECT NAME, COUNT(*)--, TYPE#
FROM COL$
WHERE COL# = 1
GROUP BY NAME;--, type#;

SELECT NAME, COUNT(*), TYPE#
FROM COL$
WHERE COL# = 1
GROUP BY NAME, TYPE#;

SELECT NAME, COUNT(*) AS "NUMBER OF TIMES"
FROM COL$
WHERE COL# = 1
GROUP BY NAME
HAVING COUNT(*) > 5 ;

SELECT NAME, COUNT(*) AS "NUMBER OF TIMES"
FROM COL$
WHERE COL# = 1
GROUP BY NAME
HAVING COUNT(*) > 5 
ORDER BY "NUMBER OF TIMES" DESC;