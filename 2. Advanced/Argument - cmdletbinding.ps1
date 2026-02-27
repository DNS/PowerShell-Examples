# SCRIPT ARGUMENT

[CmdletBinding( DefaultParametersetName='None' )]
Param(
	[Parameter(Mandatory=$true)] [String] $Argument1 = 'default value',
	[Parameter(Mandatory=$false)] [ValidateSet("Install", "Delete", "Check")] $Argument2,
	[Int] $Argument3
)

'arg1: ' + $Argument1
'arg2: ' + $Argument2
'arg3: ' + $Argument3



<#
run:

.\test.ps1 -Argument1 'test 123' -Argument2 Install,Delete,Check -Argument3 888

String
Int Int64 Int128
UInt UInt64 UInt128
BigInt
Float Double

[Int128]::MaxValue
[UInt128]::MaxValue
[Float]::MaxValue
[Double]::MaxValue

#>




---------------------------------

# Adding a parameter to a script with no value

function Do-Magic {
	[CmdletBinding(SupportsShouldProcess=$true)]
	[Alias('magic')]
	
	Param(
		[Switch] $SkipRabbitTrick
	)
	
	Begin {}
	
	Process {
		if($SkipRabbitTrick){
			"Performance without Rabbit"
		} else {
			"Taking Rabbit out of Hat"
		}
	}
	
	End{}
}

Do-Magic
Do-Magic -SkipRabbitTrick




---------------------------------

# FUNCTION ARGUMENT

Function DoStuff(){
	param(
		[Parameter(Mandatory=$true)][string]$computername,
		[Parameter(Mandatory=$false)][string]$arg2,
		[Parameter(Mandatory=$false)][string]$domain
	)
	if(!($domain)){
		$domain = 'domain1'
	}
	write-host $domain
	if($arg2){
		write-host "arg2 present... executing script block"
	}
	else{
		write-host "arg2 missing... exiting or whatever"
	}
}










