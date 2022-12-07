# Install Rosetta 2
softwareupdate --install-rosetta

# Install Xcode Developer Tools
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Grab Brewfile
curl -fsSL https://raw.githubusercontent.com/LiFEDEVELOPMENT/MacOS-Installscript/main/Brewfile > ~/Brewfile

# Install Content of Brewfile
brew bundle

# Generate a SSH-Key for GitHub
githubmail=$(bash -c 'read -e -p "Was ist deine GitHub Mailadresse?: " tmp; echo $tmp')
ssh-keygen -t ed25519 -C $githubmail

# Add SSH-Key to the ssh-agent
eval "$(ssh-agent -s)"
touch ~/.ssh/config
echo "Host *.github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Copy the generated key to the clipboard
pbcopy < ~/.ssh/id_ed25519.pub

echo "Bitte gehe zu https://github.com/settings/ssh/new und füge den SSH-Key ein"