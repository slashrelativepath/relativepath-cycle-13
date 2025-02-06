# brew should be installed
if (brew --version)
then
  echo "brew already installed"
else
  echo "installing brew"
  sudo true
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if (which nano)
then
  echo "nano already installed" 
else
  echo "installing nano"
  brew install nano
fi

if (git --version)
then 
  echo "git already installed"
else
  echo "installing git"
  brew install git
fi


