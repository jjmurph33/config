if status is-interactive
    fish_default_key_bindings
    abbr -a t tmux_attach
    abbr -a f 'fzf --preview="batcat --color=always {}"'
    set -x PATH ~/.local/bin $PATH
    set -x PATH ~/opt/nvim/bin $PATH
end
