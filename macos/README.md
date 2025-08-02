# Personal Configuration

## Initial macOS Configuration

1. [Install PowerLine Fonts](#install-powerline-fonts)
2. Import iTerm2 Configuration

### Install Homebrew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Command Line Tools

```sh
xcode-select --install
```

### Install Homebrew Packages

```sh
# brew install git
brew install \
  wget \
  tmux \
  neovim
```

```sh
brew install \
  ripgrep \
  fzf \
  fd \
  bat \
  bat-extras \
  git-delta \
  eza
```

```sh
brew install \
  zoxide \
  gh \
  lazygit
```

```sh
brew install \
  tree \
  htop \
  shellcheck
```

If needed, install the following packages:
```sh
brew install \
  coreutils \
  zsh \
  zsh-completions \
  zsh-autosuggestions \
  zsh-syntax-highlighting
```

#### fd

https://github.com/sharkdp/fd

fd is a program to find entries in your filesystem. It is a simple, fast and user-friendly alternative to find. While it does not aim to support all of find's powerful functionality, it provides sensible (opinionated) defaults for a majority of use cases.

```sh
brew install fd
```
#### bat

Bat is a cat clone with wings. It is a `cat` clone with syntax highlighting and Git integration. It is a drop-in replacement for `cat`.

[batdiff](https://github.com/eth-p/bat-extras/blob/master/doc/batdiff.md)
[batgrep](https://github.com/eth-p/bat-extras/blob/master/doc/batgrep.md)
[batman](https://github.com/eth-p/bat-extras/blob/master/doc/batman.md)
[batpipe](https://github.com/eth-p/bat-extras/blob/master/doc/batpipe.md)
[batwatch](https://github.com/eth-p/bat-extras/blob/master/doc/batwatch.md)
[prettybat](https://github.com/eth-p/bat-extras/blob/master/doc/prettybat.md)

#### eza

[Eza](https://github.com/oguzhaninan/eza) is a modern replacement for `ls`. It is a modern replacement for `ls` with more features and better defaults. It is a drop-in replacement for `ls`.

```sh
brew install eza
```

#### fzf

[Fzf](https://github.com/junegunn/fzf) is a command-line fuzzy finder. It is a general-purpose command-line fuzzy finder. It can be used to search for files, directories, and more. It is a drop-in replacement for `fzf`.

```sh
brew install fzf
# $(brew --prefix)/opt/fzf/install
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
```

### Install Oh My Zsh

```sh
# cp ~/.zshrc ~/.zshrc.before-oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
``` 

### Configure Oh My Zsh

```sh
cp -r .oh-my-zsh/custom ~/.oh-my-zsh/custom
```

### Install Fonts

```sh
brew tap homebrew/cask-fonts
brew install \
  font-roboto-mono-nerd-font \
  font-hack-nerd-font
```

https://github.com/powerline/fonts

```sh
git clone https://github.com/powerline/fonts.git powerline-fonts # --depth=1
cd powerline-fonts
./install.sh
cd ..
rm -rf powerline-fonts
```

### NeoVim Configuration

```sh
mkdir -p ~/.config/nvim
cp .config/nvim/init.lua ~/.config/nvim/init.lua
# https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#install
git clone https://github.com/neovim/nvim-lspconfig ~/.config/nvim/pack/nvim/start/nvim-lspconfig
```

### Install iTerm2

```sh
brew install --cask iterm2
```

### Import iTerm2 Configuration

[source](https://stackoverflow.com/questions/22943676/how-to-export-iterm2-profiles)

If you have a look at `Preferences -> General` you will notice at the bottom of the panel, there is a setting Load preferences from a custom folder or URL:. There is a button next to it Save settings to Folder.

So all you need to do is save your settings first and load it after you reinstalled your OS.

If the Save settings to Folder is disabled, select a folder (e.g. empty) in the Load preferences from a custom folder or URL: text box.

In iTerm2 3.3 the sequence is:

```
iTerm2 menu > Preferences > "General" tab > "Preferences" sub-tab
```


### Install Homebrew Casks If needed

```sh
brew install --cask \
  iterm2 \
  visual-studio-code \
  google-chrome \
  firefox \
  slack \
  spotify \
  docker \
  postman \
  rectangle \
  alacritty \
  font-fira-code \
  font-fira-mono \
  font-fira-sans \
  font-fira-sans-mono \
  font-fira-code-nerd-font \
  font-fira-mono-nerd-font \
  font-fira-sans-nerd-font \
  font-fira-sans-mono-nerd-font \
  font-jetbrains-mono \
  font-jetbrains-mono-nerd-font \
  font-jetbrains-mono-nerd-font-mono \
  font-jetbrains-mono-nerd-font-proportional \
  font-jetbrains-mono-nerd-font-proportional-mono
```
