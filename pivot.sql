/**********************************************

  Pivot Basic Template Syntax

SELECT [columns] FROM
(
 [source_query]
)
PIVOT
(
 [aggr_function]([aggr_column] 
 FOR [spreading_column] IN ([spreading_elements]))


SELECT (ColumnNames) 
FROM (TableName) 
PIVOT
 ( 
   AggregateFunction(ColumnToBeAggregated)
   FOR PivotColumn IN (PivotColumnValues)
 ) AS (Alias) //Alias is a temporary name for a table

***********************************************/

/**************
    
    Source Query

***************/

SELECT Occupation, Name
FROM OCCUPATIONS
Group by Occupation, Name
Order by Occupation, Name ASC;


/**********************************************

  Pivot Query

***********************************************/



/*******************************************************

  CASE WHEN Query with multiple expressions in WHEN condition

********************************************************/
SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root')
    WHEN N IN (SELECT DISTINCT P FROM BST) THEN CONCAT(N, ' Inner')
    ELSE CONCAT(N, ' Leaf')
    END
FROM BST
ORDER BY N ASC;

/************************************************************
POWER OF WHERE-AND CLAUSE OVER MULTIPLE JOINS
Avoid Field is ambiguous Error
- Provide Alias to table name and refer to field with TABLE_ALIS.COLUMN_NAME
INSTEAD OF PERFORMING MULTIPLE JOINS PREFER USING WHERE-AND CLAUSE specifying the columns to be equal in both tables

**************************************************************/

SELECT C.COMPANY_CODE, C.FOUNDER, COUNT(DISTINCT L.LEAD_MANAGER_CODE), COUNT(DISTINCT S.SENIOR_MANAGER_CODE), COUNT(DISTINCT M.MANAGER_CODE), COUNT(DISTINCT E.EMPLOYEE_CODE)
FROM COMPANY C, Lead_Manager L, Senior_Manager S, Manager M, Employee E
where C.COMPANY_CODE = L.COMPANY_CODE
AND L.LEAD_MANAGER_CODE = S.LEAD_MANAGER_CODE
AND S.SENIOR_MANAGER_CODE = M.SENIOR_MANAGER_CODE
AND M.MANAGER_CODE = E.MANAGER_CODE
GROUP BY COMPANY_CODE, FOUNDER
ORDER BY COMPANY_CODE, FOUNDER ASC;

/***********************************************************
OUTPUT WITHOUT ANY TABLE - USE SELECT ..... FROM INFORMATION_SCHEMA.TABLES
HOW TO INIIALIZE VARIABLES IN MYSQL - USE SET @VARIABLE_NAME:= VARIABLE_VALUE_WHATEVER
REPEATEDLY PRINT A PARTICULAR PATTER N NUMBER OF TIME: SELECT REPEAT('PATTERN'_OR_STRING, N)
VALUE FIRST INCREMENTS/DECREMENTS IN REPEAT STATEMENT AND IS THEN PRINTED THAT'S WHY INITIALIZATION WITH @NUMBER:=21

************************************************************/

SET @NUMBER := 21;
SELECT REPEAT('* ', @NUMBER:=@NUMBER-1) FROM INFORMATION_SCHEMA.TABLES;

/****************

* 
* * 
* * * 
* * * * 
* * * * *

******************/
SET @R:= 0;
SELECT REPEAT('* ', @R:= @R+1) FROM INFORMATION_SCHEMA.TABLES WHERE @R<20;

/****************************************************
Weather Observation Station 18
every derived table must have it's own Alias - Provide Alias to the last Select clause

*****************************************************/
SELECT ROUND((ABS(A-C) + ABS(B-D)),4) FROM (
    SELECT MIN(LAT_N) A, MIN(LONG_W) B, MAX(LAT_N) C, MAX(LONG_W) D
    FROM STATION) AS Manhattan_Distance;

/*********************************************************
NO SQUARE FUNCTION IN MYSQL, EXP() IS e RAISED TO THE POWER
POWER math function in MYSQL:POW(M,N) ALSO POWER
Square Root math function in MYSQL: SQRT()

***********************************************************/

SELECT ROUND(SQRT(POW(A-B,2) + POWER(C-D,2)),4) FROM(
    SELECT MIN(LAT_N) A, MIN(LONG_W) C, MAX(LAT_N) B, MAX(LONG_W) D
    FROM STATION) AS EUC_DIST;






