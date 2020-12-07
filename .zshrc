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
