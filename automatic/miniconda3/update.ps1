import-module au

$releases = 'https://docs.conda.io/en/latest/miniconda.html'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*.url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*.checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*.url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*.checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    # https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Windows-x86_64.exe
    $url32 = $download_page.links | Where-Object href -match 'Miniconda3-py39_\d+\.\d+\.\d+-Windows-x86\.exe$' | ForEach-Object href | Select-Object -First 1
    $url64 = $download_page.links | Where-Object href -match 'Miniconda3-py39_\d+\.\d+\.\d+-Windows-x86_64\.exe$' | ForEach-Object href | Select-Object -First 1
    $version = ([regex]::Match($url64, '(\d+\.\d+\.\d+)-Windows-x86_64\.exe$')).Groups[1].Value

    @{
        URL32   = $url32
        URL64   = $url64
        Version = $version
        # ChecksumType = 'sha256'
    }
}

update