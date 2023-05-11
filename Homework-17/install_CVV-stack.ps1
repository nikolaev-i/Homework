# The following script will install chocolatey, virtualbox and vagrant
# Start Powershell as administrator

# Install chocolatey if it isn't installed yet
Set-ExecutionPolicy Bypass -Scope Process -Force -Confirm; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install Git VirtualBox and Vagrant
choco install git virtualbox vagrant

# Refresh environment variables
refreshenv

# Install Vagrant Plugins
vagrant plugin install vagrant-winnfsd
vagrant plugin install vagrant-vbguest

# Reboot Windows
shutdown /r -t 60