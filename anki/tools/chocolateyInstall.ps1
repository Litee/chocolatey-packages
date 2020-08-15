$checksum = '184467a2124e8309daef939d2612433390818f931f1d5761897bffebc00f0e46'
$url = 'https://github.com/ankitects/anki/releases/download/2.1.28/anki-2.1.28-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
