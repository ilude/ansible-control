. /etc/profile

cp -r ~/.host/.ssh/* ~/.ssh/
chmod -R 600 ~/.ssh 

alias l='ls -lha'
alias ll='ls -lha'
alias la='ls -A'
alias cls='clear'

[ -d $PROJECT_PATH ] || git clone $GIT_REPO $PROJECT_PATH
(cd $PROJECT_PATH; git pull)