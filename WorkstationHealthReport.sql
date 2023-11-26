SELECT  distinct 
 CS.name0 as 'Hostname',
 RSYS.AD_Site_Name0 as 'AD Site',
 RASYS.IP_Subnets0 as 'Subnet',
 BND.Displayname as 'SCCM Boundary',
 CS.domain0 as 'Domain', 
 CS.UserName0 as 'User',
 OS.InstallDate0 as 'OS Install Date',
 -- OS Install Age Days
 -- Percent Free
 sum(isnull(LDisk.Size0,'0')) as 'Hardrive Size', 
 sum(isnull(LDisk.FreeSpace0,'0')) AS 'Free Space', 
 BIOS.ReleaseDate0 as 'Bios Date', 
 --BIOS age days
 CS.Manufacturer0 as 'System Vendor', 
 CS.Model0 as 'System Model',  
 OS.Caption0 as 'OS Name',
 SYS.SystemType0 as ' OS Architecture',
 RAM.TotalPhysicalMemory0 as 'Total Memory', 
 BIOS.SerialNumber0 as 'System Serial' 
from  
  v_GS_COMPUTER_SYSTEM CS right join v_GS_PC_BIOS BIOS on BIOS.ResourceID = CS.ResourceID
 right join v_GS_SYSTEM SYS on SYS.ResourceID = CS.ResourceID  
 right join v_GS_OPERATING_SYSTEM OS on OS.ResourceID = CS.ResourceID  
 right join v_RA_System_SMSAssignedSites RAA on RAA.ResourceID = CS.ResourceID
 right join V_GS_X86_PC_MEMORY RAM on RAM.ResourceID = CS.ResourceID 
 right join v_GS_Logical_Disk LDisk on LDisk.ResourceID = CS.ResourceID
JOIN v_GS_PROCESSOR Processor on SYS.ResourceID=Processor.ResourceID 
right join v_GS_SYSTEM_ENCLOSURE SE on SE.ResourceID = CS.ResourceID 
right join v_R_System RSYS on RSYS.ResourceID = CS.ResourceID
right join  v_RA_System_IPSubnets RASYS on RASYS.ResourceID = CS.ResourceID
left outer join vSMS_Boundary BND ON RASYS.IP_Subnets0 = BND.Value
where CS.name0 IS NOT NULL
group by 
 CS.Name0, 
 CS.domain0,
 CS.Username0, 
 BIOS.SerialNumber0, 
 CS.Manufacturer0, 
 CS.Model0, 
 OS.Caption0, 
 RAA.SMS_Assigned_Sites0,
 RAM.TotalPhysicalMemory0, 
 Processor.MaxClockSpeed0,
 BIOS.ReleaseDate0,
 OS.Description0,
 OS.InstallDate0,
 RSYS.AD_Site_Name0,
 RASYS.IP_Subnets0,
 BND.Displayname,
 SYS.SystemType0