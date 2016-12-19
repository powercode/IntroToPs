


function Get-Person([string] $Name, [int] $Age) {
	[PSCustomObject] @{
		Name = $Name
		Age = $Age
		Args = $Args
		PSTypeName = 'Person' # Magic name
	}
}

Clear-Host

Get-Person Staffan 22 | % PSTypeNames
Get-Person Jonas 45 | Get-Member

Get-Person -Name Staffan -Age 22 1 3 5