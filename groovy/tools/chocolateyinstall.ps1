
[string]$chocoVersion = $(choco --version)
[string]$majorRelease = $chocoVersion.Split('.')[1]
[string]$minorRelease = $chocoVersion.Split('.')[2]
if (-not $majorRelease.Equals("10") -or -not $minorRelease.Equals("3"))
{
    write-host "WARNING: This package has only been tested with Chocolatey 0.10.3" -f "Yellow"
}

$packageName = 'groovy'
$version = $env:chocolateyPackageVersion
$checksum = '438DD6098252647E88FF12AC5737D0D0F7E16A8E4E42E8BE3E05A4C43ABEFBD5'
$url = "https://dl.bintray.com/groovy/maven/apache-groovy-binary-$version.zip"
$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage $packageName $url $installDir -Checksum $checksum -ChecksumType 'sha256'

$groovy_home = Join-Path $installDir "$packageName-$version"
$groovy_bat = Join-Path $groovy_home 'bin/groovy.bat'

Install-ChocolateyEnvironmentVariable "GROOVY_HOME" $groovy_home 'Machine'
Install-BinFile -Name 'groovy' -Path $groovy_bat
