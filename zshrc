export PATH="$HOME/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

PROMPT="[%n @ %m] ~ "
zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''

# alias b='buku --suggest'
# autoload -Uz $HOME/.zsh/completions/_buku
# compdef _buku buku

eval "$(atuin init zsh)"

eval "$(atuin init zsh)"

# aliases
alias v="vim"
alias ls="ls -lvah"
alias python='python3'

source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
