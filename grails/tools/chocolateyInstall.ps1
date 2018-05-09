$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = 'b5840f3272b7bbec2c3b4c221b540e8d881ab463ff596d5ceb7b64bad892261d'
$url = 'https://github.com/grails/grails-core/releases/download/v3.3.5/grails-3.3.5.zip'
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
