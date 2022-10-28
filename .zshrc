#ALIAS
  #ALIAS VAGRANT
alias vaup="vagrant up"
alias vs="vagrant snapshot"  
alias vss="vagrant snapshot save"
alias vsr="vagrant snapshot restore"
alias vp="vagrant provision"
alias vssha="vagrant ssh adictos"
alias vsshau="vagrant ssh autentia"

  #OTROS ALIAS
alias ll="lsd -la"
alias dircolors="gdircolors"
alias ls='gls --color=auto'
alias dir='gdir --color=auto'
alias grep='grep --color=auto'
alias temp='pmset -g thermlog'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias zreset='source ~/.zshrc'
alias vi='vim'

# COLORES
export LS_COLORS="$(vivid generate snazzy)"

#------Autocompletion---------

source $HOME/.zsh/completion.zsh

# Initialize the completion system
autoload -Uz compinit

# Cache completion if nothing changed - faster startup time
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

# Enhanced form of menu completion called `menu selection'
zmodload -i zsh/complist

#______________________

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source $HOME/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
