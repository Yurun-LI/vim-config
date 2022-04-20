# vim-config
## Installation (Linux/MacOS)
#### 1. Clone the repository and then run `.install.py`.
```bash
cd ~
git clone git@github.com:Yurun-LI/vim-config.git ~/.vim_config
cd ~/.vim_config && ./install.py

```

It is noted that some plugins need Vim 8.0+ support, so you'd better check your Vim version first
`Brew` is recommended to install Vim
```bash
brew install vim
```
#### 2. Open the vim and run `:PlugInstall` command to install and update all the default plugins.

#### 3. Moving to `~/.vim_config/plugins/default/YouCompleteMe` and compile YCM to make it work. For details, it can be seen in [tabnine/YouCompleteMe](https://github.com/tabnine/YouCompleteMe#installation)
```bash
cd ~/.vim_config/plugins/default/YouCompleteMe
python3 ./install.py --all # if you want it support all the languages, run it

# if you only want C/C++ compiler, then run
python3 ./install.py --clangd-completer
```
After YCM is complied, open a file to test if there is still any problem.
And if it is OK, your can enjoy smooth coding!


