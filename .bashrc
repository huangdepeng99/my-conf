###########
## alias ##
###########
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -alF'
alias rm='rm -I'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias view='vim -R'
alias vimdiff='vim -d'


###############
## variables ##
###############
WSW='/d/WorkSpace/' # Windows
WSS='~/WorkSpace/'  # WSL
WSL='~/WorkSpace/'  # Linux


############
## prompt ##
############
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
export PS1='[\[\e[1;33m\]\u@\h\[\e[0m\]:\[\e[1;32m\]\w\[\e[0m\]]$(__git_ps1 " (%s)")\$ '
