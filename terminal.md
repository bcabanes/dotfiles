# Terminals

## Configuration

- iterm2
- Oh My Zsh: https://github.com/ohmyzsh/ohmyzsh
- Powerlevel10k: https://github.com/romkatv/powerlevel10k
- SpaceVim: https://github.com/SpaceVim/SpaceVim

## SSH
- Open your `~/.ssh/config` file, then modify the file to contain the following lines. If your SSH key file has a different name or path than the example code, modify the filename or path to match your current setup.
```
Host *.github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```
- Add current `ssh` keys to the Apple keypass by running this command: `ssh-add --apple-use-keychain ~/.ssh/id_ed25519`
