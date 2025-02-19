# Chocolately should be installed
if (get-command choco) {
  echo "chocolatey already installed"
} else {
  echo "installing chocolatey"
  Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1; refreshenv
}

# Nano should be installed
if (get-command nano) {
  echo "nano already installed"
} else {
  echo "installing nano"
  choco install nano
}

# Git should be installed
if (get-command git) {
  echo "git is already installed"
} else {
  echo "installing git"
  choco install git
}

# Virtualbox should be installed
if (get-command virtualbox) {
  echo "virtualbox is already installed"
} else {
  echo "installing virtualbox"
  choco install virtualbox
}

# Multipass should be installed
if (get-command multipass) {
  echo "multipass is already installed"
} else {
  echo "installing multipass"
  choco install multipass --params="'/HyperVisor:VirtualBox'"
}
