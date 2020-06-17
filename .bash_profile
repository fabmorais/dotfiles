    #  ---------------------------------------------------------------------------
#
#
#  Sections:
#  1.   Environment Configuration
#  2.   Make Terminal Better (remapping defaults and adding functionality)
#  3.   File and Folder Management
#  4.   Searching
#  5.   Process Management
#  6.   Networking
#  7.   System Operations & Information
#  8.   Web Development
#  9.   Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Remove zsh message on bash
export BASH_SILENCE_DEPRECATION_WARNING=1

#   Deploy Starship
eval "$(starship init bash)"
#source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PS1='$(kube_ps1)'$PS1

#   Color Prompt
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[1;34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
CUSTOMCOLORMIX='\[\e[1;30m\]'
DARKCUSTOMCOLORMIX='\[\e[1;32m\]'
LIGHTBLUE="\[\033[1;36m\]"
PURPLE='\[\e[1;35m\]'
NC='\[\e[0m\]'
#   ------------------------------------------------------------

# Powerline
# export PATH=$PATH:$HOME/Library/Python/2.7/bin
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /Users/fabio.morais/Library/Python/2.7/lib/python/site-packages/powerline/bindings/bash/powerline.sh

# Java Environment
eval "$(jenv init -)"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
PS1="${LIGHTBLUE}\\u ${BOLDYELLOW}[\\w] ${GREEN}\$(parse_git_branch)${DARKCUSTOMCOLORMIX}$ ${NC}"

# Go development
export GOPATH="${HOME}/.go"
export GOROOT=/usr/local/go
#export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Flutter development
export PATH=/Users/fabio.morais/mobile-dev/flutter/bin:$PATH

# Maven development
export M2_HOME="/usr/local/bin/apache-maven-3.6.3"
PATH="${M2_HOME}/bin:${PATH}"
export PATH

# vault autocomplete
complete -C /usr/local/bin/vault vault

# ssh autocomplete
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# git autocomplete
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# kubernetes & docker autocomplete
if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

source ~/.kube/kubectl_autocompletion
source <(kops completion bash)

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash
complete -C /Users/fabio.morais/terraform/terraform terraform
complete -C /usr/local/bin/terraform terraform

#   aws auto complete 
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
complete -C '/usr/local/aws/bin/aws_completer' aws


#   Set Paths
#   ------------------------------------------------------------
    export PATH="$PATH:/usr/local/bin/"
    export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fabio.morais/google-cloud-sdk/path.bash.inc' ]; then . '/Users/fabio.morais/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fabio.morais/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/fabio.morais/google-cloud-sdk/completion.bash.inc'; fi


#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/local/bin/vim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad


#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                            # Preferred 'cp' implementation
alias cdbash='cd ~/repo/bashProfile'         # cdbash:      go to my bash profile dir
alias repo='cd ~/repo/'                      # repo:        go to my repository
alias cdops='cd ~/repo/devops-scripts'       # cdops:       go to my devops-scripts dir
alias cdcf='cd ~/repo/amaro-cloudformation'  # cdcf:        go to my cloudformation dir
alias cdtf='cd ~/repo/amaro-tf'              # cdtf:        go to my terraform dir
alias cdkube='cd ~/repo/amaro-kubernetes'    # cdkube:      go to my kubernetes dir
alias cdbyrd='cd ~/repo/byrd'                # cdbyrd:      go to my byrd dir
alias cdssh='cd ~/.ssh'                      # cdssh:       go to my .ssh config dir
alias cdaws='cd ~/.aws'                      # cdaws:       go to my .aws config dir
alias p='cat'                                # p:           print terminal display
alias pc='ccat --bg=dark'                    # pc:          print terminal display with color
alias mv='mv -iv'                            # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                      # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                        # Preferred 'ls' implementation
alias less='less -FSRXc'                     # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }                # Always list directory contents upon 'cd'
alias cd..='cd ../'                          # Go back 1 directory level (for fast typers)
alias ..='cd ../'                            # Go back 1 directory level
alias ...='cd ../../'                        # Go back 2 directory levels
alias .3='cd ../../../'                      # Go back 3 directory levels
alias .4='cd ../../../../'                   # Go back 4 directory levels
alias .5='cd ../../../../../'                # Go back 5 directory levels
alias .6='cd ../../../../../../'             # Go back 6 directory levels
alias edit='subl'                            # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                  # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                               # ~:            Go Home
alias c='clear'                              # c:            Clear terminal display
alias q='exit'                               # q:            Exit terminal display
alias h='history'                            # h:            history terminal display
alias hs='history | grep'                    # hs:           history |grep terminal display
alias which='type -all'                      # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'          # path:         Echo all executable Paths
alias show_options='shopt'                   # Show_options: display bash options settings
alias fix_stty='stty sane'                   # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'    # cic:          Make tab-completion case-insensitive
alias untar='tar -zxvf'                      # untar:        untar with the right arguments
alias wget='wget -c'                         # wget:         download something but be able to resume if something goes wrong
alias getpass='openssl rand -base64 20'      # getpass:      generate a random 20-character password
alias svim='sudo vim'                        # sudo vim:     sudo vim something
alias grep='grep --color=auto'               # grep:         Colorize the grep command output
alias egrep='egrep --color=auto'             # egrep:        Colorize the egrep command output
alias fgrep='fgrep --color=auto'             # fgrep:        Colorize the fgrep command output
alias header='curl -I'                       # header:       get web server headers
alias vs='code'                              # code:         open visual studio code
mcd () { mkdir -p "$1" && cd "$1"; }         # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }      # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }     # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'     # DT:           Pipe content to file on MacOS Desktop
alias python='/usr/local/bin/python3.7'      # python3:      Make Python3 default in macos
alias nvpn='sudo killall openvpn'           # VPN:          Kill openVPN connection
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'           # AFK computer
alias update-bash='cp ~/repo/bashProfile/.bash_profile ~/.bash_profile && source ~/.bash_profile'               # update-bash: copy my git .bash to local and source
alias update-os="sudo softwareupdate -i -a; brew update; brew upgrade"                                          # update-os: update mac

alias vpn='sudo openvpn --config /Users/fabio.morais/Documents/vpn/client.ovpn --daemon'                        # VPN: connect to OpenVPN
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'                                                                

#  kubectl:  automate kube control commands
alias k='kubectl'                                                                            # change kubernetes context to develop
alias kcon='kubectl config current-context'                                                  # get the current context
alias kubedev='kubectl config use-context gke_mcmakler-prime_europe-west3_develop-1ifh'      # change kubernetes context to develop
alias kubeprod='kubectl config use-context gke_mcmakler-prime_europe-west3_production-so09'  # change kubernetes context to production
alias kubestag='kubectl config use-context gke_mcmakler-prime_europe-west3_staging-3s5h'     # change kubernetes context to test

#   git:  automate git commands
alias gg="git status"                        # gg:          show the state of the working dir
alias gp="git pull"                          # gp:          download and integrate remote changes
alias gd="git diff"                          # gd:          show changes between commits, commit and working tree
alias ginit="git init"                       # ginit:       create an empty git repository or reinitialize an existing one
alias git-branches='git branch -va'          # git-branches: show all the branches(individual projects withian a git repository)
alias git-chdevelop='git checkout develop'           # change to develop branch
alias git-chmaster='git checkout master'             # change to master branch

#   mcmakler:  git repository
alias infrastructure="cd repo/infrastructure"
alias mcmakler-config="cd repo/mcmakler-config"
alias znogit="cd repo/znogit"
alias haproxy="cd repo/haproxy-gateway"
alias docker-images="cd repo/docker-images"
alias repobackup="cd repo/backup"

#   HSTR: history
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------w
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }


#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }


#   ---------------------------
#   4.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


#   ---------------------------
#   5.  PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


#   ---------------------------
#   6.  NETWORKING
#   ---------------------------

alias ipe='curl ipinfo.io/ip'                       # ipe:          External IP Address
alias ipi='ipconfig getifaddr en0'                  # ipi:          Internal IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias ping='ping -c 5'                              # ping:         ping 5 times only
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias speed='speedtest-cli --server 2406 --simple'  # speed:  check my network speed


#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }


#   ---------------------------------------
#   7.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#   ---------------------------------------
#   8.  WEB DEVELOPMENT
#   ---------------------------------------

alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
    httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }


#   ---------------------------------------
#   9.  REMINDERS & NOTES
#   ---------------------------------------

#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:
#   ---------------------------------------
#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:
#   ---------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat
