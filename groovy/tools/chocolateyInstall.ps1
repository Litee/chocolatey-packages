[string]$chocoVersion = $(choco --version)
[string]$majorRelease = $chocoVersion.Split('.')[1]
[string]$minorRelease = $chocoVersion.Split('.')[2]
if (-not $majorRelease.Equals("10") -or -not $minorRelease.Equals("3"))
{
    write-host "WARNING: This package has only been tested with Chocolatey 0.10.3" -f "Yellow"
}

$packageName = 'groovy'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '438DD6098252647E88FF12AC5737D0D0F7E16A8E4E42E8BE3E05A4C43ABEFBD5'
$url = "https://dl.bintray.com/groovy/maven/apache-groovy-binary-$packageVersion.zip"
$toolsDir = Get-ToolsLocation
$groovy_home = Join-Path $toolsDir "$packageName-$packageVersion"
$groovy_bat = Join-Path $groovy_home 'bin/groovy.bat'

# Creating bin folder if it is not there yet
New-Item -Path $toolsDir -type directory -Force

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

