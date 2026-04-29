HISTSIZE=1000   # loaded in memory
SAVEHIST=50000  # saved to disk (i.e. to ~/.zsh_history as per below)
HISTFILE=~/.bash_history

alias ls='ls -a'
alias l='ls -ltr'
alias root='root -l'
alias diff='diff -W $(( $(tput cols) - 2 ))'

export LC_ALL=C.utf8
export LANG=C.utf8

export PS1="[\u] \w > "
export EDITOR=nano

# setup LCG
. /cvmfs/sft.cern.ch/lcg/views/LCG_106/x86_64-el9-gcc13-opt/setup.sh


