[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

# Add npm global to path
export PATH="/usr/local/Cellar/node/6.5.0/libexec/npm/bin:$PATH"

source ~/.bashrc
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source /Users/llamicron/envs/main/bin/activate
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"

source ~/envs/main3/bin/activate

# Thanks Daniel Beck!
# https://superuser.com/a/283365
function cd {
    # actually change the directory with all args passed to the function
    builtin cd "$@"
    # if there's a regular file named "entry.sh"...
    if [ -f "entry.sh" ] ; then
        # run it
        source entry.sh
    fi
}

export PATH="$HOME/.cargo/bin:$PATH"
