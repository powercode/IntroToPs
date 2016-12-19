
# static property
[datetime]::Now

[string] $greeting = 'Hello, World!'

# method call on instance. Not that parameters are needed here
$greeting.IndexOf(' ')

[datetime]::new

$epochStart = [datetime]::new(1970,01,01,00,00,00,[DateTimeKind]::Utc)
$epochStart.AddSeconds(0x58592017)

# Note difference to function
# Get-Person('Staffan', 12)

# this calls Get-Person -Name ('Staffan', 12) -age ???