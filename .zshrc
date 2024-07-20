export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="candy"
plugins=(git)

source $ZSH/oh-my-zsh.sh
alias ohmyzsh="make ~/.oh-my-zsh"

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

if [ ! -f ~/.cd_history ]; then
  touch ~/.cd_history
fi

function chpwd(){
  append_cd_history
}
function append_cd_history(){
  echo "$(pwd -L)" >> ~/.cd_history
}

function dcd(){
  cd "$(tail -n +$1 ~/.cd_history | head -1)" && pwd -L
}
function drm(){
  sed -i "$1d" ~/.cd_history
}
alias dclean='awk '\''{ seen[$0] = NR } END { for (line in seen) print seen[line], line }'\'' ~/.cd_history | sort -k1,1n | cut -d" " -f2- > ~/.cd_history.temp && mv ~/.cd_history.temp ~/.cd_history'
alias dhist='dclean && cat -n ~/.cd_history | tail -n -10'
alias dless='dclean && less -N ~/.cd_history'
alias dhis='dhist'
alias dhi='dhist'
alias dls='dhist'
alias dles='dless'
alias cdhistory='dclean && vim ~/.cd_history'

alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"
alias gitconfig="vim ~/.gitconfig"
alias nvim="~/nvim.appimage"
alias zshrc="vim ~/.zshrc"
alias tmuxconf="vim ~/.tmux.conf"
alias reload="source ~/.zshrc"
alias reloa="source ~/.zshrc"
alias relo="source ~/.zshrc"
alias mv='mv'
alias cp='cp'
alias tree='tree -C'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vim.='vim ./'
alias vim./='vim ./'
alias v='vim'
alias vi='vim'
alias t='tmux'
alias ta="tmux a -t"
alias taa="tmux a"
alias tn="tmux new -s"
alias tls="tmux ls"
alias tkill='tmux kill-session -t'
alias tkillall='tmux kill-server'


alias dc="cd"
alias dc..="cd ../"
alias dc.="cd ../"
alias dc../="cd ../"
alias cd..="cd ../"
alias cd.="cd ../"
alias cd../="cd ../"
alias cd-='cd -'
alias sl='ls'
alias ks='ls'
alias sk='ls'
alias ls="ls -F --color=auto --group-directories-first"
alias ll='ls -thl --time-style=+"%Y/%m/%d %H:%M:%S"'
alias sl="ls"
alias ks="ls"
alias lla='la'
alias les='less'
alias v.='vim ./'
alias v./='vim ./'
alias vi.='vim ./'
alias vi./='vim ./'
alias maek='make'
alias amek='make'
alias amke='make'
alias meka='make'

alias g='git'
alias gi='git'
alias gst='git status'
alias ga='git add'
alias gaa='git add -A'
alias gap='git add -p'
alias gb='git branch'
alias gbd='git branch -d'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gps='git push'
alias gpl='git pull'
alias gl='git log'
alias glog='git log'
alias gvl='git vlog'
alias gvlog='git vlog'
alias glp='git log -p'
alias gvlp='git vlog -p'
alias glogp='git log -p'
alias gvlogp='git vlog -p'
alias gd='git diff'
alias gdt='git difftool'
alias gdiff='git diff'
alias gdifftool='git difftool'
alias gvimdiff='git difftool'
alias gvd='git difftool'
alias gvdiff='git difftool'
alias gsta='git stash'
alias gstu='git stash -u'
alias gstum='git stash -u -m'
alias gstp='git stash pop'
alias gmr='git merge'

autoload -U compinit
compinit -u
export PATH=$PATH:$HOME/.cargo/bin
export TERM="xterm-256color"
export TERM="screen-256color"
export COLORTERM=truecolor

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
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

#for WSL
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

