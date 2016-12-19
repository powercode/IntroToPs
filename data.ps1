# text

gvim.exe D:\ws\wal\TnT\BuildLog.txt 

Select-String -LiteralPath D:\ws\wal\TnT\BuildLog.txt -Pattern 'frostbite\.FB_EXT_(\w+)\.ENABLE'

Select-String -LiteralPath D:\ws\wal\TnT\BuildLog.txt -Pattern 'frostbite\.FB_EXT_(\w+)\.ENABLE' | Get-Member

Select-String -LiteralPath D:\ws\wal\TnT\BuildLog.txt -Pattern '\[visualstudio\] NOT Updating project file  ''Win64_tool_shared_(?<gn>.+?)''' -Context 1,4 | Where-Object {
  $_.Context.PreContext[0] -match 'pipeline'
}


Clear-Host 

Select-String -LiteralPath D:\ws\wal\TnT\BuildLog.txt -Pattern '\[exec\] (?<red>[\S]+)|\[package\] (?<green>\S+)' | ForEach-Object {
  $g = $_.Matches[0].groups	
  if ($g[1].Success) {
    "Got an exec: $($g[1].Value)"
  }
  else {
    "Got a package: $($g[2].Value)"
  }
}


# JSON

Get-ChildItem | ConvertTo-Json -Depth 1 | ConvertFrom-Json

Get-ChildItem | Select-Object Name,Length, CreationTime | ConvertTo-JiraTable # | Set-Clipboard


# Get all items from tools shared vcxproj that are filtered under UI
[Xml] $x = Get-Content $env:TNT_ROOT\local\build\ws\flattened\Win64_Tool_Shared_WS.vcxproj.filters
$x.Project.ItemGroup.ClCompile.Where{$_.Filter-eq 'UI'}

#splatting

$excelArgs = @{
  Path = "$env:USERPROFILE\Desktop\demo.xlsx"
  WorkSheetname ='Items'
  PivotRows = 'Name' 
  PivotColumns = 'Hour' 
  PivotData  = 'length' 
  ChartType =' BarStacked'
  KillExcel = $true
  Show = $true
  IncludePivotTable = $true
  IncludePivotChart = $true
}
Remove-Item -ea:0 "$env:USERPROFILE\Desktop\demo.xlsx"
Get-ChildItem -file | Select-Object Name, Length, @{l='Hour'; ex={$_.CreationTime.Hour}}| Export-Excel @excelargs

