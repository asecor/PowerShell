<# 
Gets the newest 10 event logs from a specified category (Application). 
Other categories can be specified such as: 

Application
HardwareEvents
Internet Explorer
Key Management Service
Security; System
Windows PowerShell
#>

$servers = 'server1,server2,server3,server4'.Split(',')

foreach ($server in $servers) {
Write-Host $server 
Get-EventLog -ComputerName $servers -LogName Application -Newest 10
}


# Gets the event viewer logs from 1 server with additional formatting.
Get-EventLog -ComputerName server1 -LogName System -Newest 10 | ft TimeWritten, Source, UserName, EventID, InstanceId, Message -AutoSize -Wrap
