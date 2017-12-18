echo "Howdy from ~/.bash_profile"
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Add npm global to path
export PATH="/usr/local/Cellar/node/6.5.0/libexec/npm/bin:$PATH"

source ~/.bashrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source /Users/llamicron/envs/main/bin/activate
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

source ~/envs/main3/bin/activate
