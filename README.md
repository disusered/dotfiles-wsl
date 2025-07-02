# Dotfiles WSL

> Dotfiles for Ubuntu on Windows Subsystem for Linux

1. Install wsl
  ```sh
  wsl --install
  ```

2. Download SSH public and private key pair from 1Password into `~/.ssh`

3. Install dependencies and configure dotfiles
  ```sh
  # Clone repository to home directory
  git clone git@github.com:disusered/dotfiles-wsl.git ~/.dotfiles

  # Run bootstrap script
  chmod +x ~/.dotfiles/bootstrap
  ~/.dotfiles/bootstrap
  ```

4. Configure SSH with 1Password
  ```sh
  # https://developer.1password.com/docs/ssh/git-commit-signing
  # https://developer.1password.com/docs/ssh/integrations/wsl/

  # Allow local verification of commits with allowedSigners file
  touch ~/.ssh/allowed_signers

  # Set the allowedSignersFile configuration for local verification.
  git config --global gpg.ssh.allowedSignersFile ~/.ssh/allowed_signers

  # Get your email from git config and your public key, then write them
  # to the allowed_signers file in the required format.
  echo "$(git config --global user.email) $(cat ~/.ssh/id_ed25519.pub)" > ~/.ssh/allowed_signers
  ```
