function __git__branch {
	git branch 2> /dev/null| sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [[ ${EUID} == 0 ]] ; then
        PS1='\[\033[0;31m\]┌[ \[\033[1;31m\]\H\[\033[1;34m\]: \w \[\033[0;31m\]]\[\033[0m\]\n\[\033[0;31m\]└[ \[\033[1;34m\](\t)\[\033[0m\]\[\033[1;31m\]$(__git__branch)\[\033[0;31m\] \[\033[0m\]\[\033[1;31m\]\u\[\033[0;31m\] ]-> \[\033[0m\]'
else
        PS1='\[\033[0;32m\]┌[ \[\033[1;32m\]\H\[\033[1;34m\]: \w \[\033[0;32m\]]\[\033[0m\]\n\[\033[0;32m\]└[ \[\033[1;34m\](\t)\[\033[0m\]\[\033[1;31m\]$(__git__branch)\[\033[0;31m\] \[\033[0m\]\[\033[1;32m\]\u\[\033[0;32m\] ]-> \[\033[0m\]';
       
fi

alias ls='ls --color';
alias ll='ls -la';
alias rm='rm -i';
alias mv='mv -i';
alias mc='mc -b';

unset use_color safe_term match_lhs
export HISTCONTROL=ignoreboth
HISTFILESIZE=2500
PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin
