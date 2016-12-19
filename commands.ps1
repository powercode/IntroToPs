# Object cmdlets

Get-Command -Noun Object

# where
Get-ChildItem | Where-Object { $_.Length % 4 -eq 0 }

Get-ChildItem | Where-Object Name -like p*

# foreach
1..20 | ForEach-Object { [pscustomobject] @{I = $_; ISquare = $_ * $_} } 

Get-ChildItem | ForEach-Object Name

# sort
1,4,2,6 | Sort-Object -Descending
Get-Process | Sort-Object PriorityClass -ErrorAction 0 -Descending | Format-table ProcessName, PriorityClass

# Group
Get-Process | Group-Object {$_.Name.Substring(0,2)}
Get-Process | Group-Object Name | Sort-Object Count -Descending | Select-Object -First 5
Get-ChildItem | Group-Object Extension

# Measure-Object
Get-ChildItem | Measure-Object -Property Length -Sum -Maximum

# Select-Object
Get-ChildItem | Select-Object -First 2 -Last 1 | Select-Object -Index 1,2

# Select-Object
Get-ChildItem | Tee-Object -Variable someOutPut # -Path <somepath>

# compare
Compare-Object 1,3,4  1,3 

# New-Object / legacy


# Add-Member

Get-ChildItem d* -File | Add-Member -NotePropertyMembers @{Reminder = 'Buy groceries!!'} -PassThru -OutVariable result