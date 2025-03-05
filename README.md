# Relative path cycle-13

Repository of work for relative path cycle 13

## Local developer onboarding

Run correct command depending on your platform. 
This installs everything the developer needs to do work so far.

On Darwin (mac) run: 
`$SHELL local-setup-darwin.sh`

On Linux (Debian based) run:
`$SHELL local-setup-linux.sh`

On powershell (windows) run:
`./local-setup-windows.ps1`

## Project 
Build a webserver in a virtual machine.

Requirements
  * ubuntu virtual machine
  * nginx webserver
  * automation script

acceptance test
`curl http://$(multipass info relativepath | grep IPv4 | awk '{print $2}')`
should have 200 HTTP status code

to build the local environment  
`$SHELL create-vm.sh`

to ssh to the local vm
`ssh -i id_ed25519 -o StrictHostKeyChecking=no relativepath@$(multipass info relativepath | grep IPv4 | awk '{print $2}')`


to delete the local environment 
`$SHELL delete-vm`
