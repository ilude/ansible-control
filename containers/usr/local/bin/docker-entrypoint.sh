#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e 

# enable this for testing/debugging, to print out commands as they are run
#set -x
#set -o xtrace  

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_ed25519
unset SSH_PRIVATE_KEY

exec $@