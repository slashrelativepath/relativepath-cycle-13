# nano should be installed
if (which nano)
then
  echo 'nano is already installed'
else
  echo 'installing nano'
  sudo apt install -y nano
fi

if (which git)
then
  echo 'git is already installed'
else
  echo 'installing git'
  sudo apt install -y git
fi
