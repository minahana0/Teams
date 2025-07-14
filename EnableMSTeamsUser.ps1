#Enable MS Team Phone System for List of Users

<#
========== Requirments ============
1- Create CSV file with Email, Phone, VoicePolicy Headers as following
Email,Phone,Ext,VoicePolicy
Mina@domain.com,11111111,1111,QIA-International

#>
#Install Modules
##Install-Module MicrosoftTeams -Force
#Install-Module PowerShellGet -Force -AllowClobber

Import-Module -Name MicrosoftTeams
#Import-Module SkypeOnlineConnector


#Connect to MS Teams
Connect-MicrosoftTeams   
#Change Username and onmicrosoftdomain
#$sfbSession = New-CsOnlineSession -username admin@minadev.onmicrosoft.com -Overrideadmindomain minadev.onmicrosoft.com
#Import-PSSession $sfbSession -AllowClobber

#Enable Users

$users = Import-CSV  C:\Temp\Userslist1.csv
foreach ($user in $users)
{

   #"+97445388701;ext=1002"
   $NewPhone = "+974"+ $user.Phone+";ext="+$user.Ext

   Grant-CsTeamsUpgradePolicy -Identity $user.Email -PolicyName UpgradeToTeams
   Set-CsPhoneNumberAssignment -Identity $user.Email -EnterpriseVoiceEnabled $true
   Set-CsPhoneNumberAssignment -Identity $user.Email -PhoneNumber $NewPhone -PhoneNumberType DirectRouting
   #Set-CsUser -Identity $user.Email -EnterpriseVoiceEnabled $true -HostedVoiceMail $true -OnPremLineURI $NewPhone
   #Grant-CsOnlineVoiceRoutingPolicy -Identity $user.Email  -PolicyName $user.VoicePolicy
   $NewPhone = ""
 }
