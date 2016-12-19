Write-Output 'This goes to the pipeline'
Write-Error -Message 'Oops' -Category InvalidArgument -TargetObject  @{ Value = 47; WasItChineseNewYear = $false}
Write-Warning 'You shouldn''t run with scissors'
Write-Debug 'Intended for the developers of the scripts'
Write-Verbose 'Intended for the advanced user of the script'
Write-Progress -Activity 'Build Project' -Status WS.Main -CurrentOperation Entities.cpp -PercentComplete 47

Write-Host 'Message that is not redirectable'



Stop-Service -Name Foobar -ErrorVariable spsvErr