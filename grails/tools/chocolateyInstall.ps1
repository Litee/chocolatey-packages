[string]$chocoVersion = $(choco --version)
[string]$majorRelease = $chocoVersion.Split('.')[1]
[string]$minorRelease = $chocoVersion.Split('.')[2]
if (-not $majorRelease.Equals("10") -or -not $minorRelease.Equals("3"))
{
    write-host "WARNING: This package has only been tested with Chocolatey 0.10.3" -f "Yellow"
}

$packageName = 'grails'
$packageVersion = $env:chocolateyPackageVersion
$checksum = '1770D6E16CBB9F8F4F41B00EBEAF0BB837343B99BAB100FC2FC136E6C46E471B'
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
