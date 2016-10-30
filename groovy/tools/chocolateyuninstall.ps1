$packageName = 'groovy'
$version = $env:chocolateyPackageVersion

$installDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$groovy_home = Join-Path $installDir "$packageName-$version"
$groovy_bat = Join-Path $groovy_home 'bin/groovy.bat'

Install-ChocolateyEnvironmentVariable "GROOVY_HOME" $null 'Machine'
Uninstall-BinFile -Name 'groovy' -Path $groovy_bat
