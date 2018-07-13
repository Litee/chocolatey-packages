$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = 'C7C7835495B15DF7E3C299323D5E3B8745BB0B72CC2B928E805F5C7AC85F7960'
$url = 'https://github.com/grails/grails-core/releases/download/v3.3.6/grails-3.3.6.zip'
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
