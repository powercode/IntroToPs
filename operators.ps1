
10 -eq 10

10 -ne 10

5 -gt 10

5 -gt "6"

"abc" -gt "bcd"

11 -ge 10

#bitwize
$blocks = {0x10 -bAND 0x110}, {0xf -bOR 0x8}, {0xF -bXOR 0xc},{-bNOT 0x0}
foreach($sb in $blocks) {
    $result = & $sb
    [pscustomobject] @{
        Expression = [string] $sb
        Binary = [Convert]::ToString($result,2)
        Decimal = [Convert]::ToString($result,10)
        Hex = '0x' + [Convert]::ToString($result,16)
    }
}