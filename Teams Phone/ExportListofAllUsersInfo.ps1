#Export All Users info from Local AD
Get-ADUser -filter * -Properties * | select Displayname,Name,mail,UserPrincipalName,samaccountname,sn,Enabled,EmailAddress,homePhone,ipPhone,mobile,telephoneNumber,OfficePhone, city, title, company, department  | export-csv -path c:\temp\All
lUsers-allinfo.csv

