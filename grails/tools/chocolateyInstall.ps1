$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '2B1BBE93F931BF6EAB468575C40E6582881E6C3A3B6B2FB4AEE6AD685FA2DCB6'
$url = 'https://github.com/grails/grails-core/releases/download/v4.0.4/grails-4.0.4.zip'
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
