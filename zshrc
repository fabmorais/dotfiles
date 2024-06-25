fastfetch

export ZSH="$HOME/.oh-my-zsh"
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh
bindkey -v

export PATH="$PATH:$HOME/.cargo/bin"

export GOPATH="${HOME}/go"
export PATH="$PATH:$HOME/go/bin"

export OPENCV_LOG_LEVEL=0
export OPENCV_VIDEOIO_PRIORITY_INTEL_MFX=0

# User configuration
export EDITOR='nvim'
export HISTFILESIZE=100000
export HISTSIZE=${HISTFILESIZE}
source $HOME/Projects/dotfiles/aliases

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
