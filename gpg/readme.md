# GPG key signin for GitHub

### Install the stuff
```bash
brew install gnupg pinentry-mac
```

### Generate new key
```bash
gpg --full-generate-key -i
```
- Select `RSA and RSA`;
- Select maximum size: `4096`;
- When asked to enter your email address, ensure that you enter the verified email address for your GitHub account.

### Get your key
```bash
gpg --list-secret-keys --keyid-format LONG
```

### Configure git
```bash
git config --global user.signingkey {{key_id}}
git config --global commit.gpgsign true
```

### Be able to save it in KeyChain (macOS)
Open `~/.gnupg/gpg-agent.conf` and add:
```bash
pinentry-program /usr/local/bin/pinentry-mac
```

### Export to GitHub
```bash
gpg --armor --export {{key_id}} | pbcopy
```
