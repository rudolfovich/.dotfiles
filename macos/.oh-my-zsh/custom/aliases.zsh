alias l='/bin/ls -lah'
alias la='/bin/ls -lAh'
alias ll='/bin/ls -lh'
alias ls='/bin/ls -G'
alias lsa='/bin/ls -lah'

alias miniLog='ssh "pm" "tail -fn30 /var/log/messages" | colorize.py'

alias nanoLog='ssh "pn" "tail -fn30 /var/log/messages" | colorize.py'
