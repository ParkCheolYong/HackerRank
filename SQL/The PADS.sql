SELECT NAME + '(' + LEFT(OCCUPATION,1) + ')'
  FROM OCCUPATIONS 
  ORDER BY NAME;

SELECT 'There are a total of ' + CONVERT(VARCHAR,COUNT(OCCUPATION)) + ' ' + LOWER(OCCUPATION) + 's.'
  FROM OCCUPATIONS 
 GROUP BY 
       OCCUPATION
 ORDER BY 
       COUNT(OCCUPATION)
     , OCCUPATION;