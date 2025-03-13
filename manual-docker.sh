# ssh into your vm (using create-vm.sh and the ssh command in the README.md)

# docker should be installed on the vm

curl -fsSL https://get.docker.com -o get-docker.sh

$SHELL get-docker.sh

sudo docker --version


# A Dockerfile should exist in this working directory that installs nginx on an ubuntu:latest base image
cat <<EOF > Dockerfile
FROM ubuntu:latest

RUN apt update

RUN apt install -y nginx

CMD ["nginx", "-g", "daemon off;"]
EOF

cat Dockerfile

# An image should be built from the Dockerfile
sudo docker build -t rpngnix .

docker image ls

# A container should be running, based off the image, and listening on port 80, and should run in the background

sudo docker run -d -p 80:80 rpngnix

sudo docker ps

# The container should be accessible on the host machine (the vm) at http://localhost:80 and you should get an http response of 200
curl localhost:80

# the container should be deleted when finished
docker ps # copy container id from here

docker stop <id from previous docker ps>
