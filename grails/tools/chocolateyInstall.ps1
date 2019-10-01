$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '5D17F4EBE6460186A6DDAF9327705E55930CB319F065A8C68ADCDDC6DEC0C08F'
$url = 'https://github.com/grails/grails-core/releases/download/v4.0.0/grails-4.0.0.zip'
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
