# Use colors in coreutils utilities output
alias ls='ls --color=auto'
export GREP_OPTIONS="--color"

# ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls'

# Update dotfiles
function dfu() {
    (
        cd ~/.dotfiles && git pullff && ./install -q
    )
}

# Use pip without requiring virtualenv
function syspip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# cd to git root directory
alias cdgr='cd "$(git root)"'

# Jump to directory containing file
function jump() {
    cd "$(dirname ${1})"
}

# cd replacement for screen to track cwd (like tmux)
function scr_cd()
{
    builtin cd $1
    screen -X chdir $PWD
}

if [[ -n $STY ]]; then
    alias cd=scr_cd
fi

# Go up [n] directories
function up()
{
    if [[ "${1}" == "" ]]; then
        cd ..
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for i in {1..${1}}; do
            cd ..
        done
    fi
}

# Execute a command in a specific directory
function in() {
    (
        cd ${1} && shift && ${@}
    )
}

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'
