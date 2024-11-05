export LANG=en_US.UTF-8


# theme
if [ "$TERM_PROGRAM" = "iTerm.app" ] # use 10k only in iterm
then
    ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# load custom zsh plugins (put plugins in `~/.zfunc`)
fpath=(~/.zfunc $fpath)
autoload -Uz ${fpath[1]}/*(:t)

# append path of local bin
export PATH="$PATH:~/.local/bin"

# alias
alias lsd='lsd --date=relative --group-dirs=first --size=short -l' # lsd group first
alias glg="git log --graph --oneline --decorate" # pretty git log
# neovim
alias nv="nvim"
alias nvv='fd -tf -td -E node_modules -E .git --hidden | fzf-tmux --reverse | xargs nvim' # open selected file in nvim
# intellij
alias idea='open -a "`ls -dt /Applications/IntelliJ\ IDEA*|head -1`"'
# x86 in silicon mac
alias ibrew='arch -x86_64 /usr/local/bin/brew'
alias tox86='arch -x86_64 zsh'
alias igcc='clang -arch x86_64 -masm=intel'

# macro for killing Docker Desktop and VM
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
