$checksum = '4e11850c3208e4a0d71d71ad5381d74ca87233ca5f69b9e09f8763af9228b660'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.1.20-windows.exe?u=1'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
