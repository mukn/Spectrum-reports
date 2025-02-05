---- Billings
/* This should have information about each billing that went against the contract: date, invoice number, amount, line items, etc. */
-- 61855 rows
SELECT --TOP 100
	LTRIM(RTRIM(b.Site_ID)) AS Site_Code,
	LTRIM(RTRIM(b.Contract_Number)) AS Contract_Number,
	b.Scheduled_Date,
	b.Scheduled_Amount,
	LTRIM(RTRIM(b.Invoice_Or_Transaction)) AS Invoice_Number,
	b.Transaction_Type,
	b.Internal_Key
	--,b.*
FROM
	SC_CONTRACT_BILLING_MC AS b
WHERE
  b.Company_Code = 'NA2'
