$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$checksum = 'B9E4AD752AFFE37867A28E186DCCDDC8B541EA82AD3D86E4172A0FD9084C146F'
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

