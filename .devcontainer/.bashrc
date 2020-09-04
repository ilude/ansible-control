. /etc/profile

cp -r ~/.host/.ssh/* ~/.ssh/
chmod -R 600 ~/.ssh 

alias l='ls -lha'
alias ll='ls -lha'
alias la='ls -A'
alias cls='clear'

echo "checking for $GIT_REPO in $PROJECT_PATH"
[ ! -d $PROJECT_PATH ] && echo "cloning $GIT_REPO into $PROJECT_PATH" && git clone $GIT_REPO $PROJECT_PATH
cd $PROJECT_PATH 
echo "pulling latest..."
git pull