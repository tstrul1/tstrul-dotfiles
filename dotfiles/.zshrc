# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#export PATH=$PATH:$HOME/bin:/usr/local/bin:$PATH:~/Library/Python/2.7/bin:~/bin:~/.npm-global/bin:${KREW_ROOT:-$HOME/.krew}/bin
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH:~/Library/Python/2.7/bin"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME_RANDOM_CANDIDATES=(
#     "robbyrussell"
#     "dracula"
# )
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(
    ansible
    autoupdate
    aws
    common-aliases
    docker
    git
    kubectl
    minikube
    colorize
    gradle
    helm
    colored-man-pages
    z
    ssh-agent
    zsh-autosuggestions
    zsh-syntax-highlighting
)
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities ## ADD PEM FILES. EXAMPLE: "id_rsa LabKey.pem"
source $ZSH/oh-my-zsh.sh
autoload -U +X bashcompinit && bashcompinit



# Set Locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8


#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [[ -f /usr/local/opt/kube-ps1/share/kube-ps1.sh ]];then
    source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
    # PS1=$PS1'$(kube_ps1): '
    unset POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND

fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f ~/.aliases.zsh ]; then
    . ~/.aliases.zsh
fi
