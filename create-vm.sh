# The vm relativepath should exist
if (multipass info relativepath)
then
  echo "relativepath vm already exists" 
else
  echo "creating vm relativepath"
  multipass launch --name relativepath
fi
