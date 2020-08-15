$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$checksum = 'eba1dc30ed0ceeefe56eba6e79cf43c2ae164eea6e407fd7a79f6c434a667146'
$url = 'https://dl.bintray.com/groovy/maven/apache-groovy-binary-3.0.4.zip'
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

