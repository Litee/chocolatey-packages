$packageName = 'kubernetes-draft'
$packageVersion = $env:chocolateyPackageVersion
$url = "https://azuredraft.blob.core.windows.net/draft/draft-v$packageVersion-windows-amd64.zip"
$checksum = '973BAAF6BA62DB9F6014FA728721554057531E5A4B447165D15AFBA17F24FA61'

$toolsDir   = Get-ToolsLocation
$draft_home = Join-Path $toolsDir "$packageName-$packageVersion"

Install-ChocolateyZipPackage `
    -PackageName $packageName `
    -UnzipLocation $draft_home `
    -Url $url `
    -Checksum $checksum `
    -ChecksumType 'sha256'

Install-ChocolateyPath `
    -PathToInstall "$draft_home\windows-amd64" `
    -PathType 'Machine'