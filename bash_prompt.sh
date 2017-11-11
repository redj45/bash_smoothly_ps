function __git__branch {
        git branch 2> /dev/null| sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(__git_status)) /" 
}

function __git_status {
        [[ $(LC_ALL=C git status 2> /dev/null | tail -n1) != *"nothing to commit"* ]] && echo " [*]"
}

function __virtual_env {
        if [[ $VIRTUAL_ENV != "" ]] ; then 
		            echo env:$(basename $VIRTUAL_ENV)\ 
	      fi 
}

if [[ ${EUID} == 0 ]] ; then
	PS1='\
\[\033[0;31m\]┌[ \[\033[1;31m\]\H\[\033[1;34m\]: \w \[\033[0;31m\]]\[\033[0m\]
\[\033[0;31m\]└[ \[\033[0m\]\[\033[1;31m\]$(__virtual_env)$(__git__branch)\[\033[0;31m\]\[\033[0m\]\[\033[1;31m\]\u\[\033[0;31m\] ]-> \[\033[0m\]'
else
        PS1='\
\[\033[0;32m\]┌[ \[\033[1;32m\]\H\[\033[1;34m\]: \w \[\033[0;32m\]]\[\033[0m\]
\[\033[0;32m\]└[ \[\033[0m\]\[\033[1;31m\]$(__virtual_env)$(__git__branch)\[\033[0;31m\]\[\033[0m\]\[\033[1;32m\]\u\[\033[0;32m\] ]-> \[\033[0m\]';
       
fi

alias ls='ls --color';
alias ll='ls -la';
alias rm='rm -i';
alias mv='mv -i';
alias mc='mc -b';

unset use_color safe_term match_lhs
export HISTCONTROL=ignoreboth
export VIRTUAL_ENV_DISABLE_PROMPT=1
HISTFILESIZE=2500
PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin
