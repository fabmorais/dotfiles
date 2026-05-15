#!/bin/bash

# Path to HyDE theme configuration
HYDE_THEME_FILE="$HOME/.config/hypr/themes/wallbash.conf"

# Extract the current HyDE theme name
HYDE_THEME=$(grep "^\$HYDE_THEME=" "$HYDE_THEME_FILE" | cut -d '=' -f 2)

echo "Detected HyDE theme: '$HYDE_THEME'"

# Define the path to Lua colorschemes and current default
LUA_COLORSCHEMES_DIR="$HOME/.config/nvim/lua/colorschemes-config"
CURRENT_LUA_THEME="$LUA_COLORSCHEMES_DIR/default.lua"

# Define a mapping from HyDE themes to Lua colorschemes
declare -A THEME_MAP
THEME_MAP=(
    ["Catppuccin Mocha"]="catppuccin"
    ["Catppuccin Latte"]="catppuccin"
    ["Catppuccin Frappe"]="catppuccin"
    ["Catppuccin Macchiato"]="catppuccin"
    ["Dracula"]="dracula"
    ["Nordic"]="nordic"
    ["Nordic Blue"]="nordic"
    ["Gruvbox"]="gruvbox"
    ["Gruvbox Retro"]="gruvbox"
    ["Rose Pine"]="rosepine"
    ["Rosé Pine"]="rosepine"
    ["Tokyo Night"]="tokyonight"
    ["Hack the Box"]="hardhacker"
    ["Hackthebox"]="hardhacker"
    ["Synth Wave"]="synthwave"
    ["Oxocarbon"]="oxocarbon"
    ["Material Sakura"]="material_sakura"
    ["Decay Green"]="decay_green"
    ["Graphite Mono"]="mono"
    ["One Dark"]="onedark"
)

# Define default theme
DEFAULT_LUA_THEME="catppuccin"

# Function to change Lua colorscheme
change_lua_theme() {
    THEME_NAME=$1
    THEME_FILE="$LUA_COLORSCHEMES_DIR/$THEME_NAME.lua"

    if [ -f "$THEME_FILE" ]; then
        ln -sf "$THEME_FILE" "$CURRENT_LUA_THEME"
        echo "✓ Lua theme changed to $THEME_NAME"
    else
        echo "✗ Theme file $THEME_FILE does not exist"
        echo "  Creating symlink to default theme instead"
        DEFAULT_FILE="$LUA_COLORSCHEMES_DIR/$DEFAULT_LUA_THEME.lua"
        if [ -f "$DEFAULT_FILE" ]; then
            ln -sf "$DEFAULT_FILE" "$CURRENT_LUA_THEME"
        fi
    fi
}

# Check the HyDE theme and change Lua theme accordingly
if [[ ${THEME_MAP[$HYDE_THEME]+_} ]]; then
    change_lua_theme "${THEME_MAP[$HYDE_THEME]}"
else
    echo "⚠ No matching theme found for HyDE theme: '$HYDE_THEME'"
    echo "  Using default Lua theme: $DEFAULT_LUA_THEME"
    change_lua_theme "$DEFAULT_LUA_THEME"
fi
