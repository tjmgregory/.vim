set -o vi

export VIM_DIR=~/.vim

export RIPGREP_CONFIG_PATH=~/.vim/.ripgreprc
export FZF_DEFAULT_COMMAND='rg --debug --files --hidden'
export FZF_DEFAULT_OPTS='--ansi --preview="bat --style=numbers --color=always {1}" --preview-window "right:60%" --layout reverse --margin=1,4 --bind "ctrl-n:down,ctrl-p:up,ctrl-b:preview-down,ctrl-o:preview-up"'

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

export HISTSIZE=1000000

source "$VIM_DIR/.zsh_aliases/git.zsh"

export EDITOR="vi -e"
export VISUAL="vim"

alias vimconf="cd $VIM_DIR; vim; cd -"

# ctags for mac
alias ctags='/usr/local/opt/universal-ctags/bin/ctags'

# lazygit
alias gg='lazygit'

# Useful scripts
alias formatjson='pbpaste | python -m json.tool | pbcopy'
alias isodate='date -u +"%Y-%m-%dT%H:%M:%SZ" | tr -d '\n' | tee >(pbcopy)'
alias ll='ls -la'
alias rmswp="find . -type f -name \"*.sw[klmnop]\" -delete"
alias text="pbpaste | pbcopy"
alias uuid='python -c "import uuid; import sys; sys.stdout.write(\"{}\".format(uuid.uuid4()))" | tee >(pbcopy)'
alias vimm="vim -u NONE -U NONE -N -i NONE"
function sha1 { echo -n "$1" | openssl sha1 | tee >(pbcopy) }

# Full scripts
SCRIPT_DIR="$VIM_DIR/scripts"
alias vid_to_gif="$SCRIPT_DIR/vid_to_gif.sh"

# Home IoT devices
alias mark='ssh pi@192.168.1.103'
alias jez='ssh ubuntu@192.168.1.212'

# Elephant
alias hunt='kill -KILL $(ps aux | grep node | grep -v vim | grep -v grep | sed -E '"'"'s/^[[:alnum:]]+[[:blank:]]+([[:alnum:]]+).*/\1/'"'"')'

export ELEPHANT_DIR=~/elephant
export PRIMARY_CARE_PILOT="$ELEPHANT_DIR/primary-care-pilot"
export PRIMARY_CARE_PILOT_PACKAGES="$PRIMARY_CARE_PILOT/packages"
alias elpi='cd $PRIMARY_CARE_PILOT'
alias elcl='cd $PRIMARY_CARE_PILOT_PACKAGES/api-clinical-product'
alias elin='cd $PRIMARY_CARE_PILOT_PACKAGES/api-inventory'
alias elpr='cd $PRIMARY_CARE_PILOT_PACKAGES/api-prescription'
alias elwe='cd $PRIMARY_CARE_PILOT_PACKAGES/primary-care-web'
alias el='cd $ELEPHANT_DIR/primary-care-pilot'
alias elrf='cd $ELEPHANT_DIR/rfcs'
alias elte='cd $ELEPHANT_DIR/terraform'
alias elku='cd $ELEPHANT_DIR/platform-kube-job-runner'
