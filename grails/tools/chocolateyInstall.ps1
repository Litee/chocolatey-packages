$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '43DC220D566A6F24A2A6D36616E63FC496499A0C95F0732A651FA81734B66793'
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
