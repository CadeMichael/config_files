#git status

# Load version control information
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr       "!"
zstyle ':vcs_info:git:*' formats '%F{magenta}(%b%u)%f'

setopt PROMPT_SUBST
PROMPT='%F{green}[%~%f${vcs_info_msg_0_}%F{green}]%% %f'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

autoload -Uz compinit && compinit
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#Homebrew upgrade message
#libffi is keg-only, which means it was not symlinked into /usr/local,
#because macOS already provides this software and installing another version in
#parallel can cause all kinds of trouble.

#For compilers to find libffi you may need to set:
#  export LDFLAGS="-L/usr/local/opt/libffi/lib"
#  export CPPFLAGS="-I/usr/local/opt/libffi/include"

#For pkg-config to find libffi you may need to set:
#  export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# c/c++ server
export PATH=":/usr/local/opt/llvm/bin:$PATH"
# go 
export GOBIN="/Users/cadelueker/go/bin"
export PATH=$PATH:$GOBIN

# not sure what sbin is but...
export PATH="/usr/local/sbin:$PATH"
# Haskell
[ -f "/Users/cadelueker/.ghcup/env" ] && source "/Users/cadelueker/.ghcup/env" # ghcup-env
source "$HOME/.cargo/env"

alias save-notes='git pull && git add . && git commit -m "notes" && git push'
alias nvconf='nvim ~/.config/nvim/init.vim'

# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/auto-ls.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # has to be sourced last
