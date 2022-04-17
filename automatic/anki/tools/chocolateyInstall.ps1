$ErrorActionPreference = 'Stop'
$installDir            = "$env:ProgramFiles\Anki"
$checksum              = '892c1297f23ca0bf69a1495b480afbb255c23adc03ba5a786b5c6b8f2024f07a'
$version               = '2.1.50'
$silentArgs            = '/S'

$additionalArgs = Get-PackageParameters
if($additionalArgs['InstallDir']) {
  $installDir = $additionalArgs['InstallDir']
  $silentArgs += " /D=$installDir"
}

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs $silentArgs  `
	-Url "https://github.com/ankitects/anki/releases/download/$version/anki-$version-windows-qt5.exe" `
	-Checksum $checksum `
	-ChecksumType 'sha256'

if(!$additionalArgs['CreateDesktopIcon']) {
	Remove-Item `
		-Path "$env:Public\Desktop\Anki.lnk" `
		-Force `
		-ErrorAction SilentlyContinue
}
	
# Fix bugged start menu icon
Remove-Item `
	-Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Anki.lnk" `
	-Force `
	-ErrorAction SilentlyContinue

Install-ChocolateyShortcut `
	-ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Anki.lnk" `
	-TargetPath "$installDir\anki.exe" `
	-WorkingDirectory $installDir
