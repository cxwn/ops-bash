#!/bin/bash
mkdir ~/.vim && cd .vim
curl -C - -o vim-support.zip https://www.vim.org/scripts/download_script.php?src_id=24453
unzip vim-support.zip
rm -f vim-support.zip
cd ~
echo -e "filetype plugin on\nset nu">>.vimrc