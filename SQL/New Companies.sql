SELECT C.COMPANY_CODE
     , C.FOUNDER
     , COUNT(DISTINCT L.LEAD_MANAGER_CODE)
     , COUNT(DISTINCT SM.SENIOR_MANAGER_CODE)
     , COUNT(DISTINCT M.MANAGER_CODE)
     , COUNT(DISTINCT E.EMPLOYEE_CODE)
  FROM COMPANY C
       INNER JOIN LEAD_MANAGER L    ON L.COMPANY_CODE = C.COMPANY_CODE
       INNER JOIN SENIOR_MANAGER SM ON SM.COMPANY_CODE = L.COMPANY_CODE
       INNER JOIN MANAGER M         ON M.COMPANY_CODE = SM.COMPANY_CODE
       INNER JOIN EMPLOYEE E        ON E.COMPANY_CODE = M.COMPANY_CODE
 GROUP BY       
       C.COMPANY_CODE
     , C.FOUNDER
 ORDER BY     
       C.COMPANY_CODE;