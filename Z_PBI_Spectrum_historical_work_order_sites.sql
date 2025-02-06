SELECT
	LTRIM(RTRIM(w.Ship_To_ID)) AS Site_Code,
	w.Ship_To_Name AS Location_Name,
	w.Ship_To_Address1 AS Location_Address1,
	w.Ship_To_Address2 AS Location_Address2,
	w.Ship_To_City AS Location_City,
	w.Ship_To_State AS Location_State,
	w.Ship_To_Zip_Code AS Location_ZIP,
	w.Ship_To_Phone1 AS Location_Phone1,
	w.Ship_To_Phone2 AS Location_Phone2,
	w.Site_Contact_Person AS Location_Contact,
	w.Zone AS Service_Zone,
	udf.Vert_Market

FROM
	WO_ADDRESS_MC AS w
	LEFT OUTER JOIN
	(SELECT     Site_ID, Alpha_Field AS Vert_Market
	FROM        dbo.WO_SITE_USER_FIELDS_DET_MC AS U
	WHERE     (Company_Code = 'NA2') AND (User_Def_Sequence = '000023')) AS udf
		ON LTRIM(RTRIM(w.Ship_To_ID)) = LTRIM(RTRIM(udf.Site_ID))


WHERE
	w.Company_Code = 'NA2'
