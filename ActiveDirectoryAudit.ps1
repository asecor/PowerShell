# One-liner to get simple "audit" information of a user
$aduser = user1
Get-ADUser $aduser -Properties * | select Created, Name, GivenName, Surname, SamAccountName,UserPrincipalName, DistinguishedName, SID, Enabled, PasswordLastSet, LastLogonDate, MemberOf | fl 


# Retrieves information for all AD user/service accounts and sorts them by last logon date.
Get-ADUser -Filter * -Properties * | Sort-Object -Property lastlogondate | ft -Property name, lastlogondate,whencreated,PasswordNeverExpires,PasswordExpired,PasswordLastSet
