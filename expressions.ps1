
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

# Hashtable
@{
    Product = "Walrus"
    TD = 'Jonas'
    Devs = 35
}

#types
$null = [datetime], [string]

[pscustomobject] @{
    Language = 'PowerShell'
    Version = [Version] '5.1.0'
    When = [datetime] '2017-12-17 11:30'
}