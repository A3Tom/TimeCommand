param([String]$Target)


$timer = [diagnostics.stopwatch]::StartNew()

$timer.Start()

$proc = Invoke-WmiMethod -Class win32_process -Name create -ArgumentList "$Target"
Wait-Process -Id $proc.ProcessId -Timeout 120

$timer.Stop()

$msTaken = $timer.Elapsed.Milliseconds

"This quick wee fuck only took $msTaken ms to run"