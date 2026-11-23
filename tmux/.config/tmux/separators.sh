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

# --- Tabs, catppuccin style: name block + colored number block ----------
# Inactive: [ icon name ][ n ]   Active: same, with the number block in blue.
# The pane number is not shown. Zoom adds an icon after the name.
FG="#a9b1d6"; MUTED="#7982a9"; BRIGHT="#c0caf5"; DARK="#15161e"
NAME_BG="#2A2F41"; NUM_BG="#3b4261"; ACCENT="#7aa2f7"
ICON_TERM=$'\uea85'; ICON_SSH=$'\U000f08c0'; ICON_ZOOM=$'\U000f0293'
icon="#{?#{==:#{pane_current_command},ssh},${ICON_SSH},${ICON_TERM}}"
zoom="#{?window_zoomed_flag, ${ICON_ZOOM},}"

tmux set -g window-status-format \
  "#[fg=${NAME_BG},bg=${BG},nobold]${L}#[fg=${MUTED},bg=${NAME_BG}] ${icon} #W${zoom} #[fg=${FG},bg=${NUM_BG}] #I #[fg=${NUM_BG},bg=${BG}]${R}"
tmux set -g window-status-current-format \
  "#[fg=${NAME_BG},bg=${BG},nobold]${L}#[fg=${BRIGHT},bg=${NAME_BG},bold] ${icon} #W${zoom} #[fg=${DARK},bg=${ACCENT}] #I #[fg=${ACCENT},bg=${BG},nobold]${R}"
tmux set -g window-status-separator " "

# --- Session, catppuccin style: icon block + name block ------------------
# The icon block changes color while the prefix (Ctrl+s) is active.
PREFIX_COLOR="#f7768e"
ICON_SESSION=$'\U000f018d'
tmux set -g status-left-length 40
# Single-attribute styles inside the conditional: commas would split its branches.
tmux set -g status-left \
  "#[fg=${DARK},bold]#{?client_prefix,#[bg=${PREFIX_COLOR}],#[bg=${ACCENT}]} ${ICON_SESSION} #{?client_prefix,#[fg=${PREFIX_COLOR}],#[fg=${ACCENT}]}#[bg=${NAME_BG}]${R}#[fg=${FG},bg=${NAME_BG},nobold] #S #[fg=${NAME_BG},bg=${BG}]${R} "


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
