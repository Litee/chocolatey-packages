$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '4a4f95bee132cd9f6c49e23d7ceb87826812bbcf568eb8a22bfe9453f796a9a8'
$url = 'https://github.com/grails/grails-core/releases/download/v5.1.7/grails-5.1.7.zip'
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
