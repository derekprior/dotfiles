# Perforce Settings
export P4CONFIG=.perforce
export P4USER=dprior
export P4PORT='rsh:ssh -q -a -x -l p4ssh perforce /bin /true'
alias p4s='p4 submit'
alias p4a='p4 add'
alias p4e='p4 edit'
alias p4o='p4 opened'
alias p4d='p4 describe'
alias p4aa='find . -type f ! -name ".DS_Store" -print | p4 -x - add'
