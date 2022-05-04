#!/bin/bash

# script to customize my aliases
USER=$(whoami)
FILE=alias.file
LOG=alias.log

function shells() {
  cp .bashrc{,.backup}
  cp .zshrc{,.backup}

}

function shell_reload() {
  move_home
  echo "aliases copied."
  echo "remember to run source .bashrc or source .zshrc to load new aliases"
}

function move_home() {
  echo "moving to home directory and making backup of *rc files."
  cd /home/"$USER" || exit
}

function alias_file() {
  move_home
  echo "#follow the following format for alias commands" > $FILE
  echo '#alias alias="command"' >> $FILE

}

# body

move_home || echo "error"
echo "backup of current rc files complete"
if [ "$(ls /home/"$USER"/$FILE)" ]
then
    shells
    cat $FILE >> .bashrc
    cat $FILE >> .zshrc
    shell_reload
    echo "alaises added successfully, exiting";exit
else
    echo "no $FILE to read from in home directory"
    echo "making file now. Please add commands to it and run script again"
    touch $FILE;alias_file
    exit

fi
