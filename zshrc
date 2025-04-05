fastfetch

export ZSH="$HOME/.oh-my-zsh"
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

bindkey -v

# Fix for ltex-ls crashing due to XML entity limits in LanguageTool
export JAVA_TOOL_OPTIONS="-Djdk.xml.totalEntitySizeLimit=1000000"
export JAVA_OPTS="--enable-native-access=ALL-UNNAMED"

export JAVA_HOME="/usr/lib/jvm/java-24-openjdk"
export GOPATH="${HOME}/go"

path_additions=(
  "$HOME/.cargo/bin"
  "$JAVA_HOME/bin"
  "$GOPATH/bin"
  "$HOME/.spicetify"
)

for p in "${path_additions[@]}"; do
    [[ ":PATH:" != *":$p:"* ]] && export PATH="$PATH:$p"
done

export OPENCV_LOG_LEVEL=0
export OPENCV_VIDEOIO_PRIORITY_INTEL_MFX=0

# User configuration
export EDITOR='nvim'
export HISTFILESIZE=100000
export HISTSIZE=${HISTFILESIZE}

source $HOME/Projects/Personal/dotfiles/aliases

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
