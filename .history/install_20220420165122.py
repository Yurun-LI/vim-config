#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os,sys
import shutil

ROOT = os.getcwd()
HOME = os.environ['HOME']
print('current directory: {}'.format(ROOT))
vimrc_path = os.path.join(HOME,'.vimrc')

# if ~/.vimrc exists, backup it.
if os.path.exists(vimrc_path):
    print('The current "~/.vimrc" exists!')
    vimrc_backup = os.path.join(ROOT,'.origin_vimrc_backup.vim')
    print('make a backup of "~/.vimrc" to the directory: {}'.format(vimrc_backup))
    shutil.copyfile(vimrc_path,vimrc_backup)
    print('Backup complete!\n')

print('start configuring ...\n')
# copy .my_vimrc to ~/.vimrc
my_vimrc_path = os.path.join(ROOT,".my_vimrc")
shutil.copyfile(my_vimrc_path,vimrc_path)

# if ~/.vim_config/ exists, replace it.
# else copy the clone directory to ~/.vim_config/
dest_dir = os.path.join(HOME,'.vim_config/')

if dest_dir != ROOT:
    if os.path.exists(dest_dir):
        print(" ~/.vim_config/ directory already exists!")
        is_remove = input("\nIf remove the current ~/.vim_config directory [Y/n]:")
        if is_remove in ['Y','y']:
            shutil.rmtree(os.path.join(HOME,'.vim_config/'))
        else:
            print("configuration is interrupt !")
            sys.exit(0)
    shutil.copytree(ROOT,os.path.join(HOME,'.vim_config/'))
    print('"configuration is completed and please enjoy it ~~')
    print("all of the configurations are based on the files in ~/.vim_config/configurations/\n")
    print("all the files are moved to ~/.vim_config\n\n And, you can remove the downloads by\n\n\t '$ rm -rf {}'\n".format(ROOT))
else:
    print('"configuration is completed and please enjoy it ~~')
    print("all of the configurations are based on the files in ~/.vim_config/configurations/\n")









