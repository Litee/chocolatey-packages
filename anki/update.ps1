import-module au

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*.url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*.checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri 'https://apps.ankiweb.net/'

    $url = $download_page.links | Where-Object href -match '.exe$' | Select-Object -First 1 -expand href
    $version = ([regex]::Match($url, '(\d+\.\d+\.\d+)\.exe$')).Groups[1].Value

    @{
        URL32   = 'https://apps.ankiweb.net' + $url
        Version = $version
        # ChecksumType = 'sha256'
    }
}

update