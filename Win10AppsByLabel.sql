SELECT 
appname,
vendorname,
APP.version,
TA.tag

from Applications APP
left join Application_Report APR on apr.appIdentity = APP.appIdentity
left join Data_Collection_Package DCP on dcp.name = app.appName
left join Tagged_Applications TA on TA.appIdentity = APP.appIdentity

where osid like '%10.0%'

order by tag
