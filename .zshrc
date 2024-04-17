export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="candy"
plugins=(git)

source $ZSH/oh-my-zsh.sh
alias ohmyzsh="mate ~/.oh-my-zsh"

# zplug の設定
export ZPLUG_HOME="$HOME/.zplug"
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
if ! zplug check --verbose; then
    printf "Install zplug plugins...\n"
    zplug install
fi
zplug load --verbose

alias sl="ls"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias tmuxconf="vim ~/.tmux.conf"
alias ta="tmux a -t" 
alias taa="tmux a" 
alias tn="tmux new -s" 
alias tls="tmux ls" 
alias reload="source ~/.zshrc" 
autoload -U compinit
export PATH=$PATH:$HOME/.cargo/bin

setopt auto_pushd
setopt correct
setopt share_history
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt no_beep
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' use-cache on 
zstyle ':completion:*' cache-path ~/.zsh/cache 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fd() {
  local dir
  dir=$(find . -type d ! -name .git 2> /dev/null | fzf +m) && cd "$dir"
}
function vim-fzf-find() {
  local FILE=$(find ./ -path '*/\.*' -name .git -prune -o -type f -print 2> /dev/null | fzf +m)
  if [ -n "$FILE" ]; then
    ${EDITOR:-vim} $FILE
  fi
  }
alias fv=vim-fzf-find

function buffer-fzf-history() {
  local HISTORY=$(history -n -r 1 | fzf +m)
  BUFFER=$HISTORY
  if [ -n "$HISTORY" ]; then
    CURSOR=$#BUFFER
  else
    zle accept-line
  fi
  }
zle -N buffer-fzf-history
bindkey '^R' buffer-fzf-history

function mopen() {
    if [ $# != 1 ]; then
        explorer.exe .
    else
        if [ -e $1 ]; then
            cmd.exe /c start $(wslpath -w $1) 2> /dev/null
        else
            echo "open: $1 : No such file or directory"
        fi
    fi
}

clear
