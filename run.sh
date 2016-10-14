#!/bin/bash

echo "Backup old configs..."
if [ ! -f $HOME/.old_config ]
then
  mkdir -p $HOME/.old_config
  mv $HOME/.bashrc $HOME/.old_config
  mv $HOME/.vimrc $HOME/.old_config
  mv $HOME/.vim $HOME/.old_config
  mv $HOME/.tmux.conf $HOME/.old_config
fi

echo "Copy my configs..."
cp $PWD/_bashrc $HOME/.bashrc
cp $PWD/_vimrc $HOME/.vimrc
cp $PWD/_tmux.conf $HOME/.tmux.conf
tar xf vim.tgz
cp -r $PWD/_vim $HOME/.vim


if [ ! -d $HOME/.ssh ]
then
  echo "Gen ssh key..."
  ssh-keygen
  cp $PWD/_ssh_config $HOME/.ssh/config
fi
