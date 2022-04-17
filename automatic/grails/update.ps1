import-module au

$releases = 'https://github.com/grails/grails-core/releases'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*.url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*.checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $url   = $download_page.links | Where-Object href -match '5\.\d+\.\d+\.zip$' | ForEach-Object href | Select-Object -First 1
    $version = (Split-Path ( Split-Path $url ) -Leaf).Substring(1)

    @{
        URL32   = 'https://github.com' + $url
        Version = $version
        # ChecksumType = 'sha256'
    }
}

update