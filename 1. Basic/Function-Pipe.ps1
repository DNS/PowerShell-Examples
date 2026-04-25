<#

Example:
'John', 'Adam',  | Function-Pipe.ps1

#>

[CmdletBinding()]
Param(
  [Parameter(Mandatory=$false, ValueFromPipeline=$True)] $InputObject
)


Begin {}

Process {
	$InputObject | % { 'Hello: ' + $_ }
}

End {}

