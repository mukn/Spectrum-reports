---- Contract information
/* Top-level contract information, contact information for the site and customer, sales rep information, margins, etc. */
SELECT --TOP 100
	LTRIM(RTRIM(s.Contract_Number)) AS Contract_Number,
	LTRIM(RTRIM(s.Customer_Code)) AS Customer_Code,
	LTRIM(RTRIM(s.Site_ID)) AS Site_Code,
	s.Description AS Contract_Type,
	s.Scheduled_Visit_Count AS Number_Visits,
	s.Number_Of_Bill_Periods AS Number_Billings,
	s.Begin_Date AS Contract_Start,
	s.End_Date AS Contract_End,
	s.Salesman,
	s.Contract_Amount,
	c.Tran_Type,
	c.Cost
	--,s.*
	
FROM
	SC_CONTRACT_MC AS s
	LEFT OUTER JOIN
    (SELECT Contract_Number, Tran_Type, SUM(Amt) AS Cost
	FROM Z_PBI_Spectrum_historical_service_contracts_costs_per_visits
	GROUP BY Contract_Number, Tran_Type) AS c
		ON LTRIM(RTRIM(s.Contract_Number)) = c.Contract_Number
    
WHERE
	s.Company_Code = 'NA2'
