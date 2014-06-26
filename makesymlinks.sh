#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$1                    # dotfiles directory
olddir=$2             # old dotfiles backup directory
files="bashrc vimrc vim tcshrc zshrc "    # list of files/folders to symlink in homedir

##########
if [[ bundle: ]]; then
    #statements
fi
## create dotfiles_old in homedir
#echo "Creating $olddir for backup of any existing dotfiles in ~"
#mkdir -p $olddir
#echo "...done"

## change to the dotfiles directory
#echo "Changing to the $dir directory"
#cd $dir
#echo "...done"

## move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
#for file in $files; do
    #echo "Moving any existing dotfiles from ~ to $olddir"
    #mv ~/.$file $olddir
    #echo "Creating symlink to $file in home directory."
    #ln -s $dir/$file ~/.$file
#done

## move tmux files
#echo "moving old tmux files to $olddir"
#mv ~/.tmux.conf $olddir/tmux
#echo "Creating symlink to $file in home directory."
#ln -s $dir/tmux/tmux.conf ~/.tmux.conf

## Note: install tmux, zsh, latest vim for all this to work
