$checksum = '0c26fc190e6da9c41fbafb095c8ed00593346da818459b725346dffca21a97e7'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.1.3-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
