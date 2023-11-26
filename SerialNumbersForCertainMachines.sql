SELECT  distinct 
 CS.name0 as 'Computer Name', 
 BIOS.SerialNumber0 as 'Serial Number', 
 CS.Model0 as 'Model'
from  
  v_GS_COMPUTER_SYSTEM CS right join v_GS_PC_BIOS BIOS on BIOS.ResourceID = CS.ResourceID
 right join v_GS_SYSTEM SYS on SYS.ResourceID = CS.ResourceID  
 right join v_GS_OPERATING_SYSTEM OS on OS.ResourceID = CS.ResourceID  
 right join v_RA_System_SMSAssignedSites RAA on RAA.ResourceID = CS.ResourceID
 right join V_GS_X86_PC_MEMORY RAM on RAM.ResourceID = CS.ResourceID 
 right join v_GS_Logical_Disk LDisk on LDisk.ResourceID = CS.ResourceID
JOIN v_GS_PROCESSOR Processor on SYS.ResourceID=Processor.ResourceID 
right join v_GS_SYSTEM_ENCLOSURE SE on SE.ResourceID = CS.ResourceID 
where 
 CS.name0 in (
 'hostname1',
 'hostname2' )
group by 
 CS.Name0, 
 BIOS.SerialNumber0, 
 CS.Model0
