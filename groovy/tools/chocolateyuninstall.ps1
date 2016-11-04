$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$toolsDir = Get-ToolsLocation
$groovy_home = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyEnvironmentVariable "GROOVY_HOME" $null 'Machine'

Remove-Item $groovy_home -Recurse -Force

"Please manually remove Grails (%GROOVY_HOME%\bin) from the PATH environment variable."
