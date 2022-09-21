# Starting from scratch
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

# Install your dotfiles onto a new system (or migrate to this setup) 
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

echo ".cfg" >> .gitignore

git clone --bare <git-repo-url> $HOME/.cfg

config checkout

# if the last command fails, its probably because there is some old config
# files its trying to overwrite
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I {} mv {} .config-backup/{}

# so git doesnt show all the untracked files in $HOME
config config --local status.showUntrackedFiles no


