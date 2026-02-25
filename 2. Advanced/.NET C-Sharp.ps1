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


######################################3

<#
Not working!

Add-Type -TypeDefinition @"
using System;
Console.WriteLine("hello world");
"@ -Language CSharp
#>




