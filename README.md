This installation will allow you to use the same `.vimrc` configuraiton file for both standard Vim, as well as with NeoVim.

# Installation
Installation requires Python 3+

* Install NeoVim 3.0+
* Install Universal Ctags

Universal tags will conflict with previously installed versions of ctags.  As a result, you may wish to add
a `CTAGS_HOME` environment variable and then add the `bin/` directory to universal tags to your `PATH`

```bash
# OSX
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

* Clone the repository

```
git clone https://github.com/xildatin/vimrc.git ~/vimrc
```

* Set up symbolic links from the correct configuration file locations to the ones in this package
```bash
ln -s vimrc/.vimrc ~/.vimrc && ln -s vimrc/.config/nvim ~/.config/nvim
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

* Run PluginInstall to install the plugins
```bash
vim +PluginInstall +qall
```
