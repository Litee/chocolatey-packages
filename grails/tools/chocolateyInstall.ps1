[string]$chocoVersion = $(choco --version)
[string]$majorRelease = $chocoVersion.Split('.')[1]
[string]$minorRelease = $chocoVersion.Split('.')[2]
if (-not $majorRelease.Equals("10") -or -not $minorRelease.Equals("3"))
{
    write-host "WARNING: This package has only been tested with Chocolatey 0.10.3" -f "Yellow"
}

$packageName = 'grails'
$version = $env:chocolateyPackageVersion
$checksum = '62134E359D13D59401FE93F7A30C32D6A3A68943FD2CA8FC483F4A69CC0BB03F'
$url = "https://github.com/grails/grails-core/releases/download/v$version/grails-$version.zip"
$binRoot = Get-ToolsLocation
$grails_home = Join-Path $binRoot "$packageName-$version"
 
# Creating bin folder if it is not there yet
New-Item -Path $binRoot -type directory -Force

Install-ChocolateyZipPackage `
	-PackageName $packageName `
	-Url $url `
	-UnzipLocation $binRoot `
	-Checksum $checksum `
	-ChecksumType 'sha256'

Install-ChocolateyEnvironmentVariable "GRAILS_HOME" $grails_home 'Machine'
Install-ChocolateyPath "%GRAILS_HOME%\bin" Machine