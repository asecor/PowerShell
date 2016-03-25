#script which get members from all matching ad groups
#source - http://stackoverflow.com/questions/17195819/powershell-script-to-return-members-of-multiple-security-groups/27789847#27789847
Import-Module ActiveDirectory

$Groups = (Get-AdGroup -filter * | Where {$_.name -like "*TFS*admin*"} | select name -expandproperty name)


$Table = @()

$Record = [ordered]@{
"Group Name" = ""
"Name" = ""
"Username" = ""
}



Foreach ($Group in $Groups)
{

$Arrayofmembers = Get-ADGroupMember -identity $Group | select name,samaccountname

foreach ($Member in $Arrayofmembers)
{
$Record."Group Name" = $Group
$Record."Name" = $Member.name
$Record."UserName" = $Member.samaccountname
$objRecord = New-Object PSObject -property $Record
$Table += $objrecord

}

}

$Table #| export-csv "C:\temp\SecurityGroups.csv" -NoTypeInformation
