$checksum = '94e3b9840382d8a66ef1153c4b1435e83bdda2a22d7044b0f5b9131deb9ace4b'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.0.52.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
