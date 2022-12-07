# Install Rosetta 2
softwareupdate --install-rosetta

# Install Xcode Developer Tools
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Grab Brewfile
curl 