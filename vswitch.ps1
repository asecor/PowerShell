$vmhost = Connect-VIServer 10.0.0.114 -User root -Password Password1
$vswitch = Get-VirtualSwitch
[array]$vswitch0nics = (Read-Host "Enter vSwitc0 NICs - comma separated")#.Split(",") | %{$_.Trim()}
[array]$vswitch1nics = (Read-Host "Enter vSwitc1 NICs - comma separated")#.Split(",") | %{$_.Trim()}


if ($vswitch -notmatch "vSwitch0")
{
    New-VirtualSwitch -VMHost $vmhost -Name vSwitch0 -Nic $vswitch0nics
}
elseif ($vswitch -match "vSwitch0")
{
    New-VirtualPortGroup -VirtualSwitch $vswitch -Name Servers -VLanId 22 -Server $vmhost
    New-VirtualPortGroup -VirtualSwitch $vswitch -Name Development -VLanId 122 -Server $vmhost
    New-VirtualPortGroup -VirtualSwitch $vswitch -Name Testing -VLanId 143 -Server $vmhost
}
elseif ($vswitch -notmatch "vSwitch1")
{
    New-VirtualSwitch -VMHost $vmhost -Name vSwitch1 -Nic $vswitch1nics

}
elseif ($vswitch -match "vSwitch1")
{
    New-VirtualPortGroup -VirtualSwitch $vswitch -Name vMotion -VLanId 200 -Server $vmhost
}
else
{
Write-host "Finished"
}




<#
1. connect to esxihost
1.1 specify (read-host) vswitch0 nics
1.2 specify (read-host) vswitch1 nics
2. check if vswitch0 exists 
2.1 if exists create new portgroups 
2.2 if it doesn't exists create vswitch0
2.3 add nics specified in 1.1 to vswitch0 
2.4 go to 2.1
3. check if vswitch0 exists 
3.1 if exists create new portgroups 
3.2 if it doesn't exists create vswitch0
3.3 add nics specified in 1.1 to vswitch0 
3.4 go to 3.1
#>
