# embed C# to PowerShell script

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


