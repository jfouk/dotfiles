# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#--------------------------------------------- Color Code Connections ---------------------------------------

# System wide functions and aliases
# Environment stuff goes in /etc/profile

# For some unknown reason bash refuses to inherit
# PS1 in some circumstances that I can't figure out.
# Putting PS1 here ensures that it gets loaded every time.

# Set up prompts. Color code them for logins. Red for root, white for 
# user logins, green for ssh sessions, cyan for telnet,
# magenta with red "(ssh)" for ssh + su, magenta for telnet.
THIS_TTY=tty`ps aux | grep $$ | grep bash | awk '{ print $7 }'`
SESS_SRC=`who | grep $THIS_TTY | awk '{ print $6 }'`

SSH_FLAG=0
SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
if [ $SSH_IP ] ; then
  SSH_FLAG=1
fi
SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
if [ $SSH2_IP ] ; then
  SSH_FLAG=1
fi
if [ $SSH_FLAG -eq 1 ] ; then
  CONN=ssh
elif [ -z $SESS_SRC ] ; then
  CONN=lcl
elif [ $SESS_SRC = "(:0.0)" -o $SESS_SRC = "" ] ; then
  CONN=lcl
else
  CONN=tel
fi

# Okay...Now who we be?
if [ `/usr/bin/whoami` = "root" ] ; then
  USR=priv
else
  USR=nopriv
fi

#Set some prompts...
if [ $CONN = lcl -a $USR = nopriv ] ; then
  PS1="[\u \W]\\$ "
elif [ $CONN = lcl -a $USR = priv ] ; then
  PS1="\[\033[01;31m\][\w]\\$\[\033[00m\] "
elif [ $CONN = tel -a $USR = nopriv ] ; then
  PS1="\[\033[01;34m\][\u@\h \W]\\$\[\033[00m\] "
elif [ $CONN = tel -a $USR = priv ] ; then
  PS1="\[\033[01;30;45m\][\u@\h \W]\\$\[\033[00m\] "
elif [ $CONN = ssh -a $USR = nopriv ] ; then
  PS1="\[\033[01;32m\][\u@\h \W]\\$\[\033[00m\] "
elif [ $CONN = ssh -a $USR = priv ] ; then
  PS1="\[\033[01;35m\][\u@\h \W]\\$\[\033[00m\] "
fi

# PS1="[\u@\h \W]\\$ "
export PS1
#----------------------------------------------------------------------end

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
shopt -s cdable_vars
jonafs="/afs/rchland.ibm.com/usr1/joncfouk"
gsasri="/gsa/rchgsa/projects/s/sriov"
jbox="/afs/rchland.ibm.com/usr1/joncfouk/ode/afw/"

alias vtty-fsp='/afs/rchland.ibm.com/usr6/d4a3/tools/vtty-fsp'
alias sys_capture='/afs/rchland.ibm.com/usr6/d4a3/tools/sys_capture'

function gbdir()
{
    if [ $1 ] ; then
        if [ $2 ]; then
            if [ "$2" == "curstage" ]; then
                cd /afs/rchland.ibm.com/usr5/phypbld/afw/$1/curstage/src
            else
                cd /afs/rchland.ibm.com/usr5/phypbld/afw/$1/builds/$2/src 
            fi
        else
            echo "Please enter build version."
        fi
    else
        echo "Please enter afw version."
    fi
}

function gitStart()
{
    read -p "Initializing git here" -n 1 -r
    git init
    cp ~/.gitignore_main ./.gitignore       #ignore file for main project
    cp ~/.ag_ignore_files ./.agignore       #ignore file for ag
#     cp ~/.gitignore_project src/
    git add .
    git commit -m "Initial Commit"
}

