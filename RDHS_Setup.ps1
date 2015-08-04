
Import-Module RemoteDesktop
Set-RDLicenseConfiguration -LicenseServer "rdslicenceserverone" -Mode PerDevice -Force

$obj = gwmi -namespace "Root/CIMV2/TerminalServices" Win32_TerminalServiceSetting
$obj. LicensingType
$obj.LicensingName
$obj = gwmi -namespace "Root/CIMV2/TerminalServices" Win32_TerminalServiceSetting
$obj.ChangeMode(2)
$obj = gwmi -namespace "Root/CIMV2/TerminalServices" Win32_TerminalServiceSetting
$obj.GetSpecifiedLicenseServerList(xxxxx)
