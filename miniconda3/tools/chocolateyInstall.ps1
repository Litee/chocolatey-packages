$packageVersion = $env:chocolateyPackageVersion
$packageParameters = Get-PackageParameters

if ($packageParameters['D']) {
  if (Test-Path -IsValid $packageParameters['D']) {
    Write-Information "Using overriden installation path: ($($packageParameters['D']))"
    $D = "/D=$($packageParameters['D'])"
  } else {
    Write-Error "Value for D ($($packageParameters['D'])) is not a valid directory path"
  }
} else {
  Write-Information "Using standard installation path: ($($packageParameters['D']))"
  $D = ''
}

Install-ChocolateyPackage `
  -PackageName 'miniconda3' `
  -InstallerType 'EXE'  `
  -Url "https://repo.continuum.io/miniconda/Miniconda3-$packageVersion-Windows-x86.exe" `
  -Checksum 'BEF086271D3DC9907CDC413249EAC02F19C3FBAE73B09701FCFB012747205DC5' `
  -ChecksumType 'sha256' `
  -Url64 "https://repo.continuum.io/miniconda/Miniconda3-$packageVersion-Windows-x86_64.exe" `
  -Checksum64 'BEBFEB141D8F4A426019D878D526249CFF6F6E93BBB1B64B522D3AAD4FD2BB30' `
  -ChecksumType64 'sha256' `
  -SilentArgs "/S $D" `
  -ValidExitCodes @(0)
