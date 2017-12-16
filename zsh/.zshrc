source ~/.zsh/plugins.zsh
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/jfouk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# needed to get things like current git branch
 #autoload -Uz vcs_info
 #zstyle ':vcs_info:*' enable git 
 #zstyle ':vcs_info:git*' use-simple true
 #zstyle ':vcs_info:git*' check-for-changes true
 #zstyle ':vcs_info:git*' formats '%r %b %c %u'
 #precmd () { vcs_info }
 
#__________________prompt___________________-
# git super status customization
#ZSH_THEME_GIT_PROMPT_PREFIX=""
#ZSH_THEME_GIT_PROMPT_SUFFIX=""
#ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
#ZSH_THEME_GIT_PROMPT_BRANCH="%{%B%F{73}%}"
#ZSH_THEME_GIT_PROMPT_STAGED="%{%B%F{154}⚫%G%}"
#ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%}"
#ZSH_THEME_GIT_PROMPT_CHANGED="%{%B%F{166}⚫%G%}"
#ZSH_THEME_GIT_PROMPT_BEHIND="%{%B%F{248}↓%G%}"
#ZSH_THEME_GIT_PROMPT_AHEAD="%{%B%F{248}↑%G%}"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{241}⚫%G%}"
#ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%}"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{%B%F{73}%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{%B%F{154}⚫%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS=" %{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{%B%F{166}✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND=" %{%B%F{15}↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD=" %{%B%F{15}↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{%F{248}…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}%{✔%G%}"
#zsh_prompt_
PROMPT='%B%F{178}%~%f %F{154}§%f%b '
#RPROMPT='%F{241}$vcs_info_msg_0_%f'
#RPROMPT='$(git_super_status)'

# asynch prompt
setopt prompt_subst # enable command substition in prompt

#PROMPT='$(prompt_cmd)' # single quotes to prevent immediate execution
RPROMPT='' # no initial prompt, set dynamically

ASYNC_PROC=0
function precmd() {
    function async() {
        # save to temp file
        printf "%s" "$(git_super_status)" > "/tmp/zsh_prompt_$$"

        # signal parent
        kill -s USR1 $$
    }

    # do not clear RPROMPT, let it persist

    # kill child if necessary
    if [[ "${ASYNC_PROC}" != 0 ]]; then
        kill -s HUP $ASYNC_PROC >/dev/null 2>&1 || :
    fi

    # start background computation
    async &!
    ASYNC_PROC=$!
}

function TRAPUSR1() {
    # read from temp file
    RPROMPT="$(cat /tmp/zsh_prompt_$$)"

    # reset proc number
    ASYNC_PROC=0

    # redisplay
    zle && zle reset-prompt
}

