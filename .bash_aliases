# some more ls aliases
alias less='less -SR'
alias l='ls -lLBh --time-style=locale'
alias la='ls -la $1 | less'
alias ll='ls -l'
alias lx='ls -lB' #sort by ext
alias lk='ls -lSr' #soft by size
alias lashtr='ls -lashtr' #sort last modified full
alias lnd='ls -A1' # Show no directories

# Alias's to modifed commands
#alias ps='ps '
alias home='cd ~'
alias pg='ps aux | grep' #requires an argument
alias lg='ls -la | grep' #requires an argument
alias un='tar -zxvf'
alias df='df -hT'
alias ping='ping -c 10'
alias net-restart='sudo /etc/init.d/networking restart'
alias ..='cd ..'
alias ipconfig='ifconfig -a'


# Some ping commands
alias pga='ping 192.168.1.1 -c 10'
alias pgo='ping google.com -c 10'

# Some chmod commands
alias mx='chmod a+x'
alias 000='chmod 000'
alias chsh='chmod 600'
alias screen='TERM=screen screen'

# Knife Commands
alias klan='knife node list'
alias klac='knife client list'
alias klar='knife role list'
alias klae='knife environment list'
