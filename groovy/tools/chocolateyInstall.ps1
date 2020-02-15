$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$checksum = 'f4b2211e7651ed4ec7728c96c1e1961795c4a9de7b0cad6d399df8e92001d682'
$url = 'https://dl.bintray.com/groovy/maven/apache-groovy-binary-3.0.0.zip'
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

