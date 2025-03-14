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

to build the local environment  
`$SHELL create-vm.sh`

to copy webserver.sh to the vm:
`scp -i id_ed25519 -o StrictHostKeyChecking=no webserver.sh relativepath@$(multipass info relativepath | grep IPv4 | awk '{print $2}'):`

to ssh to the local vm
`ssh -i id_ed25519 -o StrictHostKeyChecking=no relativepath@$(multipass info relativepath | grep IPv4 | awk '{print $2}')`

to execute the webserver.sh on the vm:
`$SHELL webserver.sh`

to validate the webserver is working, exit the vm and type this from your local:
`curl -w "%{http_code}" http://$(multipass info relativepath | grep IPv4 | awk '{print $2}')`

to delete the local environment 
`$SHELL delete-vm.sh`

to do the whole thing all at once:
`$SHELL create-vm.sh && scp -i id_ed25519 -o StrictHostKeyChecking=no webserver.sh relativepath@$(multipass info relativepath | grep IPv4 | awk '{print $2}'): && ssh -i id_ed25519 -o StrictHostKeyChecking=no relativepath@$(multipass info relativepath | grep IPv4 | awk '{print $2}') '$SHELL webserver.sh' && curl -w "%{http_code}" http://$(multipass info relativepath | grep IPv4 | awk '{print $2}') && $SHELL delete-vm.sh`

## HOW TO SET UP AND RUN DOCKER WITH A NGINX IMAGE

Git Setup:
Look at your working directory
```shell
git status
```
Switch to the main branch
```shell
git checkout main
```
Get the latest changes from main onto your local
```shell
git pull origin main
```
Create your own branch to work on
```shell
git checkout -b (name of branch)
```



1. Create the VM
```shell
$SHELL create-vm.sh
```

2. cat the README, copy the ssh to local vm command, paste it in your terminal and 
run it.

3. Download the file that downloads docker
```shell
curl -fsSL https://get.docker.com -o get-docker.sh
```

This script can be found on a website called get.docker.com. It's a script-hosting 
URL. Running this will grab a file called get-docker.sh and download it on your local 
machine. This file contains a script that when ran will download docker on your local 
machine.

 4. Run the script to download Docker ```shell
$SHELL get-docker.sh
```

5. Verify you have Docker
```shell
docker --version
```

6. Test Docker and make sure it’s working (this will run an image)
```shell
sudo docker run -it hello-world
```

7. Run the command:
```shell
systemctl status docker.service 
```

This is the main service responsible for managing Docker. It starts and stops the 
Docker daemon, which handles container creation and management.

You want it to say: active (running)

8. Create and configure a Dockerfile
```shell
nano Dockerfile
```

The file should have the following:

FROM ubuntu
RUN apt update
RUN apt install -y nginx
EXPOSE 80
CMD [“nginx”, “-g”, “daemon off;”]

Save it and exit nano.

9. Run the command:
```shell
docker build -t rpnginx .
```

This command builds a Docker image from the Dockerfile in the current directory and 
tags the image with the name rpnginx.

10. Display the full list of all of the images that were created
```shell
sudo docker image ls
```

11. Run the Docker image.

You can do this two ways...

Run the command:
```shell
sudo docker run -it rpnginx 
```

OR

Run the command:
```shell
sudo docker run -d rpnginx
```

Here’s the difference between the two:
-it keeps the container running in an interactive terminal. But when you exit the 
session, the container stops.
-d runs it in the background (daemon mode), so it continues running even after you 
close the terminal.

12. To show all running containers (processes) run the command:
```shell
sudo docker ps
```

13. To stop a running container, run the command:
```shell
sudo docker stop <container_id or container_name>
```

14. Run the  Nginx Container in Detached Mode with the port mapped
```shell
sudo docker run -d -p 80:80 rpnginx
```

15. Display the running container
```shell
sudo docker ps
```

16. Run Nginx
```shell
curl localhost:80
```

You should see a "Welcome To Nginx!" html page.

That indicates that you were successful.

🐳 ✨ ✨ ✨ ✨ ✨ ✨ ✨ ✨ ✨ ✨ ✨ ✨ ✨ ✨

When you're done...

Exit the VM and type:
```shell
$SHELL delete-vm.sh
```
