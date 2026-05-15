#!/bin/bash

# Path to HyDE theme configuration
HYDE_THEME_FILE="$HOME/.config/hypr/themes/wallbash.conf"

# Extract the current HyDE theme name
HYDE_THEME=$(grep "^\$HYDE_THEME=" "$HYDE_THEME_FILE" | cut -d '=' -f 2)

echo "Detected HyDE theme: '$HYDE_THEME'"

# Get Logitech mouse name
LOGI_MOUSE_NAME=$(ratbagctl list | awk '{print $1}' | sed 's/://')

# Define a mapping from HyDE themes to RGB colors
declare -A THEME_COLORS
THEME_COLORS=(
    ["Catppuccin Mocha"]="cba6f7"     # Mauve/Purple
    ["Catppuccin Latte"]="dc8a78"     # Rosewater
    ["Catppuccin Frappe"]="ca9ee6"    # Mauve
    ["Catppuccin Macchiato"]="c6a0f6" # Mauve
    ["Dracula"]="bd93f9"              # Purple
    ["Nordic"]="88c0d0"               # Light blue
    ["Nordic Blue"]="88c0d0"          # Light blue
    ["Gruvbox"]="d79921"              # Yellow
    ["Gruvbox Retro"]="d79921"        # Yellow
    ["Rose Pine"]="ebbcba"            # Rose
    ["Rosé Pine"]="ebbcba"            # Rose
    ["Tokyo Night"]="7aa2f7"          # Blue
    ["Hack the Box"]="9fef00"         # HTB Green
    ["Hackthebox"]="9fef00"           # HTB Green
    ["Synth Wave"]="ff6ac1"           # Hot pink
    ["Oxocarbon"]="ee5396"            # Magenta
    ["Material Sakura"]="ff4081"      # Pink
    ["Decay Green"]="95c561"          # Green
    ["Graphite Mono"]="666666"        # Gray
    ["One Dark"]="61afef"             # Blue
    ["Edge Runner"]="00ffff"          # Cyan
    ["Frosted Glass"]="a0c8e0"        # Light blue
)

DEFAULT_THEME="Catppuccin Mocha"
DEFAULT_COLOR="cba6f7" # Default purple

# Function to change keyboard color
change_keyboard_color() {
    THEME_NAME=$1
    COLOR=${THEME_COLORS[$THEME_NAME]}

    if [ -n "$COLOR" ]; then
        echo "✓ Changing keyboard color to #$COLOR for theme '$THEME_NAME'"
        asusctl aura static -c $COLOR
    else
        echo "⚠ No matching color found for theme '$THEME_NAME'. Setting default color."
        asusctl aura static -c $DEFAULT_COLOR
    fi
}

# Function to change mouse LED color using ratbagctl
change_mouse_color() {
    THEME_NAME=$1
    COLOR=${THEME_COLORS[$THEME_NAME]}

    if [ -n "$COLOR" ]; then
        echo "✓ Changing mouse '$LOGI_MOUSE_NAME' LED to #$COLOR for theme '$THEME_NAME'"
        ratbagctl $LOGI_MOUSE_NAME led 0 set color $COLOR
    else
        echo "⚠ No matching color found for theme '$THEME_NAME'. Setting default color."
        ratbagctl $LOGI_MOUSE_NAME led 0 set color $DEFAULT_COLOR
    fi
}

# Check the HyDE theme and change keyboard/mouse lighting accordingly
if [[ ${THEME_COLORS[$HYDE_THEME]+_} ]]; then
    change_keyboard_color "$HYDE_THEME"
    change_mouse_color "$HYDE_THEME"
else
    echo "⚠ No matching RGB color found for HyDE theme: '$HYDE_THEME'"
    echo "  Setting default color: #$DEFAULT_COLOR"
    change_keyboard_color "$DEFAULT_THEME"
    change_mouse_color "$DEFAULT_THEME"
fi
