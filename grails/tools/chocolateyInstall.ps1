$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '77A3D01CE99D07717C799449C73275C4C93C39393E0EB05D33BD3FE36A408346'
$url = 'https://github.com/grails/grails-core/releases/download/v4.0.6/grails-4.0.6.zip'
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
