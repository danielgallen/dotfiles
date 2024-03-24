# History in cache directory 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

export _JAVA_AWT_WM_NONREPARENTING=1

# Vi mode
bindkey -v
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# No BEEP
unsetopt beep

# The following lines were added by compinstall
zstyle :compinstall filename '/home/tubbytoad/.zshrc'

# Autocomplete
autoload -Uz compinit
compinit

# Version control info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{red}[%b]%f'

# More completions (less stable)
# source /usr/share/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh

# Autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^Y' autosuggest-accept
bindkey '^[[3;5~' autosuggest-clear

# Autojump (Rust AUR package)
source /usr/share/autojump/autojump.zsh

# Prompt
PS1='-> %2~ ${vcs_info_msg_0_}%# '
autoload -Uz promptinit
promptinit

# Aliases
alias ls='ls --color=auto'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias s="kitty +kitten ssh"
alias fv='fzf --print0 | xargs -0 -o nvim'
alias rm='echo "This is not the command you are looking for. del (trash-put) is safer. (Backslash in front to use rm anyways)"; false'
alias del='sudo trash-put'
alias workrandr='xrandr --output DP-0 --off --output HDMI-0 --off'

# Syntax highlighting AUR package. Source after other plugins 
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
