-- Document location to Transaction_ID
SELECT
	d.*
	,x.Transaction_ID
	--,x.*
	,m.Transaction_Description
	--m.*
FROM
	DI_IMAGE_MASTER_VIEW AS d
	JOIN
	DI_IMAGE_XREF_VIEW AS x
		ON d.Document_ID = x.Document_ID
	LEFT JOIN
	DI_MASTER_MC AS m
		ON x.Transaction_ID = m.Transaction_ID

ORDER BY d.Document_ID DESC
