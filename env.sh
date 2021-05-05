set -o vi

export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_DEFAULT_OPTS='--ansi --preview="bat --style=numbers --color=always {1}" --preview-window "right:60%" --layout reverse --margin=1,4 --bind "ctrl-n:down,ctrl-p:up,ctrl-b:preview-down,ctrl-o:preview-up"'

alias vimm="vim -u NONE -U NONE -N -i NONE"

export VIM_DIR=~/.vim
function vco(){
    FAILURE=0
    OUTPUT=""
    CURR_DIR=$(pwd)

    cd $VIM_DIR
    OUTPUT+=$(git submodule deinit --all -f) > /dev/null 2>&1
    FAILURE+=$?
    OUTPUT+=$(git checkout $1) > /dev/null 2>&1
    FAILURE+=$?
    OUTPUT+=$(git submodule update --init --recursive) > /dev/null 2>&1
    FAILURE+=$?
    cd $CURR_DIR

    if [[ $FAILURE -eq 0 ]]
    then
        echo "Successfully checked out VIM setup '$1'"
    else
        echo "Failed to switch VIM setup, printing output."
        echo $OUTPUT
    fi
}

alias rmswp="find . -type f -name \"*.sw[klmnop]\" -delete"

export HISTSIZE=1000000

