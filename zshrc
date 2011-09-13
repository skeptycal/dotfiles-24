# PS1
autoload -U colors && colors

if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%{$fg[blue]%}+%m%3 %{$fg[yellow]%}$(git_info_for_prompt)$reset_color%}%{$fg[blue]%}>$reset_color%} '
else
  export PS1='%{$fg[blue]%}+%3 %{$fg[yellow]%}$(git_info_for_prompt)$reset_color%}%{$fg[blue]%}>$reset_color%} '
fi

export EDITOR='vim'
bindkey -e # Still use emacs bindings
export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:/usr/local/mysql/man:$MANPATH"

# Rubygems
export GEM_PATH="$HOME/.gem/ruby/1.8"
export GEM_HOME="$HOME/.gem/ruby/1.8"
export PATH="$HOME/.gem/ruby/1.8/bin:$PATH"

# Functions
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
REPORTTIME=10 # print elapsed time when more than 10 seconds

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# Keys
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[3~' delete-char

# Imports
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
