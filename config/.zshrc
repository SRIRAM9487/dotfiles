autoload -Uz vcs_info
autoload -U colors
colors

REPORTTIME=3

PROMPT_EOL_MARK=''
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000

setopt INC_APPEND_HISTORY

setopt EXTENDED_HISTORY

setopt HIST_IGNORE_ALL_DUPS

setopt HIST_IGNORE_SPACE


zstyle ':completion:*' completer _complete _correct _approximate 
zstyle ':vcs_info:*' stagedstr '%F{green}●%f '
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f '
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%F{blue}%b%f %u%c"

unsetopt correct
unsetopt correct_all
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt nocaseglob
zstyle ':completion:*' list-colors 'di=34:fi=35:ln=32:pi=33:so=36:bd=40;1:cd=40;1'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %S%p%%

autoload -Uz compinit
compinit


_setup_ps1() {
  vcs_info
  GLYPH="▲"
  [ "x$KEYMAP" = "xvicmd" ] && GLYPH="▼"

  PS1="%F{magenta}%n@%m%f "                            
  PS1+="%(?.%F{green}✓%f.%F{red}✗%f) "                 
  PS1+="$GLYPH "                                       
  PS1+="%(1j.%F{cyan}[%j]%f .)"                        
  PS1+="%F{blue}%~%f $ "                               
  PS1+="%(!.%F{red}#%f .)"                             

  RPROMPT="$vcs_info_msg_0_"
}

_setup_ps1


# Vi mode
zle-keymap-select () {
 _setup_ps1
  zle reset-prompt
}
zle -N zle-keymap-select
zle-line-init () {
  zle -K viins
}
zle -N zle-line-init
bindkey -v

# --------- CUSTOM PATHS -----------
export SCRIPT_FOLDER=/home/sriram/bin/script
export PATH=$SCRIPT_FOLDER:$PATH

# --------- ON START -----------

# --------- BINDING -----------
alias h="mvn spring-boot:run"
alias m="javac *.java && java Main"
alias ta="tmux -u a"
alias t="tmux"
alias n="nvim ."

# --------- JAVA -----------
# export JAVA_HOME=/opt/jdk-21.0.9/
export JAVA_HOME=/opt/jdk-25.0.1
export INTELLIJ=/opt/idea-IU-252.25557.131
export CARGO_PATH=~/.cargo/bin/
export PATH=$JAVA_HOME/bin:$INTELLIJ/bin:$PATH/$CARGO_PATH

# ---- YAZI------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

