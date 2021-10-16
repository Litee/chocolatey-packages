$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName= 'GitKraken' # arbitrary name for the package, used in messages
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://release.gitkraken.com/win32/GitKrakenSetup.exe' # download url
$url64      = 'https://release.gitkraken.com/win64/GitKrakenSetup.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url           = $url
  url64bit      = $url64

  silentArgs   = '-s'           # Squirrel
  validExitCodes= @(0) #please insert other valid exit codes here

  # optional, highly recommended
  softwareName  = 'GitKraken*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = ''
  checksumType  = 'sha256'
  checksum64    = ''
  checksumType64= 'sha256'
}

Install-ChocolateyPackage @packageArgs
