# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/fabio.morais/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
# ENABLE_CORRECTION="true"

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
plugins=(git zsh-autosuggestions)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cp='cp -iv'                            # Preferred 'cp' implementation
alias cdbash='cd ~/repo/bashProfile'         # cdbash:      go to my bash profile dir
alias repo='cd ~/repo/'                      # repo:        go to my repository
alias cdops='cd ~/repo/devops-scripts'       # cdops:       go to my devops-scripts dir
alias cdinfra='cd ~/repo/infrastructure'     # cdinfra:     go to my infra dir
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

#  gcloud:  speed list, ssh access to instance
alias gcvmlist='gcloud compute instances list --project=mcmakler-prime'                         # list instances in mcmakler-prime
alias gcssha='gcloud compute ssh --internal-ip --zone=europe-west3-a --project=mcmakler-prime'  # access instance in zone europe-west3-a in mcmakler-prime
alias gcsshb='gcloud compute ssh --internal-ip --zone=europe-west3-b --project=mcmakler-prime'  # access instance in zone europe-west3-b in mcmakler-prime
alias gcsshc='gcloud compute ssh --internal-ip --zone=europe-west3-c --project=mcmakler-prime'  # access instance in zone europe-west3-c in mcmakler-prime

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
alias infrastructure="cd ~/repo/infrastructure"
alias mcmakler-config="cd ~/repo/mcmakler-config"
alias znogit="cd ~/repo/znogit"
alias haproxy="cd ~/repo/haproxy-gateway"
alias docker-images="cd ~/repo/docker-images"
alias repobackup="cd ~/repo/backup"
