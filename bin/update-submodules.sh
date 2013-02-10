#!/bin/bash

#echo "Updating plugins..."
cd ~/.emacs.d
git submodule foreach git pull origin master
