#!/bin/bash

# Path to HyDE theme configuration
HYDE_THEME_FILE="$HOME/.config/hypr/themes/wallbash.conf"

# Extract the current HyDE theme name
HYDE_THEME=$(grep "^\$HYDE_THEME=" "$HYDE_THEME_FILE" | cut -d '=' -f 2)

echo "Detected HyDE theme: '$HYDE_THEME'"

# Define the mapping from HyDE theme to Starship palette
declare -A theme_palette_map
theme_palette_map=(
    ["Catppuccin Mocha"]="catppuccin_mocha"
    ["Catppuccin Latte"]="catppuccin_latte"
    ["Catppuccin Frappe"]="catppuccin_frappe"
    ["Catppuccin Macchiato"]="catppuccin_macchiato"
    ["Dracula"]="dracula"
    ["Nordic"]="nordic"
    ["Nordic Blue"]="nordic"
    ["Gruvbox"]="gruvbox_dark"
    ["Gruvbox Retro"]="gruvbox_dark"
    ["Rose Pine"]="rose_pine"
    ["Rosé Pine"]="rose_pine"
    ["Tokyo Night"]="tokyo_night"
    ["Hack the Box"]="hardhacker"
    ["Hackthebox"]="hardhacker"
    ["Synth Wave"]="synth_wave"
    ["Oxocarbon"]="oxo_carbon"
    ["Material Sakura"]="material_sakura"
    ["Decay Green"]="decay_green"
    ["Graphite Mono"]="graphite_mono"
    ["One Dark"]="one_dark"
    ["Edge Runner"]="cyberpunk"
    ["Frosted Glass"]="frosted_glass"
    ["Vanta Black"]="vanta_black"
)

# Get the corresponding palette (with fallback)
palette=${theme_palette_map["$HYDE_THEME"]}
if [ -z "$palette" ]; then
    echo "⚠ No matching palette found for HyDE theme: '$HYDE_THEME'"
    echo "  Using default palette: catppuccin_mocha"
    palette="catppuccin_mocha"
fi

# Path to your starship.toml file
starship_config="$HOME/.config/starship.toml"

# Create a temporary file
temp_file=$(mktemp)

# Add the palette line at the top after the comment
awk -v new_palette="palette = \"$palette\"" '
BEGIN { placed = 0 }
{
    if (NR == 1 && $0 == "# Use the color palette") {
        print $0
        getline
        print new_palette
        placed = 1
    }
    if ($0 !~ /^palette = / && $0 !~ /^# palette = /) {
        print $0
    }
}
END {
    if (placed == 0) {
        print new_palette
    }
}
' "$starship_config" >"$temp_file"

# Move the temporary file to replace the original config file
mv "$temp_file" "$starship_config"

echo "✓ Updated starship.toml to use the '$palette' palette"
