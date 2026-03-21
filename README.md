# Dotfiles

My personal config files for Neovim, tmux, and WezTerm.

## What's in here

| Folder     | Config for | Symlink target          |
| ---------- | ---------- | ----------------------- |
| `nvim/`    | Neovim     | `~/.config/nvim`        |
| `tmux/`    | tmux       | `~/.tmux.conf`          |
| `wezterm/` | WezTerm    | `~/.wezterm.lua`        |

## Setting up a new computer

### 1. Install dependencies

```bash
brew install neovim tmux stow
```

Download and install [WezTerm](https://wezfurlong.org/wezterm/installation.html).

### 2. Clone this repo

```bash
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
```

### 3. Create symlinks

```bash
# Neovim
ln -sf ~/dotfiles/nvim ~/.config/nvim

# tmux
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

# WezTerm
ln -sf ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua
```

### 4. Open Neovim

The first time you open Neovim it will automatically install all plugins via lazy.nvim. Just run `nvim` and wait for it to finish.
