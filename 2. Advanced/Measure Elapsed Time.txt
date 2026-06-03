# using Measure-Command
Measure-Command {
	Start-Sleep -Seconds 5
}



# using .NET class
$watch = [System.Diagnostics.Stopwatch]::StartNew()
Start-Sleep -Seconds 1
$watch.Stop()
"First measurement: {0:h\:mm\:ss\.fff}" -f $watch.Elapsed
$watch.Reset()
$watch.Start()
Start-Sleep -Seconds 2
"Second measurement: {0:h\:mm\:ss\.fff}" -f $watch.Elapsed
$watch.Stop()



