

function Get-Person {
  param(
    [Parameter(Mandatory)]
    [string] $Name, 
    [Parameter(Mandatory)]    
    [int] $Age)
    
  [PSCustomObject] @{
    Name = $Name
    Age = $Age
    Args = $Args
    PSTypeName = 'Person' # Magic name
  }  
}

Get-Person Staffan 22 | Get-Member
Get-Person Jonas 45 | % PSTypeNames
