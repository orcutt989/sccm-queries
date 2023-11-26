SELECT distinct CS.Model0,
				CS.Name0 as 'Name', 
				TPM.SpecVersion0 as 'SpecVersion', 
				OPSYS.Caption0 as 'OS' 
FROM v_GS_COMPUTER_SYSTEM CS 
left join v_R_System S on S.ResourceID=CS.ResourceID
left join v_GS_OPERATING_SYSTEM OPSYS on CS.ResourceID = OPSYS.ResourceID
join v_GS_TPM TPM on TPM.ResourceID=CS.ResourceID
WHERE OPSYS.Caption0 LIKE '%Microsoft Windows 7%' AND TPM.SpecVersion0 >='2'
Order by CS.Name0