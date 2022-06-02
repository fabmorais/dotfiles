# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#.zshrc
export PATH="/usr/local/sbin:$PATH"
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# # This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# remove zsh correct
CORRECT_IGNORE_FILE='.*'

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# GNU Tools
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
#tf shell tab
# terraform -install-autocomplete

# Go development
export GOPATH="${HOME}/.go"
#export GOROOT=/usr/local/go
#export GOROOT=/usr/local/opt/go/libexec
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Path to your oh-my-zsh installation.
export ZSH="/Users/fabio/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-peco-history zsh-z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# gcloud
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# Changing "ls" to "exa"
alias ls='exa -al --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -a --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --icons --color=always --group-directories-first'  # long format
alias lt='exa -aT --icons --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cp='cp -iv'                            # Preferred 'cp' implementation
alias repo='cd ~/repo/'                      # repo:        go to my repository
alias pc='ccat --bg=dark'                    # pc:          print terminal display with color
alias mv='mv -iv'                            # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                      # Preferred 'mkdir' implementation
# alias ll='ls -FGlAhp'                        # Preferred 'ls' implementation
alias less='less -FSRXc'                     # Preferred 'less' implementation
cd() { builtin cd "$@"; ll; }                # Always list directory contents upon 'cd'
# alias cd..='cd ../'                          # Go back 1 directory level (for fast typers)
# alias ..='cd ../'                            # Go back 1 directory level
# alias ...='cd ../../'                        # Go back 2 directory levels
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
# alias which='type -all'                      # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'          # path:         Echo all executable Paths
alias show_options='shopt'                   # Show_options: display bash options settings
alias fix_stty='stty sane'                   # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'    # cic:          Make tab-completion case-insensitive
alias untar='tar -zxvf'                      # untar:        untar with the right arguments
alias wget='wget -c'                         # wget:         download something but be able to resume if something goes wrong
alias getpass='openssl rand -base64 20'      # getpass:      generate a random 20-character password
alias svim='sudo vim'                        # sudo vim:     sudo vim something
alias v='nvim'                               # neovim:       neovim 
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
alias nvpn='sudo killall openvpn'            # VPN:          Kill openVPN connection
alias vpn='sudo openvpn --config /Users/fabio/Documents/vpn/client.ovpn --daemon'                     # VPN: connect to OpenVPN
alias afk='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend' # AFK computer
alias update-zsh='cp ~/Projects/dotfiles/zshrc ~/.zshrc && source ~/.zshrc'                           # update-zsh: copy my git .zshrc to local and source
alias update-os="sudo softwareupdate -i -a; brew update; brew upgrade"                                # update-os: update mac
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'                                                                
alias watch='watch '                                                                                  # enable watch to work with alias
alias df='df -h'                                                                                      # human-readable sizes
alias free='free -m'                                                                                  # show sizes in MB

# gcloud:  speed list, ssh access to instance
alias gcvmlist='gcloud compute instances list --project=mcmakler-prime'                         # list instances in mcmakler-prime
alias gcssha='gcloud compute ssh --internal-ip --zone=europe-west3-a --project=mcmakler-prime'  # access instance in zone europe-west3-a in mcmakler-prime
alias gcsshb='gcloud compute ssh --internal-ip --zone=europe-west3-b --project=mcmakler-prime'  # access instance in zone europe-west3-b in mcmakler-prime
alias gcsshc='gcloud compute ssh --internal-ip --zone=europe-west3-c --project=mcmakler-prime'  # access instance in zone europe-west3-c in mcmakler-prime

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# broot
alias br='broot -dhp'
alias bs='broot --sizes'

# kubectl:  automate kube control commands
alias k='kubectl'                                          # change kubernetes context to develop
alias kg='kubectl get'                                     # shortcut for kubectl get
alias ke='kubectl edit'                                    # shortcut for kubectl edit
alias kd='kubectl describe'                                # shortcut for kubectl describe
alias ks='kubectl scale'                                   # shortcut for kubectl scale
alias kl='kubectl logs'                                    # shortcut for kubectl logs
alias kt='kubectl top'                                     # shortcut for kubectl top
alias kx='kubectl exec'                                    # shortcut for kubectl exec
alias kap='kubectl apply -f'                               # shortcut for kubectl apply -f
alias kcon='kubectl config current-context'                # get the current context
alias kubedev='kubectl config use-context gke_flink-core-dev_europe-west3_k8s-main-dev'           # change kubernetes context to develop
alias kubeprod='kubectl config use-context gke_flink-core-prod_europe-west3_k8s-main-prod'        # change kubernetes context to production
alias kubestag='kubectl config use-context gke_flink-core-staging_europe-west3_k8s-main-staging'  # change kubernetes context to test
alias kubeshare='kubectl config use-context gke_flink-core-shared_europe-west3_k8s-main-shared'   # change kubernetes context to test

# git: automate git commands
alias gg="git status"                                       # gg:          show the state of the working dir
alias gp="git pull"                                         # gp:          download and integrate remote changes
alias gd="git diff"                                         # gd:          show changes between commits, commit and working tree
alias gl="git log"                                          # gl: 
alias gco="git checkout"                                    # gco:
alias gba="git branch"                                      # gba:
alias ginit="git init"                                      # ginit:       create an empty git repository or reinitialize an existing one
alias git-branches='git branch -va'                         # git-branches: show all the branches(individual projects withian a git repository)
alias gco-dev='git checkout develop'                        # change to develop branch
alias gco-stag='git checkout staging'                       # change to develop branch
alias gco-master='git checkout master'                      # change to master branch
alias gl-fancy='git log --oneline --decorate --all --graph' # git log fancy

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#   ---------------------------
#          NETWORKING
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
alias matrix='cmatrix -ab'			    # matrix

# HSTR configuration - add this to ~/.bashrc
export HSTR_CONFIG=hicolor       # get more colors
# shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=100000       # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
# if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
export PATH=$(brew --prefix openvpn)/sbin:$PATH

# kubectl
source <(kubectl completion zsh)
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
complete -F __start_kubectl k

# kubectl new plugin gcp
USE_GKE_GCLOUD_AUTH_PLUGIN=True

### Nerd section ###
excuse() { echo $(telnet bofh.jeffballard.us 666 2>/dev/null) | grep --color -o "Your excuse is:.*$" ; }
starwars() { telnet towel.blinkenlights.nl ; }
weather() { curl wttr.in/$1 ; }

### Tools ###
rbrew_upgrade() {
  brew update && brew upgrade
}
rbrew_doctor() {
  brew update && brew upgrade && brew cleanup; brew doctor
}

# To install useful key bindings and fuzzy completion:
# $(brew --prefix)/opt/fzf/install

. /opt/homebrew/opt/asdf/libexec/asdf.sh
