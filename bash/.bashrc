
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

# Aliases
alias tree1="tree . -L 1"
alias tree2="tree . -L 2"
alias ctags="`brew --prefix`/bin/ctags"
alias http="python -m SimpleHTTPServer"
alias github="launchy https://github.com"

alias test_installation="source ~/test-installation/bin/activate"
# At home
# alias brewpi-test="ssh pi@192.168.0.224"
# At A&M

# Adds a weird pip to path. Don't remove this line

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export LC_CTYPE=en_US.UTF-8
alias vim=mvim
alias python3env="source ~/envs/main3/bin/activate"
alias python2env="source ~/envs/main/bin/activate"
