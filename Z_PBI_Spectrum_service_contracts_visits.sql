---- Visits
/* This should have information about each visit against the contract including tech who went, hours, what was done, etc. */
SELECT 
	LTRIM(RTRIM(v.Contract_Number)) AS Contract_Number,
	LTRIM(RTRIM(v.Site_ID)) AS Site_Code,
	v.Visit_Date,
	w.WO_Date_List1,
	w.WO_Date_List2,
	w.WO_Date_List3,
	w.WO_Date_List4,
	w.Scheduled_Start_Date,
	w.Complete_Date,
	LTRIM(RTRIM(v.Work_Summary)) AS Work_Requested,
	w.Summary_Description,
	v.Budget_Hours,
	w.Projected_Hours,
	LTRIM(RTRIM(v.WO_Number)) AS Visit_Number,
	LTRIM(RTRIM(w.WO_Number)) AS WO_Number,
	LTRIM(RTRIM(w.Workman_List1)) AS Workman_List1,
	LTRIM(RTRIM(w.Workman_List2)) AS Workman_List2,
	LTRIM(RTRIM(w.AR_Invoice_Number)) AS Invoice_Number,
	v.Internal_Key
	--,v.*
	--,w.*
FROM
	SC_CONTRACT_VISIT_MC AS v WITH (NOLOCK)
	LEFT OUTER JOIN
	WO_HEADER_MC AS w WITH (NOLOCK)
		ON LTRIM(RTRIM(v.WO_Number)) = LTRIM(RTRIM(w.WO_Number))
		AND LTRIM(RTRIM(v.Contract_Number)) = LTRIM(RTRIM(w.Contract_Number))
WHERE
	v.Company_Code = 'NA2'
