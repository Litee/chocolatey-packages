$packageVersion = $env:chocolateyPackageVersion
$ToolsDir = Get-ToolsLocation
$pp = Get-PackageParameters

if (!$pp['InstallationType']) {
    $InstallationType = 'AllUsers'
}
else {
    if ($pp['InstallationType'] -notin 'AllUsers', 'JustMe') {
        Write-Error "Value for InstallationType not recognised: only `'AllUsers`' or `'JustMe`' are valid"
    }
    else {
        $InstallationType = $pp['InstallationType']
    }
}

if (!$pp['RegisterPython']) {
    $RegisterPython = '1'
}
else {
    if ($pp['RegisterPython'] -notin '0', '1') {
        Write-Error "Value for RegisterPython not recognised: only `'0`' or `'1`' are valid"
    }
    else {
        $RegisterPython = $pp['RegisterPython']
    }
}

if (!$pp['AddToPath']) {
    $AddToPath = '0'
}
else {
    if ($pp['AddToPath'] -notin '0', '1') {
        Write-Error "Value for AddToPath not recognised: only `'0`' or `'1`' are valid"
    }
    else {
        $AddToPath = $pp['AddToPath']
    }
}

if (!$pp['D']) {
    $D = Join-Path $ToolsDir 'miniconda3'
}
else {
    if (!(Test-Path -IsValid $pp['D'])) {
        Write-Error "Value for D ($($pp['D'])) is not a valid directory path"
    }
    else {
        $D = $pp['D']
    }
}

Install-ChocolateyPackage `
    -PackageName 'miniconda3' `
    -InstallerType 'EXE'  `
    -Url "https://repo.continuum.io/miniconda/Miniconda3-py38_$packageVersion-Windows-x86.exe" `
    -Checksum '9C2EF76BAE97246C85C206733CA30FD1FEB8A4B3F90A2A511FEA681CE7EBC661' `
    -ChecksumType 'sha256' `
    -Url64 "https://repo.continuum.io/miniconda/Miniconda3-py38_$packageVersion-Windows-x86_64.exe" `
    -Checksum64 '4FA22BBA0497BABB5B6608CB8843545372A99F5331C8120099AE1D803F627C61' `
    -ChecksumType64 'sha256' `
    -SilentArgs "/S /InstallationType=$InstallationType /RegisterPython=$RegisterPython /AddToPath=$AddToPath /D=$D" `
    -ValidExitCodes @(0)
