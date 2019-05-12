$checksum = '91383b6b24aee83ee86d721ec246a3763d5678c4a5daabcb1f7e1bdcde58b9a5'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.1.12-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
