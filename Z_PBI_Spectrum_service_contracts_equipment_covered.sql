---- Equipment list
/* All the equipment that we have against the contract */
SELECT --TOP 100 
	LTRIM(RTRIM(e.Site_ID)) AS Site_Code,
	LTRIM(RTRIM(e.Contract_Number)) AS Contract_Number,
	e.Equipment_Code
	--,e.*
FROM
	SC_CONTRACT_EQUIPMENT_MC AS e
WHERE
	e.Company_Code = 'NA2'
