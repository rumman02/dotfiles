#  ______ _____ _    _ 
# |___  // ____| |  | |
#    / /| (___ | |__| |
#   / /  \___ \|  __  |
#  / /__ ____) | |  | |
# /_____|_____/|_|  |_|
# https://www.zsh.org

#==================================================# 
#                very first command                #
#==================================================# 

#==================================================# 
#                     p10klevel                    #
#==================================================# 
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION="  "
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION="  "
#==================================================# 
#                  plugin manager                  #
#==================================================# 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"
# zinit zstatus - run this command for zinit status
#==================================================# 
#                     plugin                       #
#==================================================# 
zinit ice depth=1
zinit light romkatv/powerlevel10k	# ui/beauty plugin (p10klevel)
zinit light zsh-users/zsh-syntax-highlighting # file/syntax highlight color for zsh
zinit light zsh-users/zsh-completions	# auto completions in zsh
zinit light zsh-users/zsh-autosuggestions	# auto suggest in zsh
zinit light ajeetdsouza/zoxide # quickly navigate to your path using your previous path history
zinit light Aloxaf/fzf-tab # tab button for fzf
zinit light jeffreytse/zsh-vi-mode # zsh vim mode

# other plugins from oh-my-zsh and many more like this
# INSTALLATION REQUIRED: fzf, zoxide
# insatll from your package manager ex: brew, pacman, apt, yay etc
zinit snippet OMZP::fzf
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::zoxide
#==================================================# 
#                  plugin setting                  #
#==================================================# 
autoload -U compinit && compinit
zinit cdreplay -q

# shows this error line while p10k setup end
# [ gitstatus_stop_p9k_:zle:41: No handler installed for fd 14 ]
# [ gitstatus_stop_p9k_:49: failed to close file descriptor 14: bad file descriptor ]
# so fix it by this
unset ZSH_AUTOSUGGEST_USE_ASYNC
#==================================================# 
#                     keybind                      #
#==================================================# 
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
#==================================================# 
#                     setting                      #
#==================================================# 
HISTSIZE=10000
HISTFILE=~/.zsh_history # changing will break zsh-autosuggestions SAVEHIST=$HISTSIZE
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
#==================================================# 
#                   shell style                    #
#==================================================# 
zstyle ':completion:*' menu no # disable the default completion menu on tab
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # enable case-insensitive completion
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}' # use colors for completion matching ls --color
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath' # enable colored preview for 'cd' completions
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath' # enable colored preview for zoxide directory completions
#==================================================# 
#                     aliase                       #
#==================================================# 
alias ls="ls --color" # modify ls command for better view
alias c="clear"
alias p10k="p10k configure"
alias fnvim="fzf | xargs nvim"
alias ta="tmux attach"
alias tls="tmux ls"
alias tka='tmux kill-server'
alias ..="cd .."
alias 1..="cd ../"
alias 2..="cd ../../"
alias 3..="cd ../../../"
alias 4..="cd ../../../../"
alias 5..="cd ../../../../../"
#==================================================# 
#                shell integration                 #
#==================================================# 
eval "$(fzf --zsh)"

# if you're using macOS, you'll want this enabled
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
#==================================================# 
#               zsh vim mode config                #
#==================================================# 
# change to Zsh's default readkey engine
ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE

# speed up to enter insert and normal mode
ZVM_KEYTIMEOUT=0.1
ZVM_ESCAPE_KEYTIMEOUT=0.1

# set default mode as normal mode
ZVM_LINE_INIT_MODE=$ZVM_MODE_NORMAL

# enables blinking cursor
ZVM_CURSOR_STYLE_ENABLED=true
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_VISUAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_VISUAL_LINE_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
#==================================================# 
#                very last command                 #
#==================================================# 

#==================================================# 
#                   executable                     #
#==================================================# 

