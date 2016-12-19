
# int32
42

# int64
564897987465

# decimal
3213216546549879847651

# String
'Hello'

# variable
$someone = 'World'

# String with variable expansion
"Hello, $someone"

# Array
@(1,2,3)
'a', 'b', 'c'

# Hashtable
@{
    Product = 'Walrus'
    TD = 'Jonas'
    Devs = 35
}

$true, $false

#types
$null = [datetime], [string]

[pscustomobject] @{
    Language = 'PowerShell'
    Version = [Version] '5.1.0'
    When = [datetime] '2017-12-17 11:30'
}

# scriptblock - lambda function evaluated by '&' operator
{ 1 + 1 }

# invoke operator
& { 1 + 1 } # = 2

& 'cmd.exe' /c dir # runs cmd.exe instead of sending the string 'cmd.exe' down the pipeline

@"
This is a here string
With mor than one line
and some `t`t tabs and`n`nnewlines
"@

1 + 1

1..10

$a = 1,2,3,4
$a[-2,-1]

$a[0..2]

$('SubExpression')

$var = 'Nice'
"$var $(1,2,3 -join ';')"