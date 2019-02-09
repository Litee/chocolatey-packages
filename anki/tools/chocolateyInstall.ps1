$checksum = 'e7fa6e306644873ee3e8b826ebb5373f9bd879d6059fb7218446be243580dbc9'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.1.8-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
