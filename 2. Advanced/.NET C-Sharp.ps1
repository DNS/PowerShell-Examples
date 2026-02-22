<#
    embed C# to PowerShell script
    C# code will be faster than PowerShell code
#>

Add-Type @"
namespace MyNamespace
{
    public class MyProgram
    {
        public static string MyMethod (string args)
        {
            return args;
        }
    }
}
"@

[MyNamespace.MyProgram]::MyMethod('Hello World!')



