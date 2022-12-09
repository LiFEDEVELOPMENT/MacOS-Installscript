# Grab Brewfile
curl -fsSL https://raw.githubusercontent.com/LiFEDEVELOPMENT/MacOS-Installscript/main/Brewfile > ~/Brewfile

# Install Rosetta 2
softwareupdate --install-rosetta

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Brew to PATH
echo '# Set PATH, MANPATH, etc., for Homebrew.' >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
∏
# Install Content of Brewfile
brew bundle

# Add Code to PATH
cat << EOF >> ~/.zprofile
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

# Generate a SSH-Key for GitHub
githubmail=$(bash -c 'read -e -p "Was ist deine GitHub Mailadresse?: " tmp; echo $tmp')
ssh-keygen -t ed25519 -C $githubmail

# Add SSH-Key to the ssh-agent
eval "$(ssh-agent -s)"
echo "Host *.github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Copy the generated key to the clipboard
pbcopy < ~/.ssh/id_ed25519.pub

echo "Bitte gehe zu https://github.com/settings/ssh/new und füge den SSH-Key ein"
