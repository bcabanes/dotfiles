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

Should you prompt something like this:
```bash
/Users/hubot/.gnupg/secring.gpg
------------------------------------
sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
uid                          Hubot 
ssb   4096R/42B317FD4BA89E7A 2016-03-10
```
`3AA5C34371567BD2` is your key id.

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

### Adding the GPG key to your GitHub account
Follow the instructions on [the official website here](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/).