# Nginx should be installed
if (which nginx)
then
  echo "nginx is already installed"
else
  echo "installing nginx"
  sudo apt install -y nginx
fi
