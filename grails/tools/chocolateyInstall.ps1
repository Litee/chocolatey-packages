$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '227B3F3C78E858D108565677AA35AE963DF4297C366F82A999821D121D57D3D3'
$url = 'https://github.com/grails/grails-core/releases/download/v3.3.10/grails-3.3.10.zip'
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
