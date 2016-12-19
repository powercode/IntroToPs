
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
    [Parameter(Mandatory)]
    [ValidateSet('Staffan', 'Vidar', 'Arve', 'Oden')]
    [string] $Name, 
    [Parameter(Mandatory)]    
    [ValidateRange(0, 140)]
    [int] $Age)
    
  [Person]::new($Name, $Age)
}



