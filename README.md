# Dotfiles WSL

## Setup

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

## TODO

## Easy/Medium

- [x] Wezterm basic setup
- [x] Starship replace Pure
- [x] Eza <https://github.com/eza-community/eza>
- [x] Wezterm Tmux replacement <https://www.florianbellmann.com/blog/switch-from-tmux-to-wezterm>
- [x] Whichkey toggles
- [x] rg (ripgrep) replace ag (the silver searcher)
- [x] Theme rg
- [x] Delta integrated with Git and rg
- [x] Delta theme
- [x] Wezterm quick select <https://wezterm.org/quickselect.html>
- [x] Wezterm customize tab bar <https://github.com/michaelbrusegard/awesome-wezterm?tab=readme-ov-file#tab-bar>
- [x] Wezterm workspaces <https://wezterm.org/recipes/workspaces.html>
- [x] Neovim number/icon column same background as default background
- [x] Neovim symbol position under tabline Foo > Bar
- [ ] Wezterm Delta hyperlinks <https://dandavison.github.io/delta/hyperlinks.html>
- [ ] Wezterm Eza hyperlinks <https://wezterm.org/recipes/hyperlinks.html#requirements>
- [ ] xdgopen -> wslview or wsl-open <https://github.com/4U6U57/wsl-open>
- [ ] Neovim show selection stats (lines, words, characters) in statusline
- [ ] Neovim hide unnecessary info from statusline
- [ ] Neovim wrap sidebar icon like screenshot
- [ ] Neovim Markdown outline sidebar
- [ ] Dragon <https://github.com/mwh/dragon>
- [ ] Wezterm launch menu <https://wezterm.org/config/launch.html#the-launcher-menu>
- [ ] Starship indicate inside container
- [ ] Starship give Docker context
- [ ] Starship show sudo status
- [ ] Eza completion <https://eza.rocks/>
- [ ] Clean up zshfuns

### Difficult

- [ ] Wezterm sessions <https://github.com/michaelbrusegard/awesome-wezterm?tab=readme-ov-file#session>
- [ ] Wezterm hyperlinks to Jira/GitHub issues
- [ ] Dim inactive panes in Wezterm & Neovim
- [ ] Use Justfile for dotfile bootstrap

- Document scoop packages
  - Nuget
  - win32yank
  - dual-monitor-tools

- Document winget packages
  - Install
    - 7zip.7zip
    - Docker.DockerDesktop
    - SourceFoundry.HackFonts
    - Zoom.Zoom
    - Logitech.GHub
    - Google.Chrome
    - Google.GoogleDrive
    - RevoUninstaller.RevoUninstaller
    - wez.wezterm
    - AgileBits.1Password
    - AgileBits.1Password.CLI
    - Microsoft.Teams
    - Meld.Meld
  - Uninstall
    - Microsoft.OneDrive
    - Microsoft.Edge

## Documentation

- Document Wezterm windows setup
- Elevated Powershell

  ```powershell
  cmd /c mklink /D "C:\Users\carlo\.config\wezterm" "\\wsl`$\Ubuntu\home\carlos\.dotfiles\confs\wezterm\.config\wezterm"
  symbolic link created for C:\Users\carlo\.config\wezterm <<===>> \\wsl$\Ubuntu\home\carlos\.dotfiles\confs\wezterm\.config\wezterm

  cmd /c mklink "C:\Users\carlo\.wezterm.lua" "\\wsl`$\Ubuntu\home\carlos\.dotfiles\confs\wezterm\.wezterm.lua"
  symbolic link created for C:\Users\carlo\.wezterm.lua <<===>> \\wsl$\Ubuntu\home\carlos\.dotfiles\confs\wezterm\.wezterm.lua
  ```

## Etc

- Wezterm config debug: <https://github.com/wezterm/wezterm/discussions/6348>
