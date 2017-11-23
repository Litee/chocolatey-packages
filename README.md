How to package:

1. Download a binary - e.g. `apache-groovy-binary-2.4.13.zip`
1. Run `checksum -t=sha256 apache-groovy-binary-2.4.13.zip`, copy the resulting hash
1. Edit to `install.ps1` file - update the hash
1. Edit to `.nuspec` file - update version
1. Run `cpack` command in folder with `.nuspec` file
1. Upload the resulting `.nupkg` file to Chocolatey site. You will be recieving e-mail as package got uploaded, passes tests and finally got approved
1. Commit changes into GitHub. Do not forget to tag the version.