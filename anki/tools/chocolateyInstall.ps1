$checksum = '5672638094c9b40ef6fa50236b4c4dcf938e028aeee79209dc0cda6ac4983b99'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.1.15-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
