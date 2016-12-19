

class Person {
  [string] $Name
  [int]    $Age
  
  Person([string] $name, [int] $age) {
    $this.Name = $name
    $this.Age = $age
  }   
}

function Get-Person {
  [OutputType([Person])]
  param(
    [Parameter(Mandatory, ValueFromPipelineByPropertyName)]    
    [string] $Name, 
    [Parameter(Mandatory, ValueFromPipelineByPropertyName)]    
    [Alias('Length')]    
    [int] $Age)
  
  begin {
    $ageSum = 0
  }
  process {
    [Person]::new($Name, $Age)
    $ageSum += $Age
  }
  end {
    Write-Verbose "The sum of ages is $agesum"
  }
  
}

get-person Staffan 2 -Verbose 

Get-ChildItem -File | Get-Person -Verbose 



