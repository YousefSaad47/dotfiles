set -g fish_key_bindings fish_vi_key_bindings

set -g fish_greeting

fastfetch

starship init fish | source

zoxide init fish | source

source ~/.config/fish/aliases.fish

# pnpm
set -gx PNPM_HOME "/home/yousef/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

if test -d $HOME/.local/bin
    set -gx PATH $HOME/.local/bin $PATH
end

