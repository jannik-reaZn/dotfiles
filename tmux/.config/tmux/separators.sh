#!/usr/bin/env bash
# Adds lualine-style angled separators to the tokyo-night-tmux status bar.
# Runs after the plugin (see tmux.conf) and wraps the formats it generated.
# Glyphs (Nerd Font / Powerline): E0B0 right-pointing, E0B2 left-pointing.
R=$''
L=$''
BG="#1A1B26"      # tokyo-night "night" background
SEG="#2A2F41"     # plugin's active-tab / datetime segment color
SESSION="#7aa2f7" # session block color

get() { tmux show -gv "$1"; }

# Session block ends with an arrow
tmux set -g status-left "$(get status-left)#[fg=${SESSION},bg=${BG},nobold,nodim]${R}"

# Active tab: angled on both sides
tmux set -g window-status-current-format \
  "#[fg=${SEG},bg=${BG}]${L}$(get window-status-current-format)#[fg=${SEG},bg=${BG},nobold,nodim]${R}"

# Path widget: drop the "▒" block the plugin prints before the folder icon
# by replacing its call with the icon plus a relative-to-$HOME path.
right="$(get status-right)"
pw='#('"$(dirname "$0")"'/plugins/tokyo-night-tmux/src/path-widget.sh #{q:pane_current_path})'
if [[ "$right" == *"$pw"* && "$(get @tokyo-night-tmux_show_path)" == 1 ]]; then
  plain="#[fg=blue,bg=default] #[fg=#a9b1d6,bg=default]#{s|${HOME}|~|:pane_current_path} "
  tmux set -g status-right "${right/"$pw"/$plain}"
fi

# Date/time block starts with an arrow
right="$(get status-right)"
# The widget separates date and time with "❬"; swap it for the left-pointing E0B3.
dt="#($(dirname "$0")/plugins/tokyo-night-tmux/src/datetime-widget.sh | sed 's/❬//')"
case "$right" in
  *datetime-widget.sh\))
    tmux set -g status-right "${right%\#(*datetime-widget.sh\)}#[fg=${SEG},bg=${BG}]${L}${dt}"
    ;;
esac
