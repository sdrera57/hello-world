	SELECT DISTINCT
stage.dbo.Contact.Birthname__c,
stage.dbo.Contact.Email,
-- stage.dbo.contact.FirstName,
LEFT(RTRIM(stage.dbo.contact.FirstName), 15),

-- stage.dbo.Contact.LastName,
LEFT(RTRIM(stage.dbo.Contact.LastName), 30),
stage.dbo.contact.MiddleName,
replace(replace(replace(replace(replace(stage.dbo.Contact.MobilePhone,'.',''),'-',''), ' ',''),')',''),'(',''),
stage.dbo.Contact.Salutation,
stage.dbo.integration_control.sf_id,
'Stage_User',
'Stage_Import',
getdate()
from stage.dbo.integration_control
left outer join
contact on integration_control.sf_id = contact.id
where integration_control.jenzabar_id is null
and stage.dbo.integration_control.app_status = 'Approved'
