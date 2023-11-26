SELECT sys.Netbios_Name0
	,um.*
FROM v_R_System sys
LEFT OUTER JOIN v_GS_SYSTEM_CONSOLE_USAGE_MAXGROUP um
	ON um.ResourceID = sys.ResourceID
where sys.User_name0 in (
'username1', 
'username2',)

ORDER BY sys.Netbios_Name0