#Go Sandbox Directory
# parameters:
#    afw:           afw number
#    sandbox name:  name of the sandbox
#function goSandboxDirectory()
#{
    ## check for parameters, if entered go to specified sandbox
    ## otherwise, go to root of directory
    #if [ $1 ] ; then
        #if [ $2 ]; then
            #sbDir="/afs/rchland.ibm.com/usr1/joncfouk/ode/afw/$1/$2"
            #if [ -d "$sbDir" ]; then
                #cd $sbDir
            #else
                #echo "$sbDir does not exist!!!"
            #fi
        #else
            #echo "Please enter sandbox name!"
        #fi
    #else
        #echo "Please enter afw version."
    #fi
#}

function goSandBox()
{
    # check for parameters, if entered go to specified sandbox
    # otherwise, go to root of directory
    sbDir="NULL"
    if [ $1 ] ; then
        #find all sb names
        local sbpaths sbarr
        sbpaths=$(find /afs/rchland.ibm.com/usr1/joncfouk/ode/afw -maxdepth 2 -mindepth 2 -type d)
        sbarr=($sbpaths)
        for x in ${sbarr[*]}; do
            if [ $1 == ${x##*/} ]; then 
                sbDir=$x
                break
            fi
        done
        if [ -d "$sbDir" ]; then
            echo "Navigating to $(basename $sbDir)!"
            cd $sbDir
        else
            echo "$sbDir does not exist!!!"
        fi
    else
        ##else go back to project root
        local path temp old_ifs
        path=$PWD
        old_fs=$IFS 
        IFS='/' temp=($path)
        IFS=$old_fs
        #check if current directory can be a project directory
        if [ ${#temp[@]} -gt 7 ]; then
            sbpaths=$(find /afs/rchland.ibm.com/usr1/joncfouk/ode/afw -maxdepth 2 -mindepth 2 -type d)
            sbarr=($sbpaths)
            for x in ${sbarr[*]}; do
                if [[ ${temp[8]} =~ ${x##*/} ]]; then 
                    sbDir=$x
                    break
                fi
            done
            if [ -d "$sbDir" ]; then
                echo "Navigating to $(basename $sbDir)!"
                cd $sbDir
            else
                echo "$sbDir does not exist!!!"
            fi
        else
            echo "You're not in a sandbox directory currently!"
        fi
    fi
}

_goSandBox()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    #opts=$(for x in $(find -maxdepth 2 -mindepth 2 -type d | cut -c 3-); do echo $x; done)
    opts=$(find /afs/rchland.ibm.com/usr1/joncfouk/ode/afw -maxdepth 2 -mindepth 2 -type d -printf "%f ")
    if [[ $COMP_CWORD>1 ]]; then
        return 0
    fi

    #command completion
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) ) 
    return 0
}
complete -F _goSandBox goSandBox
alias gsb="goSandBox"
complete -F _goSandBox gsb

#_goSandBoxDirectory()
#{
    #local cur prev opts
    #COMPREPLY=()
    #cur="${COMP_WORDS[COMP_CWORD]}"
    #prev="${COMP_WORDS[COMP_CWORD-1]}"
    #opts=$(for x in $(ls /afs/rchland.ibm.com/usr1/joncfouk/ode/afw/); do echo $x; done)
    #if [[ $COMP_CWORD>2 ]]; then
        #return 0
    #fi

    ##if afw version already entered, then offer sandboxes
    #temp=($opts)
    #for x in ${temp[*]}; do 
        #if [[ $prev =~ $x ]]; then
            #running=$(for x in $(ls /afs/rchland.ibm.com/usr1/joncfouk/ode/afw/$prev); do echo $x; done)
            #COMPREPLY=($(compgen -W "${running}" -- ${cur}))
            #return 0;
        #fi
    #done

    ##command completion
    #COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    #return 0
#}
#complete -F _goSandBoxDirectory goSandboxDirectory

function updateCache()
{
    if [ $1 ]; then
        #check last touched date
        #file=~/.vim/.projectcache/${1}_LATEST
        #file_info=( $(ls -lat $file) )
        #echo "${file_info[5]} ${file_info[6]} ${file_info[7]}"

        find /afs/rchland.ibm.com/usr5/phypbld/afw/$1/builds/LATEST/src -iname *.c -printf '%P\n' -or -iname *.h -printf '%P\n' > ~/.vim/.projectcache/${1}_LATEST
    else
        echo "Please enter in afw version"
    fi
}

function vimProject()
{
    local path temp old_ifs afwVersion
    path=$PWD

    #check if we are in a sandbox
    echo $path | grep -q "/afs/rchland.ibm.com/usr1/joncfouk/ode/afw"
    if [ $? -eq 0 ]; then
        old_fs=$IFS 
        IFS='/' temp=($path)
        IFS=$old_fs
        #check if current directory can be a project directory
        if [ ${#temp[@]} -gt 8 ]; then
            echo ${temp[7]}
            sbpaths=$(find /afs/rchland.ibm.com/usr1/joncfouk/ode/afw -maxdepth 1 -mindepth 1 -type d)
            sbarr=($sbpaths)
            for x in ${sbarr[*]}; do
                if [[ ${temp[7]} =~ ${x##*/} ]]; then 
                    afwVersion=${x##*/}
                    echo "Starting vim with $afwVersion!"
                    #updateCache $afwVersion &
                    # check that it's been a day since last update, else don't update
                    #if ! checkLastModified /home/jfouk/Development/cscope/$afwVersion/fzf.files 86400; then
                        #( updateLocalBB & )
                    #fi
                    vimx -c "Pinit $afwVersion LATEST" $@
                    return
                fi
            done
        fi
    else
        echo "not in project directory"
        vimx $@
    fi
}
alias vim="vimProject"

# checks if it has been $2 seconds since the file was modified
function checkLastModified()
{
    #checkLastModified file #seconds
    curTime=$(date +'%s')
    if [ $1 ]; then
        if [ $2 ]; then
            fileTime=$(stat -c %Y $1)
            difference=$((curTime-fileTime))
            if [ "$difference" -lt "$2" ]; then
                return 0
            else
                return 1
            fi
        fi
    fi
    return 1
}
function updateLocalBB()
{
    curDir="$PWD"
    local baseDir="/home/jfouk/Development/cscope"
    for releases in 868 910 920
    do
        local bbDir="$baseDir/afw$releases/gitroot/"
        if [ -d "$bbDir" ]; then
            echo "Updating $bbDir..."
            cd $bbDir
            git pull
            buildLocalCscope afw$releases
            buildLocalFzfList afw$releases
            cd $curDir
        else
            echo "$bbDir does NOT exist!"
            buildLocalBB afw$releases
        fi
        #cd $baseDir/$releases/
    done
}

function buildLocalBB()
{
    #buildLocalBB release
    local curDir=$PWD
    if [ $1 ]; then
        local baseDir="/home/jfouk/Development/cscope/$1"
        local afsDir="/afs/rchland.ibm.com/usr5/phypbld/afw/$1/git/gitroot/"
        if [ -d "$baseDir/gitroot" ]; then
            echo "$1 dir already created, don't do anything.."
        else
            mkdir $baseDir
            cd $baseDir
            echo "Cloning $afsDir..."
            git clone $afsDir
            buildLocalCscope $1
            buildLocalFzfList $1
            cd $curDir
        fi
    else
        echo "Please enter in afw release!"
    fi
}

function buildLocalCscope()
{
    local curDir=$PWD
    if [ $1 ]; then
        local baseDir="/home/jfouk/Development/cscope/$1"
        local gitRoot="$baseDir/gitroot"
        if [ -d $gitRoot ]; then
            echo "Building cscope..."
            find $gitRoot/src -type f \( -name *.c -o -name *.h -o -name *.C -o -name *.H  -o -name *.ode  -o -name *.mk -o -name *.m4 \) > $baseDir/cscope.files
            cd $baseDir
            cscope -b -q -k
            cd $curDir
        fi
    else
        echo "Please enter in afw release!"
    fi
}

function buildLocalFzfList()
{
    local curDir=$PWD
    if [ $1 ]; then
        local baseDir="/home/jfouk/Development/cscope/$1"
        local gitRoot="$baseDir/gitroot"
        if [ -d $gitRoot ]; then
            echo "Building List of files for FZF..."
            cd $gitRoot/src
            find . -type f \( -name *.c -o -name *.h -o -name *.C -o -name *.H  -o -name *.ode  -o -name *.mk -o -name *.m4 \) -printf '%P\n' > $baseDir/fzf.files
            cd $curDir
        fi
    else
        echo "Please enter in afw release!"
    fi
}

#make vtty-fsp faster
function fsp()
{
    machine=$(getMachineUrl $1 $2)
    if [ "$machine" != "NULL" ]; then
        local vttyFspCmd=$(/afs/rchland.ibm.com/usr6/d4a3/tools/vtty-fsp $machine -session 0 -setuponly -timeout 0)
        telnet $machine 30002
    fi
}

function syscap()
{
    machine=$(getMachineUrl $1 $2)
    if [ "$machine" != "NULL" ]; then
        sys_capture $machine
    fi
}
alias sys="syscap"

function myssh()
{
    if [ $1 ]; then
        case $1 in
            *hmc*)
                number=$(echo $1 | sed -n "s/^.*hmc\([0-9]\)/\1/p")
                machine=$(getMachineUrl sriovhmc$number $2)
                ssh hscroot@$machine -X -k -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
                ;;
            z*)
                machine=$(getMachineUrl $1 $2)
                ssh root@$machine -X -k -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null
                ;;
                
        esac
        fi
}
function getMachineUrl()
{
    #set domain
    loc="rch"
    if [ $2 ]; then
        loc=$2
    fi
    if [ $1 ]; then
        machine="$1.$loc.stglabs.ibm.com"
        echo $machine
    else
        echo "Please enter a machine name!" >&2
        echo NULL
    fi
}

alias vi="vimx"
alias vims="vimx --servername "
alias git_ls="git ls-tree -r master --name-only"
alias tree="tree -C"
alias pwc="pwd | tr -d '\n' | xsel -ib"
#[[ $TMUX = "" ]] && export TERM="xterm-256color"
export TERM="screen-256color"
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
alias ag="ag -S"

#ssh aliases
alias myfat="mosh joncfouk@fatcat.rch.stglabs.ibm.com"
alias mytim="ssh -X joncfouk@timothy.rch.stglabs.ibm.com"

alias logon="$HOME/logon.sh; cat $HOME/signmeon_log.txt"

alias dailyjournal="/home/jfouk/Development/Setup/dotfiles/scripts/daily_orgnotes_script.sh"
alias dj="dailyjournal"

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
export FZF_TMUX=0

export ORG_NOTES="$HOME/Development/Notes"
alias gitl="git log --graph --decorate --oneline --all"
source "/etc/profile.d/goenv.sh"
export PATH="$PATH:$GOPATH/bin"

# set capslock to ctrl when used in conjunction with another key, and esc when pressed by itself
setxkbmap -option 'caps:ctrl_modifier'
#xcape -e 'Caps_Lock=Escape'
if [ ! $(ps ax | grep 'watch -n 3600 /home/jfouk/logon.sh' | wc -l) -gt 1 ]
then
    watch -n 3600 /home/jfouk/logon.sh &>/dev/null &
fi
if [ ! $(ps ax | grep 'watch -n 86400 /home/jfouk/Scripts/buildLocalBB.sh' | wc -l) -gt 1 ]
then
    watch -n 86400 /home/jfouk/Scripts/buildLocalBB.sh &>/dev/null &
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
