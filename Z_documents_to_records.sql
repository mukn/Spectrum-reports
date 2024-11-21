  -- Document location to Transaction_ID
SELECT
	d.*
	--,x.Transaction_ID
FROM
	DI_IMAGE_MASTER_VIEW AS d
	JOIN
	DI_IMAGE_XREF_VIEW as x
		ON d.Document_ID = x.Document_ID
