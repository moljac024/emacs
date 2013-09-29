#!/bin/bash
EMACS_DIRECTORY=~/.emacs.d

cd ~
git clone https://github.com/moljac024/emacs.git $EMACS_DIRECTORY
cd $EMACS_DIRECTORY
git submodule init
git submodule update

# Compile ctags
CTAGS_SOURCE_DIR=$EMACS_DIRECTORY/ctags/install/source
CTAGS_SOURCE_FILE=ctags-5.8.tar.gz
cd $CTAGS_SOURCE_DIR
if [[ ! -d $EMACS_DIRECTORY/tmp ]]; then
    mkdir -p $EMACS_DIRECTORY/tmp/ctags-install
fi
cp $CTAGS_SOURCE_FILE $EMACS_DIRECTORY/tmp/ctags-install
cd $EMACS_DIRECTORY/tmp/ctags-install
tar xzf $CTAGS_SOURCE_FILE
./configure --prefix=$HOME/.local && make && make install &&\
make clean && make distclean
echo "Compiled and installed ctags succesfully!"
