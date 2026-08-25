# Prompt
autoload -U colors && colors
autoload -Uz vcs_info
setopt prompt_subst
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{#7f849c}(%b)%f'
zstyle ':vcs_info:*' enable git
PROMPT='%F{#7f849c}[%*]%f %F{#89b4fa}%~%f${vcs_info_msg_0_} %F{#cba6f7}%#%f '

# ZSH history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          # Share history instantly across active panes
setopt HIST_IGNORE_ALL_DUPS   # Suppress duplicate entries from storage
setopt HIST_REDUCE_BLANKS     # Trim extra whitespace blocks

# Tab completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Load configuration
ZSH_CONFIG="$HOME/.config/zsh"

[[ -f "$ZSH_CONFIG/env.zsh" ]]       && source "$ZSH_CONFIG/env.zsh"
[[ -f "$ZSH_CONFIG/aliases.zsh" ]]   && source "$ZSH_CONFIG/aliases.zsh"
[[ -f "$ZSH_CONFIG/functions.zsh" ]] && source "$ZSH_CONFIG/functions.zsh"
[[ -f "$ZSH_CONFIG/completions.zsh" ]] && source "$ZSH_CONFIG/completions.zsh"

# Extension packages
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

