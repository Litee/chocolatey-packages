$checksum = 'f03ec672079c1a27a308519bb42d7439f4c3401dbb83947c5f15defbf3d6a19e'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.1.13-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
