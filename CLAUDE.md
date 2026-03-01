# Dotfiles Repository

macOS dotfiles and configuration backup repository.

## Purpose

Store and version-control personal macOS configurations for easy restoration on a fresh machine.

## Repository Structure

```
dotfiles/
├── scripts/
│   └── export.sh         # Copies configs from $HOME into this repo
├── alacritty/
│   └── catppuccin_mocha.toml
├── .dotfiles/
│   └── README.md         # Setup instructions for bare git approach
├── .zshrc                # Zsh shell config (Oh-My-Zsh, starship, plugins)
├── .p10k.zsh             # Powerlevel10k prompt config
├── .tmux.conf            # Tmux config (Dracula theme)
├── .vimrc                # Vim config
├── .gitconfig            # Git config (email/signingkey stripped)
├── alacritty.toml        # Alacritty terminal config
├── init.lua              # Hammerspoon macOS automation
├── brew-formulas.txt     # Homebrew formula list
└── brew-casks.txt        # Homebrew cask list
```

## Workflow

### Exporting (saving changes)

Run after modifying configs on your machine:

```bash
./scripts/export.sh
```

This copies configs from `$HOME` into the repo and regenerates Homebrew package lists. The `.gitconfig` is exported with `email` and `signingkey` lines stripped for security.

Then review, commit, and push:

```bash
git add .
git commit -m 'Update dotfiles'
git push
```

### Restoring (fresh Mac setup)

The repo uses a **bare git** approach — `$HOME` is the working tree:

```bash
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config status.showUntrackedFiles no
```

Then checkout files with `config checkout` to place them in `$HOME`.

After restoring:
- Set `git user.email` and `user.name` in `~/.gitconfig` manually
- Install Homebrew packages: `xargs brew install < brew-formulas.txt`
- Install Homebrew casks: `xargs brew install --cask < brew-casks.txt`

## Key Tools Configured

| Tool | Config file | Notes |
|------|-------------|-------|
| Zsh | `.zshrc` | Oh-My-Zsh, starship prompt, nvm, pyenv |
| Tmux | `.tmux.conf` | Dracula theme |
| Vim | `.vimrc` | Minimal setup, snazzy colorscheme |
| Alacritty | `alacritty.toml` | JetBrains Mono, Catppuccin Mocha, 0.9 opacity |
| Hammerspoon | `init.lua` | Cmd+Alt+Ctrl+W generates UUID |
| Git | `.gitconfig` | GPG signing enabled |

## Security Notes

- Never commit API keys, tokens, or passwords
- `.gitconfig` export strips `email` and `signingkey` — set these manually after restore
- Review all exported files before committing
