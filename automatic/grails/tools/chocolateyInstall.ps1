$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = ''
$url = 'https://github.com/grails/grails-core/releases/download/v4.0.12/grails-4.0.12.zip'
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
