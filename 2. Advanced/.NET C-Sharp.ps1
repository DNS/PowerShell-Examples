<#
    embed C# to PowerShell script
    C# code will be faster than PowerShell code
#>

Add-Type @"
using System;
namespace MyNamespace
{
    public class MyProgram
    {
        
        public static void MyMethod1 (string arg1)
        {
            Console.WriteLine("Received msg: " + arg1);
        }
        
        public static string MyMethod2 (string arg1)
        {
            return arg1;
        }
        
    }
}
"@

[MyNamespace.MyProgram]::MyMethod1('Hello World 1')
[MyNamespace.MyProgram]::MyMethod2('Hello World 2')


######################################3

<#
Not working!

Add-Type -TypeDefinition @"
using System;
Console.WriteLine("hello world");
"@ -Language CSharp
#>





