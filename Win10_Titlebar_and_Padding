#Reduce Titlebar & Window Border Padding on Windows 10

$regpath = "HKCU:\Control Panel\Desktop\WindowMetrics\"
$CaptionHeight = "CaptionHeight"
$CaptionHeightValue = "-285"
$CaptionWidth = "CaptionWidth"
$CaptionWidthValue = "-285"
$CaptionFont = "CaptionFont"
$CaptionFontValue = "hex:f4,ff,ff,ff,00,00,00,00,00,00,00,00,00,00,00,00,90,01,00,00,\
      00,00,00,01,00,00,05,00,53,00,65,00,67,00,6f,00,65,00,20,00,55,00,49,00,00,\
      00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,\
      00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00"
$ScrollWidth = "ScrollWidth"
$ScrollWidthValue = "-240"
$ScrollHeight = "ScrollHeight"
$ScrollHeightValue = "-240"
$PaddedBorderWidth = "PaddedBorderWidth"
$PaddedBorderWidthValue = "0"

New-ItemProperty -Path $regpath -Name $CaptionHeight -Value $CaptionHeightValue -PropertyType String -Force
New-ItemProperty -Path $regpath -Name $CaptionWidth -Value $CaptionWidthValue -PropertyType String -Force 
New-ItemProperty -Path $regpath -Name $CaptionFont -Value $CaptionFontValue -PropertyType Binary -Force 
New-ItemProperty -Path $regpath -Name $ScrollWidth -Value $ScrollWidthValue -PropertyType String -Force 
New-ItemProperty -Path $regpath -Name $ScrollHeight -Value $ScrollHeightValue -PropertyType String -Force 
New-ItemProperty -Path $regpath -Name $PaddedBorderWidth -Value $PaddedBorderWidthValue -PropertyType String -Force 
