$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$checksum = 'b64d0807d85857cb9d7a2137c6d5d828890598597ad0fd149faac20198ed8e92'
$url = 'https://dl.bintray.com/groovy/maven/apache-groovy-binary-2.5.6.zip'
$toolsDir = Get-ToolsLocation
$groovy_home = Join-Path $toolsDir "$packageName-$packageVersion"
$groovy_bat = Join-Path $groovy_home 'bin/groovy.bat'

Install-ChocolateyZipPackage `
	-PackageName $packageName `
	-Url $url `
	-UnzipLocation $toolsDir `
	-Checksum $checksum `
	-ChecksumType 'sha256'

Install-ChocolateyEnvironmentVariable -VariableName "GROOVY_HOME" -VariableValue $groovy_home -VariableType 'Machine'
Install-ChocolateyPath -PathToInstall "%GROOVY_HOME%\bin" -PathType 'Machine'

# Removing shim from previous version
Uninstall-BinFile -Name 'groovy' -Path $groovy_bat

