$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = 'C0DE7CE97EA156A7FD43E190479814D61ECD91A0399E88FD353526B1A3A2D8C1'
$url = 'https://github.com/grails/grails-core/releases/download/v3.3.8/grails-3.3.8.zip'
$toolsDir = Get-ToolsLocation
$grails_home = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyZipPackage `
	-PackageName $packageName `
	-Url $url `
	-UnzipLocation $toolsDir `
	-Checksum $checksum `
	-ChecksumType 'sha256'

Install-ChocolateyEnvironmentVariable -VariableName "GRAILS_HOME" -VariableValue $grails_home -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "$grails_home\bin" -PathType 'Machine'
