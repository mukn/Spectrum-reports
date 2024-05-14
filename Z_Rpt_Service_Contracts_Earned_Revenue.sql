/** Z_RPT_Service_Contracts_Earned_Revenue
	**/
SELECT
	bTotal.Contract_Number
	,bTotal.Contract_value
	,bBilled.Revenue_Billed
	,bEarned.Revenue_Earned

FROM 
	(SELECT LTRIM(RTRIM(Contract_Number)) AS Contract_Number,SUM(Scheduled_Amount) AS Contract_value
	FROM Z_RPT_SERVICE_CONTRACT_BILLING GROUP BY Contract_Number) AS bTotal
	LEFT OUTER JOIN
	(SELECT LTRIM(RTRIM(Contract_Number)) AS Contract_Number,SUM(Scheduled_Amount) AS Revenue_Billed
	FROM Z_RPT_SERVICE_CONTRACT_BILLING WHERE Billed = 'Y' GROUP BY Contract_Number) AS bBilled
		ON bTotal.Contract_Number = bBilled.Contract_Number
	LEFT OUTER JOIN
	(SELECT LTRIM(RTRIM(Contract_Number)) AS Contract_Number,SUM(Revenue_Amount) AS Revenue_Earned
	FROM SC_GL_DIST_HIST_MC WHERE Company_Code = 'NA2' GROUP BY Contract_Number) AS bEarned
		ON bTotal.Contract_Number = bEarned.Contract_Number

	/** Supporting queries

	-- This selects the contract, revenue transactions, the total contract amount, a few dates that need defined, and internal key values for cross referencing to other tables and views.
	SELECT LTRIM(RTRIM(Contract_Number)) AS Contract_Number,Revenue_Amount,Contract_Amount,GL_Date,Update_Date,Scheduled_Date,Internal_Key,Revenue_Key FROM SC_GL_DIST_HIST_MC WHERE Company_Code = 'NA2' ORDER BY Contract_Number
	SELECT LTRIM(RTRIM(Contract_Number)) AS Contract_Number,SUM(Revenue_Amount) AS Revenue_Amount FROM SC_GL_DIST_HIST_MC WHERE Company_Code = 'NA2' GROUP BY Contract_Number

	*/ 
