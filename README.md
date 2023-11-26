# sccm-queries

These are WQL queries to be used for the creations of Device Collections in SCCM.  The data gathered by these queries can be used to monitor metrics for proactive maintenance such as reboot time, free disk space, etc.

#### No Reboot in more than 90 Days
```sql
select  SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client 
from    SMS_R_System 
inner join SMS_G_System_OPERATING_SYSTEM on SMS_G_System_OPERATING_SYSTEM.ResourceID = SMS_R_System.ResourceId 
where   DATEDIFF(DD, SMS_G_System_OPERATING_SYSTEM.LastBootUpTime, GETDATE()) > 90
```

#### No Reboot in more than 60 Days
```sql
select  SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client 
from    SMS_R_System 
inner join SMS_G_System_OPERATING_SYSTEM on SMS_G_System_OPERATING_SYSTEM.ResourceID = SMS_R_System.ResourceId 
where   DATEDIFF(DD, SMS_G_System_OPERATING_SYSTEM.LastBootUpTime, GETDATE()) > 60
```

#### No Reboot in more than 30 Days
```sql
select  SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client 
from    SMS_R_System 
inner join SMS_G_System_OPERATING_SYSTEM on SMS_G_System_OPERATING_SYSTEM.ResourceID = SMS_R_System.ResourceId 
where   DATEDIFF(DD, SMS_G_System_OPERATING_SYSTEM.LastBootUpTime, GETDATE()) > 30
```

#### Systems Pending a Reboot
```sql
SELECT  SMS_R_SYSTEM.ResourceID, 
        SMS_R_SYSTEM.ResourceType, 
        SMS_R_SYSTEM.Name,
        SMS_R_SYSTEM.SMSUniqueIdentifier, 
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,
        SMS_R_SYSTEM.Client FROM sms_r_system 
inner join SMS_UpdateComplianceStatus ON SMS_UpdateComplianceStatus.machineid=sms_r_system.resourceid
WHERE   SMS_UpdateComplianceStatus.LastEnforcementMessageID = 9
```

#### All Workstations with Failed Software Updates
```sql
select  SMS_R_SYSTEM.ResourceID, 
        SMS_R_SYSTEM.ResourceType, 
        SMS_R_SYSTEM.Name, 
        SMS_R_SYSTEM.SMSUniqueIdentifier, 
        SMS_R_SYSTEM.ResourceDomainORWorkgroup, 
        SMS_R_SYSTEM.Client 
from    sms_r_system 
inner join SMS_UpdateComplianceStatus on SMS_UpdateComplianceStatus.machineid=sms_r_system.resourceid 
where   SMS_UpdateComplianceStatus.LastEnforcementMessageID = 11
```

#### Has BitLocker Partition
```sql
select  SMS_R_SYSTEM.ResourceID,
        SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,
        SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,
        SMS_R_SYSTEM.Client 
from    SMS_R_System 
inner join SMS_G_System_PARTITION on SMS_G_System_PARTITION.ResourceId = SMS_R_System.ResourceId 
where   SMS_G_System_PARTITION.Size = 300
```

#### BitLocker Status Protection OFF
```sql
select  SMS_R_SYSTEM.ResourceID,
        SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,
        SMS_R_SYSTEM.Client 
from    SMS_R_System 
inner join SMS_G_System_ENCRYPTABLE_VOLUME on SMS_G_System_ENCRYPTABLE_VOLUME.ResourceId = SMS_R_System.ResourceId 
where   SMS_G_System_ENCRYPTABLE_VOLUME.ProtectionStatus = 0
```

#### **Note - For the below TPM queries, you'll have to enable the Win32_TPM class by importing a custom MOF file to SCCM. See https://eliasleal.com/2014/09/19/show-tpm-values/ for more details!

#### Has TPM
```sql
select  SMS_R_SYSTEM.ResourceID,
        SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,
        SMS_R_SYSTEM.Client from SMS_R_System 
inner join SMS_G_System_TPM on SMS_G_System_TPM.ResourceID = SMS_R_System.ResourceId 
where   SMS_G_System_TPM.SpecVersion is not null 
```

#### TPM Activated
```sql
select  SMS_R_SYSTEM.ResourceID,
        SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client 
from    SMS_R_System 
inner join SMS_G_System_TPM on SMS_G_System_TPM.ResourceId = SMS_R_System.ResourceId 
where   SMS_G_System_TPM.IsActivated_InitialValue = 1
```

#### TPM Enabled
```sql
select  SMS_R_SYSTEM.ResourceID,
        SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,
        SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,
        SMS_R_SYSTEM.Client 
from    SMS_R_System 
inner join SMS_G_System_TPM on SMS_G_System_TPM.ResourceId = SMS_R_System.ResourceId 
where   SMS_G_System_TPM.IsEnabled_InitialValue = 1
```

#### TPM Owned
```sql
select  SMS_R_SYSTEM.ResourceID,
        SMS_R_SYSTEM.ResourceType,
        SMS_R_SYSTEM.Name,
        SMS_R_SYSTEM.SMSUniqueIdentifier,
        SMS_R_SYSTEM.ResourceDomainORWorkgroup,
        SMS_R_SYSTEM.Client from SMS_R_System 
inner join SMS_G_System_TPM on SMS_G_System_TPM.ResourceId = SMS_R_System.ResourceId 
where   SMS_G_System_TPM.IsOwned_InitialValue = 1
```





