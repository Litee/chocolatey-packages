$packageVersion = $env:chocolateyPackageVersion
$url32 = 'https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Windows-x86.exe'
$checksum32 = '24f438e57ff2ef1ce1e93050d4e9d13f5050955f759f448d84a4018d3cd12d6b'
$url64 = 'https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Windows-x86_64.exe'
$checksum64 = 'b33797064593ab2229a0135dc69001bea05cb56a20c2f243b1231213642e260a'
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
    -Url $url32 `
    -Checksum $checksum32 `
    -ChecksumType 'sha256' `
    -Url64 $url64 `
    -Checksum64 $checksum64 `
    -ChecksumType64 'sha256' `
    -SilentArgs "/S /InstallationType=$InstallationType /RegisterPython=$RegisterPython /AddToPath=$AddToPath /D=$D" `
    -ValidExitCodes @(0)
