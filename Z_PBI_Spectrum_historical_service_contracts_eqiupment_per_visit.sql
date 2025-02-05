---- Equipment per visit list
SELECT --TOP 100
	e.Internal_Key,
	e.Equipment,
	e.Task,
	e.Quantity
	--,e.*
FROM
	SC_CONTRACT_VISIT_EQUIP_MC AS e
WHERE
	Company_Code = 'NA2'
