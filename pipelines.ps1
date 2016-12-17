

Get-Process | Where-Object ProcessName -like p* | Sort-Object VirtualMemorySize64 | ForEach-Object MainModule | Format-Table -AutoSize

Get-ChildItem -Recurse -File | Group Extension | Sort Count -Descending