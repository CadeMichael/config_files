# config_files

- these include files that I use on my **Arch** Desktop / macbook running **the mac os**/ raspberry pi running **arch arm**
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

## .vimrc -- UNUSED

- trying to learn vim and become more of a terminal poweruser
- installed vim-plug via their autoinstaller to make it easy to add to future machines (no need to reinstall just source the rc and you're done)
- after sourcing run `:PlugInstall` and you should be good to go!
- installed NERDTree, fzf, and autocomplpop to give vim more of a 'modern' text editor feel and make it less bare bones

## Fully switched to NVIM
- two init.vim files one with **kite** and **deoplete** in addition to vim-lsc for auto complete. The second just uses vim-lsc and AucoComplPop for a lightweight autocomplete. Might use CoC but not ready to ride it yet (a bit too much does more than I'd like). Might add ale for linting in the future but as of right now these configs are sufficient. 

- Reasons for vim-lsc
  - very lightweight
  - made for dart (with affiliated plugin), I'd say this is a must for Flutter mobile dev in vim
- reasons for Deoplete
  - deoplete works with vsnip and gives suggestions for your snippets.
  - Deoplete for Omni-complete with vim-go compatibility for golang completion. 
- downside of Deoplete
  - conflicts with vim-lsc with cpp files so I disabled it
  - conflicts with kite for python
  - not huge downsides as you can disable deoplete for these filetypes
  

*eventually want to get a language server running and migrate from vs-code to vim for Flutter dev*

- using vim-lsc and the dart vim plugin offers great autocomplete for flutter dev as well as python and c++
  - vim-lsc is also great for python and c++ autocomplete. I have an example of c++ using clangd in this vimrc
- the init.vim is for ***NeoVim***, it allows it to use the same config as I am using for vim.
  - I am choosing to use neovim over vim as it is community driven versus a passion project and aligns more with what *(subjective opinion)* I belive open source software should be about.
