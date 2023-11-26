select 
    Model0 as 'MODEL',
	Manufacturer0 as 'VENDOR', 
    Count(*) as 'COUNT'
from 
    dbo.v_GS_COMPUTER_SYSTEM CS,
    dbo.v_FullCollectionMembership FCM
Where
    CS.ResourceId = FCM.ResourceId
    And CollectionID = 'SMS00001'
Group by 
    Model0, Manufacturer0
Order by
	COUNT DESC
