if (get-command choco) {
    echo "chocolatey already installed"
} else {
    echo "installing chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1; refreshenv
}