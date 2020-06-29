$XMLFile = "C:\TEMP\inventory.xml"

[xml]$xml = Get-Content $XMLFile

$xml.SelectNodes(""//Description[.='HP Command View EVA']") | % { $_.ParentNode.RemoveChild($_) }

$xml.save("C:\Temp\inventory2.XML")