function __git__branch {
    git branch 2> /dev/null| sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(__git_status)) /"
}

function __git_status {
    [[ $(LC_ALL=C git status 2> /dev/null | tail -n1) != *"nothing to commit"* ]] && echo " [*]"
}

function __virtual_env {
    [[ $VIRTUAL_ENV != "" ]] && echo env:$(basename $VIRTUAL_ENV)" "
}

if [[ ${EUID} == 0 ]] ; then
    PS1='\
\[\033[0;31m\]┌[ \[\033[1;31m\]\H\[\033[1;34m\]: \w \[\033[0;31m\]]\[\033[0m\]
\[\033[0;31m\]└[ \[\033[0m\]\[\033[1;31m\]$(__virtual_env)$(__git__branch)\[\033[0;31m\]\[\033[0m\]\[\033[1;31m\]\u\[\033[0;31m\] ]-> \[\033[0m\]';
else
    PS1='\
\[\033[0;32m\]┌[ \[\033[1;32m\]\H\[\033[1;34m\]: \w \[\033[0;32m\]]\[\033[0m\]
\[\033[0;32m\]└[ \[\033[0m\]\[\033[1;31m\]$(__virtual_env)$(__git__branch)\[\033[0;31m\]\[\033[0m\]\[\033[1;32m\]\u\[\033[0;32m\] ]-> \[\033[0m\]';
fi

alias ls='ls --color';
alias ll='ls -la';
alias rm='rm -i';
alias mv='mv -i';
alias mc='mc --colors normal=green,default:selected=brightmagenta,gray:marked=yellow,default:markselect=yellow,gray:directory=blue,default:executable=brightgreen,default:link=cyan,default:device=brightmagenta,default:special=lightgray,default:errors=red,default:reverse=green,default:gauge=green,default:input=white,gray:dnormal=green,gray:dfocus=brightgreen,gray:dhotnormal=cyan,gray:dhotfocus=brightcyan,gray:menu=green,default:menuhot=cyan,default:menusel=green,gray:menuhotsel=cyan,default:helpnormal=cyan,default:editnormal=green,default:editbold=blue,default:editmarked=gray,blue:stalelink=red,default';
alias cls='clear';

unset use_color safe_term match_lhs
export HISTCONTROL=ignoreboth
export VIRTUAL_ENV_DISABLE_PROMPT=1
HISTFILESIZE=2500
PATH=$PATH:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin
