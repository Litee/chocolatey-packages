$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '3F8FC6855B85B3575583744C7113CE182B133F5D84972515317A0625C35799FE'
$url = "https://dl.bintray.com/groovy/maven/apache-groovy-binary-$packageVersion.zip"
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

