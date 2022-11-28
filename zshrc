export ZSH="/home/llamicron/.oh-my-zsh"
ZSH_THEME="lukeforest"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases ======================================================

# Unalias some things
# I can't find where these are aliased, maybe from within zsh?
unalias l

# Aliases
alias l="tree -L 1"
alias l2="tree -L 2"
# This will restart pulseaudio. I have an issue where when my 
# processor is under load (i think) then it fucks the audio
alias fix_audio="pulseaudio -k"
alias luketex="latexmk -pvc -shell-escape"


# Add Spicetify to path
export PATH=$PATH:/home/llamicron/.spicetify
# Add LaTeX (TexLive) to path
export PATH=$PATH:/usr/local/texlive/2022/bin/x86_64-linux

[ -f "/home/llamicron/.ghcup/env" ] && source "/home/llamicron/.ghcup/env" # ghcup-env
