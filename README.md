This installation will allow you to use the same `.vimrc` configuraiton file for both standard Vim, as well as with NeoVim.

# Installation
Installation requires Python 3+

* Install NeoVim 3.0+

```bash
# Ubuntu
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim

# Prerequisites for the Python modules (may not be necessary with pyenv):
sudo apt install python-dev python-pip python3-dev python3-pip
```

* Install Universal Ctags

Universal tags will conflict with previously installed versions of ctags.  As a result, you may wish to add
a `CTAGS_HOME` environment variable and then add the `bin/` directory to universal tags to your `PATH`

```bash
# OSX
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

```bash
# Ubuntu
sudo add-apt-repository ppa:hnakamur/universal-ctags
sudo apt update
sudo apt install universal-ctags
```

* Clone the repository

```
git clone https://github.com/xildatin/vimrc.git ~/vimrc
```

* Set up symbolic links from the correct configuration file locations to the ones in this package
```bash
ln -s vimrc/.vimrc ~/.vimrc && ln -s vimrc/.config/nvim ~/.config/nvim
```

* Install `Plug`
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


* If you wish to use the Ctags language files for Universal Ctags included with this package, symlink to the Ctags directory in the repository.  Note that
the location of language files for Universal Ctags is different than Ctags or Exuberant Ctags.
```bash
ln -s vimrc/.ctags.d ~/.ctags.d
```

* Install the Python neovim plugin
```bash
pip install neovim
```

* Language Server
** Scala
[https://scalameta.org/metals/docs/editors/vim.html](https://scalameta.org/metals/docs/editors/vim.html)

Yarn and node for coc.nvim plugin
```bash
curl -sL install-node.now.sh/lts -o node-install.sh
sudo /bin/bash node-install.sh
curl --compressed -o- -L https://yarnpkg.com/install.sh | /bin/bash
```

* Run PlugInstall to install the plugins
```bash
vim +PlugInstall +qall
```
