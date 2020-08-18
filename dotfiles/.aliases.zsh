alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias reload="source ~/.zshrc"
alias tzgit='cd ~/Github_Projects'
alias diff='colordiff'
alias startweb='python -m SimpleHTTPServer 8000'
alias svim="sudo vim"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias please='sudo $(fc -ln -1)'
fixhost() {
        sed -e $1d -i ~/.ssh/known_hosts
}
# Open the github page of the repo you're in, in the browser
function opengit () { git remote -v | awk 'NR==1{print $2}' | sed -e 's?\.git$??' -e "s?git@?https://?" -e "s?https///?https://?g" | xargs open }
function kubeshell() { kubectl exec -ti $@ -- /bin/sh; }
source ~/Credentials/aliases.zsh
