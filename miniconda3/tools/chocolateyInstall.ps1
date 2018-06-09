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
    -Url "https://repo.continuum.io/miniconda/Miniconda3-$packageVersion-Windows-x86.exe" `
    -Checksum '76F8A89B8A8E3D0A3E153F440DDC6FB558D8745C99B25DEB678DA787172C5E0E' `
    -ChecksumType 'sha256' `
    -Url64 "https://repo.continuum.io/miniconda/Miniconda3-$packageVersion-Windows-x86_64.exe" `
    -Checksum64 'E347AFE9C9A1BF4CF12DD2090E91030796F89E2C75EBA04CF396B23B22201683' `
    -ChecksumType64 'sha256' `
    -SilentArgs "/S /InstallationType=$InstallationType /RegisterPython=$RegisterPython /AddToPath=$AddToPath /D=$D" `
    -ValidExitCodes @(0)
