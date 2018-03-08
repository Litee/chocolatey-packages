$packageVersion = $env:chocolateyPackageVersion
# $packageVersion = '4.3.31'
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
    -Checksum 'D2FF1B784A649B545C67846FD713707F0B9EAF45DDE7AED09002989673F1D651' `
    -ChecksumType 'sha256' `
    -Url64 "https://repo.continuum.io/miniconda/Miniconda3-$packageVersion-Windows-x86_64.exe" `
    -Checksum64 '39FC8CE44979F79C4A1D1D55EFEEA495E493928968BF1613D27C95B1D02A0385' `
    -ChecksumType64 'sha256' `
    -SilentArgs "/S /InstallationType=$InstallationType /RegisterPython=$RegisterPython /AddToPath=$AddToPath /D=$D" `
    -ValidExitCodes @(0)
