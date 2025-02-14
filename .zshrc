###############################################################################
# General Settings
###############################################################################
# language locale
export LANG=en_US.UTF-8

# theme - "robbyrussell" "passion" "powerlevel10k/powerlevel10k"
ZSH_THEME="robbyrussell"
if [ "$TERM_PROGRAM" = "iTerm.app" ]; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

###############################################################################
# Custom Functions, Paths & Plugins
###############################################################################
# load custom zsh functions
fpath=(~/.zfunc $fpath)
autoload -Uz ${fpath[1]}/*(:t)

# append path of local bin
export PATH="$PATH:~/.local/bin"

###############################################################################
# Environment & Tool Integrations
###############################################################################
# kill docker processes (excluding vmnetd)
function kdo() {
    ps ax | grep -i docker | egrep -iv 'grep|com.docker.vmnetd' | awk '{print $1}' | xargs kill
}

# man page coloring
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

###############################################################################
# Aliases & Shortcuts
###############################################################################
# reload shell configuration
alias reload='source ~/.zshrc'

# utility aliases
alias myip='curl -s ipinfo.io/ip'
alias ports='lsof -i -P -n | grep LISTEN'

# shortcuts for common commands
alias lsd='lsd --date=relative --group-dirs=first --size=short -l' # lsd group first
alias glg="git log --graph --oneline --decorate" # pretty git log

# neovim
alias nv="nvim"
alias nvv='fd -tf -td -E node_modules -E .git --hidden | fzf-tmux --reverse | xargs nvim' # open selected file in nvim

# mac-specific aliases and applications
if [[ "$(uname)" == "Darwin" ]]; then
  # apps
  alias idea='open -a "$(ls -dt /Applications/IntelliJ\ IDEA* | head -1)"'
  alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
  # x86 emulation aliases
  alias ibrew='arch -x86_64 /usr/local/bin/brew'
  alias tox86='arch -x86_64 zsh'
  alias igcc='clang -arch x86_64 -masm=intel'
  # llm
  alias @cop='gh copilot explain'
  alias @gpt='/opt/homebrew/bin/gpt'
fi
