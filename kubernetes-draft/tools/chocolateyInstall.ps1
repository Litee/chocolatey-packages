$packageName = 'kubernetes-draft'
$packageVersion = $env:chocolateyPackageVersion
$url = "https://azuredraft.blob.core.windows.net/draft/draft-v$packageVersion-windows-amd64.zip"
$checksum = '973BAAF6BA62DB9F6014FA728721554057531E5A4B447165D15AFBA17F24FA61'

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage `
    -PackageName $packageName `
    -UnzipLocation $toolsDir `
    -Url $url `
    -Checksum $checksum `
    -ChecksumType 'sha256'
