Get-PSDrive 

Get-Command -Noun PSDrive

Get-Item ~/.gitconfig

Get-ChildItem # gci

Get-ChildItem $env:TNT_ROOT -Depth 2 -file -Include a* | Where-Object Name -match ^a

$function:ExtendHistoryInfo

#formatdata
#typedata

Set-Item -Path env:foo -Value 'a b c'
Remove-Item env:foo
Move-Item -Path A -Destination B
New-Item -ItemType Directory -Path Foo
Invoke-Item
Clear-Item
Rename-Item
Copy-Item

Rename-ItemProperty ~/.gitconfig -Name ISReadOnly -NewName IsNotWriteable  -WhatIf 
Remove-ItemProperty ~/.gitconfig -Name ISReadOnly  -WhatIf 
New-ItemProperty
Move-ItemProperty

Get-ItemProperty -path 'HKCU:\Console\Git Bash'  -Name FaceName
Get-ItemPropertyValue -path 'HKCU:\Console\Git Bash'  -Name FaceName
Set-ItemProperty -path 'HKCU:\Console\Git Bash'  -Name FaceName -Value 'Lucida Console'
Copy-ItemProperty 
Clear-ItemProperty


