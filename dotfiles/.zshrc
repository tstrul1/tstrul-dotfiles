# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH:$HOME/Library/Python/2.7/bin:$HOME/Library/Python/3.8/bin"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# Set Locale
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ -f /usr/local/opt/kube-ps1/share/kube-ps1.sh ]];then
    source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
fi

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Use Antigen
source $HOME/antigen.zsh

# Use oh-my-zsh
antigen use oh-my-zsh

# Set theme
antigen theme https://github.com/romkatv/powerlevel10k powerlevel10k

# Set plugins
antigen bundle zsh-agent
antigen bundle z
antigen bundle common-aliases
antigen bundle colorize
antigen bundle colored-man-pages
antigen bundle command-not-found
antigen bundle git
antigen bundle terraform
antigen bundle docker
antigen bundle aws
antigen bundle gcloud
antigen bundle heroku
antigen bundle kubectl
antigen bundle minikube
antigen bundle helm
antigen bundle gradle
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle TamCore/autoupdate-oh-my-zsh-plugins
antigen bundle unixorn/autoupdate-antigen.zshplugin

# Apply changes
antigen apply

autoload -U +X bashcompinit && bashcompinit
autoload -U compinit && compinit
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa deployerL.pem  deployer.pem  id_rsa_adm.pem  LabKey.pem  pulsar-prod.pem  smartexe.pem  terraform-prod.pem  terraform-stg.pem Jenkins.pem microcosm-prod.pem microcosm.pem ## ADD PEM FILES. EXAMPLE: "id_rsa LabKey.pem"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
