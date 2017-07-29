﻿$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '4F773C4CE9D6841CFA2B44B9917595AF3AE5FB4DBAAAC9699D4AF0D401A56952'
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
