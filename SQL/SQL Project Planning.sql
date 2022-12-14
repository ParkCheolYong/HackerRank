SELECT A.START_DATE
     , MIN(B.END_DATE) AS END_DATE
  FROM (SELECT A.START_DATE
          FROM Projects A
               LEFT OUTER JOIN Projects B ON B.END_DATE = A.START_DATE
         WHERE B.TASK_ID IS NULL) A
       CROSS JOIN (SELECT A.END_DATE
                     FROM Projects A
                          LEFT OUTER JOIN Projects B ON B.START_DATE = A.END_DATE
                    WHERE B.TASK_ID IS NULL) B 
 WHERE A.START_DATE < B.END_DATE    
 GROUP BY
       A.START_DATE
 ORDER BY
       DATEDIFF(dd, A.START_DATE, MIN(B.END_DATE))
     , A.START_DATE;