select 
    Model0 as 'MODEL',
	CS.Manufacturer0 as 'VENDOR', 
	OS.Caption0 as 'OS Name',
	STM.SystemType0 as 'Architecture',
    Count(*) as 'COUNT'
from 
    dbo.v_GS_COMPUTER_SYSTEM CS,
	v_R_System rsys
	JOIN v_GS_SYSTEM STM on rsys.ResourceID = stm.ResourceID
	JOIN v_GS_OPERATING_SYSTEM os ON rsys.ResourceID = os.ResourceID
	JOIN v_FullCollectionMembership fcm on os.ResourceID = fcm.ResourceID
Where
    CS.ResourceId = FCM.ResourceId
    And CollectionID = 'SMS00001'
Group by 
    Model0, CS.Manufacturer0, OS.Caption0, STM.SystemType0
Order by
	COUNT DESC
