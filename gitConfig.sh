#!/bin/bash
# -*-ENCODING UTF-8 -*-
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ssh-keygen -t rsa -b 4096 -C "useremail"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub
echo "Agregue el md5 a git"
read
echo "Genial!"
git config --global user.name "username"
git config --global user.email "useremail"
git config --global core.editor nvim
git config --global alias.a add
git config --global alias.cl clone
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
exit
