## copy something from command line to clipboard
## Then use like: 
## grep John file_for_contacts | c
## now, john’s contact info is copied to the clipboard, etc.

alias c='xsel --clipboard'

alias ccat='pygmentize -g'

alias cl='clear'

alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'

alias sha='shasum -a 256 '

alias untar='tar -zxvf '

alias bc='bc -l'

alias path='echo -e ${PATH//:/\\n}'

alias ipe='curl ipinfo.io/ip'

alias h='history'

alias j='jobs -l'

## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'

alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../../'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -iv'
alias cp='cp -ir'
alias ln='ln -iv'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# For Super user Aliases
if [ $UID -ne 0 ]; then
	alias reboot='sudo /sbin/reboot'
	alias poweroff='sudo /sbin/poweroff'
	alias halt='sudo /sbin/halt'
	alias shutdown='sudo /sbin/shutdown'

    alias update='sudo apt-get update && sudo apt-get upgrade'
    alias apt-get='sudo apt-get'
    alias root='sudo -i'
fi

## For fun
alias rain='curl -4 https://wttr.in/saint-peterburg'