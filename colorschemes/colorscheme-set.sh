#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to display error messages
error() {
    echo "Error: $1" >&2
    exit 1
}

# Ensure a colorscheme profile is provided
if [ -z "$1" ]; then
    error "No colorscheme profile provided"
fi

colorscheme_profile="$1"

echo $colorscheme_profile

# Define paths
colorscheme_file="$HOME/.config/colorschemes/list/$colorscheme_profile"
active_file="$HOME/.config/colorschemes/active/active-colorscheme.sh"

# Check if the colorscheme file exists
if [ ! -f "$colorscheme_file" ]; then
    error "Colorscheme file '$colorscheme_file' does not exist."
fi

# If active-colorscheme.sh doesn't exist, create it
if [ ! -f "$active_file" ]; then
    echo "Active colorscheme file not found. Creating '$active_file'."
    cp "$colorscheme_file" "$active_file"
    UPDATED=true
else
    # Compare the new colorscheme with the active one
    if ! diff -q "$active_file" "$colorscheme_file" >/dev/null; then
        UPDATED=true
    else
        UPDATED=false
    fi
fi

generate_kitty_config() {
    kitty_conf_file="$HOME/.config/kitty/active-theme.conf"

    cat >"$kitty_conf_file" <<EOF
foreground            $noir_color14
background            $noir_color07
selection_foreground  $noir_color14
selection_background   $noir_color16
url_color             $noir_color03
# black
color0                $noir_color10
color8                $noir_color08
# red
color1                $noir_color11
color9                $noir_color11
# green
color2                $noir_color02
color10               $noir_color02
# yellow
color3                $noir_color05
color11               $noir_color05
# blue
color4                $noir_color04
color12               $noir_color04
# magenta
color5                $noir_color01
color13               $noir_color01
# cyan
color6                $noir_color03
color14               $noir_color03
# white
color7                $noir_color14
color15               $noir_color14
# Cursor colors
cursor                $noir_color24
cursor_text_color     $noir_color24
# Tab bar colors
active_tab_foreground  $noir_color10
active_tab_background   $noir_color02
inactive_tab_foreground $noir_color03
inactive_tab_background $noir_color10
# Marks
mark1_foreground      $noir_color10
mark1_background      $noir_color11
# Splits/Windows
active_border_color   $noir_color04
inactive_border_color  $noir_color10
EOF

    echo "Kitty configuration updated at '$kitty_conf_file'."
}

# generate_btop_config() {
#     btop_conf_file="$HOME/.config/btop/themes/btop-theme.theme"
#
#     cat >"$btop_conf_file" <<EOF
# # Main background, empty for terminal default, need to be empty if you want transparent background
# theme[main_bg]="$noir_color10"
#
# # Main text color
# theme[main_fg]="$noir_color14"
#
# # Title color for boxes
# theme[title]="$noir_color14"
#
# # Highlight color for keyboard shortcuts
# theme[hi_fg]="$noir_color02"
#
# # Background color of selected item in processes box
# theme[selected_bg]="$noir_color04"
#
# # Foreground color of selected item in processes box
# theme[selected_fg]="$noir_color14"
#
# # Color of inactive/disabled text
# theme[inactive_fg]="$noir_color09"
#
# # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
# theme[graph_text]="$noir_color14"
#
# # Background color of the percentage meters
# theme[meter_bg]="$noir_color17"
#
# # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
# theme[proc_misc]="$noir_color01"
#
# # Cpu box outline color
# theme[cpu_box]="$noir_color04"
#
# # Memory/disks box outline color
# theme[mem_box]="$noir_color02"
#
# # Net up/down box outline color
# theme[net_box]="$noir_color03"
#
# # Processes box outline color
# theme[proc_box]="$noir_color05"
#
# # Box divider line and small boxes line color
# theme[div_line]="$noir_color17"
#
# # Temperature graph colors
# theme[temp_start]="$noir_color01"
# theme[temp_mid]="$noir_color16"
# theme[temp_end]="$noir_color06"
#
# # CPU graph colors
# theme[cpu_start]="$noir_color01"
# theme[cpu_mid]="$noir_color05"
# theme[cpu_end]="$noir_color02"
#
# # Mem/Disk free meter
# theme[free_start]="$noir_color18"
# theme[free_mid]="$noir_color16"
# theme[free_end]="$noir_color06"
#
# # Mem/Disk cached meter
# theme[cached_start]="$noir_color03"
# theme[cached_mid]="$noir_color05"
# theme[cached_end]="$noir_color08"
#
# # Mem/Disk available meter
# theme[available_start]="$noir_color21"
# theme[available_mid]="$noir_color01"
# theme[available_end]="$noir_color04"
#
# # Mem/Disk used meter
# theme[used_start]="$noir_color19"
# theme[used_mid]="$noir_color05"
# theme[used_end]="$noir_color02"
#
# # Download graph colors
# theme[download_start]="$noir_color01"
# theme[download_mid]="$noir_color02"
# theme[download_end]="$noir_color05"
#
# # Upload graph colors
# theme[upload_start]="$noir_color08"
# theme[upload_mid]="$noir_color16"
# theme[upload_end]="$noir_color06"
#
# # Process box color gradient for threads, mem and cpu usage
# theme[process_start]="$noir_color03"
# theme[process_mid]="$noir_color02"
# theme[process_end]="$noir_color06"
# EOF
#
#     echo "Btop configuration updated at '$btop_conf_file'."
# }

