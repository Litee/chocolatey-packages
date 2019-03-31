$checksum = '08988bdeadef801491d145780fe182f14e67e3a667cfb5f83145be40be0a2b43'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.1.11-windows.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
