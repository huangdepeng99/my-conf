##############################
## auto-launching ssh-agent ##
##############################
# https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
fi

unset env


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