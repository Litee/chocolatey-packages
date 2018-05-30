import-module au

$releases = 'http://www.groovy-lang.org/download.html'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*.url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*.checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $url = $download_page.links | Where-Object href -match 'apache-groovy-binary-(\d+\.\d+\.\d+)\.zip$' | ForEach-Object href | Select-Object -First 1
    $version = ([regex]::Match($url, '(\d+\.\d+\.\d+)\.zip$')).Groups[1].Value

    @{
        URL32   = $url
        Version = $version
        # ChecksumType = 'sha256'
    }
}

update