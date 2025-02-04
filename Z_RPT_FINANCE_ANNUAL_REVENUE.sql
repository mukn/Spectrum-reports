-- 2499 results
SELECT
	LTRIM(RTRIM(j.Job_Number)) AS Job_Number,
	j.Job_Description,
	j.Start_Date,
	YEAR(j.Start_Date) AS Start_FY,
	YEAR(j.Complete_Date) AS End_FY,
	j.Complete_Date,
	CASE
		WHEN p.Projected_Cost > 0 THEN p.Cost_To_Date / p.Projected_Cost 
		ELSE 0
	END AS Percent_Complete,
	j.Original_Contract AS Original_Contract,
	p.Revised_Contract AS Revised_Contract,
	j.Customer_Code,
	j.Address_1,
	j.Address_2,
	j.City,
	j.State,
	j.Zip_Code,
	LTRIM(RTRIM(j.WO_Site)) AS Site_Code,
	s.Site_Address1,
	s.Site_Address2,
	s.Site_City,
	s.Site_State,
	s.Site_ZIP AS Site_ZIP,
	CASE
		WHEN p.Projected_Cost > 0 THEN p.Revised_Contract * p.Cost_To_Date / p.Projected_Cost 
		ELSE 0
	END AS Revenue_Earned,
	p.Cost_To_Date AS Actual_Cost,
	p.Estimated_Cost,
	p.Projected_Cost
	--,j.*
	--,p.*
FROM
	JC_JOB_MASTER_MC AS j WITH (NOLOCK)
	LEFT OUTER JOIN
	JC_JOB_PROGRESS_MC AS p WITH (NOLOCK)
		ON LTRIM(RTRIM(j.Job_Number)) = LTRIM(RTRIM(p.Job_Number))
	LEFT OUTER JOIN
	(SELECT LTRIM(RTRIM(Ship_To_ID)) AS Site_Code,Ship_To_Address1 AS Site_Address1,Ship_To_Address2 AS Site_Address2,Ship_To_City AS Site_City,Ship_To_State AS Site_State,Ship_To_Zip_Code AS Site_ZIP
	FROM WO_ADDRESS_MC WHERE Company_Code = 'NA2') AS s
		ON s.Site_Code = LTRIM(RTRIM(j.WO_Site))
WHERE
	j.Company_Code = 'NA2'
ORDER BY j.Job_Number DESC
