<#

Script-Pipe.ps1 — Accept values passed from pipelines or arguments

Example:
'John', 'Adam' | Script-Pipe.ps1
Script-Pipe.ps1 'Obito', 'Madara'
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$false, ValueFromPipeline=$true, ValueFromRemainingArguments=$true)] $InputObject,
	[Parameter(Mandatory=$false)] [Switch] $Help
)


Begin {}

Process {
	$InputObject | % { 'Hello: ' + $_ }
}

End {}

