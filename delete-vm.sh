multipass delete relativepath --purge
rm ./id_ed25519*
rm ./user-data
multipass list
echo "Cleanup complete."
