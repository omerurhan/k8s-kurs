source ~/kube-ps1/kube-ps1.sh
PS1='[\u@\h \W $(kube_ps1)]\$ '

alias k="kubectl"
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace '



