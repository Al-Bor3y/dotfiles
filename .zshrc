emulate sh -c '. /data/data/com.termux/files/usr/etc/profile'

command_not_found_handler() {
        /data/data/com.termux/files/usr/libexec/termux/command-not-found $1
}
# History Configuration
HISTFILE=$HOME/.zsh/zsh_history
HISTSIZE=1000000             # In-memory history size
SAVEHIST=1000000             # Number of lines saved to $HISTFILE

# History Behavior
setopt INC_APPEND_HISTORY    # Write to history immediately
setopt SHARE_HISTORY         # Share history across sessions
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Shell Behavior
setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

# Key Bindings
bindkey -e
bindkey '^[[3~' delete-char          # Delete
bindkey '^[[1;5C' forward-word       # Ctrl + →
bindkey '^[[1;5D' backward-word      # Ctrl + ←
bindkey '^[[Z' end-of-line           # Shift + Tab

# Completion Tuning
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U compinit && compinit

# Catppuccin Mocha LS_COLORS
eval "$(dircolors -b <<EOF
LS_COLORS="\
di=1;34:\
ln=1;36:\
so=1;35:\
pi=1;33:\
ex=1;92:\
bd=1;93:\
cd=1;93:\
su=1;91:\
sg=1;93:\
tw=1;94:\
ow=1;94:\
or=1;31:\
mi=1;31:\
*.tar=1;31:\
*.zip=1;31:\
*.7z=1;31:\
*.gz=1;31:\
*.xz=1;31:\
*.rar=1;31:\
*.zst=1;31:\
*.mp3=1;95:\
*.ogg=1;95:\
*.flac=1;95:\
*.mp4=1;96:\
*.mkv=1;96:\
*.webm=1;96:\
*.jpg=1;35:\
*.jpeg=1;35:\
*.png=1;35:\
*.svg=1;35:\
*.gif=1;35:\
*.pdf=1;91:\
*.c=1;32:\
*.cpp=1;32:\
*.h=1;32:\
*.sh=1;33:\
*.zsh=1;33:\
*.py=1;33"
export LS_COLORS
EOF
)"

# Aliases
alias ls='ls --color=auto'
alias client='python3 ~/Cashier/main.py'
alias clients='python3 ~/Cashier/main.py --get-all'

# Autosuggestions
source /data/data/com.termux/files/usr/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax Highlighting
source $HOME/.zsh/catppuccin-syntax-highlighting.zsh
source /data/data/com.termux/files/usr/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Colors (Catppuccin Mocha - Lavender Accent)
autoload -U colors && colors
ROSEWATER="%F{223}"
FLAMINGO="%F{217}"
LAVENDER="%F{147}"
BLUE="%F{117}"
SKY="%F{123}"
TEAL="%F{86}"
GREEN="%F{114}"
YELLOW="%F{229}"
PEACH="%F{215}"
RED="%F{203}"
SUBTEXT0="%F{103}"
SURFACE1="%F{238}"
RESET="%f"

# Git Info
autoload -Uz vcs_info

# Remove end-of-line marker
PROMPT_EOL_MARK=""

# Prompt Timer
preexec() {
  CMD_START_TIME=$(date +%s)
}

format_time() {
  local end=$(date +%s)
  local elapsed=$(( end - CMD_START_TIME ))

  local d=$(( elapsed / 86400 ))
  local h=$(( (elapsed % 86400) / 3600 ))
  local m=$(( (elapsed % 3600) / 60 ))
  local s=$(( elapsed % 60 ))

  local out=""
  (( d > 0 )) && out+="${d}d "
  (( h > 0 )) && out+="${h}h "
  (( m > 0 )) && out+="${m}m "
  (( s > 0 )) && out+="${s}s "

  echo "${out%% }"
}

precmd() {
  last_exit=$?
  vcs_info

  if [[ -n "$CMD_START_TIME" ]]; then
	  local elapsed_time=$(format_time)
	  if [[ ! -z $elapsed_time ]]; then
		  RPROMPT="${SUBTEXT0}${elapsed_time} 󱎫${RESET}"
	  else
		  unset RPROMPT
	  fi
  else
    unset RPROMPT
  fi

  unset CMD_START_TIME
  set_prompt $last_exit
}

# Prompt Setup
function set_prompt() {
  local last_exit=$1
  local exit_info=""
  local user_host="${LAVENDER}%n@%m"
  local dir="${BLUE}%~"
  local git=""

  if [[ -n ${vcs_info_msg_0_} ]]; then
    git=" ${YELLOW}{${vcs_info_msg_0_} }"
  fi

  if [[ $last_exit -ne 0 ]]; then
    exit_info="${RED}${last_exit}${RESET} "
  fi

  PROMPT="${exit_info}${user_host} ${dir}${git}
${GREEN}❯ ${RESET}"
}

# Load environment variables
#source ~/.profile
