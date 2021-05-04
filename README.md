# config_files

- these include files that I use on my mini atx Desktop running **Arch GNU/Linux** / macbook running **the mac os**/ raspberry pi running **arch arm**
- by no means a power user but I try to add some custom shortcuts / things that make my life a bit easier

(main files)

## picom

- I am using a custom [picom](https://github.com/jonaburg/picom) which allows for rounded corners and better transparent blurring

## rc.lua

- I use [awesomeWM](https://wiki.archlinux.org/index.php/Awesome) with Arch and have gotten it somewhat usable for almost all daily tasks and got through a semester of online classes with it on an old thinkpad
- I have some simple edits and preferences

## config.txt

- this allows my pi to work with my otherwise unrecognizble offbrand monitor by setting the exact resolution from one of the HDMI ports

## .zshrc

- very minimalist zsh setup on my mac
- shows when I make an update to a git repo and the current directory without crowding the terminal
```zsh
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
---

# getting path completion 

autoload -Uz compinit && compinit
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 
```

- plugins 
    - [autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
    - [autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## .vimrc -- UNUSED

- trying to learn vim and become more of a terminal poweruser
- installed vim-plug via their autoinstaller to make it easy to add to future machines (no need to reinstall just source the rc and you're done)
- after sourcing run `:PlugInstall` and you should be good to go!
- installed NERDTree, fzf, and autocomplpop to give vim more of a 'modern' text editor feel and make it less bare bones

## Fully switched to NVIM
- two init.vim files one with **deoplete** and **ale** for android. The second **CoC** for autocomplete. 

- Reasons for CoC
  - CoC is really the best completion engine. I tried to resist using it and only use lightweight plugins. but with it's own mini plugin extension network it is unparalleled. 
  - I finally switched as I saw myself using vim less due to some of the shortcomings of the other autocompletes and made the switch.
  - the integration with Dart is amazing it feels almost like a full fledged IDE without all of the bloat
- Reasons for vim-lsc (Depreciated)
  - very lightweight
  - made for dart (with affiliated plugin), I'd say this is a must for Flutter mobile dev in vim
  - **why I stopped using**
  - it was having a lot of difficulty working with other completion engines like deoplete and the snippet integration wasn't as good as I'd like. This lead me to finally take the plunge and use CoC
- reasons for Deoplete
  - deoplete works with vsnip and gives suggestions for your snippets.
  - Deoplete for Omni-complete with vim-go compatibility for golang completion. 
  - works on Termux with android for tablet use in a pinch
- downside of Deoplete
  - conflicts with vim-lsc with cpp files so I disabled it
  - conflicts with kite for python
  - not huge downsides as you can disable deoplete for these filetypes
  
