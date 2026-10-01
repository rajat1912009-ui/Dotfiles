
#!/usr/bin/env fish

# 1. Read your profile path (Update this with your actual folder from Step 2!)
set ZEN_CHROME_DIR "$HOME/.config/zen/as2qb208.Default (release)/chrome
                                                                                                                                   
◄ 0s ◎                                                            "

# 2. Extract Matugen colors from the generated JSON file
set hex_primary (jq -r '.colors.light.primary // .colors.dark.primary' ~/.cache/matugen/colors.json)
set hex_bg (jq -r '.colors.light.background // .colors.dark.background' ~/.cache/matugen/colors.json)
set hex_surface (jq -r '.colors.light.surface // .colors.dark.surface' ~/.cache/matugen/colors.json)

# 3. Overwrite Zen's custom color properties
echo "
:root {
    --zen-primary-color: $hex_primary !important;
    --zen-main-browser-background: $hex_bg !important;
    --zen-themed-toolbar-bg: $hex_surface !important;
}
" > "$ZEN_CHROME_DIR/userChrome.css"
