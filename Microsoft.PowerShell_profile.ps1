Set-Location C:\
Set-PSReadlineKeyHandler -Key Tab -Function Complete
New-Alias -Name npp -Value "C:\Program Files\Notepad++\notepad++.exe"
Import-Module Vmware.VimAutomation.Core

#Window Title
[System.Security.Principal.WindowsPrincipal]$global:currentUser = 
New-Object System.Security.Principal.WindowsPrincipal(
[System.Security.Principal.WindowsIdentity]::GetCurrent()
)
if($global:currentUser.IsInRole(
[System.Security.Principal.WindowsBuiltInRole]::Administrator)
) {
  $user = $global:currentUser.Identities.Name + " (Administrator)";
} else {
  $user = $global:currentUser.Identities.Name
}
(Get-Host).UI.RawUI.WindowTitle =  $user + " on " + [System.Net.Dns]::GetHostName() + " (v" + (Get-Host).Version + ")";

#Prompt
#function Prompt {
#  Write-Host ("[") -nonewline -foregroundcolor White
#  Write-Host (Get-Date -format HH:mm:ss) -nonewline -foregroundcolor White
#  Write-Host ("]") -nonewline -foregroundcolor White
#  Write-Host ($ENV:Username.tolower()) -nonewline -foregroundcolor DarkGray
#  Write-Host ("@") -nonewline -foregroundcolor Green
#  Write-Host ($ENV:COMPUTERNAME.tolower()) -NoNewline -ForegroundColor DarkGray
#  #Write-Host ("]") -nonewline -foregroundcolor Green
#  #Write-Host (" 
#  #") -NoNewline
#  Write-Host ($executionContext.SessionState.Path.CurrentLocation) -NoNewline -ForegroundColor White
#  Write-Host (">") -NoNewline -ForegroundColor White
#  Return " ";
#}

(Get-PSProvider -PSProvider FileSystem).Home = $env:USERPROFILE
Function Prompt {
    If ([bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).Groups -match 'S-1-5-32-544')) {
        $Symbol = '#'
    } Else {
        $Symbol = '$'
    }
  
	$pdate = (Get-Date -format HH:mm:ss)
    $Prompt = "[$pdate] $($env:USERNAME.ToLower())@$($env:COMPUTERNAME.ToLower()) $Symbol "
    $Host.UI.RawUI.WindowTitle = $Prompt
    $Prompt
}

#Session logging
$PoSHLog = "$env:USERPROFILE\Scripts\Transcripts\PSSessionLog_$(Get-Date -Format MMddyyyy).log"
Start-Transcript -Path $PoSHLog -Append

#Checks if PoSH session is being executed as Administrator
$WID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$Prp = New-Object System.Security.Principal.WindowsPrincipal($WID)
$Adm = [System.Security.Principal.WindowsBuiltInRole]::Administrator
$IsAdmin = $Prp.IsInRole($Adm)

if( $IsAdmin ){
	$Host.UI.RawUI.Backgroundcolor = "DarkRed"
	Clear-Host
	}

# Start PowerShell As Domain Admin
Function Start-PowerShellAsAdmin {
    $Credential = New-Object -TypeName System.Management.Automation.PsCredential -ArgumentList "domain\username",(Get-Content "$($env:userprofile)\filename_priv.txt" | ConvertTo-SecureString)
    Start-Process PowerShell -LoadUserProfile -Credential $Credential
}
