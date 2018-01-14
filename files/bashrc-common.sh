# put this in /etc/profile.d/bashrc-comun.sh, and source it from your .bashrc
# Remember: .bashrc for terminal shells and .profile is for login


PS1='\n\[\033[01;31m\]\u@\h:\[\033[00m\]\[\033[01;36m\]$PWD\[\033[00m\]\n \$ '
export PS1

PATH="$PATH:/sbin"
export PATH

LS_COLORS='rs=0:di=1;36:';
export LS_COLORS

function cd () {
    builtin cd "$@" && ls -a
}

function vimbash () {
    vim "$1" -c ':ConqueTermSplit bash'
}

alias duh='du -hsc *'
alias ls='ls -a --color'
alias ll='ls -halF'
alias lsg='ll|grep '

# vscode
alias coderoot='sudo code --user-data-dir="~/.vscode-root"'

# disable ctrl-s (blocks input, need ctrl-q afterwards)
stty -ixon

# numlock on (numbers)
#setleds -D +num

# Additional key mapping
#  - see map table: xmodmap -pke
#  - find key code: xev
#  - columns : key Shift-key Mod-Key Shift-Mod-Key AltGr-key Shift-AltGr-key
#  - podrias usar xmodmap -e "keycode ..." mas fiable


# ya no xmodmap, ver teclado.md
