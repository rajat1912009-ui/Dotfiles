if not status is-interactive
    return
end

if not set -q __skwd_theme_path
    set -g __skwd_theme_path (status filename)
    set -g __skwd_theme_variables fish_color_normal fish_color_command fish_color_builtin fish_color_function fish_color_keyword fish_color_quote fish_color_redirection fish_color_end fish_color_error fish_color_param fish_color_valid_path fish_color_option fish_color_comment fish_color_selection fish_color_operator fish_color_escape fish_color_autosuggestion fish_color_cwd fish_color_cwd_root fish_color_user fish_color_host fish_color_host_remote fish_color_status fish_color_cancel fish_color_search_match fish_color_history_current fish_pager_color_progress fish_pager_color_background fish_pager_color_prefix fish_pager_color_completion fish_pager_color_description fish_pager_color_selected_background fish_pager_color_selected_prefix fish_pager_color_selected_completion fish_pager_color_selected_description fish_pager_color_secondary_background fish_pager_color_secondary_prefix fish_pager_color_secondary_completion fish_pager_color_secondary_description
    set -g __skwd_theme_globals
    set -g __skwd_theme_exports
    for name in $__skwd_theme_variables
        if set -q -g $name
            set -ga __skwd_theme_globals $name
            set -g __skwd_saved_$name $$name
            if set -q -gx $name
                set -ga __skwd_theme_exports $name
            end
        end
    end
end

function __skwd_refresh_theme --on-variable __skwd_theme_revision
    if test "$__skwd_theme_revision[1]" != off; and test -f "$__skwd_theme_path"
        source "$__skwd_theme_path"
    else
        for name in $__skwd_theme_variables
            if contains -- $name $__skwd_theme_globals
                set -l saved __skwd_saved_$name
                if contains -- $name $__skwd_theme_exports
                    set -gx $name $$saved
                else
                    set -gu $name $$saved
                end
                set -eg $saved
            else
                set -eg $name
            end
        end
        set -eg __skwd_theme_path __skwd_theme_variables __skwd_theme_globals __skwd_theme_exports
        functions -e __skwd_refresh_theme
    end
    commandline -f repaint 2>/dev/null
end

set -g fish_color_normal '#e2e2e2'
set -g fish_color_command '#ffffff'
set -g fish_color_builtin '#ffffff'
set -g fish_color_function '#ffffff'
set -g fish_color_keyword '#e2e2e2'
set -g fish_color_quote '#e2e2e2'
set -g fish_color_redirection '#e2e2e2'
set -g fish_color_end '#919191'
set -g fish_color_error '#ffb4ab'
set -g fish_color_param '#e2e2e2'
set -g fish_color_valid_path '#ffffff'
set -g fish_color_option '#e2e2e2'
set -g fish_color_comment '#919191'
set -g fish_color_selection '#1b1b1b' --background='#ffffff'
set -g fish_color_operator '#e2e2e2'
set -g fish_color_escape '#e2e2e2'
set -g fish_color_autosuggestion '#919191'
set -g fish_color_cwd '#ffffff'
set -g fish_color_cwd_root '#ffb4ab'
set -g fish_color_user '#ffffff'
set -g fish_color_host '#e2e2e2'
set -g fish_color_host_remote '#e2e2e2'
set -g fish_color_status '#ffb4ab'
set -g fish_color_cancel '#ffb4ab'
set -g fish_color_search_match '#1b1b1b' --background='#ffffff'
set -g fish_color_history_current '#ffffff'
set -g fish_pager_color_progress '#ffffff'
set -g fish_pager_color_background --background='#131313'
set -g fish_pager_color_prefix '#ffffff'
set -g fish_pager_color_completion '#e2e2e2'
set -g fish_pager_color_description '#919191'
set -g fish_pager_color_selected_background --background='#ffffff'
set -g fish_pager_color_selected_prefix '#1b1b1b'
set -g fish_pager_color_selected_completion '#1b1b1b'
set -g fish_pager_color_selected_description '#1b1b1b'
set -g fish_pager_color_secondary_background --background='#1f1f1f'
set -g fish_pager_color_secondary_prefix '#ffffff'
set -g fish_pager_color_secondary_completion '#e2e2e2'
set -g fish_pager_color_secondary_description '#919191'
