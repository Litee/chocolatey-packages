$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '0568ca2c2adfed3f82a7d60c7d0cb512666c06326a7207fad0802e0e0b2f4d04'
$url = 'https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-3.0.14.zip'
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

