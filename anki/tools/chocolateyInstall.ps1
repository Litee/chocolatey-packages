$checksum = 'cca3236075acaa2e972a108d8d6d6437a375936b1e958da68891eff47ade433e'
$url = 'https://apps.ankiweb.net/downloads/current/anki-2.0.51.exe'

Install-ChocolateyPackage `
	-PackageName 'anki' `
	-FileType 'exe' `
	-SilentArgs '/S'  `
	-Url $url `
	-Checksum $checksum `
	-ChecksumType 'sha256'
