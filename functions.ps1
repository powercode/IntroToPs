

function Get-Stuff {
	"I write my $($args.count) args to the pipeline:"
	$args
}


function Get-NameAge($name, $age) {
	[pscustomobject] @{
		Name = $name
		Age = $age
	}
	"I write my $($args.count) args to the pipeline:"
	$args
}

function Get-NameAge1($name, $age) {
	[pscustomobject] @{
		Name = $name
		Age = $age
	}
	"I write my $($args.count) args to the pipeline:"
	return $args
}