# nano should be installed
if (which nano)
then
  echo 'nano is already installed'
else
  echo 'installing nano'
  sudo apt install -y nano
fi
