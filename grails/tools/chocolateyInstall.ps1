$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '58D587B81DCAFDEA8185426C2960FE8CA01156C8D3ABE775DA44710F7B478D05'
$url = "https://github.com/grails/grails-core/releases/download/v$packageVersion/grails-$packageVersion.zip"
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
