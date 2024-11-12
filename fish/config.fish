if status is-interactive
    # Commands to run in interactive sessions can go here
end

fastfetch

fish_vi_key_bindings

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
if not string match -q -- "$PNPM_HOME/bin" $PATH
    set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

# Add Neovim to PATH
set -gx PATH $PATH "/opt/nvim-linux64/bin"

zoxide init fish | source

# vscode
set VSCODE_HISTORY_FILE "$HOME/.vscode_history"

function code
    if test "$argv[1]" = "-z"
        if test -f "$VSCODE_HISTORY_FILE"
            set -l dirs (cat "$VSCODE_HISTORY_FILE")

            # Create array of project names for selection
            set -l options
            for dir in $dirs
                set -a options "📁 "(basename $dir)
            end

            # Show selection menu (will use our config automatically)
            set -l selected (string join \n $options | rofi -dmenu -i -p "Select project")

            if test -n "$selected"
                # Extract project name (remove the folder icon)
                set -l selected_name (string replace "📁 " "" $selected)

                # Find the matching full path
                for dir in $dirs
                    if test (basename $dir) = $selected_name
                        echo
                        set_color green
                        echo " 🚀 Opening project: "(set_color -o white)$selected_name
                        set_color normal
                        echo "    $dir"
                        echo
                        command code "$dir"
                        break
                    end
                end
            else
                echo
                echo " Operation cancelled"
            end
        else
            set_color red
            echo " ⚠️  No project history found"
            set_color normal
            echo " Open a project with 'code ' to start building history"
        end
    else
        if test -d "$argv[1]"
            realpath "$argv[1]" >> "$VSCODE_HISTORY_FILE"
            sort -u "$VSCODE_HISTORY_FILE" -o "$VSCODE_HISTORY_FILE"
            tail -n 10 "$VSCODE_HISTORY_FILE" > "$VSCODE_HISTORY_FILE.tmp"
            mv "$VSCODE_HISTORY_FILE.tmp" "$VSCODE_HISTORY_FILE"
        end
        command code $argv
    end
end
