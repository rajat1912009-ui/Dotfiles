#!/usr/bin/env fish

hyprctl dispatch workspace 2

if not pgrep -x btop >/dev/null 2>&1
    # Spawn them with distinct titles for the window rules to catch
    fish -c "kitty --title rmpc-window -e fish -ic 'rmpc'" &
    kitty --title cava-window -e cava &
    env LANG=en_US.UTF-8 kitty --title btop-window -e btop &
    disown
end

