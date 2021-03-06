function show-result($sb){"$sb = $(&$sb)"}
function show-intresult([scriptblock[]]$sb) {
    foreach($s in $sb){
        $result = & $s
        [pscustomobject] @{
            Expression = [string] $s
            Binary = [Convert]::ToString($result,2)
            Decimal = [Convert]::ToString($result,10)
            Hex = '0x' + [Convert]::ToString($result,16)
        }
    }
}

show-result { 10 -eq 10 }

show-result { 10 -ne 10 }

show-result { 5 -gt 10 }

show-result { 7 -gt "6" }

show-result { "abc" -gt "bcd" }

show-result { 11 -ge 10 }


#logical
show-result { $true -and $false  }
show-result { $true -or $false   }
show-result { -not $true         }
show-result { ! $false           }


#bitwize
show-intresult { 0x10 -bAND 0x110 }, { 0xf -bOR 0x8 }, { 0xF -bXOR 0xc },{ -bNOT 0x0 }


# -match, -notmatch, -like, -notlike
'aaabbbccc' -match '(?<B>b+)(?<someCs>\w+)'
$matches
$matches.someCs

'aaabc' -like '*bc'

# contains
1,2,3,4 -contains 3

# in
4 -in 2..8

$i = 1
$i += 2
$i % 2
$i / 3

# join

(Get-ChildItem).Name  -join ', '

#replace
(Get-ChildItem).Name  -creplace 'function', 'Functi0n'



