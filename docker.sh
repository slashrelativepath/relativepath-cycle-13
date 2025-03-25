# docker-ce should be installed
if (dpkg -s docker-ce)
then
  echo "docker-ce is already installed."
else
  echo "Installing docker-ce..."
  sudo apt install -y docker-ce
fi

# docker cli should be installed
if (docker --version)
then
  echo "docker-ce-cli is already installed."
else
  echo "Installing docker-ce-cli..."
  sudo apt install -y docker-ce-cli
fi

# containerd.io should be installed
if (dpkg -s containerd.io)
then
  echo "containerd.io is already installed."
else
  echo "Installing containerd.io..."
  sudo apt install -y containerd.io
fi

# docker-buildx-plugin should be installed
if (dpkg -s docker-buildx-plugin)
then
  echo "docker-buildx-plugin is already installed."
else
  echo "Installing docker-buildx-plugin..."
  sudo apt install -y docker-buildx-plugin
fi

# docker-compose-plugin should be in the apt cache
if (apt cache show docker-compose-plugin)
then
  echo "Apt cache has docker-compose-plugin."
else
  echo "Updating apt cache..."
  sudo apt update
fi

# docker-compose-plugin should be installed
if (dpkg -s docker-compose-plugin)
then
  echo "docker-compose-plugin is already installed."
else
  echo "Installing docker-compose-plugin..."
  sudo apt install -y docker-compose-plugin
fi
