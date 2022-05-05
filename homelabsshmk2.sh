 #!/bin/bash
# script for generating and uploading SSH keys to local servers
# various
user=$(whoami)
# functions
function welcome() {
  echo "------------------------------------------------------------------------"
  echo "                  GENERATING SSH KEY FOR LOCAL SERVERS                  "
  echo "------------------------------------------------------------------------"
}

function ssh_gen() {
  ssh-keygen -b 2048 -t rsa -f /home/"$user"/.ssh/"$SVR_NAME.key.ssh" -q -P "" || echo "ERROR"
 echo "key generated"
}

function ssh_upload() {
  echo "uploading ssh key to $SVR_NAME at $SVR_IP"
  ssh-copy-id "$SVR_USR"@"$SVR_IP" || echo "ERROR REACHING HOST"

}

# script body
welcome
read -p "what is the ip address for the server to generate SSH keys for?: " SVR_IP
echo "ip entered is $SVR_IP"
read -p "What is the name of the server? (no spaces): " SVR_NAME
echo "Server name is $SVR_NAME"
read -p "what is the user name to generate keys for?: " SVR_USR
echo "Server username is $SVR_USR"
ssh_gen
ssh_upload
