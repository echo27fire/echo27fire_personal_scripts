#!/bin/bash
#
#
#
#
#
# date: March 3, 2022



#functions

function pause() {
  echo "returning. press any key to continue"
  read -p "press any key to continue"
}

function welcome() {
  clear
  echo "-------------------------------------------------------------"
  echo "-------------------------------------------------------------"
  echo "--     GIT GLOBAL USERNAME AND EMAIL CONFIGURATOR          --"
  echo "-------------------------------------------------------------"
  echo "-------------------------------------------------------------"
}

function git_global() {
echo "setting global vars now"
git config --global user.name $USERNAME
git config --global user.email $USEREMAIL
git_grep
pause;exit
}

function user_name(){
read -p "What is the user name to use with git? : " USERNAME
echo "you have entered a username of $USERNAME"
}

function user_email() {
read -p "what is the email associated with the git username $USERNAME? : " USEREMAIL
echo "you have entered a email of $USEREMAIL"
}

function input() {
  while true;do
    welcome

    user_name

    user_email
    read -p "IS THE USER NAME IS EMAIL CORRECT? [Y/N]: " ANS
    case $ANS in
      [Yy]) git_global
      ;;
      [Nn])pause;input
      ;;
    esac
  done
}

function git_grep() {
echo "verifying global username and email are set"
git config --list | grep user
echo "if either are incorrect, please rerun the script"
}




# scritp body

input
