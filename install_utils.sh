# Here the list of the PPA


# Don't forget to update the apt-get list to get latest version
sudo apt-get update

# Then remove unused package
sudo apt-get autoremove && sudo apt-get autoclean

# The common utils
#------------------

# Xclip helpful to pipe from command output to clipboard
sudo apt-get install -y xclip

# The build tools
sudo apt-get install -y gradle maven ant
