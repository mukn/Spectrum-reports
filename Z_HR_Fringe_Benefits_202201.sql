SELECT --TOP (1000)
	LTRIM(RTRIM(c.Employee_Code)) AS Employee_number,
	c.Employee_Name,
	LTRIM(RTRIM(c.Check_Number)) AS Check_number,
	c.Net_Check_Amount,
	c.History_Date_List1 AS Check_date_est,
	(c.Hours_List1 + c.Hours_List2) AS Reg_OT_hrs,
	(c.Hours_List3 + c.Hours_List4 + c.Hours_List5 + c.Hours_List6 + c.Hours_List7) AS DT_Other_hrs,
	f.Fringe_Code,
	f.Fringe_Amount
	--c.Union_Fringe_Amount
	--,*
FROM
	PR_CHECK_HISTORY_MC AS c
	JOIN
	(
		SELECT h.Check_Number, f.Fringe_Code, f.Fringe_Amount, h.System_Key
    FROM PR_TIME_CARD_HISTORY_MC AS h JOIN PR_TC_DET_UNION_FRI_HIST_MC AS f ON h.System_Key = f.System_Key AND h.Employee_Code = f.Employee_Code
	) AS f
		ON c.Check_Number = f.Check_Number
WHERE
	c.Company_Code = 'NA2'
	--AND c.History_Date_List1 > '01-01-2022'
	--AND c.History_Date_List1 < '01-30-2022'
	
ORDER BY c.History_Date_List1 DESC, c.Check_number DESC