generate_starship_config() {
    # Define the path to the active-config.toml
    starship_conf_file="$HOME/.config/starship.toml"

    # Generate the Starship configuration file
    cat >"$starship_conf_file" <<EOF
# This will show the time on a 2nd line
# Add a "\\" at the end of an item, if you want the next item to show on the same line
format = """
\$username\\
\$hostname\\
\$time\\
\$all\\
\$directory
\$character
"""

[character]
success_symbol = '[❯❯❯](${noir_color02} bold)'
error_symbol = '[XXX](${noir_color11} bold)'
vicmd_symbol = '[❮❮❮](${noir_color04} bold)'

[battery]
disabled = true

[time]
style = '${noir_color04} bold'
disabled = false
format = '[\[\$time\]](\$style) '
# https://docs.rs/chrono/0.4.7/chrono/format/strftime/index.html
# %T	00:34:60	Hour-minute-second format. Same to %H:%M:%S.
# time_format = '%y/%m/%d %T'
time_format = '%y/%m/%d'

[username]
style_user = '${noir_color04} bold'
style_root = 'white bold'
format = '[\$user](\$style).@.'
show_always = true

[hostname]
ssh_only = false
format = '(white bold)[\$hostname](${noir_color02} bold)'

[directory]
style = '${noir_color03} bold'
truncation_length = 0
truncate_to_repo = false
EOF

    echo "Starship configuration updated at '$starship_conf_file'."
}

# If there's an update, replace the active colorscheme and perform necessary actions
if [ "$UPDATED" = true ]; then
    echo "Updating active colorscheme to '$colorscheme_profile'."

    # Replace the contents of active-colorscheme.sh
    cp "$colorscheme_file" "$active_file"

    # I want to copy the colorscheme_file to my neobean config for folks that
    # don't use my colorscheme selector
    cp "$colorscheme_file" "$HOME/.config/nvim/lua/config/active-colorscheme.sh"

    # Source the active colorscheme to load variables
    source "$active_file"

    # Set the tmux colors
    # $HOME/.config/tmux/tools/linkarzu/set_tmux_colors.sh
    # tmux source-file ~/.tmux.conf
    # echo "Tmux colors set and tmux configuration reloaded."

    generate_starship_config

    # generate_btop_config

    # Generate the Kitty configuration file
    generate_kitty_config
    # This reloads kitty config without closing and re-opening
    kill -SIGUSR1 "$(pgrep -x kitty)"
fi
