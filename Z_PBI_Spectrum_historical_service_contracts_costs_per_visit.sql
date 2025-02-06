SELECT --TOP 100
  CAST(c.WO_Number AS int) AS WO_Number,
  LTRIM(RTRIM(c.Site_Id)) AS Site_Code,
  LTRIM(RTRIM(c.Contract_Number)) AS Contract_Number,
  c.Tran_Source,
  c.Tran_Type,
  SUM(c.Transaction_Amount) AS Amt,
  c.GL_Date
  --,c.*
FROM
  WO_COST_HISTORY_MC AS c
WHERE
  c.Company_Code = 'NA2' 
  AND c.Contract_Number <> '' 
  --AND LTRIM(RTRIM(c.WO_Number)) = '10279'
GROUP BY c.Site_Id,c.Contract_Number,c.WO_Number,GL_Date,c.Tran_Source,C.Tran_Type
ORDER BY CAST(c.WO_Number AS int) DESC
