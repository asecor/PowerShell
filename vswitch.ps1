$vmhost = Connect-VIServer 10.0.0.114 -User root -Password Password1
$vswitch = Get-VirtualSwitch 
if ($vswitch -eq "vSwitch0")
{
New-VirtualPortGroup -VirtualSwitch $vswitch -Name Servers -VLanId 22 -Server $vmhost
New-VirtualPortGroup -VirtualSwitch $vswitch -Name Development -VLanId 122 -Server $vmhost
New-VirtualPortGroup -VirtualSwitch $vswitch -Name Testing -VLanId 143 -Server $vmhost
}
else
{
Write-host "Finished"
}

