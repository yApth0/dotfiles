export PATH="$HOME/.local/bin:$PATH"
export code="$HOME/coding/"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# powerlevel 10k
zinit ice depth=1;
zinit light romkatv/powerlevel10k

# this is customized to half-life
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# i'm finding syntax highlighting not great
# zinit light zsh-users/zsh-syntax-highlighting
# source "${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/zsh-syntax-highlighting.zsh"

# autocompletion + autosuggestions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

# this is customized to half-life
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# yellow dirs -> match half-life lambda
LS_COLORS=$LS_COLORS:'di=1;93:';
export LS_COLORS

# globals
typeset -g ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# keybinds
bindkey -e

# aliases
alias ls="ls --color"

# fzf integration
eval "$(fzf --zsh)"
