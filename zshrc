# Skip fastfetch if running in an IDE
if [[ -z "$VSCODE_INJECTION" ]] && [[ -z "$CURSOR_INJECTION" ]] && [[ "$TERM_PROGRAM" != "cursor" ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
    fastfetch
fi

export ZSH="$HOME/.oh-my-zsh"
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

bindkey -v

# Fix for ltex-ls crashing due to XML entity limits in LanguageTool
export JAVA_TOOL_OPTIONS="-Djdk.xml.totalEntitySizeLimit=1000000"
export JAVA_OPTS="--enable-native-access=ALL-UNNAMED"

export JAVA_HOME="/usr/lib/jvm/java-25-openjdk"
export GOPATH="${HOME}/go"
export CUSTOMERS="${HOME}/Projects/Customers"

path_additions=(
  "$HOME/.npm-global/bin"
  "$HOME/.local/bin"
  "$HOME/.cargo/bin"
  "$JAVA_HOME/bin"
  "$GOPATH/bin"
  "$HOME/.spicetify"
)

for p in "${path_additions[@]}"; do
    [[ ":$PATH:" != *":$p:"* ]] && export PATH="$p:$PATH"
done

cursor() {
  command cursor --ozone-platform=wayland "$@" >/dev/null 2>&1 < /dev/null &!
}

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
