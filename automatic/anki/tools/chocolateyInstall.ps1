$checksum = '6ee8222f6a383e52bb45c8583c6e61288824cdc811ed54e7ebb6b2ce687c28a9'
$url = 'https://github.com/ankitects/anki/releases/download/2.1.48/anki-2.1.48-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
